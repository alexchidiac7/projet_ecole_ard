#!/usr/bin/env python
from __future__ import print_function
import csv
import serial
import time
import os
import sys
import argparse
import logging
import signal
from datetime import datetime
from postep256usb import PoStep256USB
from simple_pid import PID

# Initialize serial port
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=5)
time.sleep(0.1)

# Data storage lists
responsesX, responsesY, responsesZ, timeList = [], [], [], []

# Timestamp for file naming
suffix = "XYZ_Shear_PDMS_BC_Y"
now = datetime.now()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")
timeBegin = time.time()

# PID controller setup
pid = None
postep = None

def signal_handler(sig, frame):
    print("Signal received, cleaning up...")
    cleanup()
    sys.exit(0)  # Exit after cleanup

# Setup signal handling
signal.signal(signal.SIGTERM, signal_handler)


# Cleanup resources function
def cleanup():
    print("Cleaning up...")
    postep.run_sleep(True)
    ser.close()

def listener(target_ForceZ, Time_Inter, Max_Force, step):
    global pid, postep
    script_dir = os.path.dirname(os.path.abspath(__file__))
    measures_dir = os.path.join(script_dir, 'measures')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")
    
    with open(file_path, "w") as file:
        file.write("Time(s),Force_X,Force_Y(N),Force_Z\n")
        period = 0.5
        measurementNumber = 0.0
        u = Time_Inter

        pid = PID(15, 10, 0.1, setpoint=target_ForceZ)
        pid.output_limits = (-20, 20)

        while True:
            try:
                timeList.append(time.time() - timeBegin)
                ser.write(b'X')
                responseX = ser.readline().strip().decode() or "0.00"
                ser.write(b'Y')
                responseY = ser.readline().strip().decode() or "0.00"
                ser.write(b'Z')
                responseZ = ser.readline().strip().decode() or "0.00"
                
                if(time.time() - timeBegin > measurementNumber * period):
                    measurementNumber += 1
                    file.write(f"{timeList[-1]},{responseX},{responseY},{responseZ}\n")
                
                responseX, responseY, responseZ = map(float, [responseX, responseY, responseZ])
                motorSpeed = pid(responseZ)
                
                if motorSpeed > 0:
                    postep.move_speed(abs(motorSpeed), "acw")
                else:
                    postep.move_speed(abs(motorSpeed), "cw")
                
                if abs(responseZ) > 20:
                    postep.run_sleep(False)

                # Append the responses to their respective lists
                responsesX.append(responseX)
                responsesY.append(responseY)
                responsesZ.append(responseZ)

                # Adjust the PID setpoint and interval based on current performance
                if (time.time() - timeBegin > Time_Inter) and (target_ForceZ > Max_Force):
                    target_ForceZ += step
                    pid.setpoint = target_ForceZ
                    Time_Inter += u
                print("Time_Inter=", Time_Inter)
                    
            except KeyboardInterrupt:
                print("Exiting program due to KeyboardInterrupt")
            finally:
                cleanup()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Run XYZ force sensor test.')
    parser.add_argument('--forcez', type=float, help='Target Z-axis force', required=True)
    args = parser.parse_args()

    print("[Initialising XYZ_visualiser...]")
    postep = PoStep256USB(logging.INFO)
    if not postep.device:
        print("Driver not found, exiting.")
        sys.exit(0)

    postep.enable_rt_stream()
    postep.run_sleep(True)
    
    listener(args.forcez, 10, -3, -0.5)

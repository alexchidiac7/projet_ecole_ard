#!/usr/bin/env python
from __future__ import print_function
import csv
import serial
import time
from datetime import datetime
import logging
import sys
from postep256usb import PoStep256USB
from simple_pid import PID

import argparse #1337
import os 

# Initialize serial port
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
time.sleep(0.1)

# Setup time and logging
suffix = "XYZ_Shear_PDMS_BC_Y"
now = datetime.now()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")
timeBegin = time.time()

# Create instance of motor controller
postep = PoStep256USB(logging.INFO)
if not postep.device:
    print("Driver not found, exiting.")
    sys.exit(0)

# Setup PID controller
#target_ForceZ = -0.5  # Set initial target force


def cleanup():
    """Cleanup resources and ensure the motor stops."""
    print("Cleaning up...")
    postep.run_sleep(False)  # Ensure motor is stopped
    ser.close()

def listener(target_ForceZ, Time_Inter, Max_Force, step):
    """Monitor and control the motor based on sensor inputs."""
    try:
        while True:
            ser.write(b'X')
            responseX = ser.readline().strip().decode() or "0.00"
            ser.write(b'Y')
            responseY = ser.readline().strip().decode() or "0.00"
            ser.write(b'Z')
            responseZ = ser.readline().strip().decode() or "0.00"

            print(responseZ)

            # Convert responses to floats
            responseX, responseY, responseZ = map(float, [responseX, responseY, responseZ])
            
            # Calculate motor speed from PID based on Z response
            motorSpeed = pid(responseZ)
            
            # Control motor direction based on speed
            if motorSpeed > 0:
                print("motorSpeed > 0")
                postep.move_speed(abs(motorSpeed), "acw")
            else:
                print("motorSpeed < 0")
                postep.move_speed(abs(motorSpeed), "cw")

            # Check force threshold to wake up or sleep motor
            if abs(responseZ) > 20:
                postep.run_sleep(False)

            if (time.time()-timeBegin > Time_Inter) and (target_ForceZ>Max_Force):
                target_ForceZ += step
                pid.setpoint= target_ForceZ
                Time_Inter = Time_Inter + u
            print("Time_Inter=", Time_Inter)

    except KeyboardInterrupt:
        print("Keyboard interrupt received, stopping...")
    finally:
        cleanup()

if __name__ == '__main__':

	# Parse command-line arguments #1337
    parser = argparse.ArgumentParser(description='Run XYZ force sensor test.') #1337
    parser.add_argument('--forcez', type=float, help='Target Z-axis force', required=True) #1337
    args = parser.parse_args() #1337

    # Use the provided target force Z
    target_ForceZ = args.forcez #1337

    pid = PID(15, 10, 0.1, setpoint=target_ForceZ)
    print(target_ForceZ)
    pid.output_limits = (-20, 20)
    # Print or log the received target force Z value #1337
    print("Received target force Z:", target_ForceZ) #1337




    postep.enable_rt_stream()
    postep.run_sleep(True)  # Activate the motor
    try:
        listener(target_ForceZ, 25, -3, -0.5)
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        cleanup()

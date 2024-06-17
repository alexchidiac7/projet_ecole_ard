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

import argparse 
import os 
import signal
import tkinter as tk

# Initialize serial port
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
time.sleep(0.1)

timeList = []
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

def cleanup():
    """Cleanup resources and ensure the motor stops."""
    print("Cleaning up...")
    postep.run_sleep(False)  # Ensure motor is stopped
    ser.close()

def signal_handler(sig, frame):
    print("Signal received, running cleanup...")
    cleanup()
    sys.exit(0)

signal.signal(signal.SIGTERM, signal_handler)

def listener(target_ForceZ, Time_Inter, Max_Force, step, responseZ_label):
    """Monitor and control the motor based on sensor inputs."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    measures_dir = os.path.join(script_dir, 'measures_XYZ')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")
    with open(file_path, "w") as file:
        try:
            file.write("Time(s),Force_X,Force_Y(N),Force_Z\n")
            period = 0.5
            measurementNumber = 0.0
            u = Time_Inter
            while True:
                timeList.append(time.time() - timeBegin)
                ser.write(b'X')
                responseX = ser.readline().strip().decode() or "0.00"
                ser.write(b'Y')
                responseY = ser.readline().strip().decode() or "0.00"
                ser.write(b'Z')
                responseZ = ser.readline().strip().decode() or "0.00"

                # Update the label with the new responseZ value
                responseZ_label.config(text=responseZ)
                responseZ_label.update()

                if time.time() - timeBegin > measurementNumber * period:
                    measurementNumber += 1
                    file.write(str(timeList[-1]) + "," + str(responseX) + "," + str(responseY) + "," + str(responseZ) + "\n")

                # Convert responses to floats
                responseX, responseY, responseZ = map(float, [responseX, responseY, responseZ])

                # Calculate motor speed from PID based on Z response
                motorSpeed = pid(responseZ)

                # Control motor direction based on speed
                if motorSpeed > 0:
                    print("motorSpeed > 0, it is going UP")
                    postep.move_speed(abs(motorSpeed), "acw")
                else:
                    print("motorSpeed < 0, it is going DOWN")
                    postep.move_speed(abs(motorSpeed), "cw")

                # Check force threshold to wake up or sleep motor
                if abs(responseZ) > 20:
                    postep.run_sleep(False)

                if (time.time() - timeBegin > Time_Inter) and (target_ForceZ > Max_Force):
                    target_ForceZ += step
                    pid.setpoint = target_ForceZ
                    Time_Inter = Time_Inter + u
                print("Time_Inter=", Time_Inter)

        except KeyboardInterrupt:
            print("Keyboard interrupt received, stopping...")
        finally:
            cleanup()

if __name__ == '__main__':
    # Parse command-line arguments 
    parser = argparse.ArgumentParser(description='Run XYZ force sensor test.')
    parser.add_argument('--forcez', type=float, help='Target Z-axis force', required=True)
    args = parser.parse_args()

    # Use the provided target force Z
    target_ForceZ = -args.forcez

    pid = PID(15, 10, 0.1, setpoint=target_ForceZ)
    print(target_ForceZ)
    pid.output_limits = (-20, 20)
    # Print or log the received target force Z value 
    print("Received target force Z:", target_ForceZ)

    postep.enable_rt_stream()
    postep.run_sleep(True)  # Activate the motor

    # Setup the Tkinter GUI
    root = tk.Tk()
    root.title("Response Z Value")
    responseZ_label = tk.Label(root, text="0.00", font=("Helvetica", 48))
    responseZ_label.pack()

    # Run the listener function in a separate thread to avoid blocking the GUI
    import threading
    listener_thread = threading.Thread(target=listener, args=(target_ForceZ, 25, -3, -0.5, responseZ_label))
    listener_thread.start()

    # Start the Tkinter main loop
    root.mainloop()

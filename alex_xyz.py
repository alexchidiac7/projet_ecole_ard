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
target_ForceZ = -0.5  # Set initial target force
pid = PID(15, 10, 0.1, setpoint=target_ForceZ)
pid.output_limits = (-20, 20)

def cleanup():
    """Cleanup resources and ensure the motor stops."""
    print("Cleaning up...")
    postep.run_sleep(False)  # Ensure motor is stopped
    ser.close()

def listener(target_ForceZ, Time_Inter, Max_Force, step):
    """Monitor and control the motor based on sensor inputs."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    measures_dir = os.path.join(script_dir, 'measures_Z')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")
    with open(file_path, "w") as file:
        try:
            period = 0.5
            measurementNumber = 0.0
            u = Time_Inter
            while True:
                ser.write(b'X')
                responseX = ser.readline().strip().decode() or "0.00"
                ser.write(b'Y')
                responseY = ser.readline().strip().decode() or "0.00"
                ser.write(b'Z')
                responseZ = ser.readline().strip().decode() or "0.00"

                print(responseZ)

                if(time.time()-timeBegin > measurementNumber*period):
                    measurementNumber += 1
                    file.write(str(timeList[-1]) + "," +str(responseX) + ","+ str(responseY) + "," +str(responseZ)+"\n")

                # Convert responses to floats
                responseX, responseY, responseZ = map(float, [responseX, responseY, responseZ])
                
                # Calculate motor speed from PID based on Z response
                motorSpeed = pid(responseZ)
                
                # Control motor direction based on speed
                if motorSpeed > 0:
                    print("motorSpeed > 0, DOWN")
                    postep.move_speed(abs(motorSpeed), "acw")
                else:
                    print("motorSpeed < 0, UP")
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
    postep.enable_rt_stream()
    postep.run_sleep(True)  # Activate the motor
    try:
        listener(target_ForceZ, 25, -3, -0.5)
    except Exception as e:
        print(f"An error occurred: {e}")
        cleanup()
    # finally:
    #     cleanup()

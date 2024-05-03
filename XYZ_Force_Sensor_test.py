#!/usr/bin/env python
from __future__ import print_function
import csv
# -*- coding: utf-8 -*-

import serial
import time
import matplotlib.pyplot as plt
from datetime import datetime
import logging
import threading
import sys
from postep256usb import PoStep256USB
from simple_pid import PID

import argparse #1337
import os 
import signal

#plt.ion()
ser = serial.Serial('/dev/ttyUSB0',115200, timeout=5)
time.sleep(0.1)# open serial port - XYZ_Force_Sensor.

# create an empty list to store the responses
responsesX = []
responsesY = []
responsesZ = []
timeList = []
#ser.write(b'T')
#ser.write(b'T')
# create a figure and a plot
fig, (axX,axY,axZ) = plt.subplots(3,1)
lineX, = axX.plot([], [])
lineY, = axY.plot([], [])
lineZ, = axZ.plot([], [])
#ser.write(b'T')
suffix = "XYZ_Shear_PDMS_BC_Y"
now = datetime.now()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")
timeBegin = time.time()  # Initial target ForceZ value

def signal_handler(sig, frame):
    print("Signal received, cleaning up...")
    cleanup()
    sys.exit(0)  # Exit after cleanup

# Setup signal handling
signal.signal(signal.SIGTERM, signal_handler)


# Cleanup resources function
def cleanup():
    print("Cleaning up...")
    postep.run_sleep(False)
    ser.close()

# function to update the plot
def update_plot(responsesX,responsesY,responsesZ,timeList):

    # update the data of the plot
    lineX.set_data(range(len(responsesX)), responsesX)
    lineY.set_data(range(len(responsesY)), responsesY)
    lineZ.set_data(range(len(responsesZ)), responsesZ)
    # set the limits of the plot
    axX.set_xlim(0, len(timeList))
    axY.set_xlim(0, len(timeList))
    axZ.set_xlim(0, len(timeList))
    axX.set_ylim(min(responsesX), max(responsesX))
    axY.set_ylim(min(responsesY), max(responsesY))
    axZ.set_ylim(min(responsesZ), max(responsesZ))
    #axX.set_title("X Responses")
    axX.set_xlabel("Time [s]")
    axX.set_ylabel("Force_X [N]")
    #axY.set_title("Y Responses")
    axY.set_xlabel("Time [s]")
    axY.set_ylabel("Force_Y [N]")
    #axZ.set_title("Z Responses")
    axZ.set_xlabel("Time[s]")
    axZ.set_ylabel("Force_Z [N]")
    # redraw the plot
    fig.canvas.draw()
    fig.canvas.flush_events()
# open the file in write mode

# send the command to the Arduino board in a loop

def wait_for_position():

    while True:
        data = postep.read_stream()
        #print("Received: {}".format(data))
        if data["pos"] == data["final"]:
            print("Reached: {}".format(data["final"]))
            break
        time.sleep(0.1)

def listener(target_ForceZ,Time_Inter,Max_Force,step):
    #responseZ = target_ForceZ
    script_dir = os.path.dirname(os.path.abspath(__file__))
    measures_dir = os.path.join(script_dir, 'measures_Z')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")
    with open(file_path, "w") as file:
#    with open("/home/pi/Desktop/Haptic_Bench/Measure/" + dateAndTime + suffix + ".txt", "w") as file:


        file.write("Time(s),Force_X,Force_Y(N),Force_Z\n")
        period = 0.5
        measurementNumber = 0.0
        u = Time_Inter
        while True:
            try:
                timeList.append(time.time()-timeBegin)
                #print(timeList)
                ser.write(b'X')
                print("step1: done")
                responseX = ser.readline()
                responseX = responseX.strip().decode()
                print(f"received responseX:'{responseX}'")
                # If responseX is empty, treat it as '0'
                if responseX == "":
                    print("Received an empty response for X. Treating as 0.")
                    responseX = "0.00"  # Set to '0' as string, to be converted to float next.
                ser.write(b'Y')
                responseY = ser.readline()
                responseY = responseY.strip().decode() or "0.00"
                ser.write(b'Z')
                print(f"received responseY:'{responseY}'")

                responseZ = ser.readline()
                responseZ = responseZ.strip().decode() or "0.00"
                if(time.time()-timeBegin > measurementNumber*period):
                    measurementNumber += 1
                    file.write(str(timeList[-1]) + "," +str(responseX) + ","+ str(responseY) + "," +str(responseZ)+"\n")
                #postep.move_speed(100,"acw")
                # convert the response to a float
                responseX = float(responseX)
                responseY = float(responseY)
                responseZ = float(responseZ)
                motorSpeed = float(pid(responseZ))
                print(motorSpeed)
                print(responseZ)
                if (motorSpeed>0):
                    print("down")
                    postep.move_speed(abs(motorSpeed),"acw")

                else:
                    print("up")
                    postep.move_speed(abs(motorSpeed),"cw")

                if (20 < abs(float(responseZ))):
                    postep.run_sleep(False)


                # append the response to the list
                responsesX.append(responseX)
                responsesY.append(responseY)
                responsesZ.append(responseZ)
                if (time.time()-timeBegin > Time_Inter) and (target_ForceZ>Max_Force):
                    target_ForceZ += step
                    pid.setpoint= target_ForceZ
                    Time_Inter = Time_Inter + u
                print("Time_Inter=", Time_Inter)
               
                    
                    
                
                #update the plot
                #update_plot(responsesX,responsesY,responsesZ,timeList)

            except KeyboardInterrupt:
                print("Exiting program due to KeyboardInterrupt")
            finally:
                print("called finally")
                cleanup()
                # write a stringclose port

#===============================================================================
# MAIN METHOD
#===============================================================================
if __name__ == '__main__':
	# Parse command-line arguments #1337
    parser = argparse.ArgumentParser(description='Run XYZ force sensor test.') #1337
    parser.add_argument('--forcez', type=float, help='Target Z-axis force', required=True) #1337
    args = parser.parse_args() #1337

# Use the provided target force Z
    target_ForceZ = args.forcez #1337
# Print or log the received target force Z value #1337
    print("Received target force Z:", target_ForceZ) #1337




    print("[Initialising XYZ_visualiser...]\n")
    #rospy.init_node('XYZ_visualiser', anonymous=True,)
    postep = PoStep256USB(logging.INFO)
    # defined to show only errors as log values, set to logging.INFO or logging.DEBUG for more

    # Check if driver was detected and configuration could be established
    if postep.device is None:
        print("Driver not found, exiting.")
        sys.exit(0)

    if postep.device is None:
        print("Driver not found, exiting.")
        sys.exit(0)
    
    # enable streaming of real-time data
    postep.enable_rt_stream()
    # set the motor to run or sleep
    #time.sleep(5)
    postep.run_sleep(True)
    #target_ForceZ =-0.5 #1337
    Max_Force = -3
    step = -0.5
    pid = PID(15, 10, 0.1, setpoint=target_ForceZ)
    pid.output_limits = (-20, 20)
    Time_Inter = 10

    try:
        listener(target_ForceZ,Time_Inter,Max_Force,step)
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        print("called from main")
        cleanup()


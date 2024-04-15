#!/usr/bin/env python
from __future__ import print_function
import csv
# -*- coding: utf-8 -*-

import serial
import time
from keithley import Keithley
import matplotlib.pyplot as plt
from datetime import datetime
import logging
import threading
import sys
from postep256usb import PoStep256USB
from simple_pid import PID
plt.ion()
ser = serial.Serial('/dev/ttyUSB0',115200)  # open serial port - XYZ_Force_Sensor.
smu = Keithley('ASRL/dev/ttyUSB1::INSTR', 5000) # 

# create an empty list to store the responses
responsesX = []
responsesY = []
responsesZ = []
smu_measurement = []
timeList = []
#ser.write(b'T')
# create a figure and a plot
fig, (axX,axY,axZ,axI) = plt.subplots(4,1)
lineX, = axX.plot([], [])
lineY, = axY.plot([], [])
lineZ, = axZ.plot([], [])
lineI, = axI.plot([], [])
#ser.write(b'T')
suffix = "XYZ_Force_Sensor_Bio_OWS_Gcode_y_Sp_1N_PID_Flat_Normal"
now = datetime.now()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")
target_ForceZ = -1
pid = PID(5, 0.01, 0.05, setpoint=target_ForceZ)
pid.output_limits = (-10, 10)
#Keithley configuration
smu.reset()
smu.mode_2W()
smu.format_ASCII()
smu.clear_buf(1)
smu.enable_app_buf()
smu.enable_src_val_store()
#smu.set_m_range('i', measurementRange)
#smu.set_s_level('v', vset)
#smu.set_s_range('v', sourceRange)
smu.set_V_source()
smu.set_s_level( 'v', 5)
smu.on()  
# function to update the plot
def update_plot(responsesX,responsesY,responsesZ,smu_measurement,timeList):

    # update the data of the plot
    lineX.set_data(range(len(responsesX)), responsesX)
    lineY.set_data(range(len(responsesY)), responsesY)
    lineZ.set_data(range(len(responsesZ)), responsesZ)
    lineI.set_data(range(len(smu_measurement)), smu_measurement)
    
    
    # set the limits of the plot
    axX.set_xlim(0, len(timeList))
    axY.set_xlim(0, len(timeList))
    axZ.set_xlim(0, len(timeList))
    axI.set_xlim(0, len(timeList))
    
    axX.set_ylim(min(responsesX), max(responsesX))
    axY.set_ylim(min(responsesY), max(responsesY))
    axZ.set_ylim(min(responsesZ), max(responsesZ))
    axI.set_ylim(min(smu_measurement), max(smu_measurement))
    
    #axX.set_title("X Responses")
    #axX.set_xlabel("Time [s]")
    axX.set_ylabel("Force_X [N]")
    #axY.set_title("Y Responses")
    #axY.set_xlabel("Time [s]")
    axY.set_ylabel("Force_Y [N]")
    #axZ.set_title("Z Responses")
    #axZ.set_xlabel("Time[s]")
    axZ.set_ylabel("Force_Z [N]")
    
    axI.set_xlabel("Time[s]")
    axI.set_ylabel("PD [A]")
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
        
def listener():
    #responseZ = target_ForceZ
    with open("/home/pi/Desktop/Haptic_Bench/Measure/" + dateAndTime + suffix + ".txt", "w") as file:
        file.write("Time(s),Force_X,Force_Y(N),Force_Z,PD_Current(A)\n")
        while True:
            try:
                timeList.append(time.time())
                ser.write(b'X')
                responseX = ser.readline()
                responseX = responseX.strip().decode()
                ser.write(b'Y')
                responseY = ser.readline()
                responseY = responseY.strip().decode()
                ser.write(b'Z')
                
                responseZ = ser.readline()
                responseZ = responseZ.strip().decode()
                smu.measure('i')
                i = smu.print_readings_buf()
                i = float(i[-1])
                smu_measurement.append(i)
                smu.clear_buf(1)
                
                
                
                file.write(str(timeList[-1]) + "," +str(responseX) + ","+ str(responseY) + "," +str(responseZ)+","+str(smu_measurement[-1])+"\n")
                #postep.move_speed(100,"acw")
                # convert the response to a float
                responseX = float(responseX)
                responseY = float(responseY)
                responseZ = float(responseZ)
                motorSpeed = float(pid(responseZ))
                print(motorSpeed)
                if (motorSpeed>0):
                    print("down")
                    #postep.move_speed(abs(motorSpeed),"acw")

                else:
                    print("up")
                    #postep.move_speed(abs(motorSpeed),"cw")
                
                if (5 < abs(float(responseZ))):
                    #postep.run_sleep(False)
                
               
                # append the response to the list
                responsesX.append(responseX)
                responsesY.append(responseY)
                responsesZ.append(responseZ)
                
                # update the plot
                update_plot(responsesX,responsesY,responsesZ,smu_measurement,timeList)

            except KeyboardInterrupt:
                print("Exiting program")
                postep.run_sleep(False)
                #postep.system_reset()
                exit()
                # write a string

    ser.close()             # close port

#===============================================================================
# MAIN METHOD
#===============================================================================
if __name__ == '__main__':
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
    postep.run_sleep(True)
    
    listener()

#!/usr/bin/env python
from __future__ import print_function
import csv
import sys
import os
import time
from datetime import datetime
import ctypes
import tng

# -*- coding: utf-8 -*-
timesList = []
X = []
Y = []
Z = []
Speed = []
Acc = []
suffix = "CNC_Position_Eli_Y"
now = datetime.now()
timeBegin = time.time()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")

def listener():
    #time.sleep(5)
    tng.API.StartFnW("/home/pi/Desktop/Haptic_Bench/Gcode/Gcode_X_Sp.txt")
    timeBegin = time.time()  


    script_dir = os.path.dirname(os.path.abspath(__file__))
    measures_dir = os.path.join(script_dir, 'measures_CNC')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")

    with open(file_path, "w") as file:
        file.write("Time(s),X,Y,Z,Speed,\n")
        period = 0.5
        measurementNumber = 0.0
        while True:
            try:
                timesList.append(time.time()-timeBegin)
                x = tng.API.InfoWorkPosition(0)
                time.sleep(1./100)
                print(x)
                y = tng.API.InfoWorkPosition(1)
                print(y)
                time.sleep(1./100)
                z = tng.API.InfoWorkPosition(2)
                print(z)
                time.sleep(1./100)
                v = tng.API.InfoSpeed()
                time.sleep(1./100)
                a = tng.API.InfoAcceleration()
                time.sleep(1./100)
                X.append(x)
                Y.append(y)
                Z.append(z)
                Speed.append(v)
                Acc.append(a)
                if(time.time()-timeBegin > measurementNumber*period):
                    measurementNumber += 1
                    file.write(str(timesList[-1]) + "," + str(X[-1])+ ","+ str(Y[-1])+ ","+ str(Z[-1]) + ","+ str(Speed[-1])+"\n")
            except KeyboardInterrupt:
                print("Exiting program")
                tng.API.ExitForce()
                file.close()
                exit()

#===============================================================================
# MAIN METHOD
#===============================================================================
if __name__ == '__main__':
    print("[Initialising CNC Gcode...]\n")
    time.sleep(1)
    tng.Run()
    #tng.API.Hide() # this line closes the CNCPlanet
    listener()


  






from keithley import Keithley
import serial
import matplotlib.pyplot as plt
import csv
import time
from datetime import datetime
import os

# Enable interactive mode
plt.ion()

# open a connection to the Keithley device
smu = Keithley('ASRL/dev/ttyUSB1::INSTR', 5000)
time.sleep(1)
Ardu = serial.Serial("/dev/ttyACM0",115200)
time.sleep(1)
suffix = "WGOSP_SHEAR_Eli_Y"
now = datetime.now()
timeBegin = time.time()
dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")

# Keithley parameters
iset                    = 10e-6                # current source target -- useless
vset                    = 0                  # voc
measurementRange        = 10e-3
#sourceRange             = ()


#Keithley configuration
smu.reset()
smu.mode_4W()
smu.format_ASCII()
smu.clear_buf(1)
smu.enable_app_buf()
smu.enable_src_val_store()
smu.set_m_range('i', measurementRange)
smu.set_s_level('v', vset)
#smu.set_s_range('v', sourceRange)
smu.set_V_source()
smu.set_s_level( 'v', 0)
smu.on()


# Initialize measurement and time lists
measurement = []
timesList = []


# Initialize channel data lists
channel0 = [0,0]
channel1 = [0,0]
channel2 = [0,0]
channel3 = [0,0]
channel4 = [0,0]
channel5 = [0,0]
channel6 = [0,0]
channel7 = [0,0]
ite = []
timeList = []


# Create a figure and a plot
fig, (axX,axY,axZ) = plt.subplots(3,1)
lineX, = axX.plot([], [])
lineY, = axY.plot([], [])
lineZ, = axZ.plot([], [])


def update_plot(channel0, channel1, channel2, channel3, channel4, channel5, channel6, channel7, timeList):
    for ax in [ax0, ax1, ax2, ax3, ax4, ax5, ax6, ax7]:
        ax.ticklabel_format(style='sci', axis='y', scilimits=(0, 0))
        
    # update the data of the plots
    line0.set_data(range(len(channel0)), channel0)
    line1.set_data(range(len(channel1)), channel1)
    line2.set_data(range(len(channel2)), channel2)
    line3.set_data(range(len(channel3)), channel3)
    line4.set_data(range(len(channel4)), channel4)
    line5.set_data(range(len(channel5)), channel5)
    line6.set_data(range(len(channel6)), channel6)
    line7.set_data(range(len(channel7)), channel7)
    
    # set the limits of the plots
    ax0.set_xlim(0, len(channel0))
    ax1.set_xlim(0, len(channel1))
    ax2.set_xlim(0, len(channel2))
    ax3.set_xlim(0, len(channel3))
    ax4.set_xlim(0, len(channel4))
    ax5.set_xlim(0, len(channel5))
    ax6.set_xlim(0, len(channel6))
    ax7.set_xlim(0, len(channel7))

    ax0.set_ylim(min(channel0), max(channel0))
    ax1.set_ylim(min(channel1), max(channel1))
    ax2.set_ylim(min(channel2), max(channel2))
    ax3.set_ylim(min(channel3), max(channel3))
    ax4.set_ylim(min(channel4), max(channel4))
    ax5.set_ylim(min(channel5), max(channel5))
    ax6.set_ylim(min(channel6), max(channel6))
    ax7.set_ylim(min(channel7), max(channel7))

    # set titles and labels for each plot
    ax0.set_xlabel("Point")
    ax0.set_ylabel("Channel 0")

    ax1.set_xlabel("Point")
    ax1.set_ylabel("Channel 1")

    ax2.set_xlabel("Point")
    ax2.set_ylabel("Channel 2")

    ax3.set_xlabel("Point")
    ax3.set_ylabel("Channel 3")

    ax4.set_xlabel("Point")
    ax4.set_ylabel("Channel 4")

    ax5.set_xlabel("Point")
    ax5.set_ylabel("Channel 5")

    ax6.set_xlabel("Point")
    ax6.set_ylabel("Channel 6")

    ax7.set_xlabel("Point")
    ax7.set_ylabel("Channel 7")

    # redraw the plot
    fig.canvas.draw()
    fig.canvas.flush_events()

# open the file in write mode
#now = datetime.now()
#dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")

#with open('current_measurements'+'dateAndTime'+.csv', 'w', newline='') as csvfile:
v = 0

script_dir = "/home/pi/test_projet_ecole/"
measures_dir = os.path.join(script_dir, 'measures_MUX')
os.makedirs(measures_dir, exist_ok=True)
file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")

with open(file_path , "w") as file:
    file.write("Time(s),channel0,channel1,channel2,channel3,channel4,channel5,channel6,channel7\n")

    # create a list of empty lists to hold current measurements for each channel
    #measurements_by_channel = [[] for _ in range(8)]

    # continuously read and display the current value, and write it to the CSV file
    channelNumber = -1
    period = 0.5
    measurementNumber = 0.0 
    while True:
            try:
                timesList.append(time.time()-timeBegin)
                channelNumber = (channelNumber+1)%8
                
                print(channelNumber)
                Ardu.write(str(channelNumber).encode())
                time.sleep(1./100)
                
                if channelNumber == 0:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel0.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                    ite.append(v)

                if channelNumber == 1:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel1.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                    ite.append(v)

                if channelNumber == 2:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel2.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                    ite.append(v)

                if channelNumber == 3:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel3.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                
                if channelNumber == 4:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel4.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                    ite.append(v)


                if channelNumber == 5:
                    current = smu.measure('i')
                    time.sleep(1./100)
                    channel5.append(float(smu.print_readings_buf()[0]))
                    v=v+1
                    ite.append(v)


                #file.write(str(timesList[-1]) + "," +str(channel6[-1]) + ","+ str(channel3[-1]) + "," +str(channel1[-1])+"\n")

    #             channel1 = [float(x) for x in channel1]
    #             channel3 = [float(x) for x in channel3]
    #             channel6 = [float(x) for x in channel6]



                

                #if int(len(channel1))>0 and int(len(channel3))>0 and int(len(channel6))>0:
                if(time.time()-timeBegin > measurementNumber*period):
                    measurementNumber += 1
                    file.write(str(timesList[-1]) + "," +str(channel0[-1]) + ","+ str(channel1[-1]) + "," +str(channel2[-1])+ "," +str(channel3[-1])+ "," +str(channel4[-1])+ "," +str(channel5[-1]) +"," +str(channel6[-1]) + "," +str(channel7[-1]) + "\n")

                    
                update_plot(channel0,channel1,channel2,channel3,channel4, channel5, channel6, channel7, ite)
                smu.clear_buf(1)
                #time.sleep(1/10)

            except KeyboardInterrupt:
                file.close()
                Ardu.close()
                smu.closeConnection()
                smu.off()
                exit()
           



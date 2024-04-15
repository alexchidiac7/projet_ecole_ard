from keithley import Keithley
import serial
import matplotlib.pyplot as plt
import csv
import time
from datetime import datetime
#plt.ion()

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
#sourceRange             = ()
measurementRange        = 10e-3
#Keithley configuration
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
measurement = []
timesList = []
# create an empty list to store the responses
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
# create a figure and a plot
fig, (axX,axY,axZ) = plt.subplots(3,1)
lineX, = axX.plot([], [])
lineY, = axY.plot([], [])
lineZ, = axZ.plot([], [])


# function to update the plot -really slow
def update_plot(channel3,channel6,channel1,timeList):
    for ax in [axX, axY, axZ]:
        ax.ticklabel_format(style='sci', axis='y', scilimits=(0,0))
    # update the data of the plot
    lineX.set_data(range(len(channel3)),channel3 )
    lineY.set_data(range(len(channel6)), channel6)
    lineZ.set_data(range(len(channel1)), channel1)
    # set the limits of the plot
    axX.set_xlim(0, len(channel3))
    axY.set_xlim(0, len(channel6))
    axZ.set_xlim(0, len(channel1))
    axX.set_ylim(min(channel3), max(channel3))
    axY.set_ylim(min(channel6), max(channel6))
    axZ.set_ylim(min(channel1), max(channel1))
    #axX.set_title("X Responses")
    axX.set_xlabel("Point")
    axX.set_ylabel("channel3")
    #axY.set_title("Y Responses")
    axY.set_xlabel("Point")
    axY.set_ylabel("channel6")
    #axZ.set_title("Z Responses")
    axZ.set_xlabel("Point")
    axZ.set_ylabel("channel1")
    # redraw the plot
    fig.canvas.draw()
    fig.canvas.flush_events()
# open the file in write mode
#now = datetime.now()
#dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")

#with open('current_measurements'+'dateAndTime'+.csv', 'w', newline='') as csvfile:
v = 0
with open("/home/pi/Desktop/Haptic_Bench/Measure/" + dateAndTime + suffix + ".txt" , "w") as file:
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
                #update_plot(channel1,channel3,channel6,ite)
                smu.clear_buf(1)
                #time.sleep(1/10)

            except KeyboardInterrupt:
                file.close()
                Ardu.close()
                smu.closeConnection()
                smu.off()
                exit()
           



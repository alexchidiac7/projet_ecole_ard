import serial
import matplotlib.pyplot as plt
import csv
import time
from datetime import datetime
import os

from keithley import Keithley

# Enable interactive mode
plt.ion()

def initialize_keithley():
    smu = Keithley('ASRL/dev/ttyUSB1::INSTR', 5000)
    time.sleep(1)
    smu.reset()
    smu.mode_4W()
    smu.format_ASCII()
    smu.clear_buf(1)
    smu.enable_app_buf()
    smu.enable_src_val_store()
    smu.set_m_range('i', 10e-3)
    smu.set_s_level('v', 0)
    smu.set_V_source()
    smu.set_s_level('v', 0)
    smu.on()
    return smu

def initialize_serial():
    Ardu = serial.Serial("/dev/ttyACM0", 115200)
    time.sleep(1)
    return Ardu

def initialize_plot():
    fig, axes = plt.subplots(2, 4, figsize=(15, 10))
    lines = [ax.plot([], [])[0] for ax in axes.flatten()]
    return fig, axes.flatten(), lines

def update_plot(lines, axes, data, timeList):
    for ax in axes:
        ax.ticklabel_format(style='sci', axis='y', scilimits=(0, 0))

    for i, line in enumerate(lines):
        line.set_data(range(len(data[i])), data[i])
        axes[i].set_xlim(0, len(data[i]))
        axes[i].set_ylim(min(data[i]), max(data[i]))

    fig.canvas.draw()
    fig.canvas.flush_events()

def main():
    smu = initialize_keithley()
    Ardu = initialize_serial()

    suffix = "WGOSP_SHEAR_Eli_Y"
    now = datetime.now()
    timeBegin = time.time()
    dateAndTime = now.strftime("%Y-%m-%d_%H-%M-%S_")

    script_dir = "/home/pi/test_projet_ecole/"
    measures_dir = os.path.join(script_dir, 'measures_MUX')
    os.makedirs(measures_dir, exist_ok=True)
    file_path = os.path.join(measures_dir, dateAndTime + suffix + ".txt")

    channels = [[] for _ in range(8)]
    timeList = []
    measurementNumber = 0
    period = 0.5

    fig, axes, lines = initialize_plot()

    with open(file_path, "w") as file:
        file.write("Time(s),channel0,channel1,channel2,channel3,channel4,channel5,channel6,channel7\n")
        channelNumber = -1
        v = 0

        try:
            while True:
                timesList.append(time.time() - timeBegin)
                channelNumber = (channelNumber + 1) % 8

                Ardu.write(str(channelNumber).encode())
                time.sleep(1./100)

                current = smu.measure('i')
                time.sleep(1./100)
                channels[channelNumber].append(float(smu.print_readings_buf()[0]))
                v += 1

                if time.time() - timeBegin > measurementNumber * period:
                    measurementNumber += 1
                    file.write(f"{timesList[-1]},{','.join(str(channels[i][-1]) for i in range(8))}\n")

                if channelNumber == 7:
                    update_plot(lines, axes, channels, timeList)
                smu.clear_buf(1)

        except KeyboardInterrupt:
            file.close()
            Ardu.close()
            smu.closeConnection()
            smu.off()
            exit()

if __name__ == "__main__":
    main()

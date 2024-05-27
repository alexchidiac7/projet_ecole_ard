import matplotlib.pyplot as plt
import pandas as pd

# Load the data from the txt file
data = pd.read_csv('data.txt')

# Extract the columns
timeList = data['Time(s)'].tolist()
channel0 = data['channel0'].tolist()
channel1 = data['channel1'].tolist()
channel2 = data['channel2'].tolist()
channel3 = data['channel3'].tolist()
channel4 = data['channel4'].tolist()
channel5 = data['channel5'].tolist()
channel6 = data['channel6'].tolist()
channel7 = data['channel7'].tolist()

# Create a figure and subplots for each channel
fig, ((ax0, ax1, ax2, ax3), (ax4, ax5, ax6, ax7)) = plt.subplots(2, 4, figsize=(15, 10))

# Initialize lines for each channel
line0, = ax0.plot([], [])
line1, = ax1.plot([], [])
line2, = ax2.plot([], [])
line3, = ax3.plot([], [])
line4, = ax4.plot([], [])
line5, = ax5.plot([], [])
line6, = ax6.plot([], [])
line7, = ax7.plot([], [])

def update_plot(channel0, channel1, channel2, channel3, channel4, channel5, channel6, channel7, timeList):
    for ax in [ax0, ax1, ax2, ax3, ax4, ax5, ax6, ax7]:
        ax.ticklabel_format(style='sci', axis='y', scilimits=(0, 0))
        
    # update the data of the plots
    line0.set_data(timeList, channel0)
    line1.set_data(timeList, channel1)
    line2.set_data(timeList, channel2)
    line3.set_data(timeList, channel3)
    line4.set_data(timeList, channel4)
    line5.set_data(timeList, channel5)
    line6.set_data(timeList, channel6)
    line7.set_data(timeList, channel7)
    
    # set the limits of the plots
    ax0.set_xlim(0, max(timeList))
    ax1.set_xlim(0, max(timeList))
    ax2.set_xlim(0, max(timeList))
    ax3.set_xlim(0, max(timeList))
    ax4.set_xlim(0, max(timeList))
    ax5.set_xlim(0, max(timeList))
    ax6.set_xlim(0, max(timeList))
    ax7.set_xlim(0, max(timeList))

    ax0.set_ylim(min(channel0), max(channel0))
    ax1.set_ylim(min(channel1), max(channel1))
    ax2.set_ylim(min(channel2), max(channel2))
    ax3.set_ylim(min(channel3), max(channel3))
    ax4.set_ylim(min(channel4), max(channel4))
    ax5.set_ylim(min(channel5), max(channel5))
    ax6.set_ylim(min(channel6), max(channel6))
    ax7.set_ylim(min(channel7), max(channel7))

    # set titles and labels for each plot
    ax0.set_xlabel("Time (s)")
    ax0.set_ylabel("Channel 0")

    ax1.set_xlabel("Time (s)")
    ax1.set_ylabel("Channel 1")

    ax2.set_xlabel("Time (s)")
    ax2.set_ylabel("Channel 2")

    ax3.set_xlabel("Time (s)")
    ax3.set_ylabel("Channel 3")

    ax4.set_xlabel("Time (s)")
    ax4.set_ylabel("Channel 4")

    ax5.set_xlabel("Time (s)")
    ax5.set_ylabel("Channel 5")

    ax6.set_xlabel("Time (s)")
    ax6.set_ylabel("Channel 6")

    ax7.set_xlabel("Time (s)")
    ax7.set_ylabel("Channel 7")

    # redraw the plot
    fig.canvas.draw()
    fig.canvas.flush_events()

# Update the plot with the data from the txt file
update_plot(channel0, channel1, channel2, channel3, channel4, channel5, channel6, channel7, timeList)
plt.show()

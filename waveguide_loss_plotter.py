import sys
from matplotlib import rcParams, cycler
import matplotlib.pyplot as plt
import csv
import numpy as np

def plot_waveguide_loss(file_path):
    # Configure plot aesthetics
    rcParams['font.family'] = 'sans-serif'
    rcParams['font.sans-serif'] = ['Arial']
    rcParams['font.size'] = 10
    rcParams['axes.linewidth'] = 1.1
    rcParams['axes.labelpad'] = 10.0
    plot_color_cycle = cycler('color', ['000000', '0000FE', 'FE0000', '008001', 'FD8000', '8c564b',
                                        'e377c2', '7f7f7f', 'bcbd22', '17becf'])
    rcParams['axes.prop_cycle'] = plot_color_cycle
    rcParams['axes.xmargin'] = 0
    rcParams['axes.ymargin'] = 0
    rcParams.update({"figure.figsize" : (6.4,4.8),
                     "figure.subplot.left" : 0.177, "figure.subplot.right" : 0.946,
                     "figure.subplot.bottom" : 0.156, "figure.subplot.top" : 0.965,
                     "axes.autolimit_mode" : "round_numbers",
                     "xtick.major.size"     : 7,
                     "xtick.minor.size"     : 3.5,
                     "xtick.major.width"    : 1.1,
                     "xtick.minor.width"    : 1.1,
                     "xtick.major.pad"      : 5,
                     "xtick.minor.visible" : True,
                     "ytick.major.size"     : 7,
                     "ytick.minor.size"     : 3.5,
                     "ytick.major.width"    : 1.1,
                     "ytick.minor.width"    : 1.1,
                     "ytick.major.pad"      : 5,
                     "ytick.minor.visible" : True,
                     "lines.markersize" : 4,
                     "lines.markerfacecolor" : "None",
                     "lines.markeredgewidth"  : 0.8})

    x2 = []
    y4 = []
    y5 = []
    y6 = []
    y7 = []
    y8 = []
    y9 = []

    # Read data from file
    with open(file_path, 'r') as csvfile:
        lines = csv.reader(csvfile, delimiter=',')
        next(lines)
        first_value = next(lines)
        for row in lines:
            x2.append(float(row[0]) - float(first_value[0]))
            y4.append(float(row[1]))
            y5.append(float(row[2]))
            y6.append(float(row[3]))
            y7.append(10 * np.log10(float(first_value[1]) / float(row[1])))
            y8.append(10 * np.log10(float(first_value[2]) / float(row[2])))
            y9.append(10 * np.log10(float(first_value[3]) / float(row[3])))

    # Convert to numpy arrays
    y7 = np.array(y7)
    y8 = np.array(y8)
    y9 = np.array(y9)
    x2 = np.array(x2)

    # Plot the data
    plt.figure(1)
    plt.plot(x2, y4, label="Right")
    plt.plot(x2, y5, label="Left")
    plt.plot(x2, y6, label="Middle")
    plt.ylabel('PD current [A]')
    plt.xlabel('Time [s]')
    plt.legend()
    plt.savefig("figure1.svg")

    plt.figure(2)
    plt.plot(x2, y7, label="Right")
    plt.plot(x2, y8, label="Left")
    plt.plot(x2, y9, label="Middle")
    plt.ylabel('Normalized waveguide Loss [dB]')
    plt.xlabel('Time [s]')
    plt.legend()
    plt.savefig("figure2.svg")

    plt.show()

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python waveguide_loss_plotter.py <file_path>")
        sys.exit(1)
    file_path = sys.argv[1]
    plot_waveguide_loss(file_path)

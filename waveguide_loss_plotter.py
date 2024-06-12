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
    plot_color_cycle = cycler('color', ['#000000', '#0000FE', '#FE0000', '#008001', '#FD8000', '#8c564b',
                                        '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'])
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

    # Read data from file
    with open(file_path, 'r') as csvfile:
        lines = csv.reader(csvfile, delimiter=',')
        headers = next(lines)
        num_channels = len(headers) - 1
        
        x2 = []
        y = [[] for _ in range(num_channels)]
        y_normalized = [[] for _ in range(num_channels)]
        
        first_value = None
        for row in lines:
            if first_value is None:
                # Check if the first six channels have numbers
                if all(row[i+1] != '0' for i in range(6)):
                    first_value = row
            
            if first_value:
                x2.append(float(row[0]) - float(first_value[0]))
                for i in range(num_channels):
                    y_value = float(row[i + 1])
                    y[i].append(y_value)
                    if y_value != 0:
                        y_normalized_value = 10 * np.log10(float(first_value[i + 1]) / y_value)
                    else:
                        y_normalized_value = 0  # or any appropriate value you want to use in case of zero
                    y_normalized[i].append(y_normalized_value)

    # Convert to numpy arrays
    x2 = np.array(x2)
    y = [np.array(channel) for channel in y]
    y_normalized = [np.array(channel) for channel in y_normalized]

    # Plot the data
    plt.figure(1)
    for i in range(num_channels):
        plt.plot(x2, y[i], label=headers[i + 1])
    plt.ylabel('PD current [A]')
    plt.xlabel('Time [s]')
    plt.legend()

    plt.figure(2)
    for i in range(num_channels):
        plt.plot(x2, y_normalized[i], label=headers[i + 1])
    plt.ylabel('Normalized waveguide Loss [dB]')
    plt.xlabel('Time [s]')
    plt.legend()

    plt.show()

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python waveguide_loss_plotter.py <file_path>")
        sys.exit(1)
    file_path = sys.argv[1]
    plot_waveguide_loss(file_path)

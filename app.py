import tkinter as tk
from tkinter import messagebox
import subprocess
import sys

class SimpleForm(tk.Tk):
    def __init__(self):
        super().__init__()
        self.process = None  # Reference to the running process
        self.entries = []  # List to store rows of entries
        self.initUI()

    def initUI(self):
        self.title('Control Panel')
        self.geometry('800x400')

        self.label = tk.Label(self, text='Z-axis Force:')
        self.label.pack()

        self.lineEdit = tk.Entry(self)
        self.lineEdit.pack()

        self.pushButton = tk.Button(self, text='Submit Z-axis Force', command=self.on_click)
        self.pushButton.pack()

        # Button to stop the XYZ_Force_Sensor_test.py script
        self.stopButton = tk.Button(self, text='Stop Script', command=self.stop_script)
        self.stopButton.pack()

        # New button for running additional scripts
        self.runScriptsButton = tk.Button(self, text='Run CNC and Keithley', command=self.run_additional_scripts)
        self.runScriptsButton.pack()

        # Frame to hold the entries
        self.entry_frame = tk.Frame(self)
        self.entry_frame.pack(fill=tk.BOTH, expand=True, pady=10)

        # Button to add a new row of G-code inputs
        self.addGcodeButton = tk.Button(self, text='Add G-code Inputs', command=self.add_gcode_row)
        self.addGcodeButton.pack(pady=10)

        # Button to save all G-codes to a file
        self.saveGcodeButton = tk.Button(self, text='Save G-codes to File', command=self.save_to_file)
        self.saveGcodeButton.pack()

    def add_gcode_row(self):
        # Each row has 4 inputs for G, X, Y, and F
        row_frame = tk.Frame(self.entry_frame)
        row_frame.pack(pady=5)
        row = {}
        for field in ['G', 'X', 'Y', 'F']:
            entry = tk.Entry(row_frame, width=10)
            entry.pack(side=tk.LEFT, padx=5)
            row[field] = entry
        self.entries.append(row)

    def save_to_file(self):
        # Compile all entries into G-code format and save to a file
        filename = 'output_gcode.txt'
        try:
            with open(filename, 'w') as file:
                for row in self.entries:
                    g = row['G'].get()
                    x = row['X'].get()
                    y = row['Y'].get()
                    f = row['F'].get()
                    if g and x and y and f:  # Check if all fields are filled
                        file.write(f"{g} X{x} Y{y} F{f}\n")
            messagebox.showinfo("Success", f"G-code saved to {filename}")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    def on_click(self):
        z_force_value = self.lineEdit.get()
        print(f"Entered Z-axis Force: {z_force_value}")
        try:
            z_force_value_float = float(z_force_value)
            command = ['python3', './XYZ_Force_Sensor_test.py', '--forcez', str(z_force_value_float)]
            self.process = subprocess.Popen(command)  # Use Popen to run the script asynchronously
            print("XYZ_Force_Sensor_test.py started successfully.")
        except ValueError:
            messagebox.showerror("Error", "Please enter a valid number for the Z-axis force.")

    def stop_script(self):
        if self.process is not None and self.process.poll() is None:
            self.process.terminate()  # Send SIGTERM
            print("Process terminated.")
        else:
            print("No running process to terminate.")

    def run_additional_scripts(self):
        try:
            subprocess.Popen(['python3', './CNC_Gcode.py'])
            print("CNC_Gcode.py started successfully.")

            subprocess.Popen(['python3', './Mux_Keithley_V3.py'])
            print("Mux_Keithley_V3.py started successfully.")

        except Exception as e:
            print(f"Error starting scripts: {e}")

if __name__ == '__main__':
    app = SimpleForm()
    app.mainloop()

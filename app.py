import subprocess
import sys
import tkinter as tk
from tkinter import messagebox

class SimpleForm(tk.Tk):
    def __init__(self):
        super().__init__()
        self.process = None  # Reference to the running process
        self.initUI()

    def initUI(self):
        self.title('Enter Z-axis Force')
        self.geometry('280x150')

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
            try:
                self.process.terminate()  # Attempt to terminate
                self.process.wait(timeout=1)  # Wait a bit for the process to terminate
            except subprocess.TimeoutExpired:
                self.process.kill()  # Force kill if not terminated
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

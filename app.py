import tkinter as tk
from tkinter import messagebox
import subprocess
import sys

class SimpleForm(tk.Tk):
    def __init__(self):
        super().__init__()
        self.process = None  # Reference to the running process
        self.entries = []  # List to store rows of entries
        self.rows = []  # List to store row frames for easy removal
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
        self.addGcodeButton.pack(side=tk.LEFT, padx=5, pady=10)

        # Button to clear all G-code inputs
        self.clearGcodeButton = tk.Button(self, text='Clear G-code Inputs', command=self.clear_gcode_rows)
        self.clearGcodeButton.pack(side=tk.LEFT, padx=5, pady=10)

        # Button to save all G-codes to a file
        self.saveGcodeButton = tk.Button(self, text='Save G-codes to File', command=self.save_to_file)
        self.saveGcodeButton.pack()

    def add_gcode_row(self):
        row_frame = tk.Frame(self.entry_frame)
        row_frame.pack(pady=5, fill=tk.X)
        row = {}

        # Setup an OptionMenu for G-code selection with user-friendly labels
        g_values = {'Linear': 'G01', 'Pause': 'G04'}  # Mapping of labels to G-codes
        g_var = tk.StringVar(row_frame)
        g_var.set('Linear')  # default value is 'Linear'
        g_menu = tk.OptionMenu(row_frame, g_var, *g_values.keys(), command=lambda value: self.update_row_fields(row_frame, row, value))
        g_menu.pack(side=tk.LEFT, padx=5)
        row['G'] = g_var

        # Store widgets for later destruction
        row['widgets'] = []

        # Initially create fields for 'Linear'
        self.create_fields_for_mode(row_frame, row, 'Linear')

        self.entries.append(row)
        self.rows.append(row_frame)

    def create_fields_for_mode(self, row_frame, row, mode):
        # Clear existing widgets in the row except for the OptionMenu
        for widget in row['widgets']:
            widget.destroy()
        row['widgets'].clear()

        # Based on the mode, create appropriate fields
        if mode == 'Pause':
            # Create a field for P
            p_entry = tk.Entry(row_frame, width=10)
            p_entry.pack(side=tk.LEFT, padx=5)
            row['P'] = p_entry
            row['widgets'].append(p_entry)
        else:
            # Create fields for X, Y, F
            for field in ['X', 'Y', 'F']:
                field_frame = tk.Frame(row_frame)
                field_frame.pack(side=tk.LEFT, padx=5, expand=True, fill=tk.X)
                label = tk.Label(field_frame, text=field)
                label.pack()
                entry = tk.Entry(field_frame, width=10)
                entry.pack()
                row[field] = entry
                row['widgets'].append(field_frame)

    def update_row_fields(self, row_frame, row, mode):
        # Update fields according to the mode (Linear or Pause)
        self.create_fields_for_mode(row_frame, row, mode)

        # Update fields according to the mode (Linear or Pause)
        self.create_fields_for_mode(row_frame, row, mode if mode in ['Linear', 'Pause'] else 'Linear')

    def clear_gcode_rows(self):
        # Destroy all row frames and clear the entries list
        for row_frame in self.rows:
            row_frame.destroy()
        self.entries.clear()
        self.rows.clear()

    def save_to_file(self):
        filename = 'output_gcode.txt'
        g_values = {'Linear': 'G01', 'Pause': 'G04'}  # Map labels to G-codes
        try:
            with open(filename, 'w') as file:
                file.write("%\n")
                for row in self.entries:
                    g_label = row['G'].get()
                    g_code = g_values[g_label]
                    parameters = []
                    if g_label == 'Pause':
                        p = row.get('P', None)
                        p = p.get() if p else ''
                        if p:
                            parameters.append(f"P{p}")
                    else:
                        for param in ['X', 'Y', 'F']:
                            entry = row.get(param, None)
                            val = entry.get() if entry else ''
                            if val:
                                parameters.append(f"{param}{val}")
                    
                    if parameters:
                        file.write(f"{g_code} {' '.join(parameters)}\n")
                file.write("%\n")
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

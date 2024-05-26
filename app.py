import tkinter as tk
from tkinter import messagebox, filedialog
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
        self.label.grid(row=0, column=0, padx=10, pady=10, sticky='e')

        self.lineEdit = tk.Entry(self)
        self.lineEdit.grid(row=0, column=1, padx=10, pady=10, sticky='w')

        self.pushButton = tk.Button(self, text='Submit Z-axis Force', command=self.on_click)
        self.pushButton.grid(row=0, column=2, padx=10, pady=10, sticky='w')

        # Button for running CNC_Gcode.py script
        self.runCNCButton = tk.Button(self, text='Run CNC', command=self.run_cnc_script)
        self.runCNCButton.grid(row=1, column=0, padx=10, pady=10, sticky='e')

        # Button for running Mux_Keithley_V3.py script
        self.runKeithleyButton = tk.Button(self, text='Run Keithley', command=self.run_keithley_script)
        self.runKeithleyButton.grid(row=1, column=1, padx=10, pady=10, sticky='w')

        # Button to stop the XYZ_Force_Sensor_test.py script
        self.stopButton = tk.Button(self, text='Stop Simulation', command=self.stop_script)
        self.stopButton.grid(row=2, column=0, columnspan=2, padx=10, pady=10)

        # Frame to hold the entries
        self.entry_frame = tk.Frame(self)
        self.entry_frame.grid(row=3, column=0, columnspan=3, padx=10, pady=10, sticky='nsew')

        # Frame to hold the G-code buttons
        self.gcode_button_frame = tk.Frame(self)
        self.gcode_button_frame.grid(row=4, column=0, columnspan=3, padx=10, pady=10, sticky='nsew')

        # Button to add a new row of G-code inputs
        self.addGcodeButton = tk.Button(self.gcode_button_frame, text='Add G-code Inputs', command=self.add_gcode_row)
        self.addGcodeButton.grid(row=0, column=0, padx=5, pady=10)

        # Button to clear all G-code inputs
        self.clearGcodeButton = tk.Button(self.gcode_button_frame, text='Clear G-code Inputs', command=self.clear_gcode_rows)
        self.clearGcodeButton.grid(row=0, column=1, padx=5, pady=10)

        # Button to save all G-codes to a file
        self.saveGcodeButton = tk.Button(self.gcode_button_frame, text='Save G-codes to File', command=self.save_to_file)
        self.saveGcodeButton.grid(row=1, column=0, columnspan=2, pady=5)

        # Button to select and run forces_plotter.py
        self.runForcesPlotterButton = tk.Button(self.gcode_button_frame, text='Run Forces Plotter', command=self.run_forces_plotter)
        self.runForcesPlotterButton.grid(row=2, column=0, padx=5, pady=5)

        # Button to run waveguide loss plotter
        self.runWaveguideLossPlotterButton = tk.Button(self.gcode_button_frame, text='Run Waveguide Loss Plotter', command=self.run_waveguide_loss_plotter)
        self.runWaveguideLossPlotterButton.grid(row=2, column=1, padx=5, pady=5)


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

    def create_fields_for_mode(self, row_frame, row, mode):
        for widget in row['widgets']:
            widget.destroy()
        row['widgets'].clear()

        if mode == 'Pause':
            p_entry = tk.Entry(row_frame, width=10)
            p_entry.pack(side=tk.LEFT, padx=5)
            row['P'] = p_entry
            row['widgets'].append(p_entry)
        else:
            for field in [('X (cm)', 'X'), ('Y (cm)', 'Y'), ('Vitesse', 'F')]:
                field_frame = tk.Frame(row_frame)
                field_frame.pack(side=tk.LEFT, padx=5, expand=True, fill=tk.X)
                label = tk.Label(field_frame, text=field[0])
                label.pack()
                entry = tk.Entry(field_frame, width=10)
                entry.pack()
                row[field[1]] = entry
                row['widgets'].append(field_frame)

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
                                if param in ['X', 'Y']:
                                    val = str(float(val) * 62.5)
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
            command = ['python3', './alex_interface_xyz.py', '--forcez', str(z_force_value_float)]
            self.process = subprocess.Popen(command)  # Use Popen to run the script asynchronously
            print("alex_interface_xyz.py started successfully.")
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

    # this runs both CNC and Keithley together
    def run_additional_scripts(self):
        try:
            subprocess.Popen(['python3', './CNC_Gcode.py'])
            print("CNC_Gcode.py started successfully.")
            subprocess.Popen(['python3', './Mux_Keithley_V3.py'])
            print("Mux_Keithley_V3.py started successfully.")
        except Exception as e:
            print(f"Error starting scripts: {e}")


    def run_cnc_script(self):
        try:
            subprocess.Popen(['python3', './CNC_Gcode.py'])
            print("CNC_Gcode.py started successfully.")
        except Exception as e:
            print(f"Error starting CNC script: {e}")

    def run_keithley_script(self):
        try:
            subprocess.Popen(['python3', './Mux_Keithley_V3.py'])
            print("Mux_Keithley_V3.py started successfully.")
        except Exception as e:
            print(f"Error starting Keithley script: {e}")

    def run_forces_plotter(self):
        file_path = filedialog.askopenfilename(filetypes=[("Text files", "*.txt")])
        if file_path:
            try:
                subprocess.Popen(['python3', 'forces_plotter.py', file_path])
                print(f"forces_plotter.py started with file: {file_path}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to start forces_plotter.py: {e}")

# Inside the SimpleForm class, add this method:

    def run_waveguide_loss_plotter(self):
        file_path = filedialog.askopenfilename(filetypes=[("Text files", "*.txt")])
        if file_path:
            try:
                subprocess.Popen(['python3', 'waveguide_loss_plotter.py', file_path])
                print(f"waveguide_loss_plotter.py started with file: {file_path}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to start waveguide_loss_plotter.py: {e}")

if __name__ == '__main__':
    app = SimpleForm()
    app.mainloop()

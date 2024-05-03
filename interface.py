import tkinter as tk
import threading
import time
import subprocess
import sys
from tkinter import messagebox
from customtkinter import * 
class MyGUI(tk.Tk):
    def __init__(self):
        super().__init__()
        set_appearance_mode("dark")
        self.title("Z-AXIS Force")
        self.geometry("600x400")
        self.entry=None
        self.process=None
        self.forceZ_label=None
        self.current_position = tk.StringVar()
        self.initUI()

    def initUI(self):
       frame= CTkFrame(master=self,fg_color="#424242",border_color="#000000",border_width=2)
       frame.pack(expand=True)

       




       self.status_label0=tk.Label(master=frame,text="XYZ Force Sensor",bg="#424242", fg="white")
       self.status_label=tk.Label(master=frame,text="no process is running",bg="#424242", fg="white")
       self.status_label.place(relx=0.5,rely=0.8,anchor='center')
       btn=CTkButton(master=frame,text=' submit Z force ',corner_radius=32,fg_color="#0B614B",hover_color="#04B404",command=self.on_button_click)

       btn1=CTkButton(master=frame,text=' Break script ',corner_radius=32,fg_color="#0B614B",hover_color="#04B404",command=self.break_script)

       btn2=CTkButton(master=frame,text='run CNC and Keithley',corner_radius=32,fg_color="#0B614B",hover_color="#04B404",command=self.run_otherScripts)

       self.entry=CTkEntry(master=frame,placeholder_text="Type Z-axis value...",width=200,)
       
       self.status_label0.pack(anchor="s",expand=True,pady=10,padx=30)
       self.entry.pack(anchor="s",expand=True,pady=20,padx=30)
       self.status_label.pack(anchor="s",expand=True,pady=10,padx=30)
       btn.pack(anchor="n",expand=True,pady=15,padx=20)
       btn1.pack(anchor="n",expand=True,pady=15,padx=20)
       btn2.pack(anchor="n",expand=True,pady=15,padx=20)

       self.current_position_label = tk.Label(master=frame, textvariable=self.current_position, bg="#424242", fg="white")
       self.current_position_label.pack(anchor="s", expand=True, pady=10, padx=30)
       
    def break_script(self):
        if self.process is not None and self.process.poll() is None: #poll() lorsque le process est en cours elle retourne none sinon elle retourne le résultat du process mais ici on l'a utilisé que pour none
            self.process.terminate()
            print("script stopped")
            self.status_label.config(text="Script stopped",fg="red")
        else:
            print("no process is running")
            self.status_label.config(text="no process is running")


    def on_button_click(self):
        forceZ_value=self.entry.get()
        if forceZ_value.strip() :
            try:
                forceZ_value_float=float(forceZ_value)
                if forceZ_value_float < 2.5:
                  print(f"entered value:{forceZ_value}")
                  command=['python3','./XYZ_Force_Sensor_test.py','--forcez',str(forceZ_value_float)]
                  self.process=subprocess.Popen(command)
                  print("XYZ_Force_Sensor_test started successfully...")
            except ValueError:
                messagebox.showerror("Error", "Please enter a valid number for the Z-axis force.")
        else:
            messagebox.showerror("Error", "Please enter a valid number for the Z-axis force.")


    def run_otherScripts(self):
        try:
            self.status_label.config(text="Running CNC_Gcode...", fg="blue")
            if subprocess.run(['python3', './CNC_Gcode.py']).returncode==0:
                self.status_label.config(text="CNC_Gcode completed successfully.", fg="green")
                print("CNC_Gcode started successfully...")
            else:
                self.status_label.config(text="Error while running CNC_Gcode.", fg="red")
                print("error while running CNC_Gcode.")
            self.status_label.config(text="Running Mux_Keithley_V3...", fg="blue")    
            if subprocess.run(['python3', './Mux_Keithley_V3.py']).returncode==0:
                self.status_label.config(text="Mux_Keithley_V3 completed successfully.", fg="green")
                print("Mux_Keithley_V3 started successfully...")
            else:
                self.status_label.config(text="Error while running Mux_Keithley_V3.", fg="red")
                print("error while running Mux_Keithley_V3.")    
        except Exception as e :
            self.status_label.config(text=f"Error starting scripts: {e}", fg="red")
            messagebox.showerror("Error", f"Error starting Scripts: {e}")    
    
    def update_current_position(self):
        for position in range (0,2.5):
            self.current_position.set(str(position))
            time.sleep(1)

if __name__ == "__main__":
    app = MyGUI()
    app.mainloop()

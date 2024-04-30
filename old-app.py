import subprocess
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton

class SimpleForm(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Enter Z-axis Force')
        self.setGeometry(100, 100, 280, 80)
        
        layout = QVBoxLayout()
        
        self.label = QLabel('Z-axis Force:')
        layout.addWidget(self.label)
        
        self.lineEdit = QLineEdit(self)
        layout.addWidget(self.lineEdit)
        
        self.pushButton = QPushButton('Submit Z-axis Force', self)
        self.pushButton.clicked.connect(self.on_click)
        layout.addWidget(self.pushButton)
        
        # New button for running additional scripts
        self.runScriptsButton = QPushButton('Run CNC and Keithley', self)
        self.runScriptsButton.clicked.connect(self.run_additional_scripts)
        layout.addWidget(self.runScriptsButton)
        
        self.setLayout(layout)

    def on_click(self):
        z_force_value = self.lineEdit.text()
        print(f"Entered Z-axis Force: {z_force_value}")
        try:
            z_force_value_float = float(z_force_value)
            command = ['python3', './XYZ_Force_Sensor_test.py', '--forcez', str(z_force_value_float)]
            subprocess.Popen(command)  # Use Popen to run the script asynchronously
            print("XYZ_Force_Sensor_test.py started successfully.")
        except ValueError:
            print("Please enter a valid number for the Z-axis force.")

    def run_additional_scripts(self):
        try:
            subprocess.Popen(['python3', './CNC_Gcode.py'])
            print("CNC_Gcode.py started successfully.")
            
            subprocess.Popen(['python3', './Mux_Keithley_V3.py'])
            print("Mux_Keithley_V3.py started successfully.")
            
        except Exception as e:  # Catching a broad exception as Popen won't directly raise CalledProcessError
            print(f"Error starting scripts: {e}")

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = SimpleForm()
    ex.show()
    sys.exit(app.exec_())

#Test_push
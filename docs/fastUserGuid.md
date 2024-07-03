# Fast User Guide

## GMO Machine User Guide

To use the GMO machine, we first have to make sure that all the connections are set. Most probably they are, however sometimes they disconnect the Keithley (the current measurement machine). You’ll have to refer to our GitHub documentation to see the connections. In summary, you need to connect the 2 pins of the Keithley to Pin 3 and Pin 8 of the Mux and also connect the ethernet of the Keithley to the Raspberry Pi.

## Initial Setup

1. **Turn on:**
    - The Raspberry Pi
    - The DC Supply System
    - The Keithley System Source

2. **Open a Terminal in the Raspberry Pi system**
3. **Navigate to the Folder `test_projet_ecole`**
    - 
    ```
        cd test_projet_ecole
    ```
4. **Using Git**
    - We use git to push/pull updates to this project.
    - The `master` branch was used for documentation.
    - The main code branch is `alex-app-2`.
    - The interface is in the `app.py` file.
5. **Run the Interface**
    - 
    ```
    python3 app.py
    ```
    
## Starting the Simulation

Assuming you know the basics, this user guide is a summary of a much larger one. Refer to the other, more comprehensive document for a concrete example.

### Step 1: Positionning the CNC Machine

1. **Initial Position**
    - Save coordinates (enter them in the “Add G-codes” rows and then click “Save G-codes to file”).
2. **Run CNC**
    - This moves the machine to the saved coordinates in the txt files.
3. **Re-save New Coordinates**
    - These coordinates will serve as position number 2.

### Step 2: Start the Simulation

1. **Enter a Force (in Newtons)**
2. **Click ‘Submit Z-axis Force’**
3. **Start Taking Measurements**
    - After a couple of seconds, click ‘Run Keithley’.
4. **Move the Machine**
    - When the machine hits the surface of the GMO, click ‘Run CNC’.
    - If the machine didn’t move, it means you didn’t update your coordinates.
5. **End the Simulation**
    - When you arrive at the desired position, click ‘Stop simulation’ or press `CTRL+C` in your terminal.
    - This completes the full simulation.

### Step 3: Generate Graphs

#### View Your Simulation Measurements

1. **Run Forces Plotter**
    - Click on "Run Forces Plotter".
    - Choose the file in `mesures_XYZ` (select the latest one related to your simulation).
    - This will generate a graph of forces Fx, Fy, and Fz.

2. **Run Waveguide Loss Plotter**
    - Click on “Run Waveguide Loss Plotter”.
    - Choose the file in `mesures_MUX` (select the latest one related to your simulation).

---

This is a brief explanation. Refer to the more comprehensive documentation with a concrete example for a better understanding.

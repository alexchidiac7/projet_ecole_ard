import pyvisa as visa
import serial
import pandas as pd
from serial import SerialException
import time

class Keithley():
    """Class for Keithley control."""

    def __init__(self, address, timeout, read_term='\n', baudrate=115200):
        """Make instrument connection instantly on calling class."""
        print("hello")
        rm = visa.ResourceManager('@py')  # use py-visa backend
        print(rm.list_resources())
        self.makeConnection(rm, address, timeout, read_term, baudrate)

    def __del__(self):
        """
        Action to perform on class destruction.

        Args:
            - None.

        Returns:
            - None.
        """

        self.closeConnection()

    def makeConnection(self, rm, address, timeout, read_term, baudrate):
        """Make initial connection to instrument."""
        try:
            if 'ttyS' or 'ttyUSB' in str(address):
                # Connection via SERIAL
                self.inst = rm.open_resource(address)
                self.inst.read_termination = str(read_term)
                self.inst.term_chars = str(read_term)
                self.inst.baud_rate = baudrate
                self.inst.timeout = timeout
                print(self._query('*IDN?'))

            if 'GPIB' in str(address):
                # Connection via GPIB

                self.inst = rm.open_resource(address)
                self.inst.read_termination = str(read_term)
                self.inst.term_chars = str(read_term)
                print(f"GPIB connection.")

            if 'TCPIP' in str(address):
                # Connection via ethernet
                self.inst = rm.open_resource(address)
                self.inst.write_termination = str(read_term)
                self.inst.read_termination = str(read_term)
                self.inst.term_chars = str(read_term)
                # self.inst.timeout = timeout
                # print(self._query('*IDN?'))


        except SerialException:
            print("CONNECTION ERROR: Check instrument address.")
            raise ConnectionError

    def closeConnection(self):
        """Close connection to keithley."""
        try:
            self.inst.close()
            print(f"Keithley closed.")

        except(NameError):
            print('CONNECTION ERROR [NameError]: No connection established.')

        except(AttributeError):
            print('CONNECTION ERROR [AttributeError]: No connection established.')

    def on(self):
        """Turn ON the output."""
        self._write("smua.source.output = smua.OUTPUT_ON")

    def off(self):
        """Turn OFF the output."""
        self._write("smua.source.output = smua.OUTPUT_OFF")

    def reset(self):
        """Reset the SMU."""
        self._write("smua.reset()")

    def format_ASCII(self):
        """Select ASCII data format."""
        self._write("format.data = format.ASCII")

    ### Buffer configuration ###

    def enable_app_buf(self):
        """Enable append buffer mode."""
        self._write("smua.nvbuffer1.appendmode = 1")

    def disable_app_buf(self):
        """Enable append buffer mode."""
        self._write("smua.nvbuffer1.appendmode = 0")

    def enable_src_val_store(self):
        """Enable source value storage."""
        self._write("smua.nvbuffer1.collectsourcevalues = 1")

    def disable_src_val_store(self):
        """Enable source value storage."""
        self._write("smua.nvbuffer1.collectsourcevalues = 0")

    ### SMU configuration ###

    def mode_2W(self):
        """Set 2-Wire mode."""
        self._write("smua.sense = smua.SENSE_LOCAL")

    def mode_4W(self):
        """Set 4-Wire mode."""
        self._write("smua.sense = smua.SENSE_REMOTE")

    def set_s_autorange(self, i):
        """Set source range to auto. i= 'v' , 'i' , 'r'."""
        self._write("smua.source.autorange"+str(i)+" = smua.AUTORANGE_ON")

    def set_m_autorange(self, i):
        """Set measure range to auto. i= 'v' , 'i' , 'r'."""
        self._write("smua.measure.autorange"+str(i)+" = smua.AUTORANGE_ON")

    def set_s_range(self, i, gauge):
        """Set source range. i= 'v' , 'i' , 'r'."""
        self._write("smua.source.range"+str(i)+" = "+str(gauge))

    def set_m_range(self, i, gauge):
        """Set measure range. i= 'v' , 'i' , 'r'."""
        self._write("smua.measure.range"+str(i)+" = "+str(gauge))

    def set_V_source(self):
        """Set smu in voltage source function."""
        self._write("smua.source.func = smua.OUTPUT_DCVOLTS")

    def set_I_source(self):
        """Set smu in current source function."""
        self._write("smua.source.func = smua.OUTPUT_DCAMPS")

    def set_s_level(self, i, val):
        """Set source value. i= 'v' , 'i' , 'r'."""
        self._write("smua.source.level"+str(i)+" = "+str(val))

    def set_s_limit(self, i, val):
        """Set source value. i= 'v' , 'i' , 'r'."""
        self._write("smua.source.limit"+str(i)+" = "+str(val))

    def set_delay(self, delay):
        """Set delay before the first measurement in seconds."""
        self._write("smua.measure.delay = "+str(delay))

    def set_period(self, period):
        """Set period between two measurements in seconds."""
        self._write("smua.measure.interval = "+str(period))

    def set_count(self, count):
        """Set the number of measurements."""
        self._write("smua.measure.count = "+str(count))

    def clear_buf(self, n):
        """Clear the SMU buffer."""
        self._write("smua.nvbuffer"+str(n)+".clear()")

    def _write(self, m):
        """Write to instrument."""
        try:
            assert type(m) == str
            self.inst.write(m)
        except AttributeError:
            print('CONNECTION ERROR: No connection established.')

    def _query(self, s):
        """Query instrument."""
        try:
            r = self.inst.query(s)
            return r
        except SerialException:
            return ('Serial port busy, try again.')
        except FileNotFoundError:
            return ('CONNECTION ERROR: No connection established.')
        except AttributeError:
            print('CONNECTION ERROR: No connection established.')
            return ('CONNECTION ERROR: No connection established.')

    def loadTSP(self, tsp):
        """Load an anonymous TSP script into the K2636 nonvolatile memory."""
        try:
            tsp_dir = 'TSP-scripts/'  # Put all tsp scripts in this folder
            self._write('loadscript')
            line_count = 1
            for line in open(str(tsp_dir + tsp), mode='r'):
                self._write(line)
                line_count += 1
            self._write('endscript')
            print('----------------------------------------')
            print('Uploaded TSP script: ', tsp)

        except FileNotFoundError:
            print('ERROR: Could not find tsp script. Check path.')
            raise SystemExit

    def runTSP(self):
        """Run the anonymous TSP script currently loaded in the K2636 memory."""
        self._write('script.anonymous.run()')
        print('Measurement in progress...')

    def readBufferV(self):
        """Read buffer in memory and return an array."""
        try:
            s = [float(x) for x in self._query('printbuffer'+'(1, smua.nvbuffer1.n, smua.nvbuffer1.sourcevalues)').split(',')]
            m = [float(x) for x in self._query('printbuffer'+'(1, smua.nvbuffer1.n, smua.nvbuffer1.readings)').split(',')]

            df = pd.DataFrame({'Current [A]': s, 'Voltage [V]': m})
            return df

        except SerialException:
            print('Cannot read buffer.')
            return

    ### SMU functions ###

    def measureV(self, sample):
        """Measure voltage with zero current source."""
        try:
            begin_time = time.time()
            self.loadTSP('measureV.tsp')
            self.runTSP()
            df = self.readBufferV()
            output_name = str(sample + '-output.csv')
            df.to_csv(output_name, sep='\t', index=False)
            finish_time = time.time()
            print('Output sweeps complete. Elapsed time %.2f mins.'
                  % ((finish_time - begin_time) / 60))

        except(AttributeError):
            print('Cannot perform output sweep: no keithley connected.')

    def sweepVlin_measureI(self, startv, stopv, stime, points):
        """Sweep voltage from startv to stopv with points steps
            wait stime seconds at each step, and log current"""
        try:
            #begin_time = time.time()
            self._write("SweepVLinMeasureI(smua," + str(startv) + "," + str(stopv) + "," + str(stime) + "," +str(points) + ")")
            #df = self.readBufferV()
            #output_name = str(sample + '-output.csv')
            #df.to_csv(output_name, sep='\t', index=False)
            #finish_time = time.time()
            #print('Output sweeps complete. Elapsed time %.2f mins.'
            #      % ((finish_time - begin_time) / 60))

        except(AttributeError):
            print('Cannot perform output sweep: no keithley connected.')

    def measure(self,i):
        """Record a measurement into the buffer."""
        self._write("smua.measure."+str(i)+"(smua.nvbuffer1)")

    def print_readings_buf(self):
        """Print the value of the readings buffer."""
        result = self._query('printbuffer'+'(1, smua.nvbuffer1.n, smua.nvbuffer1.readings)').split(',')
        # print(result)
        return result

    def print_srcvalues_buf(self):
        """Print the value of the source values buffer."""
        result = self._query('printbuffer'+'(1, smua.nvbuffer1.n, smua.nvbuffer1.sourcevalues)').split(',')
        # print(result)
        return result

    def print_timestamps_buf(self):
        """Print the value of the readings buffer."""
        result = self._query('printbuffer'+'(1, smua.nvbuffer1.n, smua.nvbuffer1.timestamps)').split(',')
        # print(result)
        return result

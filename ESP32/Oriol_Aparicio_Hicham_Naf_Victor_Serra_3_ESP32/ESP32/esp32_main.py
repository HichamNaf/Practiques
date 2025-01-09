from esp32_peripheral import Peripheral
from esp32_uart import UartComms
from time import sleep_ms
import json

class MainProgram():
    
    def __init__(self):
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Construir els objectes self.comms i self.peripheral >>> #
        self.comms = UartComms()        # Initialize UART communication on port 1 at 115200 baud
        self.peripheral = Peripheral(self.command_callback)  # Initialize the peripheral object

    def command_callback(self, command):
        obj = {}
        obj["command"] = command
        json_str = json.dumps(obj) + "\r\n"
        self.comms.uart.write(json_str)

    def execute(self):
        while True:
            
            sleep_ms(100)

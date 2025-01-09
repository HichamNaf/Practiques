from machine import UART,Pin
import json
from time import sleep_ms
import _thread

class UartComms:
    
    flag_start = False
    flag_stop = False
    stop_callback = None
    
    
    def __init__(self):
        self.uart = UART(0, 115200, rx=Pin(1), tx=Pin(0))
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Construir la classe self.uart el baudrate ha de ser igual al del ESP32>>> #
        # <<< Si no s'indiquen pins, la rpi utilitza per defecte rx = 1, tx = 0 >>> #
        _thread.start_new_thread(self.__task, (None, None, None))
        sleep_ms(200)
        
    def __task(self, arg1, arg2, arg3):
        while True:
            line = self.uart.readline()
            if(line != None):
                try:
                    obj = json.loads(line)
                    if('command' in obj):
                        if obj['command'] == 'start':
                            self.flag_start = True
                        if obj['command'] == 'stop':                          
                            self.flag_stop = True
                        if obj['command'] == 'move':
                            None
                except:
                    None
            sleep_ms(100)
    
    def start(self):
        if(self.flag_start == True):
            self.flag_start = False
            return True
        return False

    def stop(self):
        if(self.flag_stop == True):
            self.flag_stop = False
            return True
        return False
        

if __name__ == "__main__":
    comms = UartComms()
    while True:
        if(comms.start() == True):
            print("Start")
        sleep_ms(1000)

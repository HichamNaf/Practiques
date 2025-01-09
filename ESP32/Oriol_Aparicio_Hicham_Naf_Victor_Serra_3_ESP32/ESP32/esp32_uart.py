from machine import UART
import json
from time import sleep_ms

class UartComms:
    
    def __init__(self):
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Completar amb una línia que crei l'objecte self.uart amb els pins tx = 4 i rx = 5 >>> #
        # <<< Com que la UART es asincrona el baudrate ha de coincidir amb el de la rpi >>> #
        self.uart = UART(1, baudrate=115200, tx=4, rx=5)
        
    def send_command(self, command : str):
        obj = {}
        obj['command'] = command;
        json_str = json.dumps(obj) + "\r\n"
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Completar amb una linea que escrigui json_str a traves de la uart >>> #
        self.uart.write(json_str.encode('utf-8'))

if __name__ == "__main__":
    comms = UartComms()
    while True:
        comms.send_command("start")
        sleep_ms(1000)

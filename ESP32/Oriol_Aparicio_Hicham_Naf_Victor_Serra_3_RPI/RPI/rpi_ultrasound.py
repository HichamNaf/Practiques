from time import ticks_us, sleep_us, sleep_ms
from machine import Pin, Timer
import _thread

class Ultrasound:
    
    def __init__(self):
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Definir el trigger com el Pin 3 de sortida >>>
        # <<< Definir el echo com el Pin 2 de entrada >>>
        self.trig = Pin(3, Pin.OUT)
        self.echo = Pin(2, Pin.IN)
        
    def get_distance(self):
        # Generate 10us square wave.
        self.trig.low()
        sleep_us(2)
        self.trig.high()
        sleep_us(10)
        self.trig.low()
        while self.echo.value() == 0:
            start = ticks_us() # <<< COMPLETAR CODI AQUÍ, obtenir el valor dels ticks en us >>> #
        while self.echo.value() == 1:
            end = ticks_us() # <<< COMPLETAR CODI AQUÍ, obtenir el valor dels ticks en us >>> #
        dis = (end - start) * 0.0343 / 2
        # round to two decimal places.
        return round(dis, 2)
    
if __name__ == "__main__":
    ultrasound = Ultrasound()
    while True:
        print(ultrasound.get_distance())
        sleep_ms(1000)
        
    

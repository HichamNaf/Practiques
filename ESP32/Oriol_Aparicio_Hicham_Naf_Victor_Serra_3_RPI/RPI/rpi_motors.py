from time import sleep
from machine import PWM, Pin

class Motor:
    
    def __init__(self, pin_fwd, pin_rvr):
        self.fwd = PWM(Pin(pin_fwd))
        self.fwd.freq(500)
        self.rvr = PWM(Pin(pin_rvr))
        self.rvr.freq(500)
        
    def rotate(self, power):
    # Para hacer que el motor vaya hacia adelante, acciona el PWM con el duty_u16_cycle que corresponda a power.
    # Si power = 100 significa que la potencia es del 100%, duty_u16_cycle = 100%.
        if power > 0:
            #To convert the duty_u16_cycle percentage value to the 0-1023 range (power range), you can multiply it by a factor of 10.24.
            power = (power)/100
            self.fwd.duty_u16(int(power * 65535))
            self.rvr.duty_u16(0)
        # Para hacer que el motor vaya hacia atrás, acciona el PWM con el duty_u16_cycle que corresponda a -power.
        # Si power = -100 significa que la potencia es del 100%, duty_u16_cycle = 100%.
        elif power < 0:
            power = (-power)/100
            self.fwd.duty_u16(0)
            self.rvr.duty_u16(int(power * 65535))
            
            
        else:
            self.fwd.duty_u16(0)
            self.rvr.duty_u16(0)
            
            self.stop
    
    def stop(self):
        self.fwd.duty_u16(0)
        self.rvr.duty_u16(0)
        
'''
Motor interface.

        front
    M1  _____  M2
       |     |
       |     |
       |     |
    M4 |_____| M3
'''

class Car:

    m1 = Motor(12, 13)
    m2 = Motor(15, 14)
    m3 = Motor(17, 16)
    m4 = Motor(18, 19)

    motors = [m1, m2, m3, m4]
    
    def __init__(self):
        None
        
    def move(self, power):
        for i in range(4):
            self.motors[i].rotate(power)
            
    def stop(self):
        self.move(0)
    
    def test(self):
        for i in range(4):
            self.motors[i].rotate(100)
            sleep(2)
            self.motors[i].rotate(-100)
            sleep(2)
            self.motors[i].stop()
            
    
if __name__ == "__main__":
    car = Car()
    car.test()
    

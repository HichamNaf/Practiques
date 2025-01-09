from rpi_uart import UartComms
from rpi_ultrasound import Ultrasound
from rpi_motors import Car
from time import sleep_ms, ticks_ms, ticks_diff
from rpi_lcd1602 import LCD
from machine import SoftI2C, Pin
import sys

class MainProgram():
    
    def __init__(self):
        self.comms = UartComms()
        self.ultrasound = Ultrasound()
        self.car = Car()
        self.lcd = LCD(SoftI2C(sda = Pin(20), scl = Pin(21)))
        self.initial_ticks = ticks_ms()
        self.final_ticks = ticks_ms()
        self.initial_distance = self.ultrasound.get_distance()
        self.final_distance = self.ultrasound.get_distance()
        self.flag_stopped = False

    def calculate_speed_forward(self, motor_power, final_distance):
        
        # Netejar lcd
        self.lcd.clear()
        self.lcd.puts("Moving Forward", 0, 0)
        
        # Guardar com a variables de classe initial_ticks i initial_distance
        self.initial_ticks = ticks_ms()
        self.initial_distance = self.ultrasound.get_distance()
        
        # Començar a moure el cotxe a la potencia indicada
        self.car.move(motor_power)
        
        # Mentre la distancia sigui superior a la distancia final esperar un un bucle
        while self.ultrasound.get_distance() > final_distance:
          	# A dins del bucle comprobar si s'ha rebut un stop per les  comms de la UART i en cas afirmatiu, fer un sys.exit()
            if self.comms.stop():
                self.car.stop()
                sys.exit()
            sleep_ms(50)
            
        # En sortir del bucle parar els motors del cotxe
        self.car.stop()
        
        # Obtenir els valors de final_ticks i final_distance
        self.final_ticks = ticks_ms()
        self.final_distance = self.ultrasound.get_distance()
        
        # Calcular la velocitat en m / s
        time_elapsed = ticks_diff(self.final_ticks, self.initial_ticks) / 1000
        
        #inicial - final = distancia recorreguda
        speed = (self.initial_distance - self.final_distance) / time_elapsed  
        
        # Escriure a la fila 0 del LCD la distancia final
        self.lcd.puts("Distance: " + str(self.final_distance) + "cm", 0, 0)
        
        # Escriure a la fila 1 del LCD la velocitat calculada
        self.lcd.puts("Speed: " + str(round(speed, 2)) + "m/s", 1, 0)
        
        # retornar el valor de la velocitat calculada
        return speed
        

    def calculate_speed_reverse(self, motor_power, final_distance):
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Ha de ser una analogia de la funció speed forward >>>
        # <<< Considerar que per anar endarrera el valor de car.move ha de ser negatiu >>> #
        self.lcd.clear()
        self.lcd.puts("Moving Backward", 0, 0)
        
        self.initial_ticks = ticks_ms()
        self.initial_distance = self.ultrasound.get_distance()
        
        self.car.move(-motor_power)
        
                
        while self.ultrasound.get_distance() < final_distance:

            if self.comms.stop():
                sys.exit()
            sleep_ms(50)
        
        self.car.stop()
        
        self.final_ticks = ticks_ms()
        self.final_distance = self.ultrasound.get_distance()
        
        time_elapsed = ticks_diff(self.final_ticks, self.initial_ticks) / 1000
        
        #final - inicial ja que es reverse speed i sino la distancia recorreguda ens sortiria negativa.
        speed = (self.final_distance - self.initial_distance) / time_elapsed
        
        self.lcd.puts("Distance: " + str(self.final_distance) + "cm", 0, 0)
        self.lcd.puts("Speed: " + str(round(speed, 2)) + "m/s", 1, 0)
        
        return speed
    
    def execute(self):
        self.lcd.puts("Ready Send start", 0,0)
        while self.comms.start() == False:
            sleep_ms(100)
        self.lcd.clear()
        self.speed = self.calculate_speed_forward(100, 40)

        while self.comms.start() == False:
            sleep_ms(100)
        self.speed = self.calculate_speed_reverse(100, 140)

        while self.comms.start() == False:
            sleep_ms(100)
        self.speed = self.calculate_speed_forward(50, 40)

        while self.comms.start() == False:
            sleep_ms(100)
        self.speed = self.calculate_speed_reverse(50, 140)
        
        self.car.stop()


import bluetooth
from time import sleep

class Peripheral:
    
    # Constants
    BT_LE_AD_LIMITED : const = 0x01                     # Limited Discoverable
    BT_LE_AD_GENERAL : const = 0x02                     # General Discoverable
    BT_LE_AD_NO_BREDR : const = 0x04                    # BR/EDR not supported

    BT_DATA_FLAGS : const = 0x01                        # AD flags
    BT_DATA_NAME_COMPLETE : const = 0x09                # Shortened name   

    _IRQ_CENTRAL_CONNECT : const = 1
    _IRQ_CENTRAL_DISCONNECT : const = 2
    _IRQ_GATTS_WRITE : const = 3

    SERVICE_CUSTOM : const = bluetooth.UUID(0xf000)
    CHARACTERISTIC_CUSTOM_COMMAND : const = bluetooth.UUID(0xf001)

    characteristic_command = (CHARACTERISTIC_CUSTOM_COMMAND, bluetooth.FLAG_WRITE, )

    service_1 = (SERVICE_CUSTOM, (characteristic_command, ), )

    profile = (service_1, )

    # Variables
    name = str()
    adv = bytearray(31)
    ble = bluetooth.BLE()
    connected = False

    # Constructor
    def __init__(self, command_callback : func):
        self.char_command_callback = command_callback
        self.ble.active(True)
        self.ble.irq(self.__bt_irq_handler)

        profile_handles = self.ble.gatts_register_services(self.profile)
        ((self.char_command_handle, ), ) = profile_handles
        
        self.__advertise("4WD-SinNombre")

    # Methods
    def __advertise(self, name : str):
        # <<< COMPLETAR CODI AQUÍ >>> #
        # <<< Tal com vàrem fer a classe construir l'advertising >>> #
        # <<< Podeu comprovar si funciona amb el nRF Connect Mobile >>> #
        # Set the advertising data
        self.adv[0] = 2        											# Length of the flags data
        self.adv[1] = self.BT_DATA_FLAGS        						# Flags data type value
        self.adv[2] = self.BT_LE_AD_GENERAL | self.BT_LE_AD_NO_BREDR    # Flags data value

        name_len = len(name)
        adv_len = 3 if name_len == 0 else 2 + name_len

        self.adv[3] = adv_len        					                # Length of the advertising data
        self.adv[4] = self.BT_DATA_NAME_COMPLETE                        # Complete local name data type value

        # Add the name to the advertising data
        for i in range(name_len):
            self.adv[i + 5] = ord(name[i])

        # Start advertising
        self.ble.gap_advertise(adv_data = self.adv)

    def __bt_irq_handler(self, event, data):
        if event == self._IRQ_CENTRAL_CONNECT:
            self.conn_handle, addr_type, addr = data
            self.connected = True

        if event == self._IRQ_CENTRAL_DISCONNECT:
            # A central has disconnected from this peripheral.
            self.connected = False
            self.conn_handle, addr_type, addr = data
            self.__advertise(self.name)
            
        elif event == self._IRQ_GATTS_WRITE:
            conn_handle, attr_handle = data
            if(attr_handle == self.char_command_handle):
                value = self.ble.gatts_read(attr_handle)
                
                # <<< COMPLETAR CODI AQUÍ >>> #
                # <<< Quan es reb una informació per BLE, s'ha de cridar el callback amb el valor llegit >>> #
                self.char_command_callback(value)
                
def command_callback(value):
    print("Received from BLE: {}".format(value))

if __name__ == "__main__":
    print("Starting BLE Peripheral Unit Test")
    ble = Peripheral(command_callback)
    while True:
        sleep(1)

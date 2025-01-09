#include <xc.h>
#include "pic18f4321.h"
#include "sio.h"

// Definicions privades del TAD
#define CONFIGURACIO_TXSTA 0x20     // Dades de 8 bits, TX Enable, Asíncron, BRGH=0
#define CONFIGURACIO_RCSTA 0x90     // Enable canal serie, 8 bits, asíncron, RX enable
#define DIVISOR_BAUDRATE 64


// Constructor del TAD
void SIO_Init(void){
    // Post: Configuració de la UART en mode assíncron, 9600 bauds, suposant fOsc=40MHz.
//    IniciRX=FiRX=QuantsRX=0;
    TRISCbits.TRISC6 = 1;
    TRISCbits.TRISC7 = 1;
    BAUDCONbits.BRG16=0;
    TXSTA=CONFIGURACIO_TXSTA;
    RCSTA=CONFIGURACIO_RCSTA;
    SPBRG=DIVISOR_BAUDRATE;
//    PIE1bits.RCIE=1;      //En cas de comentar això, no es processaria la interrupció. La UART no demanarà interrupt
    
//    IniciTX=FiTX=QuantsTX=0;
//    PIE1bits.TXIE=1;
    
    }

//FALTA ADAPTAR
unsigned char SIO_RXAvail() {
    //Post: Retorna CERT si hi ha una caràcter disponible.
    return ((PIR1bits.RCIF==1)?CERT:FALS);
} 

unsigned char SIO_GetChar() {
    // Pre: SIO_RXAvail() ha retornat CERT.
    // Post: Fa lectura destructiva del caràcter rebut.
    return RCREG;
}

unsigned char SIO_TXAvail(void){
    //Post: Retorna CERT si hi ha espai per a enviar un caràcter, FALS en cas contrari.
    return ((PIR1bits.TXIF==1)?CERT:FALS);
}

void SIO_PutChar (unsigned char Valor){
    // Pre: SIO_TXAvail() ha retornat CERT.
    // Post: Posa un nou caràcter a enviament.
    TXREG=Valor;
}

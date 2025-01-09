#include <xc.h>
#include "pic18f4321.h"
#include "joystick.h"

#define JOYSTICK_CHANNEL 0x01

#define JOYSTICK_CENTER 0
#define JOYSTICK_UP 1
#define JOYSTICK_DOWN 2

static char state;
static char estatAnterior;
static char accio;
static char start;

void JoyInit(void) {
    //Pre: ---
    //Post: inicialitza els registres ADCON1 i ADCON2 del ADC.
    ADCON1=0x0D;
    ADCON2=0x24;
    ADCON0=0x01;
    estatAnterior=JOYSTICK_CENTER;
    start=0;
    state=0;
    accio=0;
}

void startConversion(void) {
    //Pre: ---
    //Post: inicia la conversió d'un canal analogic.
    ADCON0bits.GODONE=1;
}

char finishConversion(void) {
    //Pre: s'ha cridat la funci startConversion().
    //Post: retorna CERT si ha acabat la conversio i viceversa.
    return ((ADCON0bits.GODONE==0)?CERT:FALS);
}

char mouJoyAvail(void) {
    //Pre: la funcio finishConversion() ha retornat CERT.
    //Post: retorna CERT si hi ha una accio del joystick i viceversa.    
    if (ADRESH < 5 && estatAnterior== JOYSTICK_CENTER) {
        estatAnterior=JOYSTICK_DOWN;
        return CERT;
    }
    else if (ADRESH > 245 && estatAnterior == JOYSTICK_CENTER) {
        estatAnterior=JOYSTICK_UP;
        return CERT;
    }
    else if (ADRESH > 5 && ADRESH < 245) {
        estatAnterior=JOYSTICK_CENTER;
        return FALS;
    }
    return FALS;
}

char getAction(void) {
    //Pre: la funcio mouJoyAvail() ha retornat CERT.
    //Post: retorna l'accio que cal fer.
    return estatAnterior;
}

void setJoyChannel(void) {
    //Pre: ---
    //Post: selecciona el canal analogic AN0.
    ADCON0=JOYSTICK_CHANNEL;
}
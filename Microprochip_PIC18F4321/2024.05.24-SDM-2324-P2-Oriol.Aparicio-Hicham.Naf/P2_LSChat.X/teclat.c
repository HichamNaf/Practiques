#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "teclat.h"
#include "comunicacio.h"
#include "txcom.h"
#include "altaveu.h"
#include "SIO.h"
#define CERT 1
#define FALS 0

static char state;
static char columna;
static unsigned char timer;
static char teclapremuda;

void KeyBoardInit(void) {
    char isBusy = TI_NewTimer(&timer);   //Es comprova que hi ha timers disponibles per controlar els rebots
    while(!isBusy);  //en cas contrari, el sistema es queda penjat.
    //Columnes
    TRISBbits.RB2=0;
    TRISBbits.RB4=0;
    TRISBbits.RB6=0;
    //Files
    TRISBbits.RB0=1;
    TRISBbits.RB1=1;
    TRISBbits.RB3=1;
    TRISBbits.RB5=1;
    
    TRISAbits.RA3=0;
    //TRISD=0x00;
    
    
    columna=0;
    state=0;
    
    //Inicialitzem l'escombrat a les columnes
    LATBbits.LATB2=0;
    LATBbits.LATB4=1;
    LATBbits.LATB6=0;
    
    //LATD=0x7D;
    
    
}

char GetTecla(void) {
    switch (columna) {
        case 0:
            if(PORTBbits.RB5 == 0) {
                return 1;}
            if(PORTBbits.RB0 == 0) {
                return 4;}
            if(PORTBbits.RB1 == 0) {
                return 7;}
            if(PORTBbits.RB3 == 0) {
                return '*';}
            break;
        case 1:
            if(PORTBbits.RB5 == 0) {
                return 2;}
            if(PORTBbits.RB0 == 0) {
                return 5;}
            if(PORTBbits.RB1 == 0) {
                return 8;}
            if(PORTBbits.RB3 == 0) {
                return 0;}
            break;
        case 2:
            if(PORTBbits.RB5 == 0) {
                return 3;}
            if(PORTBbits.RB0 == 0) {
                return 6;}
            if(PORTBbits.RB1 == 0) {
                return 9;}
            if(PORTBbits.RB3 == 0) {
                return '#';}
            break;    
    }
    return 0;
}

char TeclaPremuda(void) {
    return teclapremuda;
}  
char HiHaTecla(void) {
    return (((PORTBbits.RB5 == 0) || (PORTBbits.RB0 == 0) || (PORTBbits.RB1 == 0) || (PORTBbits.RB3 == 0))?CERT:FALS);
}  

void MotorKeyboard(void) {
	switch(state) {
		case 0:
			if (!HiHaTecla() && columna == 0) {
                LATBbits.LATB2=1;
                LATBbits.LATB4=1;
                LATBbits.LATB6=0;
				columna = 1;
                break;
			}
			else if (!HiHaTecla() && columna == 1) {
                LATBbits.LATB2=0;
                LATBbits.LATB4=1;
                LATBbits.LATB6=1;
				columna = 2;
                break;
			}
            else if (!HiHaTecla() && columna == 2) {
                LATBbits.LATB2=1;
                LATBbits.LATB4=0;
                LATBbits.LATB6=1;
				columna = 0;
                break;
			}
            else if (HiHaTecla()) {
                LATAbits.LATA3 = 1;
                TI_ResetTics(timer);
				state++;
			}
            break;
		case 1:
			if (TI_GetTics(timer)>=T_DEBOUNCES) {
				state++;
			}
            break;
		case 2:
			if (!HiHaTecla()) {
				state = 0;
			}
			else if (HiHaTecla()) {
                teclapremuda=1;
                SorollAlt(GetTecla());
				state++;
			}
            break;
		case 3:
			if (!HiHaTecla()) {
				TI_ResetTics(timer);
                fiSoroll();
                teclapremuda=0;
				state++;
			}
            break;
		case 4:
			if (TI_GetTics(timer)>=500) {
				state++;
			}
            break;
		case 5:
			if (!HiHaTecla()) {
                
                
                LATAbits.LATA3=0;
				state = 0;
			}
		break;    
	}
}

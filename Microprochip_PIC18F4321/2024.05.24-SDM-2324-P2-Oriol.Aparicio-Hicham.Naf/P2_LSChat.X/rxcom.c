#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "rxcom.h"
#include "txcom.h"
#include "sio.h"
#include "EQM.h"

static char start;
static unsigned char nMSG;
static unsigned char timer;
static unsigned char MSG_AUX;
static unsigned char flag_RX;
static unsigned char index;
static unsigned char inMSG[4];

void rxInit(void) {
    char isBusy = TI_NewTimer(&timer);   //Es comprova que hi ha timers disponibles per controlar els rebots
    while(!isBusy);  //en cas contrari, el sistema es queda penjat.
    inMSG[0] = '+';
    inMSG[1] = 'I';
    inMSG[2] = 'P';
    inMSG[3] = 'D';
    TRISBbits.RB7=1;
    flag_RX=0;
    
}

char GetRxMSG(void){
    flag_RX=0;
    return MSG_AUX;
}

char GetFlag(void){
    return flag_RX;
}

void MotorRX(void) {
    static char state;
    
	switch(state) {
		case 0:
            if (PORTBbits.RB7==1){
                TI_ResetTics(timer);
            }
			else  {
                if (TI_GetTics(timer)>=10){
                state=2;
                LATAbits.LATA4=0;
            }
			} 
            break;
		case 1:
			if ( nMSG < 8 ) {
                MSG_AUX = (MSG_AUX>>1) | (PORTB & 0x80);
                nMSG++;
				state++;
			} else {
                nMSG=0;
                state=3;
            }
            break;
		case 2:
            if (TI_GetTics(timer)>=30 + (nMSG*20)) {
  
                state --;
			}
            break;
        case 3:
            if (TI_GetTics(timer)>=190) { 
 
                if (inMSG[index] == MSG_AUX){
                    index++;
                    if (index == 4){
                        index=0;
                        EQM_MSG();
                    }
                }else{
                    index=0;
                }
                SIO_PutChar(MSG_AUX);
                flag_RX=1;
                state = 0;
                TI_ResetTics(timer);
			}
		break;
        
	}
}

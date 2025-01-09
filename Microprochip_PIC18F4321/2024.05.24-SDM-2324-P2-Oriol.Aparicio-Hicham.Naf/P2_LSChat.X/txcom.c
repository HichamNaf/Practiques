#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "txcom.h"
#include "sio.h"

static unsigned char start;
static unsigned char MSG;
static unsigned char nMSG;
static unsigned char timer;
static unsigned char MSG_AUX;
static unsigned char end_TX;


void txInit(void) {
    char isBusy = TI_NewTimer(&timer);   //Es comprova que hi ha timers disponibles per controlar els rebots
    while(!isBusy);  //en cas contrari, el sistema es queda penjat.

    TRISCbits.RC5=0;    //HEM DE CANVIAR EL PORT PER PODER UNTILITZAR EL JOY
    LATCbits.LATC5=1;
    end_TX=1;
    
}

void SetMSG(unsigned char new_msg){
    MSG =new_msg;
    end_TX=0;
    start=1;
}

char GetEND(void){
    return end_TX;
}

void MotorTX(void) {
    static char state = 0;
    
	switch(state) {
		case 0:
			if (start == 1) {
                TI_ResetTics(timer);
                LATCbits.LATC5=0;
                state++;
			}
            break;
		case 1:
            if (TI_GetTics(timer)>=20 + (20*nMSG)) {
				state++;
			}
            break;
		case 2:
			if (nMSG < 8) {
                MSG_AUX = 0x01 & (MSG);
                MSG = (MSG>>1);
                nMSG++;
				state--;
                if (MSG_AUX == 0){
                    LATCbits.LATC5=0;
                }
                else {
                    LATCbits.LATC5=1;
                }
			}
			else {
                LATCbits.LATC5=1;
                nMSG=0;
                state++;
			}
            break;
        case 3:
            if (TI_GetTics(timer)>=220) {
                start = 0;
                state=0;
                end_TX=1;
                TI_ResetTics(timer);
            }
            
		break;    
	}
}

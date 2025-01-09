#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "txcom.h"


static char start;
static unsigned char MSG;
static unsigned char nMSG;
static unsigned char timer;
static unsigned char MSG_AUX;
static unsigned char end_TX;


void LCDPTInit(void) {
    TRISAbits.RA0=0;
    LATAbits.LATA0=1;
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
                LATAbits.LATA0=0;
                state++;
			}
            break;
		case 1:
			if (TI_GetTics(timer)>=10) {
				state++;
			}
            break;
		case 2:
			if (nMSG < 8) {
                MSG_AUX = 0x01 & (MSG);
                MSG = (MSG>>1);
                nMSG++;
                TI_ResetTics(timer);
				state = 1;
                if (MSG_AUX == 0){
                    LATAbits.LATA0=0;
                }
                else {
                    LATAbits.LATA0=1;
                }
			}
			else {
                LATAbits.LATA0=1;
                nMSG=0;
                
                start = 0;
                state++;
                TI_ResetTics(timer);
			}
            break;
        case 3:
            if (TI_GetTics(timer)>=10) {
                state=0;
                end_TX=1;
            }
            
		break;    
	}
}

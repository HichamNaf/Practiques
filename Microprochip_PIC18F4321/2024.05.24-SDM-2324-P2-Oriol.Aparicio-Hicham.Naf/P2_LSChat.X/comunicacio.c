#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "txcom.h"
#include "comunicacio.h"


static unsigned char start;
static unsigned char eM=1;
static char* msgC;

char MotorCOM(char* new_msgC) {
    static char state = 0;
    static char index = 0;
	switch(state) {
		case 0:
            msgC = new_msgC;
            state++;
          
            break;
		case 1:
			if (GetEND()==1) {
                SetMSG(*msgC);
                *msgC++;
				state++;
			}
            break;
		case 2:
			if (*msgC) {
                state--;
			}
			else {
                state++;
			}
            break;
        case 3: 
			if (GetEND()==1) {
				state++;
			}
            break;
        case 4:
			state = 0;
            index = 0;
            break;
	}
    return state;
}

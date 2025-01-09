#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "altaveu.h"
#include "SIO.h"

#define SEGON 10000

static unsigned char sound;
static unsigned char dutycycle;
static unsigned char timer;
static char isBusy;

void InitAltaveu(void){
    sound=0;
    dutycycle=0;
    isBusy=TI_GetTics(&timer);
    while(!isBusy);
    TRISAbits.RA4=0;
    LATAbits.LATA4=0;
}
void SorollAlt(unsigned char tecla) {
    if(tecla=='*')  {dutycycle=300;}
    if(tecla=='#')  {dutycycle=950;}
    if(tecla==0)    {dutycycle=1300;}//
    if(tecla==1)    {dutycycle=900;}
    if(tecla==2)    {dutycycle=1100;}//
    if(tecla==3)    {dutycycle=2600;}//
    if(tecla==4)    {dutycycle=1000;}
    if(tecla==5)    {dutycycle=800;}//
    if(tecla==6)    {dutycycle=750;}
    if(tecla==7)    {dutycycle=2900;}
    if(tecla==8)    {dutycycle=400;}
    if(tecla==9)    {dutycycle=3100;}//
    sound=1;
}

void fiSoroll(void) {
    sound=0;
}

void MotorAltaveu(void) {
	static char state = 0;

	switch(state) {
		case 0:
            if (TI_GetTics(timer)*2>=dutycycle) {
				TI_ResetTics(timer);
                
				LATAbits.LATA4=1;
				state++;
			}
            break;
        case 1:
            if (TI_GetTics(timer)*2>=dutycycle && sound==1) {
                TI_ResetTics(timer);
				LATAbits.LATA4=0;
				state--;
                
			}
            break;
    }
}





#include <xc.h>
#include "lcd.h"
#include "menu.h"
#include "timer.h"
#include "joystick.h"
#include "teclat.h"


static unsigned char opcio_menu[6][21] = {
    {'1',':','L','I','S','T',' ','A','C','C','E','S','S',' ','P','O','I','N','T','S',' '},
    {'2',':','S','H','O','W',' ','C','O','N','N','.',' ','S','T','A','T','U','S',' ',' '},
    {'3',':','C','H','A','N','G','E',' ','C','H','A','T',' ','M','O','D','E',' ',' ',' '},
    {'4',':','E','N','T','E','R',' ','C','H','A','T',' ','M','O','D','E',' ',' ',' ',' '},
    {'5',':','L','I','S','T',' ','L','A','S','T',' ','M','S','G','S','.',' ',' ',' ',' '},
    {'6',':','C','L','O','S','E',' ','C','O','N','N','E','C','T','I','O','N',' ',' ',' '}
};

static char m0;
static char m1;
static char Opt;
static char state;
static char start;
static char tecla;
static char compt;
static char action;
static unsigned char timer;

void MenuInit(void) {
    
    char busy = TI_GetTics(&timer);
    while(!busy);
    state=0;
    start=0;
    m0=0;
    m1=0;
    Opt=0;
}

void startMenu(void) {
    start=1;
}

void stopMenu(void) {
    start=0;
}

char StateMenu(void) {
    return start;
} 
char OpcioMenu(void) {
    return Opt;
} 

void MotorMenu(void) {
    if (start==1) {
        switch(state) {
            case 0:
                m0=0;
                m1=0;
                compt=0;
                state++;
                break;
            case 1:                
                LcClear();
                TI_ResetTics(timer);
                m1 = m0;
                compt = 0;
                state++;
                break;
            case 2:
                LcGotoXY(compt,0);
                if(m1<21){
                    LcPutChar(opcio_menu[Opt][m1]);
                } else{
                    LcPutChar(opcio_menu[Opt][0]);
                }
                state++;
                break;
            case 3:
                LcGotoXY(compt,1);
                if(m1<21){
                    if(Opt!=5){
                        LcPutChar(opcio_menu[Opt+1][m1]);
                        }
                    m1++;
                } else{
                    if(Opt!=5){
                    LcPutChar(opcio_menu[Opt+1][0]);
                    }
                    m1=1;
                }
                compt++;
                if(compt ==16){
                    compt =0;
                    state++;
                }else{
                    state--;
                }
                break;
            case 4:
                if (HiHaTecla()) {
                    tecla = GetTecla();
                    state++;
                }
                else if (!HiHaTecla()) {
                    startConversion();
                    state = 6;
                }
                break;
            case 5:
                if (tecla=='#') {
                    state = 9;
                }
                else if (tecla!='#') {
                    startConversion();
                    state++;
                }
                break;
            case 6:
                if (finishConversion()==1 && mouJoyAvail()==CERT) {
                    action=getAction();
                    state++;
                } 
                else if (finishConversion()==1 && mouJoyAvail()==FALS) {
                    state=8;
                }
                break;
            case 7:
                if (action==SCROLL_UP) {
                    if (Opt != 0){
                        Opt--;
                    }
                }
                else if (action==SCROLL_DOWN) {
                    if (Opt != 5){
                        Opt++;
                    }
                }
                m0=0;
                state=1;
                break;
            case 8:
                if (TI_GetTics(timer)>=T_MARQUESINA) {
                    m0++;
                    if(m0>21){
                        m0=0;
                    }
                    state = 1;
                } else {
                    state = 4;
                }
                break;
            case 9:
                if (!HiHaTecla()) {  
                    LcClear();
                    LcGotoXY(0,0);
                    state=0;
                    start=0;
                }
                break;
        }
    }  
}



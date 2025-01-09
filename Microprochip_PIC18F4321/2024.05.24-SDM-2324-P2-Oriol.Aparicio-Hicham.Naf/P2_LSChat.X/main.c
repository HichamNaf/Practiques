/* 
 * File:   main.c
 * Author: hicham.naf && oriol.aparicio
 *
 * Created on 8 de abril de 2024, 17:47
 */

#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include "pic18f4321.h"
#include "timer.h"
#include "teclat.h"
#include "valorsteclat.h"
#include "txcom.h"
#include "rxcom.h"
#include "comunicacio.h"
#include "lcd.h"
#include "sio.h"
#include "EQM.h"
#include "joystick.h"
#include "menu.h"
#include "altaveu.h"


//#pragma config OSC = INTIO2
#pragma config OSC = HSPLL
#pragma config PBADEN = DIG
#pragma config MCLRE = ON
#pragma config WDT = OFF
#pragma config DEBUG = OFF
#pragma config PWRT = OFF
#pragma config BOR = OFF
#pragma config LVP = OFF

//static unsigned char timer;
/*
 * 
 */

void __interrupt(high_priority) my_rsi(void){
    RSI_Timer0();
}

void configInt(void) {
    RCONbits.IPEN=0;
    INTCONbits.GIE=1;
    INTCONbits.PEIE=1;  
    INTCONbits.TMR0IE=1;
    INTCON2bits.RBPU=0;
}



void main(void) {
    
    
    //configOsc();
    configInt();
    TI_Init();
    KeyBoardInit();
    ValorsTeclatInit();
    txInit();
    rxInit();
    SIO_Init();
    LcInit(2,16);
    LcClear();
    LcCursorOff();
    LcGotoXY(0,0);
    EQMInit();
    InitAltaveu();
    JoyInit();
    MenuInit();
    setJoyChannel();


    
    while(1){
        MotorKeyboard();
        MotorValorsTeclat();
        MotorEQM();
        MotorTX();
        MotorRX();
        MotorMenu();
        MotorAltaveu();
    }
}


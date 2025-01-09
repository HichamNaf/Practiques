/* 
 * File:   valors_teclat.c
 * Author: Usuario
 *
 * Created on 24 de abril de 2024, 12:04
 */

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "teclat.h"
#include "valorsteclat.h"
#include "txcom.h"
#include "lcd.h"

#define SEGON 10000

static unsigned char timer;
static unsigned char start;
static unsigned char pulsacio;
static unsigned char filaAnterior;
static unsigned char numChars;
static unsigned char pos;
static unsigned char maxChars;
static unsigned char arrayChars[10];


static unsigned char lletres_teclat[10][2] = {
    {' ', ' '},
    {'1', 0},
    {'A', 'C'},
    {'D', 'F'},
    {'G', 'I'},
    {'J', 'L'},
    {'M', 'O'},
    {'P', 'S'},
    {'T', 'V'},
    {'W', 'Z'}
};

void ValorsTeclatInit(void) {
    //Pre:
    //Post: 
    char isBusy = TI_NewTimer(&timer);
    while(!isBusy);
    
    TRISD=0x00;
    LATD=0x7D;
    numChars=0;
    start=0;
}

char ValorsState(void) {
    return start;
} 

void StartRead(char numMax){
    if (numMax ==10){
        pos=0;
    }else {
        pos=1;
     }
    numChars=0;
    filaAnterior=100;
    maxChars=numMax;
    start=1;
} 

char getMSG(char index){
    return arrayChars[index];
}

char getIND(){
    return numChars;
}

void ValorTecla(char fila) {
    static char valor;
    
    if (fila!=filaAnterior || TI_GetTics(timer)>SEGON) {
        arrayChars[numChars] = lletres_teclat[fila][0];
        filaAnterior=fila;
        numChars++;
        pulsacio=0;
        TI_ResetTics(timer);
    }
    filaAnterior=fila;
    TI_ResetTics(timer);
    
    valor =  lletres_teclat[fila][0];
    if (valor + pulsacio > lletres_teclat[fila][1]) {
        pulsacio=0;
        
        valor = '0'+fila;
        
        if (fila == 0){
            valor = '0';
        }
    }
    else {
        pulsacio++;
        valor = valor+(pulsacio-1);
    }
    
    LcGotoXY(numChars-1,pos);
    LcPutChar(valor);
    arrayChars[numChars-1] = valor;
    
}

void MotorValorsTeclat(void) {
    static char state = 0;
    
	switch(state) {
		case 0:
			if (start==1) {
                state++;
            }
            break;
        case 1:
            if (TeclaPremuda()==1){
                if (GetTecla()=='#' || GetTecla()=='*'){
                    start--;
                    state--;
                } else {
                    ValorTecla(GetTecla());
                    if(numChars>maxChars){
                        numChars--;
                        start--;
                        state--;
                    } else{
                        state++;}}
            } else if (TeclaPremuda()==0) {
                if (TI_GetTics(timer)>SEGON && numChars==maxChars){
                    ValorTecla(filaAnterior);
                    start--;
                    state--;}
            }
            break;
        case 2:
            if (TeclaPremuda()==0){
                state--;
            }
            break;
        
            
    
    }
}


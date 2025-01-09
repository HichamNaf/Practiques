#include <xc.h>
#include "pic18f4321.h"
#include "timer.h"
#include "valorsteclat.h"
#include "comunicacio.h"
#include "sio.h"
#include "lcd.h"
#include "rxcom.h"
#include "txcom.h"
#include "menu.h"
#include "teclat.h"
#include "joystick.h"
#include "altaveu.h"

//#define AT "AT+C"
#define STATUS "AT+CIPSTATUS\r\n"
#define CIPCLOSE "AT+CIPCLOSE\r\n"
#define SCAN "SCANNING...\0"
#define LIST "AT+CWLAP\r\n"
#define NOMSG "NO MSGS."

static unsigned char start;
static unsigned char timer;
static unsigned char index;
static unsigned char port[10];
static unsigned char user[3];
static unsigned char msg;
static unsigned char iMSG;
static unsigned char INTENTS;
static unsigned char state_option = 0;
static unsigned char state4 = 0;
static unsigned char lmsg;
static unsigned long temps=1000;


static unsigned char maxMSG = 0;
static unsigned char lastMSG = 7;
static unsigned char Opt3 = 0;
static unsigned char Opt4 = 0;

static unsigned char compt = 0;
static unsigned char compt2 = 0;
static unsigned char action = 0;
static unsigned char tecla = 0;

static char* msgToSend;
static char* msgToLCD;

static unsigned char wifiSTATE=0;
static unsigned char statusSTATE=0;

static unsigned char resetMENU=0;

static unsigned char comptSEC=0;
static unsigned char msgs[8][14];

void EQMInit(void) {
    char isBusy = TI_NewTimer(&timer);   //Es comprova que hi ha timers disponibles per controlar els rebots
    while(!isBusy);  //en cas contrari, el sistema es queda penjat.
    start = 1;
    Opt3 = 0;
    Opt4 = 0;
    INTENTS=0;
    port[4]=',';
    port[9]='\0';
    state_option = 0;
}

void EQM_MSG(void){
    
    start=0;
}



char ConfWIFI(void){
    switch (state_option){
        case 0:
            LcClear();
            LcGotoXY(0,0);
            state_option++;
            return 0;
        case 1:
            if (LcPutString("DEST.PORT: ") == 2) {
                StartRead(4);
                state_option++;
			}
            return 0;
        
		case 2:
			if (ValorsState()==0) {
                port[0] = getMSG(0);
                port[1] = getMSG(1);
                port[2] = getMSG(2);
                port[3] = getMSG(3);
                LcClear();
                LcGotoXY(0,0);
				state_option++;
			}
            return 0;
        case 3:
            if (LcPutString("REC.PORT: ") == 2) {
                StartRead(4);
                state_option++;
			}
            return 0;
        case 4:
			if (ValorsState()==0) {
                port[5] = getMSG(0);
                port[6] = getMSG(1);
                port[7] = getMSG(2);
                port[8] = getMSG(3);
                LcClear();
                LcGotoXY(0,0);
				state_option++;
                if (Opt3==1 ){
                    state_option=7;
                }
			}
            return 0;
        case 5:
            if (LcPutString("USER NAME: ") == 2) {
                StartRead(3);
                state_option++;
			}
            return 0;
		case 6:
            if (ValorsState()==0) {
                user[0] = getMSG(0);
                user[1] = getMSG(1);
                user[2] = getMSG(2);
                LcClear();
                LcGotoXY(0,0);
                state_option++;}
            return 0;
        case 7:
            if (MotorCOM(CIPCLOSE)==4){
                index = 0;     
                state_option++;
            }
            return 0; 
        case 8:
            if (GetFlag()==1){
                index++;
                msg= GetRxMSG();
                state_option++;
            }
            return 0;
        case 9: 
            if (msg == '\n' && index>7){
                index=0;
                state_option--;
            }else if (msg == '\n' && index<8) {
                state_option++;
            } else {
                state_option--;
            }
            return 0;
        case 10:
            if(SIO_RXAvail()==1){
                msg =SIO_GetChar();
                state_option++;
            }
            return 0;
        case 11:
            if (MotorCOM("AT+CIPSTART=\"UDP\",\"255.255.255.255\",\0")==4){ 
                //endMSG();
                state_option++;
            }
            return 0;
        case 12:
            msgToSend =(char*)port;
            if (MotorCOM(msgToSend)==4){ 
                state_option++;
            }
            return 0;
        case 13:
            if (MotorCOM("\r\n\0")==4){ 
                comptSEC=0;
                TI_ResetTics(timer);
                index=0;
                state_option++;
            }
            return 0;
        case 14:
            if(SIO_RXAvail()==1){
                if(SIO_GetChar()==0x06){
                    startMenu();
                    state_option=0;
                    wifiSTATE=1;//Indiquem l'estat de la conexio, 0 no s'ha pogut conectar, 1 si.
                    return 1;
                }else
                {
                    endMSG();
                    state_option=11;
                    INTENTS++;
                    if(INTENTS >2){
                     state_option=0;
                     wifiSTATE=0;//Indiquem l'estat de la conexio, 0 no s'ha pogut conectar, 1 si.
                     return 1;
                    }
                }
                index++;
            }
            if (TI_GetTics(timer)>=1000) {
                
                if (comptSEC>=100){
                    endMSG();
                     state_option=11;
                     INTENTS++;
                    if (Opt4==1){
                        state_option=0;
                        wifiSTATE=0;//Indiquem l'estat de la conexio, 0 no s'ha pogut conectar, 1 si.
                        return 1;
                    }
                     if(INTENTS > 2){
                         state_option=0;
                         wifiSTATE=0;//Indiquem l'estat de la conexio, 0 no s'ha pogut conectar, 1 si.
                         return 1;
                 }}else{
                    comptSEC++;
                    TI_ResetTics(timer);
                 }
            }
            return 0;
    }
}


char ListAccesPoints(void) {
    
	switch(state_option) {
		case 0:
            msgToLCD =(char*)SCAN;
            if(LcPutString(msgToLCD) == 2){
                state_option++;
            }
            return 0;

        case 1:
            if(MotorCOM(LIST)==4) {
                state_option++;
            }
            return 0;
        case 2:
            if(SIO_RXAvail()==1){
                msg = SIO_GetChar();
                state_option=0;
                return 1;
            }
            return 0;
    }        
}

char ShowConnStatus(void) {
	switch(state_option) {
		case 0:
            msgToLCD =(char*)SCAN;
            if(LcPutString(msgToLCD)==2) {
                
                state_option++;
            }
            return 0;
        case 1:
            if(MotorCOM(STATUS)==4){
                state_option++;
            }
            return 0;
        case 2:
            if(SIO_RXAvail()==1){
                msg = SIO_GetChar();
                if(msg == 0x06){
                    statusSTATE=1; //Indiquem que l'estat de la connexio és correcte
                } else {
                    statusSTATE=0; //Indiquem que l'estat de la connexio és incorrecta
                }
                state_option = 0;
                return 1;
            }
            return 0;
    }      
}

char CloseConn(void) {
    switch(state_option) {
		case 0:
            LcClear();
            LcGotoXY(0,0);
            state_option++;
            return 0;
        case 1:
            if(LcPutString("bye bye ")==2){
                state_option++;
            }
            return 0;
        case 2:
            if(LcPutString(user)==2){
                state_option++;
            }
            return 0;
        case 3:
            LcPutChar('!');
            state_option++;
            TI_ResetTics(timer);
            return 0;
        case 4:
            if(TI_GetTics(timer)>20000){     //2seg
                LcClear();
                LcGotoXY(0,0);
                return 1;
            }
            return 0;
    }      
    
}

char EnterChatMode(void) {
    
	switch(state4) {
		case 0:
            LcClear();
            LcGotoXY(0,0);
            StartRead(10);
            state4++;
            return 0;
        case 1:
            if (ValorsState()==0) {
                if(GetTecla()=='*'){
                    state4 = 0;
                    return 1;
                }
                state_option=1;
                state4++;
            } 
            return 0;
        case 2:
            if (ShowConnStatus()==1){
                if (statusSTATE==1){
                    state4=6;
                } else {
                    state4++;
                    state_option=7;
                    Opt4=1;
                }
            }
            return 0;
        case 3:
            if(ConfWIFI()==1) {
                if (wifiSTATE==1){
                    state4=6;
                } else{
                    state4++;
                }
            }
            return 0;
        case 4:
            if(LcPutString("ERROR...F")==2){
                TI_ResetTics(timer);
                state4++;
            }
            return 0;
        case 5:
            if(TI_GetTics(timer)>50000){
                LcClear();
                LcGotoXY(0,0);
                state4=0;
                return 1;
            }
            return 0;
        case 6:
            if(MotorCOM("AT+CIPSEND=\0")==4){
                index = getIND() + 6;
                if (index > 9){
                    SetMSG('1');
                    index= index - 10;
                }
                state4++;
            }
            return 0;
        case 7:
            if (GetEND()==1){ 
                SetMSG('0'+index);
                state4++;
            }
            return 0;
        case 8:
            if (GetEND()==1){ 
                state4++;
            }
            return 0;
        case 9:
            if (MotorCOM("\r\n\0")==4){  
                state4++;
            }
            return 0;
        case 10:  
            if (GetFlag()==1 && GetRxMSG() == '>'){
                index=0;
                state4++;
            }
            return 0;
        case 11:  
            if (GetEND()==1){
                if(index < 3){
                    SetMSG(user[index]);
                    SIO_PutChar(user[index]);
                }
                if (index ==3){
                    SetMSG(';');
                }
                if(3 < index){
                    SetMSG(getMSG(index-4));
                    SIO_PutChar(getMSG(index-4));
                    if(index-3 == getIND()){
                        state4++;
                    }
                }
                
                index++;
            }
            return 0;
        case 12:
            if (MotorCOM("\r\n\0")==4){  
                state4++;
            }
            return 0;
        case 13:
            if(SIO_RXAvail()==1){
                state4=0;
                if(SIO_GetChar()!=0x06){
                    return 1;
                }
            }
            return 0;
    }      
}

char ListLastMessages (void) {
    switch(state_option) {
    case 0:
        LcClear();
        LcGotoXY(0,0);
        compt = lastMSG + 1;
        if (compt==8){
            compt=0;
        }
        index=0;
        if (maxMSG>1){
            compt2 = compt+1;
            if (compt==7){
                compt2=0;
            }
        } else{
            compt2='*';
        }
        iMSG=0;
        if (maxMSG == 0){
            state_option=7;
        } else{
            state_option++;
            LcGotoXY(0,0);
        }
        return 0;
     case 1:
        if(index == 0){
            LcPutChar('1'+ iMSG);
        }
        if (index ==1){
            LcPutChar(':');
        }
        if(1 < index ){
            LcPutChar(msgs[compt][index-2]);
            if (index == 15){
                state_option++;
                index=0;
                LcGotoXY(0,1);
                if (compt2=='*'){
                    state_option++;
                }
                return 0;
            }  
            if ('*' == msgs[compt][index-1]){
                state_option++;
                index=0;
                LcGotoXY(0,1);
                if (compt2=='*'){
                    state_option=3;
                }
                return 0;
            }
        }
        index++;
        return 0;
     case 2:
        if(index == 0){
            LcPutChar('2'+iMSG);
            SIO_PutChar('2'+iMSG);
        }
        if (index ==1){
            LcPutChar(':');
            SIO_PutChar(':');
        }
        if(1 < index ){
            LcPutChar(msgs[compt2][index-2]);
            SIO_PutChar(msgs[compt2][index-2]);
            if ('*' == msgs[compt2][index-1]){
                state_option++;
            }  
            if (index == 13){
                state_option++;
            }   
        }
        index++;
        return 0;
     case 3:
         if (HiHaTecla()) {
             tecla = GetTecla();
             state_option++;
         }
         else if (!HiHaTecla() && maxMSG !=0) {
             startConversion();
             state_option = 5;
         }
         return 0;
     case 4:
         if (tecla=='*') {
             return 1;
         }
         else {
             state_option--;
         }
         break;
     case 5:
         if (finishConversion()==1 && mouJoyAvail()==CERT) {
             action=getAction();
             state_option++;
         } 
         else if (finishConversion()==1 && mouJoyAvail()==FALS) {
             state_option=3;
         }
         return 0;
     case 6:
         if (action==SCROLL_UP) {
             if (iMSG != 0){
                 iMSG--;
                 compt2 = compt;
                 if (compt==0){
                     compt=7;
                 }else{
                     compt--;
                 }
             } else{
                 state_option=3;
                 return 0;
             }
         }
         else if (action==SCROLL_DOWN) {
             if (maxMSG > 2){
                if (iMSG < maxMSG-2){
                    iMSG++;
                    compt=compt2;
                    if (compt2==7){
                        compt2=0;
                    }else{
                        compt2++;
                    }
                } else{
                    state_option=3;
                    return 0;
                }
             }
         }
         index=0;
         LcClear();
         LcGotoXY(0,0);
         state_option=1;
         return 0;
        case 7:
            msgToLCD =(char*)NOMSG;
            if(LcPutString(msgToLCD)==2) {
                
                state_option=3;
            }
            return 0;
            
    
    }}
void ReciveMSG(void){
    static unsigned char stateMSG = 0;
        switch(stateMSG) {
            case 0:
                if(StateMenu()==1){
                    stopMenu();
                    resetMENU=1;
                }else{
                    resetMENU=0;
                }
                stateMSG++;
                break;
            case 1:
                if (GetFlag()==1) {
                    msg=GetRxMSG();
                    if (msg==':'){
                        stateMSG++;
                        index=0;
                    }
                }
                 break;
            case 2: 
                if (GetFlag()==1 ) {
                    msg=GetRxMSG();
                    
                    if(msg=='\r'){
                        if(index!=13){
                            msgs[lastMSG][index] = '*';
                            
                        }
                        stateMSG++;
                    }else{
                        msgs[lastMSG][index] = msg;
                        index++;
                    }
                    }
                break;
            case 3:
                LcClear();
                LcGotoXY(0,1);
                index=0;
                stateMSG++;
                //SorollAlt(5);
                //SIO_PutChar('*');
                break;
            case 4:
                if(index < 14 ){
                    if(msgs[lastMSG][index] != '*'){
                        
                        LcPutChar(msgs[lastMSG][index]);
                        index++;
                    }else {
                        index=20;
                       
                    }
                }else{
                    SorollAlt(4);
                    comptSEC=0;
                    stateMSG=5;
                }
                TI_ResetTics(timer);
                break;
            case 5:
                if (TI_GetTics(timer) > 10000){
                        SorollAlt(5);
                        comptSEC=0;
                        TI_ResetTics(timer);
                        stateMSG++;}
                break;
            case 6:
                
               if (TI_GetTics(timer) > 10000){
                        SorollAlt(6);
                        comptSEC=0;
                        TI_ResetTics(timer);
                        stateMSG++;}
                break;
            case 7:
               if (TI_GetTics(timer) > 10000){
                        SorollAlt(7);
                        comptSEC=0;
                        TI_ResetTics(timer);
                        stateMSG++;}
                break;
            case 8:
               if (TI_GetTics(timer) > 10000){
                        SorollAlt(8);
                        comptSEC=0;
                        TI_ResetTics(timer);
                        stateMSG++;}

                break;
            case 9:
                if (TI_GetTics(timer) > 10000){
                        fiSoroll();
                        comptSEC=0;
                        TI_ResetTics(timer);
                        stateMSG++;}

                break;
            case 10:
                TI_ResetTics(timer);
                if (lastMSG != 0){
                    lastMSG--;
                }else{
                    lastMSG=7;
                }
                if (maxMSG<8){
                    maxMSG++;
                }
                start=1;
                stateMSG=0;
//
                LcClear();
                LcGotoXY(0,0);
                state_option=0;
                state4=0;
                if(resetMENU==1){
                    startMenu();
                }
                break;
        }
    
    
    }

void MotorEQM(void) {
    static unsigned char state = 0;
    
    if (start==1){
	switch(state) {
		case 0:
			if (start == 1) {
                maxMSG = 0;
                lastMSG = 7;
                Opt3 = 0;
                Opt4 = 0;
                INTENTS=0;
                port[4]=',';
                port[9]='\0';
                state++;
			}
            break;
        case 1:
            if (ConfWIFI()==1){
                if(wifiSTATE==1){
                    startMenu();
                    state_option=0;
                    state++;
                }else{
                    state--;
                } 
            }
            break;
        case 2:
            if (StateMenu() == 0){
                if(OpcioMenu()== 0) {
                    if(ListAccesPoints()== 1) {
                        state_option=0;
                        startMenu();
                    }
                    break;
                }
                if(OpcioMenu()== 1) {
                    if(ShowConnStatus()== 1) {
                        state_option=0;
                        startMenu();
                    }
                     break;
                }
                
                if(OpcioMenu()== 2) {
                    Opt3 = 1;
                    if(ConfWIFI()== 1) {
                        Opt3 = 0;
                        state_option=0;
                        startMenu();
                    }
                     break;
                }
                
                if(OpcioMenu()== 3) {
                    if(EnterChatMode()==1) {
                        state_option=0;
                        startMenu();
                    }
                     break;
                }
                
                if(OpcioMenu()== 4) {
                    if(ListLastMessages()== 1) {
                        state_option=0;
                        startMenu();
                    }
                     break;
                }
                
                if(OpcioMenu()== 5) {
                    if (CloseConn() == 1) {
                        state_option=0;
                        state=0;
                    }
                    
                     break;
                }
            }
            break;
	}
    }else{
        ReciveMSG();
    }
}
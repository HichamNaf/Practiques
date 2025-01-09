
#ifndef joystick_H
#define	joystick_H

#define SCROLL_UP 2
#define SCROLL_DOWN 1

#define CERT 1
#define FALS 0

void JoyInit(void);
//Pre: ---
//Post: inicialitza els registres ADCON1 i ADCON2 del ADC.
void startConversion(void);
//Pre: ---
//Post: inicia la conversió d'un canal analogic.

char finishConversion(void);
//Pre: s'ha cridat la funci startConversion().
//Post: retorna CERT si ha acabat la conversio i viceversa.

char mouJoyAvail(void);
//Pre: la funcio finishConversion() ha retornat CERT.
//Post: retorna CERT si hi ha una accio del joystick i viceversa.

char getAction(void);
//Pre: la funcio actionAvail() ha retornat CERT.
//Post: retorna l'accio que cal fer.

void setJoyChannel(void);
//Pre: ---
//Post: selecciona el canal analogic AN0.
   

#endif	/* joystick_H */


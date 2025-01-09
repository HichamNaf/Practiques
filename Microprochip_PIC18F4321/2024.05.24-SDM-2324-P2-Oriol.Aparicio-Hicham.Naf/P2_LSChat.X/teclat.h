/* 
 * File:   teclat.h
 * Author: DEKU
 *
 * Created on April 18, 2024, 4:10 PM
 */

#ifndef TECLAT_H
#define	TECLAT_H

#define T_DEBOUNCES 500

void KeyBoardInit(void);
//Pre: ---
//Post: inicialitza l'escombrat del teclat a la primera columna.

char HiHaTecla(void);
//Pre: ---
//Post: retorna cert si s'ha premut alguna tecla i viceversa.

char GetTecla(void);
//Pre: la funcio HiHaTecla() ha retornat cert.
//Post: retorna el valor de la tecla premuda.

void MotorKeyboard(void);
//Pre: ---
//Post: espera a que es premi alguna tecla i després comprova quina tecla s'ha premut.
char TeclaPremuda(void);

#endif	/* TECLAT_H */


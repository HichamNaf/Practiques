/* 
 * File:   menu.h
 * Author: DEKU
 *

 */

#ifndef MENU_H
#define	MENU_H

#define T_MARQUESINA 10000

void MenuInit(void);
//Pre: ---
//Post: inicialitzar variables del TAD menu.
void MotorMenu(void);
//Pre: el joystick s'ha mogut cap amunt.
//Post: fer scroll de les opcions del menu verticalment i cap amunt.
void startMenu(void);
#endif	/* MENU_H */
void stopMenu(void);


char StateMenu(void);

char OpcioMenu(void);

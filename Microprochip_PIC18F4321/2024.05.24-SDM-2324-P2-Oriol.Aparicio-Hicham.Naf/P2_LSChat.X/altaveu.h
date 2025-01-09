#ifndef ALTAVEU_H
#define	ALTAVEU_H

void InitAltaveu(void);
//Pre:---
//Post: inicialitzar variables del TAD altaveu.

void MotorAltaveu(void);
//Pre: ---
//Post: genera un pwm de periode fix i duty cycle variable.

void SorollAlt(unsigned char teclaS);
//Pre: han premut una tecla.
//Post: generar un pwm amb duty cycle correcponent a la tecla.
void fiSoroll(void);

#endif	/* ALTAVEU_H */


/* 
 * File:   valorteclat.h
 * Author: DEKU
 *
 * Created on 24 de abril de 2024, 14:03
 */

#ifndef VALORTECLAT_H
#define	VALORTECLAT_H

void ValorsTeclatInit(void);

char ValorsState(void);

void StartRead(char numMax);

char getMSG(char index);

char getIND();

void ValorTecla(char fila);

void MotorValorsTeclat(void);


#endif	/* VALORTECLAT_H */


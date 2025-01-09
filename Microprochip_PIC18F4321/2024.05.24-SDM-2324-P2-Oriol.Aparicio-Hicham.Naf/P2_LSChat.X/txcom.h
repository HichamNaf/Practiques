/* 
 * File:   teclat.h
 * Author: DEKU
 *
 * Created on April 18, 2024, 4:10 PM
 */

#ifndef TXCOM_H
#define	TXCOM_H


void txInit(void);
//Pre: ---
//Post: 

void SetMSG(unsigned char new_msg);
//Pre: 
//Post: 

void MotorTX(void);
//Pre: ---
//Post: 
char GetEND(void);


#endif	/* TXCOM_H */


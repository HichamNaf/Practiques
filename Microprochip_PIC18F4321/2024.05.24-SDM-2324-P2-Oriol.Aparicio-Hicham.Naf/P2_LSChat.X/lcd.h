#ifndef LCTLCD_H
#define	LCTLCD_H

//
// ------------------------------------HARDWARE---AREA--------------------
// The connection is of 4 data bits (D4 a D7), and the signals 
// RS, R/W and E.
// In this example we have connected: 
//
// 	RS		to RD1
//	R/!W    to RD0
//  E		to RD2
//	D4		to RD3
//	D5		to RD4
//	D6		to RD5
//	D7		to RD6
//
//  It is important that the LCD signals D0..D3 are left unused and 
//  that we connect them to GND using 1k ohms resistors. 


#include <xc.h>
#include "pic18f4321.h"

#define SetD4_D7Sortida()		(TRISDbits.TRISD3 = TRISDbits.TRISD4 = TRISDbits.TRISD5 = TRISDbits.TRISD6 =TRISDbits.TRISD6 = 0)
#define SetD4_D7Entrada()		(TRISDbits.TRISD3 = TRISDbits.TRISD4 = TRISDbits.TRISD5 = TRISDbits.TRISD6 =TRISDbits.TRISD6 = 1)
#define SetControlsSortida()    (TRISDbits.TRISD0 = TRISDbits.TRISD1 = TRISDbits.TRISD2 = 0)
#define SetD4(On)				(LATDbits.LATD3 = LATDbits.LATD3 =LATDbits.LATD3 =LATDbits.LATD3 =LATDbits.LATD3 =(On))
#define SetD5(On)				(LATDbits.LATD4 = LATDbits.LATD4 =LATDbits.LATD4 =LATDbits.LATD4 =LATDbits.LATD4 =(On))
#define SetD6(On)				(LATDbits.LATD5 = LATDbits.LATD5 =LATDbits.LATD5 =LATDbits.LATD5 =LATDbits.LATD5 =(On))
#define SetD7(On)				(LATDbits.LATD6 = LATDbits.LATD6 = LATDbits.LATD6 =LATDbits.LATD6 =LATDbits.LATD6 =(On))
#define GetBusyFlag()           (PORTDbits.RD6)
#define RSUp()					(LATDbits.LATD1 = LATDbits.LATD1 = LATDbits.LATD1 = LATDbits.LATD1 =LATDbits.LATD1 = 1)
#define RSDown()				(LATDbits.LATD1 = LATDbits.LATD1 = LATDbits.LATD1 = LATDbits.LATD1 =LATDbits.LATD1 = 0)
#define RWUp()					(LATDbits.LATD0 = LATDbits.LATD0 = LATDbits.LATD0 = LATDbits.LATD0 =LATDbits.LATD0 = 1)
#define RWDown()				(LATDbits.LATD0 = LATDbits.LATD0 = LATDbits.LATD0 = LATDbits.LATD0 =LATDbits.LATD0 =0)
#define EnableUp()				(LATDbits.LATD2 = LATDbits.LATD2 = LATDbits.LATD2 = LATDbits.LATD2 =LATDbits.LATD2 =1)
#define EnableDown()            (LATDbits.LATD2 = LATDbits.LATD2 = LATDbits.LATD2 = LATDbits.LATD2 =LATDbits.LATD2 =0)
// -------------------------------END--HARDWARE---AREA--------------------

#define STATE_INIT          0x00
#define STATE_WRITE_STRING  0x01
#define STATE_DONE          0x02

void LcInit(char rows, char columns);
// Pre: Rows = {1, 2, 4}  Columns = {8, 16, 20, 24, 32, 40 }
// Pre: There is a free timer
// Pre: It needs 40ms of tranquility between the VCC raising and this constructor being called.
// Post: This routine can last up to 100ms
// Post: The display remains cleared, the cursor turned off and at the position 0, 0.

void LcClear(void);
// Post: Clears the display and sets the cursor to its previous state. 
// Post: The next order can last up to 1.6ms. 

void LcCursorOn(void);
// Post: Turn on the cursor
// Post: The next order can last up to 40us. 

void LcCursorOff(void);
// Post: Turns off the cursor
// Post: The next order can last up to 40us. 

void LcGotoXY(char Column, char Row);
// Pre : Column between 0 and 39, row between 0 and 3. 
// Post: Sets the cursor to those coordinates. 
// Post: The next order can last up to 40us. 

void LcPutChar(char c);
// Post: Paints the char in the actual cursor position and increments 
// its position. If the column gets to 39 it returns to 0.
// The row of the LCD is increased when this happens until the second
// row and then it is reset back to row 0 if it has 2 rows total. 
// If the LCD has 4 rows it will reset back to row 0 when it
// reaches row 4 and the columns will go till 39 before reseting to 0.
// The one row LCDs returns to 0 when a column gets to 39. 
// The row is never increased. 
// The char is written

char LcPutString(char *s);
// Post: Paints the string from the actual cursor position. 
// The coordinate criteria is the same as the LcPutChar. 
// Post: Can last up to 40us per char of a routine output.


#endif	/* LCTLCD_H */

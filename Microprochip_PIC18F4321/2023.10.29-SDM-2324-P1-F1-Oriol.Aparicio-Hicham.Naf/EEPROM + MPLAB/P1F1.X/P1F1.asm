    ;--------------------------------------------------------------------------;
    ;                        Configuracions Generals                           ;
    ;--------------------------------------------------------------------------;
    #include <p18f4321.inc>
    
    CONFIG OSC = INTIO1
    CONFIG WDT = OFF
    CONFIG PBADEN = DIG
    CONFIG LVP = OFF
RESULT EQU 0x00 ;Variable on guardarem el resultat de la equacio
 
    ORG 0x0000
    GOTO MAIN
    ORG 0x0008
    RETFIE FAST
    ORG 0x0018
    RETFIE FAST
      
CONFIG_OSC 
    MOVLW b'01110000'
    MOVWF OSCCON, 0  
    MOVLW b'01000000'
    MOVWF OSCTUNE, 0
    RETURN
   
MAIN
    movlw 0x0F
    movwf ADCON1,0
    CALL CONFIG_OSC ;Cridem la funcio que configura l'oscil�lador intern
    
    
    ;Primer hem d'assignar les diferents entrades i sortides als pins del PIC
    ;EA[3..0] = PORTC[3..0] ;EF[1..0] = PORTC[7..4] ;Tecla = PORTA[0] ;OC16 = PORTA[1]
    ;Hash = PORTA[2] ;Est = PORTA[3] ;Parell = PORTA[4] ;ACK = PORTA[5]
    ;OS = PORTB[0] ;Vaixell = PORTB[1] ;C_P = PORTB[2] ;clk = PORTB[3]
    ;R_V = PORTB[4] ;R_R_M = PORTA[7] ;EnE0 = PORTD[0] ;EnE1 = PORTD[1]
    ;OC16 = PORTD[2] ;G_V = PORTD[3] ;L_M = PORTD[4] ;S_G = PORTD[5]
    ;C1S = PORTE[0] ;N_B = PORTE[1] ;clk_n = PORTE[2]
    
    ;1 = INPUT, 0 = OUTPUT
    MOVLW 0x0F
    MOVWF TRISC, 0
    ;Input for EA0 ;Input for EA1 ;Input for EA2 ;Input for EA3 
    ;Output for EF0 ;Output for EF1 ;Output for EF2 ;Output for EF3
    
    BSF TRISA, 0, 0 ;Input for Tecla
    BSF TRISA, 1, 0 ;Input for OC16
    BSF TRISA, 2, 0 ;Input for Hash
    BSF TRISA, 3, 0 ;Input for Est
    BSF TRISA, 4, 0 ;Input for Parell
    BSF TRISA, 5, 0 ;Input for ACK
    
    BCF TRISA, 7, 0 ;Output for R_R_M
    
    BSF TRISB, 0, 0 ;Input for OS
    BSF TRISB, 1, 0 ;Input for Vaixell
    BSF TRISB, 2, 0 ;Input for CurrentPlayer
    BSF TRISB, 3, 0 ;Input for clk
    
    BCF TRISB, 4, 0 ;Output for R_V

    CLRF TRISD, 0
    ;Output for EnE0
    ;Output for EnE1
    ;Output for OC16
    ;Output for G_V
    ;Output for L_M
    ;Output for S_G
    ;Output for G
    ;Output for N_C
    
    BCF TRISE, 0, 0 ;Output for C1S
    BCF TRISE, 1, 0 ;Output for New_Boat
    BCF TRISE, 2, 0 ;Output for !clk
    
    CLRF LATD,0
    BCF LATC,0,0
    BCF LATC,1,0
    BCF LATC,2,0
    BCF LATC,3,0
    BCF LATC,4,0
    BCF LATC,5,0
    
    BCF LATE,0,0
    BCF LATE,1,0
    BCF LATE,2,0
   
    ;Farem tot el sistema combinacional i qualsevol porta logica aqui� al LOOP
LOOP
    ;--------------------------------------------------------------------------;
    ;        Minterms per EF3 					               ;
    ;--------------------------------------------------------------------------;

    CLRF RESULT, 0 ;Inicialitzzem RESULT a 0
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & !H & E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 ;Comprovar que 0C16 = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    BTFSC PORTA, 2, 0 ;Comprovar que H = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    BTFSS PORTA, 3, 0 ;Comprovar que E = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & H & !E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x04 ;Ara restem 0, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 ;Comprovar que 0C16 = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    BTFSS PORTA, 2, 0 ;Comprovar que H = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    BTFSC PORTA, 3, 0 ;Comprovar que E = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & EA1 & EA0 & OS)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x07 ;Ara restem 7, si el resultat es 0 (EA[3..0] - 7 = 0) significa que EA[3..0] = 7
    BTFSS PORTB, 0, 0 ;Comprovar que OS = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & !EA1 & !EA0 & V)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x08 ;Ara restem 8, si el resultat es 0 (EA[3..0] - 8 = 0) significa que EA[3..0] = 8
    BTFSC PORTB, 1, 0 ;Comprovar que V = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & !EA1 & EA0 & CP)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els quatre ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x09 ;Ara restem 9, si el resultat es 0 (EA[3..0] - 9 = 0) significa que EA[3..0] = 9
    BTFSS PORTB, 2, 0 ;Comprovar que CP = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si CP = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & EA2 & !EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x0C ;Ara restem 12, si el resultat es 0 (EA[3..0] - 12 = 0) significa que EA[3..0] = 12
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Ara nomes hem de comprovar si RESULT es un 1 o un 0, si es un 1, significa que s'han completat un o mes minterms, si es 0, no s'ha completat cap minterm
    BTFSC RESULT, 0, 0 
    BSF LATC, 7, 0 ;Si RESULT = 1 llavors EF3 = 1
    BTFSS RESULT, 0, 0
    BCF LATC, 7, 0 ;Si RESULT = 0 llavors EF3 = 0
    
    ;--------------------------------------------------------------------------;
    ;                 Minterms per EF2                    ;
    ;--------------------------------------------------------------------------;
    
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
    
    ;Minterm (!EA3 & !EA2 & EA1 & EA0 & T)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x03 ;Ara restem 3, si el resultat es 0 (EA[3..3] - 0 = 0) significa que EA[3..0] = 3
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 1, 0 ;Comprovar que OC16 = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OC16 = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & H & !E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0 
    BTFSS PORTA, 2, 0 ;Comprovar que H = 1;
    BSF WREG, 0, 0 
    BTFSC PORTA, 3, 0 ;Comprovar que E = 0;
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & !H & !E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0 
    BTFSC PORTA, 2, 0 ;Comprovar que H = 0;
    BSF WREG, 0, 0 
    BTFSC PORTA, 3, 0 ;Comprovar que E = 0;
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    
    ;Minterm (!EA3 & EA2 & !EA1 & EA0 & P)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x05 ;Ara restem 5, si el resultat es 0 (EA[3..0] - 5 = 0) significa que EA[3..0] = 5
    BTFSS PORTA, 4, 0 ;Comprovar que P = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si P = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat

    ;Minterm (!EA3 & EA2 & EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x06 ;Ara restem 6, si el resultat es 0 (EA[3..0] - 6 = 0) significa que EA[3..0] = 6
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & EA1 & EA0 & !OS)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x07 ;Ara restem 7, si el resultat es 0 (EA[3..0] - 7 = 0) significa que EA[3..0] = 7
    BTFSC PORTB, 0, 0 ;Comprovar que OS = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OS = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    
    ;Minterm (EA3 & EA2 & !EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x0C ;Ara restem 12, si el resultat es 0 (EA[3..0] - 12 = 0) significa que EA[3..0] = 12 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    BTFSC RESULT, 0, 0 
    BSF LATC, 6, 0 ;Si RESULT = 1 llavors EF1 = 1
    BTFSS RESULT, 0, 0
    BCF LATC, 6, 0 ;Si RESULT = 0 llavors EF1 = 0
    
    ;--------------------------------------------------------------------------;
    ;        Minterms per EF1           ;
    ;--------------------------------------------------------------------------;

    CLRF RESULT, 0 ;Inicialitzem RESULT a 0
    
    ;Minterm (!EA3 & !EA2 & !EA1 & EA0 & !T)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x01 ;Ara restem 1, si el resultat es 0 (EA[3..0] - 1 = 0) significa que EA[3..0] = 1
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & !EA0 & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x02 ;Ara restem 2, si el resultat es 0 (EA[3..0] - 2 = 0) significa que EA[3..0] = 2
    BTFSS PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OC16 = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & !EA0 & !T & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x02 ;Ara restem 2, si el resultat es 0 (EA[3..0] - 2 = 0) significa que EA[3..0] = 2
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    BTFSC PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OC16 = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & EA0 & !T)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x03 ;Ara restem 3, si el resultat es 0 (EA[3..0] - 3 = 0) significa que EA[3..0] = 3
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & !T & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    BTFSC PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0  ;Posar a 1 el WREG si OC16 = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & !H & E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    BTFSC PORTA, 1, 0 ;Comprovar que OC16 = 0;
    BSF WREG, 0, 0 
    BTFSC PORTA, 2, 0 ;Comprovar que H = 0;
    BSF WREG, 0, 0 
    BTFSS PORTA, 3, 0 ;Comprovar que E = 1;
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & EA0 & P)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els dos ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x05 ;Ara restem 5, si el resultat es 0 (EA[3..0] - 5 = 0) significa que EA[3..0] = 5
    BTFSS PORTA, 4, 0 ;Comprovar que P = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si P = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & EA1 & !EA0) & (ACK + !ACK) 
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els dos ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x06 ;Ara restem 6, si el resultat es 0 (EA[3..0] - 6 = 0) significa que EA[3..0] = 6
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & EA0 & !OS)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x07 ;Ara restem 7, si el resultat es 0 (EA[3..0] - 7 = 0) significa que EA[3..0] = 7
    BTFSC PORTB, 0, 0 ;Comprovar que OS = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OS = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & !EA1 & EA0 & CP)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x09 ;Ara restem 9, si el resultat es 0 (EA[3..0] - 9 = 0) significa que EA[3..0] = 9
    BTFSS PORTB, 2, 0 ;Comprovar que CP = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si CP = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    BTFSC RESULT, 0, 0 
    BSF LATC, 5, 0 ;Si RESULT = 1 llavors EF1 = 1
    BTFSS RESULT, 0, 0
    BCF LATC, 5, 0 ;Si RESULT = 0 llavors EF1 = 0    
    ;--------------------------------------------------------------------------;
    ;        Minterms per EF0 = (!EA1 & !EA0 & X) | (!EA1 & EA0 & !Y)          ;
    ;--------------------------------------------------------------------------;

    CLRF RESULT, 0 ;Inicialitzzem RESULT a 0
    
    ;Minterm (!EA3 & !EA2 & !EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x00 ;Ara restem 0, si el resultat es 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & !EA1 & !EA0 & T)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x01 ;Ara restem 1, si el resultat es 0 (EA[3..0] - 1 = 0) significa que EA[3..0] = 1
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & !EA0 & T & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x02 ;Ara restem 2, si el resultat es 0 (EA[3..0] - 2 = 0) significa que EA[3..0] = 2
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & !EA0 & !T & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x02 ;Ara restem 2, si el resultat es 0 (EA[3..0] - 2 = 0) significa que EA[3..0] = 2
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    BTFSC PORTA, 1, 0 
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & !EA2 & EA1 & EA0 & !T)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x03 ;Ara restem 3, si el resultat es 0 (EA[3..0] - 3 = 0) significa que EA[3..0] = 3
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & !T & !OC16)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSC PORTA, 0, 0 ;Comprovar que Tecla = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 1;
    BTFSC PORTA, 1, 0 
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & !H & E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 0, si el resultat es 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 
    BSF WREG, 0, 0 
    BTFSC PORTA, 2, 0 
    BSF WREG, 0, 0 
    BTFSS PORTA, 3, 0 
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & !EA0 & T & !OC16 & !H & !E)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x04 ;Ara restem 4, si el resultat es 0 (EA[3..0] - 4 = 0) significa que EA[3..0] = 4
    BTFSS PORTA, 0, 0 ;Comprovar que Tecla = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si Tecla = 0;
    BTFSC PORTA, 1, 0 
    BSF WREG, 0, 0 
    BTFSC PORTA, 2, 0 
    BSF WREG, 0, 0 
    BTFSC PORTA, 3, 0 
    BSF WREG, 0, 0 
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & !EA1 & EA0 & !P)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x05 ;Ara restem 5, si el resultat es 0 (EA[3..0] - 5 = 0) significa que EA[3..0] = 5
    BTFSC PORTA, 4, 0 ;Comprovar que P = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si P = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
        ;Minterm (!EA3 & EA2 & EA1 & !EA0 & ACK)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x06 ;Ara restem 6, si el resultat es 0 (EA[3..0] - 6 = 0) significa que EA[3..0] = 6
    BTFSS PORTA, 5, 0 ;Comprovar que ACK = 1;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si ACK = 0;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (!EA3 & EA2 & EA1 & EA0 & !OS)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x07 ;Ara restem 7, si el resultat es 0 (EA[3..0] - 7 = 0) significa que EA[3..0] = 7
    BTFSC PORTB, 0, 0 ;Comprovar que OS = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si OS = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & !EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x08 ;Ara restem 8, si el resultat es 0 (EA[3..0] - 8 = 0) significa que EA[3..0] = 8
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & !EA1 & EA0 & !CP)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x09 ;Ara restem 9, si el resultat es 0 (EA[3..0] - 9 = 0) significa que EA[3..0] = 9
    BTFSC PORTB, 2, 0 ;Comprovar que CP = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si CP = 1;
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & EA1 & !EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x0A ;Ara restem 10, si el resultat es 0 (EA[3..0] - 10 = 0) significa que EA[3..0] = 10
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    ;Minterm (EA3 & !EA2 & EA1 & EA0)
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomes treballar amb els quatre ultims bits, apliquem la mascara [00001111] 
    SUBLW 0x0B ;Ara restem 11, si el resultat es 0 (EA[3..0] - 11 = 0) significa que EA[3..0] = 11
    SUBLW 0x00 ;si WREG - 0 = 0 llavors STATUS, Z = 1
    BTFSC STATUS, Z, 0 
    BSF RESULT, 0, 0 ;si STATUS, Z = 1 posem RESULT a 1, per indicar que el midterm s'ha completat
    
    BTFSC RESULT, 0, 0 
    BSF LATC, 4, 0 ;Si RESULT = 1 llavors EF1 = 1
    BTFSS RESULT, 0, 0
    BCF LATC, 4, 0 ;Si RESULT = 0 llavors EF1 = 0    
    
    
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per R_V = (!EA1 & !EA0) | (EA1 & !EA0)           ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x00 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en ell
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00000011]
    SUBLW 0x08 ;Ara restem 2, si el resultat és 0 (EA[1..0] - 2 = 0) significa que EA[1..0] = 2
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 2 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSS RESULT, 0, 0 
    BSF LATB, 4, 0 ;Si RESULT = 0 llavors A = 1
    BTFSC RESULT, 0, 0
    BCF LATB, 4, 0 ;Si RESULT = 1 llavors A = 0
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per R_R_M = (!EA1 & !EA0) | (EA1 & !EA0)           ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x00 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en ell
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00000011]
    SUBLW 0x0A ;Ara restem 2, si el resultat és 0 (EA[1..0] - 2 = 0) significa que EA[1..0] = 2
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 2 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSS RESULT, 0, 0 
    BSF LATA, 7, 0 ;Si RESULT = 0 llavors A = 1
    BTFSC RESULT, 0, 0
    BCF LATA, 7, 0 ;Si RESULT = 1 llavors A = 0
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per En_E0 = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x00 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en ell
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00000011]
    SUBLW 0x01 ;Ara restem 2, si el resultat és 0 (EA[1..0] - 2 = 0) significa que EA[1..0] = 2
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 2 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATD, 0, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATD, 0, 0 ;Si RESULT = 1 llavors A = 0
    
        ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per En_E1 = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x00 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATD, 1, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATD, 1, 0 ;Si RESULT = 1 llavors A = 0
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per Cont = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x02 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x04 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x07 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSS RESULT, 0, 0 
    BSF LATD, 2, 0 ;Si RESULT = 0 llavors A = 1
    BTFSC RESULT, 0, 0
    BCF LATD, 2, 0 ;Si RESULT = 1 llavors A = 0
    
        ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per G_V = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x0B ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATD, 3, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATD, 3, 0 ;Si RESULT = 1 llavors A = 0
    
        ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per L_M =     ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x0B ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC PORTB, 3, 0 ;Comprovar que clk = 0;
    BSF WREG, 0, 0 ;Posar a 1 el WREG si clk = 1;
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x09 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara nomes hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSS RESULT, 0, 0 
    BSF LATD, 4, 0 ;Si RESULT = 0 llavors A = 1
    BTFSC RESULT, 0, 0
    BCF LATD, 4, 0 ;Si RESULT = 1 llavors A = 0
   
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per S_G = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x0C ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATD, 5, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATD, 5, 0 ;Si RESULT = 1 llavors A = 0
    
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per G = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x05 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATD, 6, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATD, 6, 0 ;Si RESULT = 1 llavors A = 0
    
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per N_C = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x06 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSS RESULT, 0, 0 
    BSF LATD, 7, 0 ;Si RESULT = 0 llavors A = 1
    BTFSC RESULT, 0, 0
    BCF LATD, 7, 0 ;Si RESULT = 1 llavors A = 0
    
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per Save = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x03 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATE, 0, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATE, 0, 0 ;Si RESULT = 1 llavors A = 0
    
    
    ;--------------------------------------------------------------------------;
    ;	     Equacio de sortida per NewBoat = (!EA1 & !EA0) | (EA1 & !EA0)      ;
    ;--------------------------------------------------------------------------;
    CLRF RESULT, 0 ;Resetejem RESULT per les futures operacions
     
    MOVF PORTC, 0, 0 ;Movem els 8 bits del PORTC al WREG per poder realitzar operacions en aquest registre
    ANDLW 0x0F ;Per tal de nomès treballar amb els dos ultims bits, apliquem la màscara [00001111] 
    SUBLW 0x09 ;Ara restem 0, si el resultat és 0 (EA[3..0] - 0 = 0) significa que EA[3..0] = 0
    BTFSC STATUS, Z, 0 ;Si EA[1..0] - 0 = 0, llavors STATUS, Z = 1
    BSF RESULT, 0, 0 ;Si STATUS, Z = 1 llavors RESULT = 1
    
    ;Ara només hem de comprovar si el RESULT és un 1 o un 0, si és un 1, s'han completat un o més minterms, si és 0, no s'ha completat cap
    BTFSC RESULT, 0, 0 
    BSF LATE, 1, 0 ;Si RESULT = 0 llavors A = 1
    BTFSS RESULT, 0, 0
    BCF LATE, 1, 0 ;Si RESULT = 1 llavors A = 0
    
    
    
    ;--------------------------------------------------------------------------;
    ;			       Porta logica Not                                 ;
    ;--------------------------------------------------------------------------;

    ;Implementem una porta NOT --> n_clk = !clk
    BTFSS PORTB, 3, 0
    BSF LATE, 2, 0 ;Si B = 1, saltem la linea, si B = 0 llavors Z = 1
    BTFSC PORTB, 3, 0
    BCF LATE, 2, 0 ;Si B = 0, saltem la linea, si B = 1 llavors Z = 0
    
    GOTO LOOP
    END
    
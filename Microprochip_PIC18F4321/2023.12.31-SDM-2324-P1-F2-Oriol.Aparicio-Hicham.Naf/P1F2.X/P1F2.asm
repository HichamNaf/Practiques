;PRACTICA 1 FASE 2
    ;membre_1: Hicham Naf
    ;membre_2: Oriol Aparicio
    ;identificador_grup: 82

#include <p18f4321.inc>

    CONFIG OSC = HSPLL		;utilitzem XSTALL extern de 10MHz amb PLL per anar a 40MHz
    CONFIG MCLRE = ON		;tenim polsador de reset per si el PIC es queda penjat
    CONFIG PBADEN = DIG		;Sempre digital
    CONFIG WDT = OFF		;Posem a OFF el watch dog timer perquè no l'utilitzarem
    CONFIG LVP = OFF
			    ;Mapejem les @ de la FLASH
    ORG 0x0000
    GOTO MAIN			;Quan el pic es reseteja anem al main
    ORG 0x0008
    GOTO RSI_GEN		;declarem la interrupció del timer0 com a alta
    ORG 0x0018
    RETFIE FAST			;posem retfie per si de cas, tot i que no saltarà mai


;-------------------------------------------------------------------------------
; VARIABLES A LA RAM
;------------------------------------------------------------------------------- 
COMPTADOR		   EQU 0x01	    ;comptadors pel control dels pwm's
		   
VALOR			   EQU 0x02	    ;GUARDEM EL CONTINGUT DE LA RAM
			   
COMPT_MATRIU		   EQU 0x04
		   
LED_Blue_Mirall		   EQU 0x05
LED_Green_Mirall	   EQU 0x06
LED_Red_Mirall		   EQU 0x07
		   
COMPTADOR1		   EQU 0x08	
COMPTADOR2		   EQU 0x09
		   
VALUEESPERA		   EQU 0x0A

SOROLL_FREQ		   EQU 0x0B
		   
COORD_X			   EQU 0x0C
COORD_Y			   EQU 0X0D
			   
RAM_COORD		   EQU 0x0E 		   
CONTINGUT_RAM		   EQU 0x0F
CURRENT_GRID		   EQU 0x10

TEMPS_INC_L		   EQU 0x13
TEMPS_INC_H		   EQU 0x14	

ACTUAL_PWM		   EQU 0x15
PWM_S0			   EQU 0x16
PWM_S1			   EQU 0x17
MAX_PWM			   EQU 0x18
	   
COMPT_1S		   EQU 0x1A
		   
;-------------------------------------------------------------------------------
; TAULES DE LA FLASH
;------------------------------------------------------------------------------- 
TAULASERVO EQU 0x20		;definim taula de la flash per guardar els increments dels servos
 
    ORG TAULASERVO
    DB b'11111100',b'00011000'		; Valor del comptador per tindre 5 increments	0x20,0x21
    DB b'11111100', b'10111111'		; Valor del comptador per tindre 6 increments	0x22,0x23
    DB b'11111101', b'00110110'		; Valor del comptador per tindre 7 increments	0x24,0x25
    DB b'11111101', b'10001111'		; Valor del comptador per tindre 8 increments	0x26,0x27
    DB b'11111101', b'11010100'		; Valor del comptador per tindre 9 increments	0x28,0x29
    DB b'11111110', b'00001100'		; Valor del comptador per tindre 10 increments	0x2A,0x2B
    DB b'11111110', b'00111001'		; Valor del comptador per tindre 11 increments	0x2C,0x2D
    DB b'11111110', b'01011111'		; Valor del comptador per tindre 12 increments	0x2E,0x2F
    DB b'11111110', b'01111111'		; Valor del comptador per tindre 13 increments	0x30,0x31
    DB HIGH(.65179), LOW(.65179)	; Valor del comptador per tindre 14 increments	0x32,0x33
    DB HIGH(.65203), LOW(.65203)	; Valor del comptador per tindre 15 increments	0x34,0x35
    DB HIGH(.65224), LOW(.65224)	; Valor del comptador per tindre 18 increments	0x36,0x37
    DB HIGH(.65273), LOW(.65273)	; Valor del comptador per tindre 16 increments	0x38,0x39
    DB HIGH(.65242), LOW(.65242)	; Valor del comptador per tindre 17 increments	0x3A,0x3B
    DB HIGH(.65258), LOW(.65258)	; Valor del comptador per tindre 19 increments	0x3C,0x3D
    DB HIGH(.65286), LOW(.65286)	; Valor del comptador per tindre 20 increments	0x3E,0x3F
    DB HIGH(.65298), LOW(.65298)	; Valor del comptador per tindre 21 increments	0x40,0x41
    DB HIGH(.65309), LOW(.65309)	; Valor del comptador per tindre 22 increments	0x42,0x43
    DB HIGH(.65319), LOW(.65319)	; Valor del comptador per tindre 23 increments	0x44,0x45
    DB HIGH(.65328), LOW(.65328)	; Valor del comptador per tindre 24 increments	0x46,0x47
    DB HIGH(.65336), LOW(.65336)	; Valor del comptador per tindre 25 increments	0x48,0x49	   

;-------------------------------------------------------------------------------
; 1. CONFIGURACIO DE PORTS
;-------------------------------------------------------------------------------  

CONFIG_PORTS
    
CONFIG_PWM_PORTS    
    BCF	    TRISD,RD0,0			;Grid
    BSF	    TRISD,RD2,0			;StartGame
    BCF	    TRISA,RA1,0			;FleetStatus0
    BCF	    TRISA,RA2,0			;FleetStatus1 
    BCF	    TRISA,RA3,0			;ACK
    BCF	    TRISA,RA4,0			;CurrentGrid    
    BCF	    TRISA,RA5,0			;Speaker
CONFIG_BUTTONS    
    SETF TRISB, 0		;0-NewCoord, 1-NewBoat, 3-Up, 4-Left, 5-Down
    BSF	TRISD,RD1,0			;Right
    BSF TRISD,RD3,0			;Attack
    BCF	    INTCON2,RBPU,0		;activem pull ups al port B
CONFIG_COORDS
    SETF TRISC, 0	;inicialitzem tot el port C com a entrada
    RETURN
    
ESPERA				    ;Bucle d'espera fins que VALUEESPERA valgui 0
    NOP
    NOP
    NOP
    DECF    VALUEESPERA,1,0
    BTFSS   STATUS,Z,0
    GOTO	ESPERA
    RETURN

;-------------------------------------------------------------------------------
; 1.1. INICIALITZAR VARIABLES
;------------------------------------------------------------------------------- 
INIT_VARS
    BCF	    CURRENT_GRID,0,0
			
    BCF	    LATA,RA3,0		
    BCF	    LATA,RA4,0		
    BCF	    LATA,RB5,0
INIT_PWM 
    CLRF    MAX_PWM,0
    BCF	    LATD,RD0,0			   
    BCF	    LATA,RA1,0			   
    BCF	    LATA,RA2,0
   
    MOVLW   b'10000000'	    ;Inicialitzem el PWM
    MOVWF   COMPTADOR,0
    
INIT_RAM
    MOVLW 0x01
    MOVWF FSR0H, 0	;Indiquem que volem utilitzar el banc 1.
  
    CLRF FSR0L, 0	;Comencem en l'adressa 0 del banc 1
    CALL RESET_RAM
    RETURN
    
RESET_RAM
    MOVLW .0
    MOVWF POSTINC0, 0
    MOVLW .129
    CPFSEQ FSR0L, 0
    GOTO RESET_RAM
    CLRF FSR0L, 0
    RETURN   

INIT_TIMER0    
    BSF	 INTCON,TMR0IE,0		    ;Activem interrupcio timer0 
    CALL TIMER0_LOW
    CALL INIT_INTERUPT_VARIABLES
    RETURN
    
INIT_INTERUPT_VARIABLES
    MOVLW 0x00		;Load TBLPTR with the base
    MOVWF TBLPTRU	;Address of the word
    MOVLW 0x00		
    MOVWF TBLPTRH
    
    MOVLW .5
    SUBWF MAX_PWM,0,0
    MULLW .2
    MOVF PRODL,0
    ADDLW TAULASERVO
    MOVWF TBLPTRL,0
    
READ_WORD
    TBLRD*+		;Read into TABLAT and increment
    MOVF TABLAT, 0	;Get data
    MOVWF TEMPS_INC_H,0
    TBLRD*		;Read into TABLAT
    MOVF TABLAT, 0	;Get data
    MOVWF TEMPS_INC_L,0
    
    CLRF ACTUAL_PWM,0
    INCF MAX_PWM,1,0
    MOVFF   MAX_PWM, PWM_S0
    MOVFF   MAX_PWM, PWM_S1
    
    RETURN    
;-------------------------------------------------------------------------------
; 2. INTERRUPCIONS
;-------------------------------------------------------------------------------  
CONFIG_INT
    BCF	    RCON,IPEN,0			    ;desactivo prioritats sempre per tenir nomes la alta
    BSF	    INTCON,GIE,0		    ;activem les interrupcions internes
    BSF	    INTCON,PEIE,0		    ;activem masked i unmasked interrupts sempre
    BCF	    INTCON,TMR0IE,0		    ;de moment desactivem la interrupcio del timer0
    BSF	    INTCON,INT0IE,0		    ;activem interrupcio RB0
    
    BCF	    INTCON2,INTEDG0,0		    ;INT0 per flanc de baixada
    BSF	    INTCON2,INTEDG1,0		    ;INT1 per flanc de pujada
    
    BSF	    INTCON3,INT1IE,0		    ;activem interrupcio RB1
    
					    ;per comptar de 20ms en 20ms si vaig a 100ns haig de fer 200.000 increments,
    MOVLW   b'10000001'			    ;per tant necessitare prescaler (amb prescaler de 4 em surten 50.000 increments
    MOVWF   T0CON,0			    ;i ja em dona mes petit de 16b)
    RETURN
    
RSI_GEN
    BTFSC   INTCON,INT0IF,0
    GOTO    RSI_INT0
    BTFSC   INTCON3,INT1IF,0
    GOTO    RSI_INT1
    BTFSC   INTCON,TMR0IF,0
    GOTO    RSI_T0
    RETFIE FAST
;-------------------------------------------------------------------------------
; 2.1. INTERRUPCIO DEL TIMER0
;------------------------------------------------------------------------------- 
TIMER0_LOW			
    MOVLW   HIGH(.64286)		    ;(16b) 65536 - 1250 = 64286 (0.5ms)
    MOVWF   TMR0H,0
    MOVLW   LOW(.64286)
    MOVWF   TMR0L,0
    INCF ACTUAL_PWM,1,0
    INCF COMPT_1S,1,0
    CALL ESPERA_T0
    RETURN
TIMER0_INCREMENT
    MOVFF   TEMPS_INC_H, TMR0H
    MOVFF   TEMPS_INC_L, TMR0L
    CALL ESPERA_T0
    RETURN  
TIMER0_HIGH			
    MOVLW   HIGH(.21786)		    ;(16b) 65536 - 43750 = 21786 (17.5ms)
    MOVWF   TMR0H,0
    MOVLW   LOW(.21786)
    MOVWF   TMR0L,0
    CLRF ACTUAL_PWM,0
    RETURN
T0_LOW
    BSF LATA,1,0 
    BSF LATA,2,0
    CALL TIMER0_LOW
    GOTO RSI_T0   
T0_HIGH
    CALL TIMER0_HIGH
    BCF LATA,1,0 
    BCF LATA,2,0
    GOTO END_RSI_T0  

ESPERA_T0
    BTFSS INTCON,TMR0IF,0
    GOTO ESPERA_T0
    RETURN
RSI_T0
    BCF	    INTCON,TMR0IE,0		    ;Desactivem interrupcio timer0 
    BCF	    INTCON,TMR0IF,0
    MOVLW .0
    CPFSGT ACTUAL_PWM,0
    GOTO    T0_LOW	    		    
    MOVF ACTUAL_PWM,0
    CPFSGT MAX_PWM,0
    GOTO    T0_HIGH
    
    MOVF ACTUAL_PWM,0
    CPFSGT PWM_S0,0
    BCF LATA,1,0
    CPFSGT PWM_S1,0
    BCF LATA,2,0
    CALL TIMER0_INCREMENT
    INCF ACTUAL_PWM,1,0
    GOTO RSI_T0
    
END_RSI_T0    
    BCF	    INTCON,TMR0IF,0		    ;netejem el flac de la interrupcio i fem retfie fast
    BSF	    INTCON,TMR0IE,0		    ;activem interrupcio timer0
    RETFIE  FAST  
    
RSI_INT0				    ;Interrupcio NewCoord
    MOVLW   .255
    MOVWF   VALUEESPERA,0
    CALL	ESPERA
    CALL ESCRIPTURA_VALORS_F1
    
    BTFSS   CURRENT_GRID,0,0
    INCF MAX_PWM,1,0
    
    BSF	    LATA,RA3,0
    CALL    ESPERA_1MS
    BCF	    LATA,RA3
    
END_RSI_INT0    
    BCF	    INTCON,INT0IF,0		    ;Netejem el flac de la interrupcio i fem retfie fast    
    RETFIE FAST
    
RSI_INT1				    ;Interrupció del NewBoat per canviar de jugador
    
    BTG CURRENT_GRID,0,0
    BTG LATA,RA4,0
    CALL    LECTURA_VALORS
    MOVLW   .255
    MOVWF   VALUEESPERA,0
    CALL	ESPERA
    
END_RSI_INT1    
    BCF	    INTCON3,INT1IF,0		    ;Netejem el flac de la interrupcio i fem retfie fast    
    RETFIE FAST
    
;-------------------------------------------------------------------------------
; 3. MODUL CONTROL DE RAM
    
;3.1 LECTURA TAULELL RAM I MOSTRAR MATRIU
;-------------------------------------------------------------------------------     
    
LECTURA_VALORS
    MOVLW .65
    BTFSC CURRENT_GRID,0,0
    MOVWF   FSR0L,0
    
BUCLE_LECTURA    
    BCF	    INTCON,TMR0IE,0		    ;Desactivem interrupcio timer0 
    
    MOVFF POSTINC0, VALOR		    ;Guardem la posicio de la RAM actual i incrementem el punter
    ;Tenim el color de tots els taulells.
    BTFSS PORTD, 2, 0  ;SI L'USUARI HA COMENÇAT EL JOC MOSTRAREM ELS VALORS DE LA FASE 2
    CALL PRINT_VALORS_F1
    BTFSC PORTD, 2, 0  ;SI L'USUARI NO HA COMENÇAT EL JOC MOSTRAREM ELS VALORS DE LA FASE 1
    CALL PRINT_VALORS_F2
    MOVLW .64	    
    CPFSGT FSR0L, 0			    ;Jugador 0
    GOTO BUCLE_LECTURA
    MOVLW .129
    CPFSEQ FSR0L, 0			    ;Jugador 1
    GOTO BUCLE_LECTURA
    CLRF FSR0L, 0
    BTFSC   PORTD,RD2,0			    ;Activem la interrupcio nomes si estem a la Fase 2
    BSF	    INTCON,TMR0IE,0		    ;Activo interrupcio timer0 
    
    RETURN    

;-------------------------------------------------------------------------------
;3.2 ESCRIPTURA RAM FASE 1
;-------------------------------------------------------------------------------      
ESCRIPTURA_VALORS_F1	    ;CRIDEM LA FUNCIÓ QUAN REBEM EL SENYAL NewCoord
    
    CALL COORD_F1
    
    MOVFF RAM_COORD, FSR0L	;ASSIGNEM EL VALOR AL PUNTER DE LA RAM
    
    MOVLW .1
    MOVWF INDF0,0		;POSEM DE COLOR VERD LA POSICIÓ AL TAULELL
    
    CLRF FSR0L, 0		;POSEM EL PUNTER DE LA RAM A 0
    
    CALL LECTURA_VALORS		;MOSTRAR ACTUALITZAR LA MATRIU
    
    RETURN
    
;-------------------------------------------------------------------------------
;3.3 OBTENCIO NEW COORD
;-------------------------------------------------------------------------------    
    
COORD_F1
    MOVF PORTC, 0	    ;POSEM EL VALOR DEL PORT C AL REGISTRE WREG
    ANDLW 0x0F		    ;MULTIPLIQUEM ELS 4 LSB PER 1 I ELS 4 MSB PER 0
    MOVWF COORD_Y, 0	    ;GUARDEM EL RESULTAT A COORD_Y
    
    MOVFF PORTC, COORD_X    ;MOVEM EL VALOR DEL PORT C A LA VARIABLE COORD_X
    rlncf COORD_X,1,0	    ;ROTEM 4 VEGADES EL VALOR
    rlncf COORD_X,1,0
    rlncf COORD_X,1,0
    rlncf COORD_X,1,0
    MOVF COORD_X, 0, 0	    ;COPIEM EL VALOR AL REGISTRE WREG
    ANDLW 0x0F		    ;MULTIPLIQUEM ELS 4 LSB PER 1 I ELS 4 MSB PER 0
    MOVWF COORD_X, 0	    ;GUARDEM EL RESULTAT A COORD_X
    
    CALL CONVERT_COORD_TO_RAM
    
    RETURN

;-------------------------------------------------------------------------------
;3.4 CONVERSIO COORDENADA A POSICIO MATRIU
;-------------------------------------------------------------------------------     
CONVERT_COORD_TO_RAM
  
    MOVFF COORD_Y, RAM_COORD	    ;RESTAR 1 A COORD_Y
    DECF RAM_COORD, 1, 0
    
    MOVLW .8			    ;MULTIPLICAR PER 8
    MULWF RAM_COORD,0
    
    MOVF COORD_X, 0		    ;MOVEM LA COORD_X AL REGISTRE WREG
    ADDWF PRODL, 0, 0		    ;SUMAR COORD_X A PRODL, I GUARDAR EL RESULTAT AL ACUMULADOR
    MOVWF RAM_COORD, 0		    ;A RAM_COORD TENIM LA POSICIÓ DE LA RAM DE LES COORDENADES
    DECF RAM_COORD, 1, 0	    ;RESTEM 1 A RAM_COORD PER A QUE COINCIDEIXI LA ADREÇA DE LA RAM
    
    MOVLW .65
    BTFSC CURRENT_GRID, 0, 0	    ;MIREM SI CURRENT_GRID ES DEL JUGADOR 0 O 1
    ADDWF RAM_COORD, 1, 0	    ;SELECCIONAR TAULELL JUGADOR 1, SI HO SALTEM ESTAREM FENT EL JUGADOR 0
    
    RETURN
    
 
;-------------------------------------------------------------------------------
; 4. MODUL CONTROL MOVIMENT CURSOR + ATACAR
;-------------------------------------------------------------------------------     
INIT_CURSOR
    MOVLW .1
    MOVWF COORD_X, 0	    ;POSEM A 1 LA COORDENADA X
    MOVLW .1
    MOVWF COORD_Y, 0	    ;POSEM A 1 LA COORDENADA Y
    RETURN
   
MOURE_DOWN
    ;DOWN
    MOVLW .1
    ADDWF COORD_Y, 1,0	    ;SUMEM 1 AL VALOR DE LA COORD_Y
    ;SI VOLEM SALTAR DEL 8 AL 1
    MOVLW .8
    CPFSGT COORD_Y, 0	    ;COMPARA EL WREG AMB COORD_Y, SI COORD_Y ES MES GRAN SALTA DE LINEA
    GOTO LECTURA_VALORS
    MOVLW .1
    MOVWF COORD_Y, 0
    GOTO LECTURA_VALORS
    
  
MOURE_UP
    ;UP + SALTAR DE 1 A 8
    DECFSZ COORD_Y, 1, 0    ;RESTEM 1 AL VALOR DE COORD_Y
    GOTO LECTURA_VALORS   ;TORNEM SI NO ESTEM A 1
    MOVLW .8
    MOVWF COORD_Y, 0	    ;SI ESTAVEM A 1 EL POSEM A 8
    GOTO LECTURA_VALORS
    
    
MOURE_RIGHT
    ;RIGHT
    MOVLW .1
    ADDWF COORD_X, 1, 0	    ;SUMEM 1 AL VALOR DE LA COORD_X
    ;SI VOLEM SALTAR DEL 8 AL 1
    MOVLW .8
    CPFSGT COORD_X, 0	    ;COMPARA EL WREG AMB COORD_X, SI COORD_Y ES MES GRAN SALTA DE LINEA
    GOTO LECTURA_VALORS
    MOVLW .1
    MOVWF COORD_X, 0
    GOTO LECTURA_VALORS
    
    
MOURE_LEFT
    ;LEFT + SALTAR DE 1 A 8
    DECFSZ COORD_X, 1, 0    ;RESTEM 1 AL VALOR DE COORD_X
    GOTO LECTURA_VALORS   ;TORNEM SI NO ESTEM A 1
    MOVLW .8
    MOVWF COORD_X, 0	    ;SI ESTAVEM A 1 EL POSEM A 8
    GOTO LECTURA_VALORS
    
    
ATACAR
    ;CONVERTIR A RAM LA COORDENADA ACTUAL
    CALL CONVERT_COORD_TO_RAM
    
    MOVFF RAM_COORD,FSR0L	;AGAFEM L'ADREÇA DE LA COORDENADA A ATACAR I LA CARREGUEM AL PUNTER

    ;COMPROVAR EL VALOR QUE TE 00 O 01
    MOVFF   INDF0, CONTINGUT_RAM ;COPIEM EL CONTINGUT DE LA RAM A LA VARIABLE CONTINGUT_RAM
    MOVLW .0
    CPFSGT  CONTINGUT_RAM, 0	;SI EL CONTINGUT DE LA RAM EL MAJOR A 00 S'HO SALTA
    GOTO HAS_TOCAT_AIGUA
    MOVLW .1
    CPFSGT  CONTINGUT_RAM, 0	;SI EL CONTINGUT DE LA RAM EL MAJOR A 01 S'HO SALTA
    GOTO HAS_TOCAT_BARCO
    CLRF FSR0L,0
    RETURN
    
    
HAS_TOCAT_AIGUA
    ;POSAR LA POSICIO EN VERMELL
    MOVLW .2
    MOVWF INDF0, 0	    ;POSEM 10 A LA COORDENADA ATACADA
    MOVLW b'00001001'		    ;MOVEM EL CURSOR FORA DE LA MATRIU A MOSTRAR   
    MOVWF COORD_Y,0
    ;MOSTREM LA MATRIU ACTUALITZADA
    CLRF FSR0L,0
    CALL LECTURA_VALORS
    ;FER EL SOROLL GREU 1S
    CLRF COMPT_1S,0
    MOVLW .78
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU
    CLRF COMPT_1S,0
    CALL ESPERA_1S
    CLRF COMPT_1S,0
    CALL ESPERA_1S
    
    CALL INIT_CURSOR
    BTG CURRENT_GRID,0,0
    BTG LATA,RA4,0
    CALL LECTURA_VALORS
    
    RETURN
    
HAS_TOCAT_BARCO
    ;POSAR LA POSICIO EN VERD
    MOVLW .3
    MOVWF INDF0, 0	    ;POSEM 11 A LA COORDENADA ATACADA
    MOVLW b'00001001'		    ;MOVEM EL CURSOR FORA DE LA MATRIU A MOSTRAR     
    MOVWF COORD_Y,0
    
    ;MOSTREM LA MATRIU ACTUALITZADA
    CLRF FSR0L,0
    CALL LECTURA_VALORS
    BTFSC CURRENT_GRID ,0,0
    DECF PWM_S1,1,0
    BTFSS CURRENT_GRID ,0,0
    DECF PWM_S0,1,0
    ;FER EL SOROLL AGUT 1S
    CLRF COMPT_1S,0
    MOVLW .10
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU
    CLRF COMPT_1S,0
    CALL ESPERA_1S
    CLRF COMPT_1S,0
    CALL ESPERA_1S
    MOVLW   .1
    CPFSGT   PWM_S0,0
    GOTO    END_GAME
    CPFSGT   PWM_S1,0
    GOTO    END_GAME
    
    CALL INIT_CURSOR
    BTG CURRENT_GRID,0,0
    BTG LATA,RA4,0
    CALL LECTURA_VALORS
    RETURN

ESPERA_1S
    MOVLW .50
    CPFSGT COMPT_1S,0
    GOTO ESPERA_1S
    RETURN
    
SOROLL_ALTAVEU  
    BSF LATA,RA5,0		    
    MOVFF   SOROLL_FREQ, COMPTADOR2 
    CALL INCREMENTA_XS
    BCF LATA,RA5,0
    MOVFF   SOROLL_FREQ, COMPTADOR2
    CALL INCREMENTA_XS
    MOVLW .50
    CPFSGT COMPT_1S,0
    GOTO SOROLL_ALTAVEU
    RETURN  
    
;-------------------------------------------------------------------------------
; 5. MODUL CONTROL DE LED
;------------------------------------------------------------------------------- 
PRINT_VALORS_F1
    MOVLW .0
    CPFSGT VALOR,0
    GOTO ASSIGN_BLUE
    MOVLW .1
    CPFSGT VALOR,0
    GOTO ASSIGN_GREEN 
    RETURN
    
PRINT_VALORS_F2
    CALL CONVERT_COORD_TO_RAM
    MOVF RAM_COORD, 0 
    INCF WREG,0,0
    
    CPFSEQ FSR0L,0	    ;A la fase 2 printarem el taulell i a la posició
    GOTO PRINT_V_2	    ;on tinguem el cursor la mostrarem de color blanc
    GOTO ASSIGN_WHITE
    
PRINT_V_2    
    MOVLW .3
    CPFSLT VALOR,0
    GOTO ASSIGN_GREEN
    MOVLW .2
    CPFSLT VALOR,0
    GOTO ASSIGN_RED
    GOTO ASSIGN_BLUE
    
ASSIGN_WHITE
    MOVLW  .3
    MOVWF LED_Blue_Mirall,0
    MOVWF LED_Red_Mirall,0 
    MOVWF LED_Green_Mirall,0   
    GOTO PRINT_LED 
    
ASSIGN_BLUE
    MOVLW   .1
    MOVWF LED_Blue_Mirall,0
    CLRF  LED_Red_Mirall,0 
    CLRF  LED_Green_Mirall,0   
    GOTO PRINT_LED 
    
ASSIGN_GREEN   
    MOVLW   .3
    MOVWF LED_Green_Mirall,0
    CLRF  LED_Red_Mirall,0
    CLRF  LED_Blue_Mirall,0   
    GOTO PRINT_LED 
    
ASSIGN_RED
    MOVLW  .3
    MOVWF LED_Red_Mirall,0
    CLRF  LED_Blue_Mirall,0 
    CLRF  LED_Green_Mirall,0   
    GOTO PRINT_LED   
 
PRINT_LED  

LED_GREEN
    BSF LATD,RD0,0
    rlncf LED_Green_Mirall,1,0
    NOP
    BTFSS LED_Green_Mirall,7,0
    BCF LATD,RD0,0
    rlncf COMPTADOR,1,0
    NOP
    NOP
    BCF LATD,RD0,0
    BTFSS COMPTADOR,0,0
    GOTO LED_GREEN 
LED_RED   
    BSF LATD,RD0,0
    rlncf LED_Red_Mirall,1,0
    NOP
    BTFSS LED_Red_Mirall,7,0
    BCF LATD,RD0,0
    rlncf COMPTADOR,1,0
    NOP
    NOP
    BCF LATD,RD0,0
    BTFSS COMPTADOR,0,0
    GOTO LED_RED  
LED_BLUE    
    BSF LATD,RD0,0
    rlncf LED_Blue_Mirall,1,0
    NOP
    BTFSS LED_Blue_Mirall,7,0
    BCF LATD,RD0,0
    rlncf COMPTADOR,1,0
    NOP
    NOP
    BCF LATD,RD0,0
    BTFSS COMPTADOR,0,0
    GOTO LED_BLUE    
    RETURN
;-------------------------------------------------------------------------------
; 6. MODUL CONTROL DE REBOTS
;-------------------------------------------------------------------------------     
ESPERA_16MS
    SETF    COMPTADOR1,0		    ;a freq = 40MHz, tenim un Tinst = 100ns,
    MOVLW   .208			    ;amb increments de 255 i 208 arribem a 16ms
    MOVWF   COMPTADOR2,0    
    GOTO INCREMENTA_XS

INCREMENTA_16MS
    DECFSZ  COMPTADOR1,1,0		    ;miro si COMPTADOR1 és 0
    GOTO    INCREMENTA_16MS		    ;si no és 0, segueixo comptant
    SETF    COMPTADOR1,0
    DECFSZ  COMPTADOR2,1,0		    ;miro si COMPTADOR2 és 0	
    GOTO    INCREMENTA_16MS		    ;si no és 0, segueixo comptant
    RETURN    

ESPERA_1MS
    SETF    COMPTADOR1,		    ;a freq = 40MHz, tenim un Tinst = 100ns,
    MOVLW   .13			    ;amb increments de 255 i 13 arribem a 1ms
    MOVWF   COMPTADOR2,0    
    GOTO INCREMENTA_XS
    
INCREMENTA_XS
    DECFSZ  COMPTADOR1,1,0		    ;miro si COMPTADOR1 és 0
    GOTO    INCREMENTA_XS		    ;si no és 0, segueixo comptant
    SETF    COMPTADOR1,0
    DECFSZ  COMPTADOR2,1,0		    ;miro si COMPTADOR2 és 0	
    GOTO    INCREMENTA_XS		    ;si no és 0, segueixo comptant
    RETURN      
;-------------------------------------------------------------------------------
; 7. POLLING PULSADORS
;
; 7.1. PULSADOR RIGHT   
;-------------------------------------------------------------------------------
    
CONTROL_RIGHT
    CALL    ESPERA_16MS
    BTFSS   PORTD,RD1,0	
    RETURN
    CALL    MOURE_RIGHT
ESPERA_POLSADOR_RD1
    BTFSC   PORTD,RD1,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RD1
    CALL    ESPERA_16MS
    BTFSC   PORTD,RD1,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RD1
    RETURN
    
;-------------------------------------------------------------------------------
; 7.2. PULSADOR DOWN
;-------------------------------------------------------------------------------      
CONTROL_DOWN
    CALL    ESPERA_16MS
    BTFSC   PORTB,RB5,0	
    RETURN
    CALL    MOURE_DOWN
ESPERA_POLSADOR_RB5
    BTFSS   PORTB,RB5,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RB5
    CALL    ESPERA_16MS
    RETURN  
;-------------------------------------------------------------------------------
; 7.3. PULSADOR ATACK
;-------------------------------------------------------------------------------      
CONTROL_ATACK
    CALL    ESPERA_16MS
    BTFSS   PORTD,RD3,0	
    RETURN
    CALL    ATACAR
ESPERA_POLSADOR_RB7
    BTFSC   PORTD,RD3,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RB7
    CALL    ESPERA_16MS
    RETURN   
    
;-------------------------------------------------------------------------------
; 7.4. PULSADOR LEFT
;-------------------------------------------------------------------------------      
CONTROL_LEFT
    CALL    ESPERA_16MS
    BTFSC   PORTB,RB4,0	
    RETURN
    CALL    MOURE_LEFT
ESPERA_POLSADOR_RB4
    BTFSS   PORTB,RB4,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RB4
    CALL    ESPERA_16MS
    RETURN   
;-------------------------------------------------------------------------------
; 7.5. PULSADOR UP
;-------------------------------------------------------------------------------      
CONTROL_UP
    CALL    ESPERA_16MS
    BTFSC   PORTB,RB3,0	
    RETURN
    CALL    MOURE_UP
ESPERA_POLSADOR_RB3
    BTFSS   PORTB,RB3,0			    ;Esperem a que es des premi el polsador.
    GOTO    ESPERA_POLSADOR_RB3
    CALL    ESPERA_16MS
    RETURN     
 
;-------------------------------------------------------------------------------
; 8. FINALITZACIO DEL JOC
;-------------------------------------------------------------------------------     
END_GAME
    CLRF COMPT_1S,0	    ;FAREM SONAR LES 5 NOTES DE L'ALTAVEU UN COP ACABEM
    MOVLW .4
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU	    ;1 NOTA
    CLRF COMPT_1S,0
    MOVLW .10
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU	    ;2 NOTA
    CLRF COMPT_1S,0
    MOVLW .30
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU	    ;3 NOTA
    CLRF COMPT_1S,0
    MOVLW .50
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU	    ;4 NOTA
    CLRF COMPT_1S,0
    MOVLW .80
    MOVWF   SOROLL_FREQ,0
    CALL SOROLL_ALTAVEU	    ;5 NOTA
END_BUCLE		    ;DEIXEM EL PROGRAMA EN AQUEST BUCLE FINS QUE ES
    CLRF COMPT_1S,0	    ;TORNI A APRETAR PCI
    GOTO END_BUCLE
    
;-------------------------------------------------------------------------------
; MAIN
;------------------------------------------------------------------------------- 
MAIN
    CALL    CONFIG_PORTS		    ;inicialitzar ports
    CALL    INIT_VARS			    ;inicialitzar perifèrics i variables
    CALL    CONFIG_INT
    
    ;CARREGAR JUGADOR 0
    MOVLW   .255		;AQUI ANIREM LLEGINT LES COORDENADES 
    MOVWF   VALUEESPERA,0	;DE LA FASE 1 I LES ANIREM GUARDANT A LA RAM
    CALL    ESPERA
    CALL    LECTURA_VALORS
    MOVLW   .255
    MOVWF   VALUEESPERA,0
    CALL    ESPERA
    CALL    LECTURA_VALORS 
    
    MOVLW   .255
    MOVWF   VALUEESPERA,0
    CALL    ESPERA
    
FASE1	
    BTFSS   PORTD,RD2,0	    ;ESPEREM EL SENYAL START GAME PER SABER SI 
    GOTO FASE1		    ;HEM DE SORTIR DEL BUCLE DE LA FASE 1 I 
    CALL INIT_CURSOR	    ;JA PODEM COMENÇAR A JUGAR
    CALL INIT_TIMER0
    BTG	 CURRENT_GRID,0,0
    CALL    LECTURA_VALORS 
    MOVLW   .255
    MOVWF   VALUEESPERA,0
    CALL	ESPERA
    
LOOP					    ;fem polling dels polsadors
    
    BTFSC   PORTD,RD1,0			    ;Esperem a que es premi el polsador.
    CALL    CONTROL_RIGHT
    BTFSS   PORTB,RB5,0			    ;Esperem a que es premi el polsador.
    CALL    CONTROL_DOWN
    BTFSC   PORTD,RD3,0			    ;Esperem a que es premi el polsador.
    CALL    CONTROL_ATACK
    BTFSS   PORTB,RB4,0			    ;Esperem a que es premi el polsador.
    CALL    CONTROL_LEFT
    BTFSS   PORTB,RB3,0			    ;Esperem a que es premi el polsador.
    CALL    CONTROL_UP
    GOTO LOOP    
    
    END
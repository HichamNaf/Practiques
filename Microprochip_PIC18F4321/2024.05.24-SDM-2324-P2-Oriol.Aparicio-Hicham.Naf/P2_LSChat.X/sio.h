#define FALS 0
#define CERT 1

void SIO_Init(void);
// Post: Configuraci� de la UART en mode ass�ncron, 9600 bauds, suposant fOsc=10MHz.

unsigned char SIO_RXAvail(void);
//Post: Retorna el nombre de car�cters disponibles a la cua de RX.

unsigned char SIO_GetChar(void);
// Pre: SIO_RXAvail() ha retornat CERT.
// Post: Fa lectura destructiva del car�cter rebut.

unsigned char SIO_TXAvail(void);
//Post: Retorna el nombre de car�cters disponibles a la cua de TX. 0 si no hi ha espai, i fins a MAX_TX si est� buida.

void SIO_PutChar (unsigned char Valor);
// Pre: SIO_TXAvail() ha retornat >> 0.
// Post: Posa un nou car�cter a enviament.
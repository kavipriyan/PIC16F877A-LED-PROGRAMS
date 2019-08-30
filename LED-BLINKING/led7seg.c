#include<htc.h>
__CONFIG(0X1F7A);

void delay();

int main()
{
	TRISD=0;
	TRISC0=0;
	TRISC1=0;
	while(1)
	{
		RC0=1;
		RC1=0;
		PORTD=0X60;
		delay();
		RC0=0;
		RC1=1;
		PORTD=0XB6;
		delay();
	}
}
void delay()
{
	for(int i=0; i<=20; i++);
}
#include<htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(FOSC_HS & WDTE_OFF & PWRTE_OFF & BOREN_ON & LVP_OFF);


void num(char*,int,int);
void delay();
void delay1();

int main()
{
	TRISD=0;
	TRISC0=0;
	TRISC1=0;
	TRISC2=0;
	TRISC3=0;
	int i,j,k,l,m;
	char a[] = {0XFC,0X60,0XDA,0XF2,0X66,0XB6,0XBE,0XE0,0XFE,0XE6};
	while(1)
	{
		for(i=0; i<10;i++)
			for(j=0; j<10; j++)
				for(k=0; k<=10; k++)
					for(l=0; l<10; l++)
						for(m=0; m<10; m++)
						{
							RC0=1;
							RC1=0;
							RC2=0;
							RC3=0;
							PORTD=a[l];
							delay();
							RC0=0;
							RC1=1;
							RC2=0;
							RC3=0;
							PORTD=a[k];
							delay();
							RC0=0;
							RC1=0;
							RC2=1;
							RC3=0;	
							PORTD=a[j];
							delay();
							RC0=0;
							RC1=0;
							RC2=0;
							RC3=1;
							PORTD=a[i];
							delay();
				}
	}
}
void delay()
{
	for(int j=-500; j<500; j++);
}
void delay1()
{
	for(int j=-30000; j<30000; j++);
}
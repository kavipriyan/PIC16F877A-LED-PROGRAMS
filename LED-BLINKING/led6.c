#include<htc.h>
int main()
{
	TRISB = 0;
	char a[] = {0X08,0X04,0X02,0X01,0X80,0X40,0X20,0X10};
	int i,j,nu;
	while(1)
	{
		nu=0X00;
		PORTB = 0X00;
		for(j=-30000; j<=30000; j++);
		for(i=0; i<4; i++)
		{
			nu=nu+(a[i]+a[8-(i+1)]);
			PORTB = nu;
			for(j=-30000; j<=30000; j++);
		}
		PORTB=0;
		for(j=-30000; j<=30000; j++);
	}	
}

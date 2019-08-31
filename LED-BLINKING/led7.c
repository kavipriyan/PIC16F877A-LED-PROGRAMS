/************************************************/
/*  AUTHOR          :	Kavipriyan K P		*/
/*  DATE            :	31-08-2019		*/
/*  FILE NAME       :	LED.C			*/
/*  DESCRIPTION     :	Led  programs		*/
/************************************************/

#include<htc.h>
int main()
{
	TRISB = 0;
	char a[] = {0X01,0X02,0X04,0X08,0X10,0X20,0X40,0X80};
	int i,j;
	while(1)
	{
		for(i=0; i<8; i++)
		{
			PORTB = a[i];
			for(j=-30000; j<=30000; j++);
		}
		PORTB=0;
		for(j=-30000; j<=30000; j++);
	}	
}

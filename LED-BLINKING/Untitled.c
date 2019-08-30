#include<htc.h>
int main()
{
	int i,j,num=0X00;
	TRISB = 0;
	char a[] = {0X01,0X02,0X04,0X08,0X10,0X20,0X40,0X80};
	while(1)
	{
		num=0X00;
		for(i=0; i<8; i++)
		{
			num=a[i]+num;
			PORTB=num;
				for(j=-30000; j<=30000; j++);
		}
	}
}
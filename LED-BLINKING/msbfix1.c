/************************************************/
/*  AUTHOR          :	Kavipriyan K P		*/
/*  DATE            :	31-08-2019		*/
/*  FILE NAME       :	msbfix1.c		*/
/*  DESCRIPTION     :	Led  programs		*/
/************************************************/


#include<htc.h>
int main()
{
	int i,j,num=0X00;
	TRISB = 0;
	char a[] = {0X80,0X40,0X20,0X10,0X08,0X04,0X02,0X01};
	for(i=0; i<8; i++)
	{
		num=num+a[i];
		PORTB=num;
		for(j=-30000; j<=30000; j++);
	}
	PORTB=0;
	while(1);
}
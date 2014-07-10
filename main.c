#include <stdio.h>
#include "calcula_total_vendas.h"
#include "valor_vendas.h"

int main (void)
{
	int* apt = NULL; 
	apt = (int* )malloc(5* sizeof (int));
 
	if(apt == NULL)
	{
		printf("vector nulo\n");
		return -5;	//se o vector não for correctamente definido retorna como erro
	}



	apt[0]=0x000A0501;
	apt[1]=0x00051002;
	apt[2]=0x000F1003;
	apt[3]=0x00040804;
	apt[4]=0x00020205;

	calcula_total_vendas(apt);

	int i;
	for(i=0;i<5;i++)
	{
		printf("valor %d : %x \n",i,apt[i]);
	}

	return 0;
}

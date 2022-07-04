#include <stdio.h>
#include <stdlib.h>
#include "header.h"

int main(int argc, char *argv[])
{
	int i;
	int sum = 0;
	int value;
	if(argc >= 3)
	{
		for(i = 1; i < argc; i++)
		{
			value = atoi(argv[i]);
			sum = add(sum,value);	
		}
		printf("test2-sum : %d\n",sum);
	}
	else
	{
		printf("command line syntax error(pattern: add n1 n2 ...)\n");
	}
	return 0;

}

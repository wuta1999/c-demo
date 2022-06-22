#include <stdio.h>

int main()  
{
	char filename[20];
	printf("create file name : \n");
	scanf("%s",filename);
	if(fopen(filename,"w+") == NULL)
	{
		puts("fail to create.");
		return 0;
	}
	puts("create success.");
	return 0;
}

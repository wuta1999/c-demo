#include <stdio.h>

int main() 
{
	char filename[20];
	char ch;
	FILE *fp;
	printf("create file : \n");
	scanf("%s",filename);
	fp = fopen(filename,"w+");
	if(fp == NULL)
	{
		puts("fail to create.");
		return 0;
	}
	printf("please input some message(type '#' exit) : \n");
	ch = getchar();
	while(ch != '#') 
	{
		fputc(ch,fp);
		ch = getchar();
	}
	fclose(fp);
	return 0;
}

#include <stdio.h>
#include <fcntl.h>

int main(int argc, char *argv[])  
{
	int i;
	if(argc >= 2) 
	{
		for(i = 1; i< argc; i++)
		{
			if(open(argv[i],O_CREAT | O_EXCL,10705) == -1){
				printf("file: %s already created\n",argv[i]);
			}
			else
				printf("create file: %s\n",argv[i]);
		}
	}
	else
		printf("please input filename.\n");
	return 0;
}

#include <stdio.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[])  
{
	int fd;
	if(argc >= 3) 
	{
		fd=open(argv[1],O_CREAT | O_EXCL| O_RDWR | O_TRUNC,10705);
		if(fd == -1)
			printf("file: %s already created\n",argv[1]);
		else
		{
			printf("create file: %s\n",argv[1]);
			if(write(fd,argv[2],strlen(argv[2])) != strlen(argv[2]))
			{
				printf("write error\n");

			}
			close(fd);
			
		}
		
	}
	else
		printf("please input filename and some content.\n");
	return 0;
}

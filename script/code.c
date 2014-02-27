#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>



int main()
{

	int fd = open("file.txt", O_WRONLY|O_CREAT);
	printf("output %d",fd);

	return 0;
}

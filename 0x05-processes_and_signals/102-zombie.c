#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

/**
 * infinite_while - loop forever
 * Return: Alaways 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - run code that creates 5 zombie processes
 * Return: 0 if success
 */
int main(void)
{
	int i = 0;
	pid_t pid;

	for ( ; i < 5; i++)
	{
		pid = fork();
		if (pid < 0)
		{
			printf("fork error\n");
			exit(EXIT_FAILURE);
		}
		if (pid > 0)
			printf("Zombie process created, PID: %d\n", (int)pid);
		else
			exit(EXIT_SUCCESS);

	}
	infinite_while();
	return (0);
}

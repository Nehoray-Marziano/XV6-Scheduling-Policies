#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"

int main(int argc, char *argv[])
{
    int pid;
    int status;
    status = -1;
    pid = fork();
    if (pid != 0){
        wait(&status);
        printf(1, "process %d exited with status %d\n", pid, status);
        exit(0);
    }
    else {
        exit(3);
    }
}


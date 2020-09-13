#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"


int main(int argsc, char * argv[]) {
    char *c=argv[1];
    int i=atoi(c);
    policy(i);
    exit(0);
}
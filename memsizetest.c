#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"
int
main(int argc, char *argv[]){
    printf(1,"The process is using: %dB\n", memsize());
    double* i= malloc((sizeof(double))*2560);
    printf(1,"Allocating more memory\n");
    printf(1,"The process is using: %dB\n",memsize());
    free(i);
    printf(1,"Freeing memory\n");
    printf(1,"The process is using: %dB\n", memsize());
    exit(0);
    
}

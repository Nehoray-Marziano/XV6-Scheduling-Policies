#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"

int fib(int num){
    if(num==0)
        return 0;
    if(num==1)
        return 1;
    return fib(num-1)+fib(num-2);
}

int
main(int argc, char *argv[])
{
    printf(1, "PID\tPS_PRIORITY\tSTIME\tRETIME\tRTIME\n");
    if(fork()==0){
        set_ps_priority(5);
        set_cfs_priority(2);
        fib(20);
        struct perf perf;
        proc_info(&perf);
        printf(1, "%d\t%d\t\t%d\t%d\t%d\n", getpid(), perf.ps_priority,perf.stime,perf.retime,perf.rtime);
        exit(0);
    }
    if(fork()==0){
        set_ps_priority(10);
        set_cfs_priority(3);
        fib(20);
        struct perf perf;
        proc_info(&perf);
        printf(1, "%d\t%d\t\t%d\t%d\t%d\n", getpid(), perf.ps_priority,perf.stime,perf.retime,perf.rtime);
        exit(0);
    }
    if(fork()==0){
        set_ps_priority(1);
        set_cfs_priority(1);
        fib(20);
        struct perf perf;
        proc_info(&perf);
        printf(1, "%d\t%d\t\t%d\t%d\t%d\n", getpid(), perf.ps_priority,perf.stime,perf.retime,perf.rtime);
        exit(0);
    }
    wait(null);
    wait(null);
    wait(null);
    struct perf perf;
    proc_info(&perf);
    printf(1, "%d\t%d\t\t%d\t%d\t%d\n", getpid(), perf.ps_priority,perf.stime,perf.retime,perf.rtime);
    exit(0);
}




/*int
main(int argc, char *argv[])
{
    int pid1, pid2, pid3;
    int tickstart = uptime();
    printf(1, "PID\tPS_PRIORITY\tSTIME\tRETIME\tRTIME\n");
    pid1 = fork();
    int tikstart3 = uptime();
    if (pid1 != 0){
        pid2 = fork();
        int tikstart2 = uptime();
        if (pid2 != 0){
            pid3 = fork();
            int tikstart1 = uptime();
            if (pid3 != 0){
                wait(null);
                wait(null);
                wait(null);
                int tik = uptime() - tickstart;
                printf(1, "TICKS: %d\n", tik);
                exit(0);
            }
            else{
                
                set_cfs_priority(1);
                set_ps_priority(1);
                int i1 = 1000000;
                int dummy1 = 0;
                while(i1--)
                    dummy1 += i1;
                sleep(20);
                struct perf info1;
                int mypid1 = getpid();
                proc_info(&info1);
                int tickend1 = uptime();
                sleep(100);
                printf(1, "%d\t%d\t\t%d\t%d\t%d\t%d\n", mypid1, info1.ps_priority, info1.stime, info1.retime, info1.rtime, (tickend1 - tikstart1));
                exit(0);
            }
        }
        else{
            
            set_cfs_priority(2);
            set_ps_priority(5);
            int i2 = 1000000;
                int dummy2 = 0;
                while(i2--)
                    dummy2 += i2;
                struct perf info2;
                int mypid2 = getpid();
                proc_info(&info2);
                int tickend2 = uptime();
                sleep(200);
                printf(1, "%d\t%d\t\t%d\t%d\t%d\t%d\n", mypid2, info2.ps_priority, info2.stime, info2.retime, info2.rtime, (tickend2 - tikstart2));
                exit(0);
        }
    }
    else {
        
        set_cfs_priority(3);
        set_ps_priority(10);
        int i3 = 1000000;
                int dummy3 = 0;
                while(i3--)
                    dummy3 += i3;
                struct perf info3;
                int mypid3 = getpid();
                proc_info(&info3);
                int tickend3 = uptime();
                sleep(300);
                printf(1, "%d\t%d\t\t%d\t%d\t%d\t%d\n", mypid3, info3.ps_priority, info3.stime, info3.retime, info3.rtime, (tickend3 - tikstart3));
                exit(0);
    }
}*/

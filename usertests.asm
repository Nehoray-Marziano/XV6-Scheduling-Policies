
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 26 53 00 00       	push   $0x5326
      16:	6a 01                	push   $0x1
      18:	e8 c3 3f 00 00       	call   3fe0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 3a 53 00 00       	push   $0x533a
      26:	e8 87 3e 00 00       	call   3eb2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 1a                	js     4c <main+0x4c>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 a4 5a 00 00       	push   $0x5aa4
      39:	6a 01                	push   $0x1
      3b:	e8 a0 3f 00 00       	call   3fe0 <printf>
    exit(0);
      40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      47:	e8 26 3e 00 00       	call   3e72 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      4c:	50                   	push   %eax
      4d:	50                   	push   %eax
      4e:	68 00 02 00 00       	push   $0x200
      53:	68 3a 53 00 00       	push   $0x533a
      58:	e8 55 3e 00 00       	call   3eb2 <open>
      5d:	89 04 24             	mov    %eax,(%esp)
      60:	e8 35 3e 00 00       	call   3e9a <close>

  argptest();
      65:	e8 26 3b 00 00       	call   3b90 <argptest>
  createdelete();
      6a:	e8 81 13 00 00       	call   13f0 <createdelete>
  linkunlink();
      6f:	e8 2c 1d 00 00       	call   1da0 <linkunlink>
  concreate();
      74:	e8 e7 19 00 00       	call   1a60 <concreate>
  fourfiles();
      79:	e8 32 11 00 00       	call   11b0 <fourfiles>
  sharedfd();
      7e:	e8 4d 0f 00 00       	call   fd0 <sharedfd>

  bigargtest();
      83:	e8 88 37 00 00       	call   3810 <bigargtest>
  bigwrite();
      88:	e8 53 27 00 00       	call   27e0 <bigwrite>
  bigargtest();
      8d:	e8 7e 37 00 00       	call   3810 <bigargtest>
  bsstest();
      92:	e8 f9 36 00 00       	call   3790 <bsstest>
  sbrktest();
      97:	e8 94 31 00 00       	call   3230 <sbrktest>
  validatetest();
      9c:	e8 2f 36 00 00       	call   36d0 <validatetest>

  opentest();
      a1:	e8 ea 03 00 00       	call   490 <opentest>
  writetest();
      a6:	e8 85 04 00 00       	call   530 <writetest>
  writetest1();
      ab:	e8 90 06 00 00       	call   740 <writetest1>
  createtest();
      b0:	e8 8b 08 00 00       	call   940 <createtest>

  openiputtest();
      b5:	e8 a6 02 00 00       	call   360 <openiputtest>
  exitiputtest();
      ba:	e8 71 01 00 00       	call   230 <exitiputtest>
  iputtest();
      bf:	e8 6c 00 00 00       	call   130 <iputtest>

  mem();
      c4:	e8 27 0e 00 00       	call   ef0 <mem>
  pipe1();
      c9:	e8 72 0a 00 00       	call   b40 <pipe1>
  preempt();
      ce:	e8 2d 0c 00 00       	call   d00 <preempt>
  exitwait(null);
      d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      da:	e8 71 0d 00 00       	call   e50 <exitwait>

  rmdot();
      df:	e8 4c 2b 00 00       	call   2c30 <rmdot>
  fourteen();
      e4:	e8 e7 29 00 00       	call   2ad0 <fourteen>
  bigfile();
      e9:	e8 e2 27 00 00       	call   28d0 <bigfile>
  subdir();
      ee:	e8 0d 1f 00 00       	call   2000 <subdir>
  linktest();
      f3:	e8 18 17 00 00       	call   1810 <linktest>
  unlinkread();
      f8:	e8 53 15 00 00       	call   1650 <unlinkread>
  dirfile();
      fd:	e8 de 2c 00 00       	call   2de0 <dirfile>
  iref();
     102:	e8 19 2f 00 00       	call   3020 <iref>
  forktest();
     107:	e8 44 30 00 00       	call   3150 <forktest>
  bigdir(); // slow
     10c:	e8 9f 1d 00 00       	call   1eb0 <bigdir>

  uio();
     111:	e8 ea 39 00 00       	call   3b00 <uio>

  exectest();
     116:	e8 d5 09 00 00       	call   af0 <exectest>

  exit(0);
     11b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     122:	e8 4b 3d 00 00       	call   3e72 <exit>
     127:	66 90                	xchg   %ax,%ax
     129:	66 90                	xchg   %ax,%ax
     12b:	66 90                	xchg   %ax,%ax
     12d:	66 90                	xchg   %ax,%ax
     12f:	90                   	nop

00000130 <iputtest>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     136:	68 cc 43 00 00       	push   $0x43cc
     13b:	ff 35 e8 63 00 00    	pushl  0x63e8
     141:	e8 9a 3e 00 00       	call   3fe0 <printf>
  if(mkdir("iputdir") < 0){
     146:	c7 04 24 5f 43 00 00 	movl   $0x435f,(%esp)
     14d:	e8 88 3d 00 00       	call   3eda <mkdir>
     152:	83 c4 10             	add    $0x10,%esp
     155:	85 c0                	test   %eax,%eax
     157:	78 58                	js     1b1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	68 5f 43 00 00       	push   $0x435f
     161:	e8 7c 3d 00 00       	call   3ee2 <chdir>
     166:	83 c4 10             	add    $0x10,%esp
     169:	85 c0                	test   %eax,%eax
     16b:	0f 88 9a 00 00 00    	js     20b <iputtest+0xdb>
  if(unlink("../iputdir") < 0){
     171:	83 ec 0c             	sub    $0xc,%esp
     174:	68 5c 43 00 00       	push   $0x435c
     179:	e8 44 3d 00 00       	call   3ec2 <unlink>
     17e:	83 c4 10             	add    $0x10,%esp
     181:	85 c0                	test   %eax,%eax
     183:	78 68                	js     1ed <iputtest+0xbd>
  if(chdir("/") < 0){
     185:	83 ec 0c             	sub    $0xc,%esp
     188:	68 81 43 00 00       	push   $0x4381
     18d:	e8 50 3d 00 00       	call   3ee2 <chdir>
     192:	83 c4 10             	add    $0x10,%esp
     195:	85 c0                	test   %eax,%eax
     197:	78 36                	js     1cf <iputtest+0x9f>
  printf(stdout, "iput test ok\n");
     199:	83 ec 08             	sub    $0x8,%esp
     19c:	68 04 44 00 00       	push   $0x4404
     1a1:	ff 35 e8 63 00 00    	pushl  0x63e8
     1a7:	e8 34 3e 00 00       	call   3fe0 <printf>
}
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	c9                   	leave  
     1b0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1b1:	50                   	push   %eax
     1b2:	50                   	push   %eax
     1b3:	68 38 43 00 00       	push   $0x4338
     1b8:	ff 35 e8 63 00 00    	pushl  0x63e8
     1be:	e8 1d 3e 00 00       	call   3fe0 <printf>
    exit(0);
     1c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ca:	e8 a3 3c 00 00       	call   3e72 <exit>
    printf(stdout, "chdir / failed\n");
     1cf:	50                   	push   %eax
     1d0:	50                   	push   %eax
     1d1:	68 83 43 00 00       	push   $0x4383
     1d6:	ff 35 e8 63 00 00    	pushl  0x63e8
     1dc:	e8 ff 3d 00 00       	call   3fe0 <printf>
    exit(0);
     1e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1e8:	e8 85 3c 00 00       	call   3e72 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1ed:	52                   	push   %edx
     1ee:	52                   	push   %edx
     1ef:	68 67 43 00 00       	push   $0x4367
     1f4:	ff 35 e8 63 00 00    	pushl  0x63e8
     1fa:	e8 e1 3d 00 00       	call   3fe0 <printf>
    exit(0);
     1ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     206:	e8 67 3c 00 00       	call   3e72 <exit>
    printf(stdout, "chdir iputdir failed\n");
     20b:	51                   	push   %ecx
     20c:	51                   	push   %ecx
     20d:	68 46 43 00 00       	push   $0x4346
     212:	ff 35 e8 63 00 00    	pushl  0x63e8
     218:	e8 c3 3d 00 00       	call   3fe0 <printf>
    exit(0);
     21d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     224:	e8 49 3c 00 00       	call   3e72 <exit>
     229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <exitiputtest>:
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     236:	68 93 43 00 00       	push   $0x4393
     23b:	ff 35 e8 63 00 00    	pushl  0x63e8
     241:	e8 9a 3d 00 00       	call   3fe0 <printf>
  pid = fork();
     246:	e8 1f 3c 00 00       	call   3e6a <fork>
  if(pid < 0){
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	0f 88 a1 00 00 00    	js     2f7 <exitiputtest+0xc7>
  if(pid == 0){
     256:	75 58                	jne    2b0 <exitiputtest+0x80>
    if(mkdir("iputdir") < 0){
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 5f 43 00 00       	push   $0x435f
     260:	e8 75 3c 00 00       	call   3eda <mkdir>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	0f 88 c3 00 00 00    	js     333 <exitiputtest+0x103>
    if(chdir("iputdir") < 0){
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	68 5f 43 00 00       	push   $0x435f
     278:	e8 65 3c 00 00       	call   3ee2 <chdir>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	0f 88 8d 00 00 00    	js     315 <exitiputtest+0xe5>
    if(unlink("../iputdir") < 0){
     288:	83 ec 0c             	sub    $0xc,%esp
     28b:	68 5c 43 00 00       	push   $0x435c
     290:	e8 2d 3c 00 00       	call   3ec2 <unlink>
     295:	83 c4 10             	add    $0x10,%esp
     298:	85 c0                	test   %eax,%eax
     29a:	78 3c                	js     2d8 <exitiputtest+0xa8>
    exit(0);
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	6a 00                	push   $0x0
     2a1:	e8 cc 3b 00 00       	call   3e72 <exit>
     2a6:	8d 76 00             	lea    0x0(%esi),%esi
     2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  wait(null);
     2b0:	83 ec 0c             	sub    $0xc,%esp
     2b3:	6a 00                	push   $0x0
     2b5:	e8 c0 3b 00 00       	call   3e7a <wait>
  printf(stdout, "exitiput test ok\n");
     2ba:	58                   	pop    %eax
     2bb:	5a                   	pop    %edx
     2bc:	68 b6 43 00 00       	push   $0x43b6
     2c1:	ff 35 e8 63 00 00    	pushl  0x63e8
     2c7:	e8 14 3d 00 00       	call   3fe0 <printf>
}
     2cc:	83 c4 10             	add    $0x10,%esp
     2cf:	c9                   	leave  
     2d0:	c3                   	ret    
     2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     2d8:	83 ec 08             	sub    $0x8,%esp
     2db:	68 67 43 00 00       	push   $0x4367
     2e0:	ff 35 e8 63 00 00    	pushl  0x63e8
     2e6:	e8 f5 3c 00 00       	call   3fe0 <printf>
      exit(0);
     2eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2f2:	e8 7b 3b 00 00       	call   3e72 <exit>
    printf(stdout, "fork failed\n");
     2f7:	50                   	push   %eax
     2f8:	50                   	push   %eax
     2f9:	68 79 52 00 00       	push   $0x5279
     2fe:	ff 35 e8 63 00 00    	pushl  0x63e8
     304:	e8 d7 3c 00 00       	call   3fe0 <printf>
    exit(0);
     309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     310:	e8 5d 3b 00 00       	call   3e72 <exit>
      printf(stdout, "child chdir failed\n");
     315:	51                   	push   %ecx
     316:	51                   	push   %ecx
     317:	68 a2 43 00 00       	push   $0x43a2
     31c:	ff 35 e8 63 00 00    	pushl  0x63e8
     322:	e8 b9 3c 00 00       	call   3fe0 <printf>
      exit(0);
     327:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     32e:	e8 3f 3b 00 00       	call   3e72 <exit>
      printf(stdout, "mkdir failed\n");
     333:	50                   	push   %eax
     334:	50                   	push   %eax
     335:	68 38 43 00 00       	push   $0x4338
     33a:	ff 35 e8 63 00 00    	pushl  0x63e8
     340:	e8 9b 3c 00 00       	call   3fe0 <printf>
      exit(0);
     345:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     34c:	e8 21 3b 00 00       	call   3e72 <exit>
     351:	eb 0d                	jmp    360 <openiputtest>
     353:	90                   	nop
     354:	90                   	nop
     355:	90                   	nop
     356:	90                   	nop
     357:	90                   	nop
     358:	90                   	nop
     359:	90                   	nop
     35a:	90                   	nop
     35b:	90                   	nop
     35c:	90                   	nop
     35d:	90                   	nop
     35e:	90                   	nop
     35f:	90                   	nop

00000360 <openiputtest>:
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     366:	68 c8 43 00 00       	push   $0x43c8
     36b:	ff 35 e8 63 00 00    	pushl  0x63e8
     371:	e8 6a 3c 00 00       	call   3fe0 <printf>
  if(mkdir("oidir") < 0){
     376:	c7 04 24 d7 43 00 00 	movl   $0x43d7,(%esp)
     37d:	e8 58 3b 00 00       	call   3eda <mkdir>
     382:	83 c4 10             	add    $0x10,%esp
     385:	85 c0                	test   %eax,%eax
     387:	0f 88 9d 00 00 00    	js     42a <openiputtest+0xca>
  pid = fork();
     38d:	e8 d8 3a 00 00       	call   3e6a <fork>
  if(pid < 0){
     392:	85 c0                	test   %eax,%eax
     394:	0f 88 ae 00 00 00    	js     448 <openiputtest+0xe8>
  if(pid == 0){
     39a:	75 3c                	jne    3d8 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     39c:	83 ec 08             	sub    $0x8,%esp
     39f:	6a 02                	push   $0x2
     3a1:	68 d7 43 00 00       	push   $0x43d7
     3a6:	e8 07 3b 00 00       	call   3eb2 <open>
    if(fd >= 0){
     3ab:	83 c4 10             	add    $0x10,%esp
     3ae:	85 c0                	test   %eax,%eax
     3b0:	78 6e                	js     420 <openiputtest+0xc0>
      printf(stdout, "open directory for write succeeded\n");
     3b2:	83 ec 08             	sub    $0x8,%esp
     3b5:	68 5c 53 00 00       	push   $0x535c
     3ba:	ff 35 e8 63 00 00    	pushl  0x63e8
     3c0:	e8 1b 3c 00 00       	call   3fe0 <printf>
      exit(0);
     3c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3cc:	e8 a1 3a 00 00       	call   3e72 <exit>
     3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  sleep(1);
     3d8:	83 ec 0c             	sub    $0xc,%esp
     3db:	6a 01                	push   $0x1
     3dd:	e8 20 3b 00 00       	call   3f02 <sleep>
  if(unlink("oidir") != 0){
     3e2:	c7 04 24 d7 43 00 00 	movl   $0x43d7,(%esp)
     3e9:	e8 d4 3a 00 00       	call   3ec2 <unlink>
     3ee:	83 c4 10             	add    $0x10,%esp
     3f1:	85 c0                	test   %eax,%eax
     3f3:	75 71                	jne    466 <openiputtest+0x106>
  wait(null);
     3f5:	83 ec 0c             	sub    $0xc,%esp
     3f8:	6a 00                	push   $0x0
     3fa:	e8 7b 3a 00 00       	call   3e7a <wait>
  printf(stdout, "openiput test ok\n");
     3ff:	58                   	pop    %eax
     400:	5a                   	pop    %edx
     401:	68 00 44 00 00       	push   $0x4400
     406:	ff 35 e8 63 00 00    	pushl  0x63e8
     40c:	e8 cf 3b 00 00       	call   3fe0 <printf>
}
     411:	83 c4 10             	add    $0x10,%esp
     414:	c9                   	leave  
     415:	c3                   	ret    
     416:	8d 76 00             	lea    0x0(%esi),%esi
     419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    exit(0);
     420:	83 ec 0c             	sub    $0xc,%esp
     423:	6a 00                	push   $0x0
     425:	e8 48 3a 00 00       	call   3e72 <exit>
    printf(stdout, "mkdir oidir failed\n");
     42a:	50                   	push   %eax
     42b:	50                   	push   %eax
     42c:	68 dd 43 00 00       	push   $0x43dd
     431:	ff 35 e8 63 00 00    	pushl  0x63e8
     437:	e8 a4 3b 00 00       	call   3fe0 <printf>
    exit(0);
     43c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     443:	e8 2a 3a 00 00       	call   3e72 <exit>
    printf(stdout, "fork failed\n");
     448:	50                   	push   %eax
     449:	50                   	push   %eax
     44a:	68 79 52 00 00       	push   $0x5279
     44f:	ff 35 e8 63 00 00    	pushl  0x63e8
     455:	e8 86 3b 00 00       	call   3fe0 <printf>
    exit(0);
     45a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     461:	e8 0c 3a 00 00       	call   3e72 <exit>
    printf(stdout, "unlink failed\n");
     466:	51                   	push   %ecx
     467:	51                   	push   %ecx
     468:	68 f1 43 00 00       	push   $0x43f1
     46d:	ff 35 e8 63 00 00    	pushl  0x63e8
     473:	e8 68 3b 00 00       	call   3fe0 <printf>
    exit(0);
     478:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     47f:	e8 ee 39 00 00       	call   3e72 <exit>
     484:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     48a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000490 <opentest>:
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     496:	68 12 44 00 00       	push   $0x4412
     49b:	ff 35 e8 63 00 00    	pushl  0x63e8
     4a1:	e8 3a 3b 00 00       	call   3fe0 <printf>
  fd = open("echo", 0);
     4a6:	58                   	pop    %eax
     4a7:	5a                   	pop    %edx
     4a8:	6a 00                	push   $0x0
     4aa:	68 1d 44 00 00       	push   $0x441d
     4af:	e8 fe 39 00 00       	call   3eb2 <open>
  if(fd < 0){
     4b4:	83 c4 10             	add    $0x10,%esp
     4b7:	85 c0                	test   %eax,%eax
     4b9:	78 36                	js     4f1 <opentest+0x61>
  close(fd);
     4bb:	83 ec 0c             	sub    $0xc,%esp
     4be:	50                   	push   %eax
     4bf:	e8 d6 39 00 00       	call   3e9a <close>
  fd = open("doesnotexist", 0);
     4c4:	5a                   	pop    %edx
     4c5:	59                   	pop    %ecx
     4c6:	6a 00                	push   $0x0
     4c8:	68 35 44 00 00       	push   $0x4435
     4cd:	e8 e0 39 00 00       	call   3eb2 <open>
  if(fd >= 0){
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	85 c0                	test   %eax,%eax
     4d7:	79 36                	jns    50f <opentest+0x7f>
  printf(stdout, "open test ok\n");
     4d9:	83 ec 08             	sub    $0x8,%esp
     4dc:	68 60 44 00 00       	push   $0x4460
     4e1:	ff 35 e8 63 00 00    	pushl  0x63e8
     4e7:	e8 f4 3a 00 00       	call   3fe0 <printf>
}
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	c9                   	leave  
     4f0:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     4f1:	50                   	push   %eax
     4f2:	50                   	push   %eax
     4f3:	68 22 44 00 00       	push   $0x4422
     4f8:	ff 35 e8 63 00 00    	pushl  0x63e8
     4fe:	e8 dd 3a 00 00       	call   3fe0 <printf>
    exit(0);
     503:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     50a:	e8 63 39 00 00       	call   3e72 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     50f:	50                   	push   %eax
     510:	50                   	push   %eax
     511:	68 42 44 00 00       	push   $0x4442
     516:	ff 35 e8 63 00 00    	pushl  0x63e8
     51c:	e8 bf 3a 00 00       	call   3fe0 <printf>
    exit(0);
     521:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     528:	e8 45 39 00 00       	call   3e72 <exit>
     52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <writetest>:
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	56                   	push   %esi
     534:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     535:	83 ec 08             	sub    $0x8,%esp
     538:	68 6e 44 00 00       	push   $0x446e
     53d:	ff 35 e8 63 00 00    	pushl  0x63e8
     543:	e8 98 3a 00 00       	call   3fe0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     548:	58                   	pop    %eax
     549:	5a                   	pop    %edx
     54a:	68 02 02 00 00       	push   $0x202
     54f:	68 7f 44 00 00       	push   $0x447f
     554:	e8 59 39 00 00       	call   3eb2 <open>
  if(fd >= 0){
     559:	83 c4 10             	add    $0x10,%esp
     55c:	85 c0                	test   %eax,%eax
     55e:	0f 88 af 01 00 00    	js     713 <writetest+0x1e3>
    printf(stdout, "creat small succeeded; ok\n");
     564:	83 ec 08             	sub    $0x8,%esp
     567:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     569:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     56b:	68 85 44 00 00       	push   $0x4485
     570:	ff 35 e8 63 00 00    	pushl  0x63e8
     576:	e8 65 3a 00 00       	call   3fe0 <printf>
     57b:	83 c4 10             	add    $0x10,%esp
     57e:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     580:	83 ec 04             	sub    $0x4,%esp
     583:	6a 0a                	push   $0xa
     585:	68 bc 44 00 00       	push   $0x44bc
     58a:	56                   	push   %esi
     58b:	e8 02 39 00 00       	call   3e92 <write>
     590:	83 c4 10             	add    $0x10,%esp
     593:	83 f8 0a             	cmp    $0xa,%eax
     596:	0f 85 dd 00 00 00    	jne    679 <writetest+0x149>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     59c:	83 ec 04             	sub    $0x4,%esp
     59f:	6a 0a                	push   $0xa
     5a1:	68 c7 44 00 00       	push   $0x44c7
     5a6:	56                   	push   %esi
     5a7:	e8 e6 38 00 00       	call   3e92 <write>
     5ac:	83 c4 10             	add    $0x10,%esp
     5af:	83 f8 0a             	cmp    $0xa,%eax
     5b2:	0f 85 e1 00 00 00    	jne    699 <writetest+0x169>
  for(i = 0; i < 100; i++){
     5b8:	83 c3 01             	add    $0x1,%ebx
     5bb:	83 fb 64             	cmp    $0x64,%ebx
     5be:	75 c0                	jne    580 <writetest+0x50>
  printf(stdout, "writes ok\n");
     5c0:	83 ec 08             	sub    $0x8,%esp
     5c3:	68 d2 44 00 00       	push   $0x44d2
     5c8:	ff 35 e8 63 00 00    	pushl  0x63e8
     5ce:	e8 0d 3a 00 00       	call   3fe0 <printf>
  close(fd);
     5d3:	89 34 24             	mov    %esi,(%esp)
     5d6:	e8 bf 38 00 00       	call   3e9a <close>
  fd = open("small", O_RDONLY);
     5db:	5b                   	pop    %ebx
     5dc:	5e                   	pop    %esi
     5dd:	6a 00                	push   $0x0
     5df:	68 7f 44 00 00       	push   $0x447f
     5e4:	e8 c9 38 00 00       	call   3eb2 <open>
  if(fd >= 0){
     5e9:	83 c4 10             	add    $0x10,%esp
     5ec:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     5ee:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     5f0:	0f 88 c3 00 00 00    	js     6b9 <writetest+0x189>
    printf(stdout, "open small succeeded ok\n");
     5f6:	83 ec 08             	sub    $0x8,%esp
     5f9:	68 dd 44 00 00       	push   $0x44dd
     5fe:	ff 35 e8 63 00 00    	pushl  0x63e8
     604:	e8 d7 39 00 00       	call   3fe0 <printf>
  i = read(fd, buf, 2000);
     609:	83 c4 0c             	add    $0xc,%esp
     60c:	68 d0 07 00 00       	push   $0x7d0
     611:	68 c0 8b 00 00       	push   $0x8bc0
     616:	53                   	push   %ebx
     617:	e8 6e 38 00 00       	call   3e8a <read>
  if(i == 2000){
     61c:	83 c4 10             	add    $0x10,%esp
     61f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     624:	0f 85 ad 00 00 00    	jne    6d7 <writetest+0x1a7>
    printf(stdout, "read succeeded ok\n");
     62a:	83 ec 08             	sub    $0x8,%esp
     62d:	68 11 45 00 00       	push   $0x4511
     632:	ff 35 e8 63 00 00    	pushl  0x63e8
     638:	e8 a3 39 00 00       	call   3fe0 <printf>
  close(fd);
     63d:	89 1c 24             	mov    %ebx,(%esp)
     640:	e8 55 38 00 00       	call   3e9a <close>
  if(unlink("small") < 0){
     645:	c7 04 24 7f 44 00 00 	movl   $0x447f,(%esp)
     64c:	e8 71 38 00 00       	call   3ec2 <unlink>
     651:	83 c4 10             	add    $0x10,%esp
     654:	85 c0                	test   %eax,%eax
     656:	0f 88 99 00 00 00    	js     6f5 <writetest+0x1c5>
  printf(stdout, "small file test ok\n");
     65c:	83 ec 08             	sub    $0x8,%esp
     65f:	68 39 45 00 00       	push   $0x4539
     664:	ff 35 e8 63 00 00    	pushl  0x63e8
     66a:	e8 71 39 00 00       	call   3fe0 <printf>
}
     66f:	83 c4 10             	add    $0x10,%esp
     672:	8d 65 f8             	lea    -0x8(%ebp),%esp
     675:	5b                   	pop    %ebx
     676:	5e                   	pop    %esi
     677:	5d                   	pop    %ebp
     678:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     679:	83 ec 04             	sub    $0x4,%esp
     67c:	53                   	push   %ebx
     67d:	68 80 53 00 00       	push   $0x5380
     682:	ff 35 e8 63 00 00    	pushl  0x63e8
     688:	e8 53 39 00 00       	call   3fe0 <printf>
      exit(0);
     68d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     694:	e8 d9 37 00 00       	call   3e72 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     699:	83 ec 04             	sub    $0x4,%esp
     69c:	53                   	push   %ebx
     69d:	68 a4 53 00 00       	push   $0x53a4
     6a2:	ff 35 e8 63 00 00    	pushl  0x63e8
     6a8:	e8 33 39 00 00       	call   3fe0 <printf>
      exit(0);
     6ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6b4:	e8 b9 37 00 00       	call   3e72 <exit>
    printf(stdout, "error: open small failed!\n");
     6b9:	51                   	push   %ecx
     6ba:	51                   	push   %ecx
     6bb:	68 f6 44 00 00       	push   $0x44f6
     6c0:	ff 35 e8 63 00 00    	pushl  0x63e8
     6c6:	e8 15 39 00 00       	call   3fe0 <printf>
    exit(0);
     6cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6d2:	e8 9b 37 00 00       	call   3e72 <exit>
    printf(stdout, "read failed\n");
     6d7:	52                   	push   %edx
     6d8:	52                   	push   %edx
     6d9:	68 3d 48 00 00       	push   $0x483d
     6de:	ff 35 e8 63 00 00    	pushl  0x63e8
     6e4:	e8 f7 38 00 00       	call   3fe0 <printf>
    exit(0);
     6e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6f0:	e8 7d 37 00 00       	call   3e72 <exit>
    printf(stdout, "unlink small failed\n");
     6f5:	50                   	push   %eax
     6f6:	50                   	push   %eax
     6f7:	68 24 45 00 00       	push   $0x4524
     6fc:	ff 35 e8 63 00 00    	pushl  0x63e8
     702:	e8 d9 38 00 00       	call   3fe0 <printf>
    exit(0);
     707:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     70e:	e8 5f 37 00 00       	call   3e72 <exit>
    printf(stdout, "error: creat small failed!\n");
     713:	50                   	push   %eax
     714:	50                   	push   %eax
     715:	68 a0 44 00 00       	push   $0x44a0
     71a:	ff 35 e8 63 00 00    	pushl  0x63e8
     720:	e8 bb 38 00 00       	call   3fe0 <printf>
    exit(0);
     725:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     72c:	e8 41 37 00 00       	call   3e72 <exit>
     731:	eb 0d                	jmp    740 <writetest1>
     733:	90                   	nop
     734:	90                   	nop
     735:	90                   	nop
     736:	90                   	nop
     737:	90                   	nop
     738:	90                   	nop
     739:	90                   	nop
     73a:	90                   	nop
     73b:	90                   	nop
     73c:	90                   	nop
     73d:	90                   	nop
     73e:	90                   	nop
     73f:	90                   	nop

00000740 <writetest1>:
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     745:	83 ec 08             	sub    $0x8,%esp
     748:	68 4d 45 00 00       	push   $0x454d
     74d:	ff 35 e8 63 00 00    	pushl  0x63e8
     753:	e8 88 38 00 00       	call   3fe0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     758:	58                   	pop    %eax
     759:	5a                   	pop    %edx
     75a:	68 02 02 00 00       	push   $0x202
     75f:	68 c7 45 00 00       	push   $0x45c7
     764:	e8 49 37 00 00       	call   3eb2 <open>
  if(fd < 0){
     769:	83 c4 10             	add    $0x10,%esp
     76c:	85 c0                	test   %eax,%eax
     76e:	0f 88 88 01 00 00    	js     8fc <writetest1+0x1bc>
     774:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     776:	31 db                	xor    %ebx,%ebx
     778:	90                   	nop
     779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     780:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     783:	89 1d c0 8b 00 00    	mov    %ebx,0x8bc0
    if(write(fd, buf, 512) != 512){
     789:	68 00 02 00 00       	push   $0x200
     78e:	68 c0 8b 00 00       	push   $0x8bc0
     793:	56                   	push   %esi
     794:	e8 f9 36 00 00       	call   3e92 <write>
     799:	83 c4 10             	add    $0x10,%esp
     79c:	3d 00 02 00 00       	cmp    $0x200,%eax
     7a1:	0f 85 b7 00 00 00    	jne    85e <writetest1+0x11e>
  for(i = 0; i < MAXFILE; i++){
     7a7:	83 c3 01             	add    $0x1,%ebx
     7aa:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     7b0:	75 ce                	jne    780 <writetest1+0x40>
  close(fd);
     7b2:	83 ec 0c             	sub    $0xc,%esp
     7b5:	56                   	push   %esi
     7b6:	e8 df 36 00 00       	call   3e9a <close>
  fd = open("big", O_RDONLY);
     7bb:	5b                   	pop    %ebx
     7bc:	5e                   	pop    %esi
     7bd:	6a 00                	push   $0x0
     7bf:	68 c7 45 00 00       	push   $0x45c7
     7c4:	e8 e9 36 00 00       	call   3eb2 <open>
  if(fd < 0){
     7c9:	83 c4 10             	add    $0x10,%esp
     7cc:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     7ce:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     7d0:	0f 88 08 01 00 00    	js     8de <writetest1+0x19e>
  n = 0;
     7d6:	31 db                	xor    %ebx,%ebx
     7d8:	eb 21                	jmp    7fb <writetest1+0xbb>
     7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     7e0:	3d 00 02 00 00       	cmp    $0x200,%eax
     7e5:	0f 85 b1 00 00 00    	jne    89c <writetest1+0x15c>
    if(((int*)buf)[0] != n){
     7eb:	a1 c0 8b 00 00       	mov    0x8bc0,%eax
     7f0:	39 d8                	cmp    %ebx,%eax
     7f2:	0f 85 86 00 00 00    	jne    87e <writetest1+0x13e>
    n++;
     7f8:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     7fb:	83 ec 04             	sub    $0x4,%esp
     7fe:	68 00 02 00 00       	push   $0x200
     803:	68 c0 8b 00 00       	push   $0x8bc0
     808:	56                   	push   %esi
     809:	e8 7c 36 00 00       	call   3e8a <read>
    if(i == 0){
     80e:	83 c4 10             	add    $0x10,%esp
     811:	85 c0                	test   %eax,%eax
     813:	75 cb                	jne    7e0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     815:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     81b:	0f 84 9b 00 00 00    	je     8bc <writetest1+0x17c>
  close(fd);
     821:	83 ec 0c             	sub    $0xc,%esp
     824:	56                   	push   %esi
     825:	e8 70 36 00 00       	call   3e9a <close>
  if(unlink("big") < 0){
     82a:	c7 04 24 c7 45 00 00 	movl   $0x45c7,(%esp)
     831:	e8 8c 36 00 00       	call   3ec2 <unlink>
     836:	83 c4 10             	add    $0x10,%esp
     839:	85 c0                	test   %eax,%eax
     83b:	0f 88 d9 00 00 00    	js     91a <writetest1+0x1da>
  printf(stdout, "big files ok\n");
     841:	83 ec 08             	sub    $0x8,%esp
     844:	68 ee 45 00 00       	push   $0x45ee
     849:	ff 35 e8 63 00 00    	pushl  0x63e8
     84f:	e8 8c 37 00 00       	call   3fe0 <printf>
}
     854:	83 c4 10             	add    $0x10,%esp
     857:	8d 65 f8             	lea    -0x8(%ebp),%esp
     85a:	5b                   	pop    %ebx
     85b:	5e                   	pop    %esi
     85c:	5d                   	pop    %ebp
     85d:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     85e:	83 ec 04             	sub    $0x4,%esp
     861:	53                   	push   %ebx
     862:	68 77 45 00 00       	push   $0x4577
     867:	ff 35 e8 63 00 00    	pushl  0x63e8
     86d:	e8 6e 37 00 00       	call   3fe0 <printf>
      exit(0);
     872:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     879:	e8 f4 35 00 00       	call   3e72 <exit>
      printf(stdout, "read content of block %d is %d\n",
     87e:	50                   	push   %eax
     87f:	53                   	push   %ebx
     880:	68 c8 53 00 00       	push   $0x53c8
     885:	ff 35 e8 63 00 00    	pushl  0x63e8
     88b:	e8 50 37 00 00       	call   3fe0 <printf>
      exit(0);
     890:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     897:	e8 d6 35 00 00       	call   3e72 <exit>
      printf(stdout, "read failed %d\n", i);
     89c:	83 ec 04             	sub    $0x4,%esp
     89f:	50                   	push   %eax
     8a0:	68 cb 45 00 00       	push   $0x45cb
     8a5:	ff 35 e8 63 00 00    	pushl  0x63e8
     8ab:	e8 30 37 00 00       	call   3fe0 <printf>
      exit(0);
     8b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8b7:	e8 b6 35 00 00       	call   3e72 <exit>
        printf(stdout, "read only %d blocks from big", n);
     8bc:	52                   	push   %edx
     8bd:	68 8b 00 00 00       	push   $0x8b
     8c2:	68 ae 45 00 00       	push   $0x45ae
     8c7:	ff 35 e8 63 00 00    	pushl  0x63e8
     8cd:	e8 0e 37 00 00       	call   3fe0 <printf>
        exit(0);
     8d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8d9:	e8 94 35 00 00       	call   3e72 <exit>
    printf(stdout, "error: open big failed!\n");
     8de:	51                   	push   %ecx
     8df:	51                   	push   %ecx
     8e0:	68 95 45 00 00       	push   $0x4595
     8e5:	ff 35 e8 63 00 00    	pushl  0x63e8
     8eb:	e8 f0 36 00 00       	call   3fe0 <printf>
    exit(0);
     8f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8f7:	e8 76 35 00 00       	call   3e72 <exit>
    printf(stdout, "error: creat big failed!\n");
     8fc:	50                   	push   %eax
     8fd:	50                   	push   %eax
     8fe:	68 5d 45 00 00       	push   $0x455d
     903:	ff 35 e8 63 00 00    	pushl  0x63e8
     909:	e8 d2 36 00 00       	call   3fe0 <printf>
    exit(0);
     90e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     915:	e8 58 35 00 00       	call   3e72 <exit>
    printf(stdout, "unlink big failed\n");
     91a:	50                   	push   %eax
     91b:	50                   	push   %eax
     91c:	68 db 45 00 00       	push   $0x45db
     921:	ff 35 e8 63 00 00    	pushl  0x63e8
     927:	e8 b4 36 00 00       	call   3fe0 <printf>
    exit(0);
     92c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     933:	e8 3a 35 00 00       	call   3e72 <exit>
     938:	90                   	nop
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000940 <createtest>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	53                   	push   %ebx
  name[2] = '\0';
     944:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     949:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     94c:	68 e8 53 00 00       	push   $0x53e8
     951:	ff 35 e8 63 00 00    	pushl  0x63e8
     957:	e8 84 36 00 00       	call   3fe0 <printf>
  name[0] = 'a';
     95c:	c6 05 c0 ab 00 00 61 	movb   $0x61,0xabc0
  name[2] = '\0';
     963:	c6 05 c2 ab 00 00 00 	movb   $0x0,0xabc2
     96a:	83 c4 10             	add    $0x10,%esp
     96d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     970:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     973:	88 1d c1 ab 00 00    	mov    %bl,0xabc1
     979:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     97c:	68 02 02 00 00       	push   $0x202
     981:	68 c0 ab 00 00       	push   $0xabc0
     986:	e8 27 35 00 00       	call   3eb2 <open>
    close(fd);
     98b:	89 04 24             	mov    %eax,(%esp)
     98e:	e8 07 35 00 00       	call   3e9a <close>
  for(i = 0; i < 52; i++){
     993:	83 c4 10             	add    $0x10,%esp
     996:	80 fb 64             	cmp    $0x64,%bl
     999:	75 d5                	jne    970 <createtest+0x30>
  name[0] = 'a';
     99b:	c6 05 c0 ab 00 00 61 	movb   $0x61,0xabc0
  name[2] = '\0';
     9a2:	c6 05 c2 ab 00 00 00 	movb   $0x0,0xabc2
     9a9:	bb 30 00 00 00       	mov    $0x30,%ebx
     9ae:	66 90                	xchg   %ax,%ax
    unlink(name);
     9b0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     9b3:	88 1d c1 ab 00 00    	mov    %bl,0xabc1
     9b9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     9bc:	68 c0 ab 00 00       	push   $0xabc0
     9c1:	e8 fc 34 00 00       	call   3ec2 <unlink>
  for(i = 0; i < 52; i++){
     9c6:	83 c4 10             	add    $0x10,%esp
     9c9:	80 fb 64             	cmp    $0x64,%bl
     9cc:	75 e2                	jne    9b0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     9ce:	83 ec 08             	sub    $0x8,%esp
     9d1:	68 10 54 00 00       	push   $0x5410
     9d6:	ff 35 e8 63 00 00    	pushl  0x63e8
     9dc:	e8 ff 35 00 00       	call   3fe0 <printf>
}
     9e1:	83 c4 10             	add    $0x10,%esp
     9e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9e7:	c9                   	leave  
     9e8:	c3                   	ret    
     9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <dirtest>:
{
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     9f6:	68 fc 45 00 00       	push   $0x45fc
     9fb:	ff 35 e8 63 00 00    	pushl  0x63e8
     a01:	e8 da 35 00 00       	call   3fe0 <printf>
  if(mkdir("dir0") < 0){
     a06:	c7 04 24 08 46 00 00 	movl   $0x4608,(%esp)
     a0d:	e8 c8 34 00 00       	call   3eda <mkdir>
     a12:	83 c4 10             	add    $0x10,%esp
     a15:	85 c0                	test   %eax,%eax
     a17:	78 58                	js     a71 <dirtest+0x81>
  if(chdir("dir0") < 0){
     a19:	83 ec 0c             	sub    $0xc,%esp
     a1c:	68 08 46 00 00       	push   $0x4608
     a21:	e8 bc 34 00 00       	call   3ee2 <chdir>
     a26:	83 c4 10             	add    $0x10,%esp
     a29:	85 c0                	test   %eax,%eax
     a2b:	0f 88 9a 00 00 00    	js     acb <dirtest+0xdb>
  if(chdir("..") < 0){
     a31:	83 ec 0c             	sub    $0xc,%esp
     a34:	68 ad 4b 00 00       	push   $0x4bad
     a39:	e8 a4 34 00 00       	call   3ee2 <chdir>
     a3e:	83 c4 10             	add    $0x10,%esp
     a41:	85 c0                	test   %eax,%eax
     a43:	78 68                	js     aad <dirtest+0xbd>
  if(unlink("dir0") < 0){
     a45:	83 ec 0c             	sub    $0xc,%esp
     a48:	68 08 46 00 00       	push   $0x4608
     a4d:	e8 70 34 00 00       	call   3ec2 <unlink>
     a52:	83 c4 10             	add    $0x10,%esp
     a55:	85 c0                	test   %eax,%eax
     a57:	78 36                	js     a8f <dirtest+0x9f>
  printf(stdout, "mkdir test ok\n");
     a59:	83 ec 08             	sub    $0x8,%esp
     a5c:	68 45 46 00 00       	push   $0x4645
     a61:	ff 35 e8 63 00 00    	pushl  0x63e8
     a67:	e8 74 35 00 00       	call   3fe0 <printf>
}
     a6c:	83 c4 10             	add    $0x10,%esp
     a6f:	c9                   	leave  
     a70:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     a71:	50                   	push   %eax
     a72:	50                   	push   %eax
     a73:	68 38 43 00 00       	push   $0x4338
     a78:	ff 35 e8 63 00 00    	pushl  0x63e8
     a7e:	e8 5d 35 00 00       	call   3fe0 <printf>
    exit(0);
     a83:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a8a:	e8 e3 33 00 00       	call   3e72 <exit>
    printf(stdout, "unlink dir0 failed\n");
     a8f:	50                   	push   %eax
     a90:	50                   	push   %eax
     a91:	68 31 46 00 00       	push   $0x4631
     a96:	ff 35 e8 63 00 00    	pushl  0x63e8
     a9c:	e8 3f 35 00 00       	call   3fe0 <printf>
    exit(0);
     aa1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aa8:	e8 c5 33 00 00       	call   3e72 <exit>
    printf(stdout, "chdir .. failed\n");
     aad:	52                   	push   %edx
     aae:	52                   	push   %edx
     aaf:	68 20 46 00 00       	push   $0x4620
     ab4:	ff 35 e8 63 00 00    	pushl  0x63e8
     aba:	e8 21 35 00 00       	call   3fe0 <printf>
    exit(0);
     abf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ac6:	e8 a7 33 00 00       	call   3e72 <exit>
    printf(stdout, "chdir dir0 failed\n");
     acb:	51                   	push   %ecx
     acc:	51                   	push   %ecx
     acd:	68 0d 46 00 00       	push   $0x460d
     ad2:	ff 35 e8 63 00 00    	pushl  0x63e8
     ad8:	e8 03 35 00 00       	call   3fe0 <printf>
    exit(0);
     add:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ae4:	e8 89 33 00 00       	call   3e72 <exit>
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <exectest>:
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     af6:	68 54 46 00 00       	push   $0x4654
     afb:	ff 35 e8 63 00 00    	pushl  0x63e8
     b01:	e8 da 34 00 00       	call   3fe0 <printf>
  if(exec("echo", echoargv) < 0){
     b06:	5a                   	pop    %edx
     b07:	59                   	pop    %ecx
     b08:	68 ec 63 00 00       	push   $0x63ec
     b0d:	68 1d 44 00 00       	push   $0x441d
     b12:	e8 93 33 00 00       	call   3eaa <exec>
     b17:	83 c4 10             	add    $0x10,%esp
     b1a:	85 c0                	test   %eax,%eax
     b1c:	78 02                	js     b20 <exectest+0x30>
}
     b1e:	c9                   	leave  
     b1f:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     b20:	50                   	push   %eax
     b21:	50                   	push   %eax
     b22:	68 5f 46 00 00       	push   $0x465f
     b27:	ff 35 e8 63 00 00    	pushl  0x63e8
     b2d:	e8 ae 34 00 00       	call   3fe0 <printf>
    exit(0);
     b32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b39:	e8 34 33 00 00       	call   3e72 <exit>
     b3e:	66 90                	xchg   %ax,%ax

00000b40 <pipe1>:
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	57                   	push   %edi
     b44:	56                   	push   %esi
     b45:	53                   	push   %ebx
  if(pipe(fds) != 0){
     b46:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     b49:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     b4c:	50                   	push   %eax
     b4d:	e8 30 33 00 00       	call   3e82 <pipe>
     b52:	83 c4 10             	add    $0x10,%esp
     b55:	85 c0                	test   %eax,%eax
     b57:	0f 85 51 01 00 00    	jne    cae <pipe1+0x16e>
     b5d:	89 c3                	mov    %eax,%ebx
  pid = fork();
     b5f:	e8 06 33 00 00       	call   3e6a <fork>
  if(pid == 0){
     b64:	83 f8 00             	cmp    $0x0,%eax
     b67:	0f 84 84 00 00 00    	je     bf1 <pipe1+0xb1>
  } else if(pid > 0){
     b6d:	0f 8e 55 01 00 00    	jle    cc8 <pipe1+0x188>
    close(fds[1]);
     b73:	83 ec 0c             	sub    $0xc,%esp
     b76:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     b79:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     b7e:	e8 17 33 00 00       	call   3e9a <close>
    while((n = read(fds[0], buf, cc)) > 0){
     b83:	83 c4 10             	add    $0x10,%esp
    total = 0;
     b86:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     b8d:	83 ec 04             	sub    $0x4,%esp
     b90:	57                   	push   %edi
     b91:	68 c0 8b 00 00       	push   $0x8bc0
     b96:	ff 75 e0             	pushl  -0x20(%ebp)
     b99:	e8 ec 32 00 00       	call   3e8a <read>
     b9e:	83 c4 10             	add    $0x10,%esp
     ba1:	85 c0                	test   %eax,%eax
     ba3:	0f 8e b0 00 00 00    	jle    c59 <pipe1+0x119>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ba9:	89 d9                	mov    %ebx,%ecx
     bab:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     bae:	f7 d9                	neg    %ecx
     bb0:	38 9c 0b c0 8b 00 00 	cmp    %bl,0x8bc0(%ebx,%ecx,1)
     bb7:	8d 53 01             	lea    0x1(%ebx),%edx
     bba:	75 1b                	jne    bd7 <pipe1+0x97>
      for(i = 0; i < n; i++){
     bbc:	39 f2                	cmp    %esi,%edx
     bbe:	89 d3                	mov    %edx,%ebx
     bc0:	75 ee                	jne    bb0 <pipe1+0x70>
      cc = cc * 2;
     bc2:	01 ff                	add    %edi,%edi
      total += n;
     bc4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     bc7:	b8 00 20 00 00       	mov    $0x2000,%eax
     bcc:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     bd2:	0f 4f f8             	cmovg  %eax,%edi
     bd5:	eb b6                	jmp    b8d <pipe1+0x4d>
          printf(1, "pipe1 oops 2\n");
     bd7:	83 ec 08             	sub    $0x8,%esp
     bda:	68 8e 46 00 00       	push   $0x468e
     bdf:	6a 01                	push   $0x1
     be1:	e8 fa 33 00 00       	call   3fe0 <printf>
          return;
     be6:	83 c4 10             	add    $0x10,%esp
}
     be9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bec:	5b                   	pop    %ebx
     bed:	5e                   	pop    %esi
     bee:	5f                   	pop    %edi
     bef:	5d                   	pop    %ebp
     bf0:	c3                   	ret    
    close(fds[0]);
     bf1:	83 ec 0c             	sub    $0xc,%esp
     bf4:	ff 75 e0             	pushl  -0x20(%ebp)
     bf7:	31 db                	xor    %ebx,%ebx
     bf9:	be 09 04 00 00       	mov    $0x409,%esi
     bfe:	e8 97 32 00 00       	call   3e9a <close>
     c03:	83 c4 10             	add    $0x10,%esp
     c06:	89 d8                	mov    %ebx,%eax
     c08:	89 f2                	mov    %esi,%edx
     c0a:	f7 d8                	neg    %eax
     c0c:	29 da                	sub    %ebx,%edx
     c0e:	66 90                	xchg   %ax,%ax
        buf[i] = seq++;
     c10:	88 84 03 c0 8b 00 00 	mov    %al,0x8bc0(%ebx,%eax,1)
     c17:	83 c0 01             	add    $0x1,%eax
      for(i = 0; i < 1033; i++)
     c1a:	39 d0                	cmp    %edx,%eax
     c1c:	75 f2                	jne    c10 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     c1e:	83 ec 04             	sub    $0x4,%esp
     c21:	68 09 04 00 00       	push   $0x409
     c26:	68 c0 8b 00 00       	push   $0x8bc0
     c2b:	ff 75 e4             	pushl  -0x1c(%ebp)
     c2e:	e8 5f 32 00 00       	call   3e92 <write>
     c33:	83 c4 10             	add    $0x10,%esp
     c36:	3d 09 04 00 00       	cmp    $0x409,%eax
     c3b:	0f 85 a1 00 00 00    	jne    ce2 <pipe1+0x1a2>
     c41:	81 eb 09 04 00 00    	sub    $0x409,%ebx
    for(n = 0; n < 5; n++){
     c47:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
     c4d:	75 b7                	jne    c06 <pipe1+0xc6>
    exit(0);
     c4f:	83 ec 0c             	sub    $0xc,%esp
     c52:	6a 00                	push   $0x0
     c54:	e8 19 32 00 00       	call   3e72 <exit>
    if(total != 5 * 1033){
     c59:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     c60:	75 30                	jne    c92 <pipe1+0x152>
    close(fds[0]);
     c62:	83 ec 0c             	sub    $0xc,%esp
     c65:	ff 75 e0             	pushl  -0x20(%ebp)
     c68:	e8 2d 32 00 00       	call   3e9a <close>
    wait(null);
     c6d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c74:	e8 01 32 00 00       	call   3e7a <wait>
  printf(1, "pipe1 ok\n");
     c79:	5a                   	pop    %edx
     c7a:	59                   	pop    %ecx
     c7b:	68 b3 46 00 00       	push   $0x46b3
     c80:	6a 01                	push   $0x1
     c82:	e8 59 33 00 00       	call   3fe0 <printf>
     c87:	83 c4 10             	add    $0x10,%esp
}
     c8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c8d:	5b                   	pop    %ebx
     c8e:	5e                   	pop    %esi
     c8f:	5f                   	pop    %edi
     c90:	5d                   	pop    %ebp
     c91:	c3                   	ret    
      printf(1, "pipe1 oops 3 total %d\n", total);
     c92:	53                   	push   %ebx
     c93:	ff 75 d4             	pushl  -0x2c(%ebp)
     c96:	68 9c 46 00 00       	push   $0x469c
     c9b:	6a 01                	push   $0x1
     c9d:	e8 3e 33 00 00       	call   3fe0 <printf>
      exit(0);
     ca2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ca9:	e8 c4 31 00 00       	call   3e72 <exit>
    printf(1, "pipe() failed\n");
     cae:	57                   	push   %edi
     caf:	57                   	push   %edi
     cb0:	68 71 46 00 00       	push   $0x4671
     cb5:	6a 01                	push   $0x1
     cb7:	e8 24 33 00 00       	call   3fe0 <printf>
    exit(0);
     cbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cc3:	e8 aa 31 00 00       	call   3e72 <exit>
    printf(1, "fork() failed\n");
     cc8:	50                   	push   %eax
     cc9:	50                   	push   %eax
     cca:	68 bd 46 00 00       	push   $0x46bd
     ccf:	6a 01                	push   $0x1
     cd1:	e8 0a 33 00 00       	call   3fe0 <printf>
    exit(0);
     cd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cdd:	e8 90 31 00 00       	call   3e72 <exit>
        printf(1, "pipe1 oops 1\n");
     ce2:	56                   	push   %esi
     ce3:	56                   	push   %esi
     ce4:	68 80 46 00 00       	push   $0x4680
     ce9:	6a 01                	push   $0x1
     ceb:	e8 f0 32 00 00       	call   3fe0 <printf>
        exit(0);
     cf0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cf7:	e8 76 31 00 00       	call   3e72 <exit>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d00 <preempt>:
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	57                   	push   %edi
     d04:	56                   	push   %esi
     d05:	53                   	push   %ebx
     d06:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     d09:	68 cc 46 00 00       	push   $0x46cc
     d0e:	6a 01                	push   $0x1
     d10:	e8 cb 32 00 00       	call   3fe0 <printf>
  pid1 = fork();
     d15:	e8 50 31 00 00       	call   3e6a <fork>
  if(pid1 == 0)
     d1a:	83 c4 10             	add    $0x10,%esp
     d1d:	85 c0                	test   %eax,%eax
     d1f:	75 02                	jne    d23 <preempt+0x23>
     d21:	eb fe                	jmp    d21 <preempt+0x21>
     d23:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     d25:	e8 40 31 00 00       	call   3e6a <fork>
  if(pid2 == 0)
     d2a:	85 c0                	test   %eax,%eax
  pid2 = fork();
     d2c:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     d2e:	75 02                	jne    d32 <preempt+0x32>
     d30:	eb fe                	jmp    d30 <preempt+0x30>
  pipe(pfds);
     d32:	8d 45 e0             	lea    -0x20(%ebp),%eax
     d35:	83 ec 0c             	sub    $0xc,%esp
     d38:	50                   	push   %eax
     d39:	e8 44 31 00 00       	call   3e82 <pipe>
  pid3 = fork();
     d3e:	e8 27 31 00 00       	call   3e6a <fork>
  if(pid3 == 0){
     d43:	83 c4 10             	add    $0x10,%esp
     d46:	85 c0                	test   %eax,%eax
  pid3 = fork();
     d48:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     d4a:	75 46                	jne    d92 <preempt+0x92>
    close(pfds[0]);
     d4c:	83 ec 0c             	sub    $0xc,%esp
     d4f:	ff 75 e0             	pushl  -0x20(%ebp)
     d52:	e8 43 31 00 00       	call   3e9a <close>
    if(write(pfds[1], "x", 1) != 1)
     d57:	83 c4 0c             	add    $0xc,%esp
     d5a:	6a 01                	push   $0x1
     d5c:	68 91 4c 00 00       	push   $0x4c91
     d61:	ff 75 e4             	pushl  -0x1c(%ebp)
     d64:	e8 29 31 00 00       	call   3e92 <write>
     d69:	83 c4 10             	add    $0x10,%esp
     d6c:	83 e8 01             	sub    $0x1,%eax
     d6f:	74 11                	je     d82 <preempt+0x82>
      printf(1, "preempt write error");
     d71:	50                   	push   %eax
     d72:	50                   	push   %eax
     d73:	68 d6 46 00 00       	push   $0x46d6
     d78:	6a 01                	push   $0x1
     d7a:	e8 61 32 00 00       	call   3fe0 <printf>
     d7f:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     d82:	83 ec 0c             	sub    $0xc,%esp
     d85:	ff 75 e4             	pushl  -0x1c(%ebp)
     d88:	e8 0d 31 00 00       	call   3e9a <close>
     d8d:	83 c4 10             	add    $0x10,%esp
     d90:	eb fe                	jmp    d90 <preempt+0x90>
  close(pfds[1]);
     d92:	83 ec 0c             	sub    $0xc,%esp
     d95:	ff 75 e4             	pushl  -0x1c(%ebp)
     d98:	e8 fd 30 00 00       	call   3e9a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     d9d:	83 c4 0c             	add    $0xc,%esp
     da0:	68 00 20 00 00       	push   $0x2000
     da5:	68 c0 8b 00 00       	push   $0x8bc0
     daa:	ff 75 e0             	pushl  -0x20(%ebp)
     dad:	e8 d8 30 00 00       	call   3e8a <read>
     db2:	83 c4 10             	add    $0x10,%esp
     db5:	83 e8 01             	sub    $0x1,%eax
     db8:	74 19                	je     dd3 <preempt+0xd3>
    printf(1, "preempt read error");
     dba:	50                   	push   %eax
     dbb:	50                   	push   %eax
     dbc:	68 ea 46 00 00       	push   $0x46ea
     dc1:	6a 01                	push   $0x1
     dc3:	e8 18 32 00 00       	call   3fe0 <printf>
    return;
     dc8:	83 c4 10             	add    $0x10,%esp
}
     dcb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dce:	5b                   	pop    %ebx
     dcf:	5e                   	pop    %esi
     dd0:	5f                   	pop    %edi
     dd1:	5d                   	pop    %ebp
     dd2:	c3                   	ret    
  close(pfds[0]);
     dd3:	83 ec 0c             	sub    $0xc,%esp
     dd6:	ff 75 e0             	pushl  -0x20(%ebp)
     dd9:	e8 bc 30 00 00       	call   3e9a <close>
  printf(1, "kill... ");
     dde:	58                   	pop    %eax
     ddf:	5a                   	pop    %edx
     de0:	68 fd 46 00 00       	push   $0x46fd
     de5:	6a 01                	push   $0x1
     de7:	e8 f4 31 00 00       	call   3fe0 <printf>
  kill(pid1);
     dec:	89 3c 24             	mov    %edi,(%esp)
     def:	e8 ae 30 00 00       	call   3ea2 <kill>
  kill(pid2);
     df4:	89 34 24             	mov    %esi,(%esp)
     df7:	e8 a6 30 00 00       	call   3ea2 <kill>
  kill(pid3);
     dfc:	89 1c 24             	mov    %ebx,(%esp)
     dff:	e8 9e 30 00 00       	call   3ea2 <kill>
  printf(1, "wait... ");
     e04:	59                   	pop    %ecx
     e05:	5b                   	pop    %ebx
     e06:	68 06 47 00 00       	push   $0x4706
     e0b:	6a 01                	push   $0x1
     e0d:	e8 ce 31 00 00       	call   3fe0 <printf>
  wait(null);
     e12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e19:	e8 5c 30 00 00       	call   3e7a <wait>
  wait(null);
     e1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e25:	e8 50 30 00 00       	call   3e7a <wait>
  wait(null);
     e2a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e31:	e8 44 30 00 00       	call   3e7a <wait>
  printf(1, "preempt ok\n");
     e36:	5e                   	pop    %esi
     e37:	5f                   	pop    %edi
     e38:	68 0f 47 00 00       	push   $0x470f
     e3d:	6a 01                	push   $0x1
     e3f:	e8 9c 31 00 00       	call   3fe0 <printf>
     e44:	83 c4 10             	add    $0x10,%esp
     e47:	eb 82                	jmp    dcb <preempt+0xcb>
     e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e50 <exitwait>:
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	56                   	push   %esi
     e54:	be 64 00 00 00       	mov    $0x64,%esi
     e59:	53                   	push   %ebx
     e5a:	eb 1c                	jmp    e78 <exitwait+0x28>
     e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     e60:	74 77                	je     ed9 <exitwait+0x89>
      if(wait(null) != pid){
     e62:	83 ec 0c             	sub    $0xc,%esp
     e65:	6a 00                	push   $0x0
     e67:	e8 0e 30 00 00       	call   3e7a <wait>
     e6c:	83 c4 10             	add    $0x10,%esp
     e6f:	39 d8                	cmp    %ebx,%eax
     e71:	75 2d                	jne    ea0 <exitwait+0x50>
  for(i = 0; i < 100; i++){
     e73:	83 ee 01             	sub    $0x1,%esi
     e76:	74 48                	je     ec0 <exitwait+0x70>
    pid = fork();
     e78:	e8 ed 2f 00 00       	call   3e6a <fork>
    if(pid < 0){
     e7d:	85 c0                	test   %eax,%eax
    pid = fork();
     e7f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     e81:	79 dd                	jns    e60 <exitwait+0x10>
      printf(1, "fork failed\n");
     e83:	83 ec 08             	sub    $0x8,%esp
     e86:	68 79 52 00 00       	push   $0x5279
     e8b:	6a 01                	push   $0x1
     e8d:	e8 4e 31 00 00       	call   3fe0 <printf>
      return;
     e92:	83 c4 10             	add    $0x10,%esp
}
     e95:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e98:	5b                   	pop    %ebx
     e99:	5e                   	pop    %esi
     e9a:	5d                   	pop    %ebp
     e9b:	c3                   	ret    
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     ea0:	83 ec 08             	sub    $0x8,%esp
     ea3:	68 1b 47 00 00       	push   $0x471b
     ea8:	6a 01                	push   $0x1
     eaa:	e8 31 31 00 00       	call   3fe0 <printf>
        return;
     eaf:	83 c4 10             	add    $0x10,%esp
}
     eb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     eb5:	5b                   	pop    %ebx
     eb6:	5e                   	pop    %esi
     eb7:	5d                   	pop    %ebp
     eb8:	c3                   	ret    
     eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     ec0:	83 ec 08             	sub    $0x8,%esp
     ec3:	68 2b 47 00 00       	push   $0x472b
     ec8:	6a 01                	push   $0x1
     eca:	e8 11 31 00 00       	call   3fe0 <printf>
     ecf:	83 c4 10             	add    $0x10,%esp
}
     ed2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ed5:	5b                   	pop    %ebx
     ed6:	5e                   	pop    %esi
     ed7:	5d                   	pop    %ebp
     ed8:	c3                   	ret    
      exit(0);
     ed9:	83 ec 0c             	sub    $0xc,%esp
     edc:	6a 00                	push   $0x0
     ede:	e8 8f 2f 00 00       	call   3e72 <exit>
     ee3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ef0 <mem>:
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	57                   	push   %edi
     ef4:	56                   	push   %esi
     ef5:	53                   	push   %ebx
     ef6:	31 db                	xor    %ebx,%ebx
     ef8:	83 ec 14             	sub    $0x14,%esp
  printf(1, "mem test\n");
     efb:	68 38 47 00 00       	push   $0x4738
     f00:	6a 01                	push   $0x1
     f02:	e8 d9 30 00 00       	call   3fe0 <printf>
  ppid = getpid();
     f07:	e8 e6 2f 00 00       	call   3ef2 <getpid>
     f0c:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     f0e:	e8 57 2f 00 00       	call   3e6a <fork>
     f13:	83 c4 10             	add    $0x10,%esp
     f16:	85 c0                	test   %eax,%eax
     f18:	74 0a                	je     f24 <mem+0x34>
     f1a:	e9 99 00 00 00       	jmp    fb8 <mem+0xc8>
     f1f:	90                   	nop
      *(char**)m2 = m1;
     f20:	89 18                	mov    %ebx,(%eax)
     f22:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     f24:	83 ec 0c             	sub    $0xc,%esp
     f27:	68 11 27 00 00       	push   $0x2711
     f2c:	e8 0f 33 00 00       	call   4240 <malloc>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	85 c0                	test   %eax,%eax
     f36:	75 e8                	jne    f20 <mem+0x30>
    while(m1){
     f38:	85 db                	test   %ebx,%ebx
     f3a:	74 18                	je     f54 <mem+0x64>
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     f40:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     f42:	83 ec 0c             	sub    $0xc,%esp
     f45:	53                   	push   %ebx
     f46:	89 fb                	mov    %edi,%ebx
     f48:	e8 63 32 00 00       	call   41b0 <free>
    while(m1){
     f4d:	83 c4 10             	add    $0x10,%esp
     f50:	85 db                	test   %ebx,%ebx
     f52:	75 ec                	jne    f40 <mem+0x50>
    m1 = malloc(1024*20);
     f54:	83 ec 0c             	sub    $0xc,%esp
     f57:	68 00 50 00 00       	push   $0x5000
     f5c:	e8 df 32 00 00       	call   4240 <malloc>
    if(m1 == 0){
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	85 c0                	test   %eax,%eax
     f66:	74 28                	je     f90 <mem+0xa0>
    free(m1);
     f68:	83 ec 0c             	sub    $0xc,%esp
     f6b:	50                   	push   %eax
     f6c:	e8 3f 32 00 00       	call   41b0 <free>
    printf(1, "mem ok\n");
     f71:	58                   	pop    %eax
     f72:	5a                   	pop    %edx
     f73:	68 5c 47 00 00       	push   $0x475c
     f78:	6a 01                	push   $0x1
     f7a:	e8 61 30 00 00       	call   3fe0 <printf>
    exit(0);
     f7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f86:	e8 e7 2e 00 00       	call   3e72 <exit>
     f8b:	90                   	nop
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     f90:	83 ec 08             	sub    $0x8,%esp
     f93:	68 42 47 00 00       	push   $0x4742
     f98:	6a 01                	push   $0x1
     f9a:	e8 41 30 00 00       	call   3fe0 <printf>
      kill(ppid);
     f9f:	89 34 24             	mov    %esi,(%esp)
     fa2:	e8 fb 2e 00 00       	call   3ea2 <kill>
      exit(0);
     fa7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fae:	e8 bf 2e 00 00       	call   3e72 <exit>
     fb3:	90                   	nop
     fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    wait(null);
     fb8:	83 ec 0c             	sub    $0xc,%esp
     fbb:	6a 00                	push   $0x0
     fbd:	e8 b8 2e 00 00       	call   3e7a <wait>
}
     fc2:	83 c4 10             	add    $0x10,%esp
     fc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc8:	5b                   	pop    %ebx
     fc9:	5e                   	pop    %esi
     fca:	5f                   	pop    %edi
     fcb:	5d                   	pop    %ebp
     fcc:	c3                   	ret    
     fcd:	8d 76 00             	lea    0x0(%esi),%esi

00000fd0 <sharedfd>:
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
     fd4:	56                   	push   %esi
     fd5:	53                   	push   %ebx
     fd6:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     fd9:	68 64 47 00 00       	push   $0x4764
     fde:	6a 01                	push   $0x1
     fe0:	e8 fb 2f 00 00       	call   3fe0 <printf>
  unlink("sharedfd");
     fe5:	c7 04 24 73 47 00 00 	movl   $0x4773,(%esp)
     fec:	e8 d1 2e 00 00       	call   3ec2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ff1:	59                   	pop    %ecx
     ff2:	5b                   	pop    %ebx
     ff3:	68 02 02 00 00       	push   $0x202
     ff8:	68 73 47 00 00       	push   $0x4773
     ffd:	e8 b0 2e 00 00       	call   3eb2 <open>
  if(fd < 0){
    1002:	83 c4 10             	add    $0x10,%esp
    1005:	85 c0                	test   %eax,%eax
    1007:	0f 88 43 01 00 00    	js     1150 <sharedfd+0x180>
    100d:	89 c6                	mov    %eax,%esi
  memset(buf, pid==0?'c':'p', sizeof(buf));
    100f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
    1014:	e8 51 2e 00 00       	call   3e6a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1019:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
    101c:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
    101e:	19 c0                	sbb    %eax,%eax
    1020:	83 ec 04             	sub    $0x4,%esp
    1023:	83 e0 f3             	and    $0xfffffff3,%eax
    1026:	6a 0a                	push   $0xa
    1028:	83 c0 70             	add    $0x70,%eax
    102b:	50                   	push   %eax
    102c:	8d 45 de             	lea    -0x22(%ebp),%eax
    102f:	50                   	push   %eax
    1030:	e8 9b 2c 00 00       	call   3cd0 <memset>
    1035:	83 c4 10             	add    $0x10,%esp
    1038:	eb 0b                	jmp    1045 <sharedfd+0x75>
    103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
    1040:	83 eb 01             	sub    $0x1,%ebx
    1043:	74 29                	je     106e <sharedfd+0x9e>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1045:	8d 45 de             	lea    -0x22(%ebp),%eax
    1048:	83 ec 04             	sub    $0x4,%esp
    104b:	6a 0a                	push   $0xa
    104d:	50                   	push   %eax
    104e:	56                   	push   %esi
    104f:	e8 3e 2e 00 00       	call   3e92 <write>
    1054:	83 c4 10             	add    $0x10,%esp
    1057:	83 f8 0a             	cmp    $0xa,%eax
    105a:	74 e4                	je     1040 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    105c:	83 ec 08             	sub    $0x8,%esp
    105f:	68 64 54 00 00       	push   $0x5464
    1064:	6a 01                	push   $0x1
    1066:	e8 75 2f 00 00       	call   3fe0 <printf>
      break;
    106b:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
    106e:	85 ff                	test   %edi,%edi
    1070:	0f 84 0e 01 00 00    	je     1184 <sharedfd+0x1b4>
    wait(null);
    1076:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
    1079:	31 db                	xor    %ebx,%ebx
    107b:	31 ff                	xor    %edi,%edi
    wait(null);
    107d:	6a 00                	push   $0x0
    107f:	e8 f6 2d 00 00       	call   3e7a <wait>
  close(fd);
    1084:	89 34 24             	mov    %esi,(%esp)
    1087:	8d 75 e8             	lea    -0x18(%ebp),%esi
    108a:	e8 0b 2e 00 00       	call   3e9a <close>
  fd = open("sharedfd", 0);
    108f:	58                   	pop    %eax
    1090:	5a                   	pop    %edx
    1091:	6a 00                	push   $0x0
    1093:	68 73 47 00 00       	push   $0x4773
    1098:	e8 15 2e 00 00       	call   3eb2 <open>
  if(fd < 0){
    109d:	83 c4 10             	add    $0x10,%esp
    10a0:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
    10a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
    10a5:	0f 88 bf 00 00 00    	js     116a <sharedfd+0x19a>
    10ab:	89 f8                	mov    %edi,%eax
    10ad:	89 df                	mov    %ebx,%edi
    10af:	89 c3                	mov    %eax,%ebx
    10b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10b8:	8d 45 de             	lea    -0x22(%ebp),%eax
    10bb:	83 ec 04             	sub    $0x4,%esp
    10be:	6a 0a                	push   $0xa
    10c0:	50                   	push   %eax
    10c1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10c4:	e8 c1 2d 00 00       	call   3e8a <read>
    10c9:	83 c4 10             	add    $0x10,%esp
    10cc:	85 c0                	test   %eax,%eax
    10ce:	7e 30                	jle    1100 <sharedfd+0x130>
    10d0:	8d 45 de             	lea    -0x22(%ebp),%eax
    10d3:	eb 15                	jmp    10ea <sharedfd+0x11a>
    10d5:	8d 76 00             	lea    0x0(%esi),%esi
        np++;
    10d8:	80 fa 70             	cmp    $0x70,%dl
    10db:	0f 94 c2             	sete   %dl
    10de:	0f b6 d2             	movzbl %dl,%edx
    10e1:	01 d7                	add    %edx,%edi
    10e3:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
    10e6:	39 f0                	cmp    %esi,%eax
    10e8:	74 ce                	je     10b8 <sharedfd+0xe8>
      if(buf[i] == 'c')
    10ea:	0f b6 10             	movzbl (%eax),%edx
    10ed:	80 fa 63             	cmp    $0x63,%dl
    10f0:	75 e6                	jne    10d8 <sharedfd+0x108>
        nc++;
    10f2:	83 c3 01             	add    $0x1,%ebx
    10f5:	eb ec                	jmp    10e3 <sharedfd+0x113>
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  close(fd);
    1100:	83 ec 0c             	sub    $0xc,%esp
    1103:	89 d8                	mov    %ebx,%eax
    1105:	ff 75 d4             	pushl  -0x2c(%ebp)
    1108:	89 fb                	mov    %edi,%ebx
    110a:	89 c7                	mov    %eax,%edi
    110c:	e8 89 2d 00 00       	call   3e9a <close>
  unlink("sharedfd");
    1111:	c7 04 24 73 47 00 00 	movl   $0x4773,(%esp)
    1118:	e8 a5 2d 00 00       	call   3ec2 <unlink>
  if(nc == 10000 && np == 10000){
    111d:	83 c4 10             	add    $0x10,%esp
    1120:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    1126:	75 66                	jne    118e <sharedfd+0x1be>
    1128:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    112e:	75 5e                	jne    118e <sharedfd+0x1be>
    printf(1, "sharedfd ok\n");
    1130:	83 ec 08             	sub    $0x8,%esp
    1133:	68 7c 47 00 00       	push   $0x477c
    1138:	6a 01                	push   $0x1
    113a:	e8 a1 2e 00 00       	call   3fe0 <printf>
    113f:	83 c4 10             	add    $0x10,%esp
}
    1142:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1145:	5b                   	pop    %ebx
    1146:	5e                   	pop    %esi
    1147:	5f                   	pop    %edi
    1148:	5d                   	pop    %ebp
    1149:	c3                   	ret    
    114a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "fstests: cannot open sharedfd for writing");
    1150:	83 ec 08             	sub    $0x8,%esp
    1153:	68 38 54 00 00       	push   $0x5438
    1158:	6a 01                	push   $0x1
    115a:	e8 81 2e 00 00       	call   3fe0 <printf>
    return;
    115f:	83 c4 10             	add    $0x10,%esp
}
    1162:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1165:	5b                   	pop    %ebx
    1166:	5e                   	pop    %esi
    1167:	5f                   	pop    %edi
    1168:	5d                   	pop    %ebp
    1169:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    116a:	83 ec 08             	sub    $0x8,%esp
    116d:	68 84 54 00 00       	push   $0x5484
    1172:	6a 01                	push   $0x1
    1174:	e8 67 2e 00 00       	call   3fe0 <printf>
    return;
    1179:	83 c4 10             	add    $0x10,%esp
}
    117c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    117f:	5b                   	pop    %ebx
    1180:	5e                   	pop    %esi
    1181:	5f                   	pop    %edi
    1182:	5d                   	pop    %ebp
    1183:	c3                   	ret    
    exit(0);
    1184:	83 ec 0c             	sub    $0xc,%esp
    1187:	6a 00                	push   $0x0
    1189:	e8 e4 2c 00 00       	call   3e72 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    118e:	53                   	push   %ebx
    118f:	57                   	push   %edi
    1190:	68 89 47 00 00       	push   $0x4789
    1195:	6a 01                	push   $0x1
    1197:	e8 44 2e 00 00       	call   3fe0 <printf>
    exit(0);
    119c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11a3:	e8 ca 2c 00 00       	call   3e72 <exit>
    11a8:	90                   	nop
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011b0 <fourfiles>:
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    11b6:	be 9e 47 00 00       	mov    $0x479e,%esi
  for(pi = 0; pi < 4; pi++){
    11bb:	31 db                	xor    %ebx,%ebx
{
    11bd:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    11c0:	c7 45 d8 9e 47 00 00 	movl   $0x479e,-0x28(%ebp)
    11c7:	c7 45 dc e7 48 00 00 	movl   $0x48e7,-0x24(%ebp)
  printf(1, "fourfiles test\n");
    11ce:	68 a4 47 00 00       	push   $0x47a4
    11d3:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    11d5:	c7 45 e0 eb 48 00 00 	movl   $0x48eb,-0x20(%ebp)
    11dc:	c7 45 e4 a1 47 00 00 	movl   $0x47a1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    11e3:	e8 f8 2d 00 00       	call   3fe0 <printf>
    11e8:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    11eb:	83 ec 0c             	sub    $0xc,%esp
    11ee:	56                   	push   %esi
    11ef:	e8 ce 2c 00 00       	call   3ec2 <unlink>
    pid = fork();
    11f4:	e8 71 2c 00 00       	call   3e6a <fork>
    if(pid < 0){
    11f9:	83 c4 10             	add    $0x10,%esp
    11fc:	85 c0                	test   %eax,%eax
    11fe:	0f 88 9b 01 00 00    	js     139f <fourfiles+0x1ef>
    if(pid == 0){
    1204:	0f 84 ff 00 00 00    	je     1309 <fourfiles+0x159>
  for(pi = 0; pi < 4; pi++){
    120a:	83 c3 01             	add    $0x1,%ebx
    120d:	83 fb 04             	cmp    $0x4,%ebx
    1210:	74 06                	je     1218 <fourfiles+0x68>
    1212:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1216:	eb d3                	jmp    11eb <fourfiles+0x3b>
    wait(null);
    1218:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 2; i++){
    121b:	31 ff                	xor    %edi,%edi
    wait(null);
    121d:	6a 00                	push   $0x0
    121f:	e8 56 2c 00 00       	call   3e7a <wait>
    1224:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    122b:	e8 4a 2c 00 00       	call   3e7a <wait>
    1230:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1237:	e8 3e 2c 00 00       	call   3e7a <wait>
    123c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1243:	e8 32 2c 00 00       	call   3e7a <wait>
    1248:	83 c4 10             	add    $0x10,%esp
    124b:	c7 45 d0 9e 47 00 00 	movl   $0x479e,-0x30(%ebp)
    fd = open(fname, 0);
    1252:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1255:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    1257:	6a 00                	push   $0x0
    1259:	ff 75 d0             	pushl  -0x30(%ebp)
    125c:	e8 51 2c 00 00       	call   3eb2 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1261:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    1264:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1267:	89 f6                	mov    %esi,%esi
    1269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1270:	83 ec 04             	sub    $0x4,%esp
    1273:	68 00 20 00 00       	push   $0x2000
    1278:	68 c0 8b 00 00       	push   $0x8bc0
    127d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1280:	e8 05 2c 00 00       	call   3e8a <read>
    1285:	83 c4 10             	add    $0x10,%esp
    1288:	85 c0                	test   %eax,%eax
    128a:	7e 26                	jle    12b2 <fourfiles+0x102>
      for(j = 0; j < n; j++){
    128c:	31 d2                	xor    %edx,%edx
    128e:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    1290:	0f be b2 c0 8b 00 00 	movsbl 0x8bc0(%edx),%esi
    1297:	83 ff 01             	cmp    $0x1,%edi
    129a:	19 c9                	sbb    %ecx,%ecx
    129c:	83 c1 31             	add    $0x31,%ecx
    129f:	39 ce                	cmp    %ecx,%esi
    12a1:	0f 85 c3 00 00 00    	jne    136a <fourfiles+0x1ba>
      for(j = 0; j < n; j++){
    12a7:	83 c2 01             	add    $0x1,%edx
    12aa:	39 d0                	cmp    %edx,%eax
    12ac:	75 e2                	jne    1290 <fourfiles+0xe0>
      total += n;
    12ae:	01 c3                	add    %eax,%ebx
    12b0:	eb be                	jmp    1270 <fourfiles+0xc0>
    close(fd);
    12b2:	83 ec 0c             	sub    $0xc,%esp
    12b5:	ff 75 d4             	pushl  -0x2c(%ebp)
    12b8:	e8 dd 2b 00 00       	call   3e9a <close>
    if(total != 12*500){
    12bd:	83 c4 10             	add    $0x10,%esp
    12c0:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    12c6:	0f 85 ed 00 00 00    	jne    13b9 <fourfiles+0x209>
    unlink(fname);
    12cc:	83 ec 0c             	sub    $0xc,%esp
    12cf:	ff 75 d0             	pushl  -0x30(%ebp)
    12d2:	e8 eb 2b 00 00       	call   3ec2 <unlink>
  for(i = 0; i < 2; i++){
    12d7:	83 c4 10             	add    $0x10,%esp
    12da:	83 ff 01             	cmp    $0x1,%edi
    12dd:	75 1a                	jne    12f9 <fourfiles+0x149>
  printf(1, "fourfiles ok\n");
    12df:	83 ec 08             	sub    $0x8,%esp
    12e2:	68 e2 47 00 00       	push   $0x47e2
    12e7:	6a 01                	push   $0x1
    12e9:	e8 f2 2c 00 00       	call   3fe0 <printf>
}
    12ee:	83 c4 10             	add    $0x10,%esp
    12f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12f4:	5b                   	pop    %ebx
    12f5:	5e                   	pop    %esi
    12f6:	5f                   	pop    %edi
    12f7:	5d                   	pop    %ebp
    12f8:	c3                   	ret    
    12f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    12fc:	bf 01 00 00 00       	mov    $0x1,%edi
    1301:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1304:	e9 49 ff ff ff       	jmp    1252 <fourfiles+0xa2>
      fd = open(fname, O_CREATE | O_RDWR);
    1309:	83 ec 08             	sub    $0x8,%esp
    130c:	68 02 02 00 00       	push   $0x202
    1311:	56                   	push   %esi
    1312:	e8 9b 2b 00 00       	call   3eb2 <open>
      if(fd < 0){
    1317:	83 c4 10             	add    $0x10,%esp
    131a:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    131c:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    131e:	78 65                	js     1385 <fourfiles+0x1d5>
      memset(buf, '0'+pi, 512);
    1320:	83 ec 04             	sub    $0x4,%esp
    1323:	83 c3 30             	add    $0x30,%ebx
    1326:	68 00 02 00 00       	push   $0x200
    132b:	53                   	push   %ebx
    132c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1331:	68 c0 8b 00 00       	push   $0x8bc0
    1336:	e8 95 29 00 00       	call   3cd0 <memset>
    133b:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    133e:	83 ec 04             	sub    $0x4,%esp
    1341:	68 f4 01 00 00       	push   $0x1f4
    1346:	68 c0 8b 00 00       	push   $0x8bc0
    134b:	56                   	push   %esi
    134c:	e8 41 2b 00 00       	call   3e92 <write>
    1351:	83 c4 10             	add    $0x10,%esp
    1354:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1359:	75 78                	jne    13d3 <fourfiles+0x223>
      for(i = 0; i < 12; i++){
    135b:	83 eb 01             	sub    $0x1,%ebx
    135e:	75 de                	jne    133e <fourfiles+0x18e>
      exit(0);
    1360:	83 ec 0c             	sub    $0xc,%esp
    1363:	6a 00                	push   $0x0
    1365:	e8 08 2b 00 00       	call   3e72 <exit>
          printf(1, "wrong char\n");
    136a:	83 ec 08             	sub    $0x8,%esp
    136d:	68 c5 47 00 00       	push   $0x47c5
    1372:	6a 01                	push   $0x1
    1374:	e8 67 2c 00 00       	call   3fe0 <printf>
          exit(0);
    1379:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1380:	e8 ed 2a 00 00       	call   3e72 <exit>
        printf(1, "create failed\n");
    1385:	51                   	push   %ecx
    1386:	51                   	push   %ecx
    1387:	68 3f 4a 00 00       	push   $0x4a3f
    138c:	6a 01                	push   $0x1
    138e:	e8 4d 2c 00 00       	call   3fe0 <printf>
        exit(0);
    1393:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    139a:	e8 d3 2a 00 00       	call   3e72 <exit>
      printf(1, "fork failed\n");
    139f:	53                   	push   %ebx
    13a0:	53                   	push   %ebx
    13a1:	68 79 52 00 00       	push   $0x5279
    13a6:	6a 01                	push   $0x1
    13a8:	e8 33 2c 00 00       	call   3fe0 <printf>
      exit(0);
    13ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13b4:	e8 b9 2a 00 00       	call   3e72 <exit>
      printf(1, "wrong length %d\n", total);
    13b9:	50                   	push   %eax
    13ba:	53                   	push   %ebx
    13bb:	68 d1 47 00 00       	push   $0x47d1
    13c0:	6a 01                	push   $0x1
    13c2:	e8 19 2c 00 00       	call   3fe0 <printf>
      exit(0);
    13c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13ce:	e8 9f 2a 00 00       	call   3e72 <exit>
          printf(1, "write failed %d\n", n);
    13d3:	52                   	push   %edx
    13d4:	50                   	push   %eax
    13d5:	68 b4 47 00 00       	push   $0x47b4
    13da:	6a 01                	push   $0x1
    13dc:	e8 ff 2b 00 00       	call   3fe0 <printf>
          exit(0);
    13e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13e8:	e8 85 2a 00 00       	call   3e72 <exit>
    13ed:	8d 76 00             	lea    0x0(%esi),%esi

000013f0 <createdelete>:
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    13f6:	31 db                	xor    %ebx,%ebx
{
    13f8:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    13fb:	68 f0 47 00 00       	push   $0x47f0
    1400:	6a 01                	push   $0x1
    1402:	e8 d9 2b 00 00       	call   3fe0 <printf>
    1407:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    140a:	e8 5b 2a 00 00       	call   3e6a <fork>
    if(pid < 0){
    140f:	85 c0                	test   %eax,%eax
    1411:	0f 88 f9 01 00 00    	js     1610 <createdelete+0x220>
    if(pid == 0){
    1417:	0f 84 2b 01 00 00    	je     1548 <createdelete+0x158>
  for(pi = 0; pi < 4; pi++){
    141d:	83 c3 01             	add    $0x1,%ebx
    1420:	83 fb 04             	cmp    $0x4,%ebx
    1423:	75 e5                	jne    140a <createdelete+0x1a>
    wait(null);
    1425:	83 ec 0c             	sub    $0xc,%esp
    1428:	8d 7d c8             	lea    -0x38(%ebp),%edi
  name[0] = name[1] = name[2] = 0;
    142b:	be ff ff ff ff       	mov    $0xffffffff,%esi
    wait(null);
    1430:	6a 00                	push   $0x0
    1432:	e8 43 2a 00 00       	call   3e7a <wait>
    1437:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    143e:	e8 37 2a 00 00       	call   3e7a <wait>
    1443:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    144a:	e8 2b 2a 00 00       	call   3e7a <wait>
    144f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1456:	e8 1f 2a 00 00       	call   3e7a <wait>
  name[0] = name[1] = name[2] = 0;
    145b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    145f:	83 c4 10             	add    $0x10,%esp
    1462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1468:	8d 46 31             	lea    0x31(%esi),%eax
    146b:	88 45 c7             	mov    %al,-0x39(%ebp)
    146e:	8d 46 01             	lea    0x1(%esi),%eax
    1471:	83 f8 09             	cmp    $0x9,%eax
    1474:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1477:	0f 9f c3             	setg   %bl
    147a:	85 c0                	test   %eax,%eax
    147c:	0f 94 c0             	sete   %al
    147f:	09 c3                	or     %eax,%ebx
    1481:	88 5d c6             	mov    %bl,-0x3a(%ebp)
      name[2] = '\0';
    1484:	bb 70 00 00 00       	mov    $0x70,%ebx
      name[1] = '0' + i;
    1489:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    148d:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    1490:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    1493:	6a 00                	push   $0x0
    1495:	57                   	push   %edi
      name[1] = '0' + i;
    1496:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1499:	e8 14 2a 00 00       	call   3eb2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    149e:	83 c4 10             	add    $0x10,%esp
    14a1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    14a5:	0f 84 85 00 00 00    	je     1530 <createdelete+0x140>
    14ab:	85 c0                	test   %eax,%eax
    14ad:	0f 88 27 01 00 00    	js     15da <createdelete+0x1ea>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    14b3:	83 fe 08             	cmp    $0x8,%esi
    14b6:	0f 86 76 01 00 00    	jbe    1632 <createdelete+0x242>
        close(fd);
    14bc:	83 ec 0c             	sub    $0xc,%esp
    14bf:	50                   	push   %eax
    14c0:	e8 d5 29 00 00       	call   3e9a <close>
    14c5:	83 c4 10             	add    $0x10,%esp
    14c8:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    14cb:	80 fb 74             	cmp    $0x74,%bl
    14ce:	75 b9                	jne    1489 <createdelete+0x99>
    14d0:	8b 75 c0             	mov    -0x40(%ebp),%esi
  for(i = 0; i < N; i++){
    14d3:	83 fe 13             	cmp    $0x13,%esi
    14d6:	75 90                	jne    1468 <createdelete+0x78>
    14d8:	be 70 00 00 00       	mov    $0x70,%esi
    14dd:	8d 76 00             	lea    0x0(%esi),%esi
    14e0:	8d 46 c0             	lea    -0x40(%esi),%eax
  name[0] = name[1] = name[2] = 0;
    14e3:	bb 04 00 00 00       	mov    $0x4,%ebx
    14e8:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    14eb:	89 f0                	mov    %esi,%eax
      unlink(name);
    14ed:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    14f0:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    14f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    14f7:	57                   	push   %edi
      name[1] = '0' + i;
    14f8:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    14fb:	e8 c2 29 00 00       	call   3ec2 <unlink>
    for(pi = 0; pi < 4; pi++){
    1500:	83 c4 10             	add    $0x10,%esp
    1503:	83 eb 01             	sub    $0x1,%ebx
    1506:	75 e3                	jne    14eb <createdelete+0xfb>
    1508:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    150b:	89 f0                	mov    %esi,%eax
    150d:	3c 84                	cmp    $0x84,%al
    150f:	75 cf                	jne    14e0 <createdelete+0xf0>
  printf(1, "createdelete ok\n");
    1511:	83 ec 08             	sub    $0x8,%esp
    1514:	68 03 48 00 00       	push   $0x4803
    1519:	6a 01                	push   $0x1
    151b:	e8 c0 2a 00 00       	call   3fe0 <printf>
}
    1520:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1523:	5b                   	pop    %ebx
    1524:	5e                   	pop    %esi
    1525:	5f                   	pop    %edi
    1526:	5d                   	pop    %ebp
    1527:	c3                   	ret    
    1528:	90                   	nop
    1529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1530:	83 fe 08             	cmp    $0x8,%esi
    1533:	0f 86 f1 00 00 00    	jbe    162a <createdelete+0x23a>
      if(fd >= 0)
    1539:	85 c0                	test   %eax,%eax
    153b:	78 8b                	js     14c8 <createdelete+0xd8>
    153d:	e9 7a ff ff ff       	jmp    14bc <createdelete+0xcc>
    1542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    1548:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    154b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    154f:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    1552:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    1555:	31 db                	xor    %ebx,%ebx
    1557:	eb 0f                	jmp    1568 <createdelete+0x178>
    1559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1560:	83 fb 13             	cmp    $0x13,%ebx
    1563:	74 6b                	je     15d0 <createdelete+0x1e0>
    1565:	83 c3 01             	add    $0x1,%ebx
        fd = open(name, O_CREATE | O_RDWR);
    1568:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    156b:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    156e:	68 02 02 00 00       	push   $0x202
    1573:	57                   	push   %edi
        name[1] = '0' + i;
    1574:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1577:	e8 36 29 00 00       	call   3eb2 <open>
        if(fd < 0){
    157c:	83 c4 10             	add    $0x10,%esp
    157f:	85 c0                	test   %eax,%eax
    1581:	78 73                	js     15f6 <createdelete+0x206>
        close(fd);
    1583:	83 ec 0c             	sub    $0xc,%esp
    1586:	50                   	push   %eax
    1587:	e8 0e 29 00 00       	call   3e9a <close>
        if(i > 0 && (i % 2 ) == 0){
    158c:	83 c4 10             	add    $0x10,%esp
    158f:	85 db                	test   %ebx,%ebx
    1591:	74 d2                	je     1565 <createdelete+0x175>
    1593:	f6 c3 01             	test   $0x1,%bl
    1596:	75 c8                	jne    1560 <createdelete+0x170>
          if(unlink(name) < 0){
    1598:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    159b:	89 d8                	mov    %ebx,%eax
    159d:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    159f:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    15a0:	83 c0 30             	add    $0x30,%eax
    15a3:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    15a6:	e8 17 29 00 00       	call   3ec2 <unlink>
    15ab:	83 c4 10             	add    $0x10,%esp
    15ae:	85 c0                	test   %eax,%eax
    15b0:	79 ae                	jns    1560 <createdelete+0x170>
            printf(1, "unlink failed\n");
    15b2:	52                   	push   %edx
    15b3:	52                   	push   %edx
    15b4:	68 f1 43 00 00       	push   $0x43f1
    15b9:	6a 01                	push   $0x1
    15bb:	e8 20 2a 00 00       	call   3fe0 <printf>
            exit(0);
    15c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15c7:	e8 a6 28 00 00       	call   3e72 <exit>
    15cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      exit(0);
    15d0:	83 ec 0c             	sub    $0xc,%esp
    15d3:	6a 00                	push   $0x0
    15d5:	e8 98 28 00 00       	call   3e72 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    15da:	83 ec 04             	sub    $0x4,%esp
    15dd:	57                   	push   %edi
    15de:	68 b0 54 00 00       	push   $0x54b0
    15e3:	6a 01                	push   $0x1
    15e5:	e8 f6 29 00 00       	call   3fe0 <printf>
        exit(0);
    15ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15f1:	e8 7c 28 00 00       	call   3e72 <exit>
          printf(1, "create failed\n");
    15f6:	51                   	push   %ecx
    15f7:	51                   	push   %ecx
    15f8:	68 3f 4a 00 00       	push   $0x4a3f
    15fd:	6a 01                	push   $0x1
    15ff:	e8 dc 29 00 00       	call   3fe0 <printf>
          exit(0);
    1604:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    160b:	e8 62 28 00 00       	call   3e72 <exit>
      printf(1, "fork failed\n");
    1610:	53                   	push   %ebx
    1611:	53                   	push   %ebx
    1612:	68 79 52 00 00       	push   $0x5279
    1617:	6a 01                	push   $0x1
    1619:	e8 c2 29 00 00       	call   3fe0 <printf>
      exit(0);
    161e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1625:	e8 48 28 00 00       	call   3e72 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    162a:	85 c0                	test   %eax,%eax
    162c:	0f 88 96 fe ff ff    	js     14c8 <createdelete+0xd8>
        printf(1, "oops createdelete %s did exist\n", name);
    1632:	50                   	push   %eax
    1633:	57                   	push   %edi
    1634:	68 d4 54 00 00       	push   $0x54d4
    1639:	6a 01                	push   $0x1
    163b:	e8 a0 29 00 00       	call   3fe0 <printf>
        exit(0);
    1640:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1647:	e8 26 28 00 00       	call   3e72 <exit>
    164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001650 <unlinkread>:
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	56                   	push   %esi
    1654:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1655:	83 ec 08             	sub    $0x8,%esp
    1658:	68 14 48 00 00       	push   $0x4814
    165d:	6a 01                	push   $0x1
    165f:	e8 7c 29 00 00       	call   3fe0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1664:	5b                   	pop    %ebx
    1665:	5e                   	pop    %esi
    1666:	68 02 02 00 00       	push   $0x202
    166b:	68 25 48 00 00       	push   $0x4825
    1670:	e8 3d 28 00 00       	call   3eb2 <open>
  if(fd < 0){
    1675:	83 c4 10             	add    $0x10,%esp
    1678:	85 c0                	test   %eax,%eax
    167a:	0f 88 e6 00 00 00    	js     1766 <unlinkread+0x116>
  write(fd, "hello", 5);
    1680:	83 ec 04             	sub    $0x4,%esp
    1683:	89 c3                	mov    %eax,%ebx
    1685:	6a 05                	push   $0x5
    1687:	68 4a 48 00 00       	push   $0x484a
    168c:	50                   	push   %eax
    168d:	e8 00 28 00 00       	call   3e92 <write>
  close(fd);
    1692:	89 1c 24             	mov    %ebx,(%esp)
    1695:	e8 00 28 00 00       	call   3e9a <close>
  fd = open("unlinkread", O_RDWR);
    169a:	58                   	pop    %eax
    169b:	5a                   	pop    %edx
    169c:	6a 02                	push   $0x2
    169e:	68 25 48 00 00       	push   $0x4825
    16a3:	e8 0a 28 00 00       	call   3eb2 <open>
  if(fd < 0){
    16a8:	83 c4 10             	add    $0x10,%esp
    16ab:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    16ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16af:	0f 88 33 01 00 00    	js     17e8 <unlinkread+0x198>
  if(unlink("unlinkread") != 0){
    16b5:	83 ec 0c             	sub    $0xc,%esp
    16b8:	68 25 48 00 00       	push   $0x4825
    16bd:	e8 00 28 00 00       	call   3ec2 <unlink>
    16c2:	83 c4 10             	add    $0x10,%esp
    16c5:	85 c0                	test   %eax,%eax
    16c7:	0f 85 01 01 00 00    	jne    17ce <unlinkread+0x17e>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    16cd:	83 ec 08             	sub    $0x8,%esp
    16d0:	68 02 02 00 00       	push   $0x202
    16d5:	68 25 48 00 00       	push   $0x4825
    16da:	e8 d3 27 00 00       	call   3eb2 <open>
  write(fd1, "yyy", 3);
    16df:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    16e2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    16e4:	6a 03                	push   $0x3
    16e6:	68 82 48 00 00       	push   $0x4882
    16eb:	50                   	push   %eax
    16ec:	e8 a1 27 00 00       	call   3e92 <write>
  close(fd1);
    16f1:	89 34 24             	mov    %esi,(%esp)
    16f4:	e8 a1 27 00 00       	call   3e9a <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    16f9:	83 c4 0c             	add    $0xc,%esp
    16fc:	68 00 20 00 00       	push   $0x2000
    1701:	68 c0 8b 00 00       	push   $0x8bc0
    1706:	53                   	push   %ebx
    1707:	e8 7e 27 00 00       	call   3e8a <read>
    170c:	83 c4 10             	add    $0x10,%esp
    170f:	83 f8 05             	cmp    $0x5,%eax
    1712:	0f 85 9c 00 00 00    	jne    17b4 <unlinkread+0x164>
  if(buf[0] != 'h'){
    1718:	80 3d c0 8b 00 00 68 	cmpb   $0x68,0x8bc0
    171f:	75 79                	jne    179a <unlinkread+0x14a>
  if(write(fd, buf, 10) != 10){
    1721:	83 ec 04             	sub    $0x4,%esp
    1724:	6a 0a                	push   $0xa
    1726:	68 c0 8b 00 00       	push   $0x8bc0
    172b:	53                   	push   %ebx
    172c:	e8 61 27 00 00       	call   3e92 <write>
    1731:	83 c4 10             	add    $0x10,%esp
    1734:	83 f8 0a             	cmp    $0xa,%eax
    1737:	75 47                	jne    1780 <unlinkread+0x130>
  close(fd);
    1739:	83 ec 0c             	sub    $0xc,%esp
    173c:	53                   	push   %ebx
    173d:	e8 58 27 00 00       	call   3e9a <close>
  unlink("unlinkread");
    1742:	c7 04 24 25 48 00 00 	movl   $0x4825,(%esp)
    1749:	e8 74 27 00 00       	call   3ec2 <unlink>
  printf(1, "unlinkread ok\n");
    174e:	58                   	pop    %eax
    174f:	5a                   	pop    %edx
    1750:	68 cd 48 00 00       	push   $0x48cd
    1755:	6a 01                	push   $0x1
    1757:	e8 84 28 00 00       	call   3fe0 <printf>
}
    175c:	83 c4 10             	add    $0x10,%esp
    175f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1762:	5b                   	pop    %ebx
    1763:	5e                   	pop    %esi
    1764:	5d                   	pop    %ebp
    1765:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1766:	51                   	push   %ecx
    1767:	51                   	push   %ecx
    1768:	68 30 48 00 00       	push   $0x4830
    176d:	6a 01                	push   $0x1
    176f:	e8 6c 28 00 00       	call   3fe0 <printf>
    exit(0);
    1774:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    177b:	e8 f2 26 00 00       	call   3e72 <exit>
    printf(1, "unlinkread write failed\n");
    1780:	51                   	push   %ecx
    1781:	51                   	push   %ecx
    1782:	68 b4 48 00 00       	push   $0x48b4
    1787:	6a 01                	push   $0x1
    1789:	e8 52 28 00 00       	call   3fe0 <printf>
    exit(0);
    178e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1795:	e8 d8 26 00 00       	call   3e72 <exit>
    printf(1, "unlinkread wrong data\n");
    179a:	53                   	push   %ebx
    179b:	53                   	push   %ebx
    179c:	68 9d 48 00 00       	push   $0x489d
    17a1:	6a 01                	push   $0x1
    17a3:	e8 38 28 00 00       	call   3fe0 <printf>
    exit(0);
    17a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17af:	e8 be 26 00 00       	call   3e72 <exit>
    printf(1, "unlinkread read failed");
    17b4:	56                   	push   %esi
    17b5:	56                   	push   %esi
    17b6:	68 86 48 00 00       	push   $0x4886
    17bb:	6a 01                	push   $0x1
    17bd:	e8 1e 28 00 00       	call   3fe0 <printf>
    exit(0);
    17c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17c9:	e8 a4 26 00 00       	call   3e72 <exit>
    printf(1, "unlink unlinkread failed\n");
    17ce:	50                   	push   %eax
    17cf:	50                   	push   %eax
    17d0:	68 68 48 00 00       	push   $0x4868
    17d5:	6a 01                	push   $0x1
    17d7:	e8 04 28 00 00       	call   3fe0 <printf>
    exit(0);
    17dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17e3:	e8 8a 26 00 00       	call   3e72 <exit>
    printf(1, "open unlinkread failed\n");
    17e8:	50                   	push   %eax
    17e9:	50                   	push   %eax
    17ea:	68 50 48 00 00       	push   $0x4850
    17ef:	6a 01                	push   $0x1
    17f1:	e8 ea 27 00 00       	call   3fe0 <printf>
    exit(0);
    17f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17fd:	e8 70 26 00 00       	call   3e72 <exit>
    1802:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001810 <linktest>:
{
    1810:	55                   	push   %ebp
    1811:	89 e5                	mov    %esp,%ebp
    1813:	53                   	push   %ebx
    1814:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    1817:	68 dc 48 00 00       	push   $0x48dc
    181c:	6a 01                	push   $0x1
    181e:	e8 bd 27 00 00       	call   3fe0 <printf>
  unlink("lf1");
    1823:	c7 04 24 e6 48 00 00 	movl   $0x48e6,(%esp)
    182a:	e8 93 26 00 00       	call   3ec2 <unlink>
  unlink("lf2");
    182f:	c7 04 24 ea 48 00 00 	movl   $0x48ea,(%esp)
    1836:	e8 87 26 00 00       	call   3ec2 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    183b:	58                   	pop    %eax
    183c:	5a                   	pop    %edx
    183d:	68 02 02 00 00       	push   $0x202
    1842:	68 e6 48 00 00       	push   $0x48e6
    1847:	e8 66 26 00 00       	call   3eb2 <open>
  if(fd < 0){
    184c:	83 c4 10             	add    $0x10,%esp
    184f:	85 c0                	test   %eax,%eax
    1851:	0f 88 1e 01 00 00    	js     1975 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1857:	83 ec 04             	sub    $0x4,%esp
    185a:	89 c3                	mov    %eax,%ebx
    185c:	6a 05                	push   $0x5
    185e:	68 4a 48 00 00       	push   $0x484a
    1863:	50                   	push   %eax
    1864:	e8 29 26 00 00       	call   3e92 <write>
    1869:	83 c4 10             	add    $0x10,%esp
    186c:	83 f8 05             	cmp    $0x5,%eax
    186f:	0f 85 d0 01 00 00    	jne    1a45 <linktest+0x235>
  close(fd);
    1875:	83 ec 0c             	sub    $0xc,%esp
    1878:	53                   	push   %ebx
    1879:	e8 1c 26 00 00       	call   3e9a <close>
  if(link("lf1", "lf2") < 0){
    187e:	5b                   	pop    %ebx
    187f:	58                   	pop    %eax
    1880:	68 ea 48 00 00       	push   $0x48ea
    1885:	68 e6 48 00 00       	push   $0x48e6
    188a:	e8 43 26 00 00       	call   3ed2 <link>
    188f:	83 c4 10             	add    $0x10,%esp
    1892:	85 c0                	test   %eax,%eax
    1894:	0f 88 91 01 00 00    	js     1a2b <linktest+0x21b>
  unlink("lf1");
    189a:	83 ec 0c             	sub    $0xc,%esp
    189d:	68 e6 48 00 00       	push   $0x48e6
    18a2:	e8 1b 26 00 00       	call   3ec2 <unlink>
  if(open("lf1", 0) >= 0){
    18a7:	58                   	pop    %eax
    18a8:	5a                   	pop    %edx
    18a9:	6a 00                	push   $0x0
    18ab:	68 e6 48 00 00       	push   $0x48e6
    18b0:	e8 fd 25 00 00       	call   3eb2 <open>
    18b5:	83 c4 10             	add    $0x10,%esp
    18b8:	85 c0                	test   %eax,%eax
    18ba:	0f 89 51 01 00 00    	jns    1a11 <linktest+0x201>
  fd = open("lf2", 0);
    18c0:	83 ec 08             	sub    $0x8,%esp
    18c3:	6a 00                	push   $0x0
    18c5:	68 ea 48 00 00       	push   $0x48ea
    18ca:	e8 e3 25 00 00       	call   3eb2 <open>
  if(fd < 0){
    18cf:	83 c4 10             	add    $0x10,%esp
    18d2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    18d4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    18d6:	0f 88 1b 01 00 00    	js     19f7 <linktest+0x1e7>
  if(read(fd, buf, sizeof(buf)) != 5){
    18dc:	83 ec 04             	sub    $0x4,%esp
    18df:	68 00 20 00 00       	push   $0x2000
    18e4:	68 c0 8b 00 00       	push   $0x8bc0
    18e9:	50                   	push   %eax
    18ea:	e8 9b 25 00 00       	call   3e8a <read>
    18ef:	83 c4 10             	add    $0x10,%esp
    18f2:	83 f8 05             	cmp    $0x5,%eax
    18f5:	0f 85 e2 00 00 00    	jne    19dd <linktest+0x1cd>
  close(fd);
    18fb:	83 ec 0c             	sub    $0xc,%esp
    18fe:	53                   	push   %ebx
    18ff:	e8 96 25 00 00       	call   3e9a <close>
  if(link("lf2", "lf2") >= 0){
    1904:	58                   	pop    %eax
    1905:	5a                   	pop    %edx
    1906:	68 ea 48 00 00       	push   $0x48ea
    190b:	68 ea 48 00 00       	push   $0x48ea
    1910:	e8 bd 25 00 00       	call   3ed2 <link>
    1915:	83 c4 10             	add    $0x10,%esp
    1918:	85 c0                	test   %eax,%eax
    191a:	0f 89 a3 00 00 00    	jns    19c3 <linktest+0x1b3>
  unlink("lf2");
    1920:	83 ec 0c             	sub    $0xc,%esp
    1923:	68 ea 48 00 00       	push   $0x48ea
    1928:	e8 95 25 00 00       	call   3ec2 <unlink>
  if(link("lf2", "lf1") >= 0){
    192d:	59                   	pop    %ecx
    192e:	5b                   	pop    %ebx
    192f:	68 e6 48 00 00       	push   $0x48e6
    1934:	68 ea 48 00 00       	push   $0x48ea
    1939:	e8 94 25 00 00       	call   3ed2 <link>
    193e:	83 c4 10             	add    $0x10,%esp
    1941:	85 c0                	test   %eax,%eax
    1943:	79 64                	jns    19a9 <linktest+0x199>
  if(link(".", "lf1") >= 0){
    1945:	83 ec 08             	sub    $0x8,%esp
    1948:	68 e6 48 00 00       	push   $0x48e6
    194d:	68 ae 4b 00 00       	push   $0x4bae
    1952:	e8 7b 25 00 00       	call   3ed2 <link>
    1957:	83 c4 10             	add    $0x10,%esp
    195a:	85 c0                	test   %eax,%eax
    195c:	79 31                	jns    198f <linktest+0x17f>
  printf(1, "linktest ok\n");
    195e:	83 ec 08             	sub    $0x8,%esp
    1961:	68 84 49 00 00       	push   $0x4984
    1966:	6a 01                	push   $0x1
    1968:	e8 73 26 00 00       	call   3fe0 <printf>
}
    196d:	83 c4 10             	add    $0x10,%esp
    1970:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1973:	c9                   	leave  
    1974:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1975:	50                   	push   %eax
    1976:	50                   	push   %eax
    1977:	68 ee 48 00 00       	push   $0x48ee
    197c:	6a 01                	push   $0x1
    197e:	e8 5d 26 00 00       	call   3fe0 <printf>
    exit(0);
    1983:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    198a:	e8 e3 24 00 00       	call   3e72 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    198f:	50                   	push   %eax
    1990:	50                   	push   %eax
    1991:	68 68 49 00 00       	push   $0x4968
    1996:	6a 01                	push   $0x1
    1998:	e8 43 26 00 00       	call   3fe0 <printf>
    exit(0);
    199d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19a4:	e8 c9 24 00 00       	call   3e72 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    19a9:	52                   	push   %edx
    19aa:	52                   	push   %edx
    19ab:	68 1c 55 00 00       	push   $0x551c
    19b0:	6a 01                	push   $0x1
    19b2:	e8 29 26 00 00       	call   3fe0 <printf>
    exit(0);
    19b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19be:	e8 af 24 00 00       	call   3e72 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    19c3:	50                   	push   %eax
    19c4:	50                   	push   %eax
    19c5:	68 4a 49 00 00       	push   $0x494a
    19ca:	6a 01                	push   $0x1
    19cc:	e8 0f 26 00 00       	call   3fe0 <printf>
    exit(0);
    19d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19d8:	e8 95 24 00 00       	call   3e72 <exit>
    printf(1, "read lf2 failed\n");
    19dd:	51                   	push   %ecx
    19de:	51                   	push   %ecx
    19df:	68 39 49 00 00       	push   $0x4939
    19e4:	6a 01                	push   $0x1
    19e6:	e8 f5 25 00 00       	call   3fe0 <printf>
    exit(0);
    19eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19f2:	e8 7b 24 00 00       	call   3e72 <exit>
    printf(1, "open lf2 failed\n");
    19f7:	53                   	push   %ebx
    19f8:	53                   	push   %ebx
    19f9:	68 28 49 00 00       	push   $0x4928
    19fe:	6a 01                	push   $0x1
    1a00:	e8 db 25 00 00       	call   3fe0 <printf>
    exit(0);
    1a05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a0c:	e8 61 24 00 00       	call   3e72 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    1a11:	50                   	push   %eax
    1a12:	50                   	push   %eax
    1a13:	68 f4 54 00 00       	push   $0x54f4
    1a18:	6a 01                	push   $0x1
    1a1a:	e8 c1 25 00 00       	call   3fe0 <printf>
    exit(0);
    1a1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a26:	e8 47 24 00 00       	call   3e72 <exit>
    printf(1, "link lf1 lf2 failed\n");
    1a2b:	51                   	push   %ecx
    1a2c:	51                   	push   %ecx
    1a2d:	68 13 49 00 00       	push   $0x4913
    1a32:	6a 01                	push   $0x1
    1a34:	e8 a7 25 00 00       	call   3fe0 <printf>
    exit(0);
    1a39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a40:	e8 2d 24 00 00       	call   3e72 <exit>
    printf(1, "write lf1 failed\n");
    1a45:	50                   	push   %eax
    1a46:	50                   	push   %eax
    1a47:	68 01 49 00 00       	push   $0x4901
    1a4c:	6a 01                	push   $0x1
    1a4e:	e8 8d 25 00 00       	call   3fe0 <printf>
    exit(0);
    1a53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a5a:	e8 13 24 00 00       	call   3e72 <exit>
    1a5f:	90                   	nop

00001a60 <concreate>:
{
    1a60:	55                   	push   %ebp
    1a61:	89 e5                	mov    %esp,%ebp
    1a63:	57                   	push   %edi
    1a64:	56                   	push   %esi
    1a65:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    1a66:	31 f6                	xor    %esi,%esi
    1a68:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    1a6b:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
{
    1a70:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1a73:	68 91 49 00 00       	push   $0x4991
    1a78:	6a 01                	push   $0x1
    1a7a:	e8 61 25 00 00       	call   3fe0 <printf>
  file[0] = 'C';
    1a7f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1a83:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1a87:	83 c4 10             	add    $0x10,%esp
    1a8a:	eb 54                	jmp    1ae0 <concreate+0x80>
    1a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    1a90:	89 f0                	mov    %esi,%eax
    1a92:	89 f1                	mov    %esi,%ecx
    1a94:	f7 e7                	mul    %edi
    1a96:	d1 ea                	shr    %edx
    1a98:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a9b:	29 c1                	sub    %eax,%ecx
    1a9d:	83 f9 01             	cmp    $0x1,%ecx
    1aa0:	0f 84 ca 00 00 00    	je     1b70 <concreate+0x110>
      fd = open(file, O_CREATE | O_RDWR);
    1aa6:	83 ec 08             	sub    $0x8,%esp
    1aa9:	68 02 02 00 00       	push   $0x202
    1aae:	53                   	push   %ebx
    1aaf:	e8 fe 23 00 00       	call   3eb2 <open>
      if(fd < 0){
    1ab4:	83 c4 10             	add    $0x10,%esp
    1ab7:	85 c0                	test   %eax,%eax
    1ab9:	78 6f                	js     1b2a <concreate+0xca>
      close(fd);
    1abb:	83 ec 0c             	sub    $0xc,%esp
    1abe:	50                   	push   %eax
    1abf:	e8 d6 23 00 00       	call   3e9a <close>
    1ac4:	83 c4 10             	add    $0x10,%esp
      wait(null);
    1ac7:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1aca:	83 c6 01             	add    $0x1,%esi
      wait(null);
    1acd:	6a 00                	push   $0x0
    1acf:	e8 a6 23 00 00       	call   3e7a <wait>
  for(i = 0; i < 40; i++){
    1ad4:	83 c4 10             	add    $0x10,%esp
    1ad7:	83 fe 28             	cmp    $0x28,%esi
    1ada:	0f 84 b0 00 00 00    	je     1b90 <concreate+0x130>
    unlink(file);
    1ae0:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1ae3:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1ae6:	53                   	push   %ebx
    file[1] = '0' + i;
    1ae7:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1aea:	e8 d3 23 00 00       	call   3ec2 <unlink>
    pid = fork();
    1aef:	e8 76 23 00 00       	call   3e6a <fork>
    if(pid && (i % 3) == 1){
    1af4:	83 c4 10             	add    $0x10,%esp
    1af7:	85 c0                	test   %eax,%eax
    1af9:	75 95                	jne    1a90 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    1afb:	89 f0                	mov    %esi,%eax
    1afd:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    1b02:	f7 e2                	mul    %edx
    1b04:	c1 ea 02             	shr    $0x2,%edx
    1b07:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1b0a:	29 c6                	sub    %eax,%esi
    1b0c:	83 fe 01             	cmp    $0x1,%esi
    1b0f:	74 3f                	je     1b50 <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    1b11:	83 ec 08             	sub    $0x8,%esp
    1b14:	68 02 02 00 00       	push   $0x202
    1b19:	53                   	push   %ebx
    1b1a:	e8 93 23 00 00       	call   3eb2 <open>
      if(fd < 0){
    1b1f:	83 c4 10             	add    $0x10,%esp
    1b22:	85 c0                	test   %eax,%eax
    1b24:	0f 89 5c 02 00 00    	jns    1d86 <concreate+0x326>
        printf(1, "concreate create %s failed\n", file);
    1b2a:	83 ec 04             	sub    $0x4,%esp
    1b2d:	53                   	push   %ebx
    1b2e:	68 a4 49 00 00       	push   $0x49a4
    1b33:	6a 01                	push   $0x1
    1b35:	e8 a6 24 00 00       	call   3fe0 <printf>
        exit(0);
    1b3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b41:	e8 2c 23 00 00       	call   3e72 <exit>
    1b46:	8d 76 00             	lea    0x0(%esi),%esi
    1b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    1b50:	83 ec 08             	sub    $0x8,%esp
    1b53:	53                   	push   %ebx
    1b54:	68 a1 49 00 00       	push   $0x49a1
    1b59:	e8 74 23 00 00       	call   3ed2 <link>
    1b5e:	83 c4 10             	add    $0x10,%esp
      exit(0);
    1b61:	83 ec 0c             	sub    $0xc,%esp
    1b64:	6a 00                	push   $0x0
    1b66:	e8 07 23 00 00       	call   3e72 <exit>
    1b6b:	90                   	nop
    1b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      link("C0", file);
    1b70:	83 ec 08             	sub    $0x8,%esp
    1b73:	53                   	push   %ebx
    1b74:	68 a1 49 00 00       	push   $0x49a1
    1b79:	e8 54 23 00 00       	call   3ed2 <link>
    1b7e:	83 c4 10             	add    $0x10,%esp
    1b81:	e9 41 ff ff ff       	jmp    1ac7 <concreate+0x67>
    1b86:	8d 76 00             	lea    0x0(%esi),%esi
    1b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  memset(fa, 0, sizeof(fa));
    1b90:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1b93:	83 ec 04             	sub    $0x4,%esp
    1b96:	6a 28                	push   $0x28
    1b98:	6a 00                	push   $0x0
    1b9a:	50                   	push   %eax
    1b9b:	e8 30 21 00 00       	call   3cd0 <memset>
  fd = open(".", 0);
    1ba0:	5f                   	pop    %edi
    1ba1:	58                   	pop    %eax
    1ba2:	6a 00                	push   $0x0
    1ba4:	68 ae 4b 00 00       	push   $0x4bae
    1ba9:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1bac:	e8 01 23 00 00       	call   3eb2 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    1bb1:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1bb4:	89 c6                	mov    %eax,%esi
  n = 0;
    1bb6:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1bbd:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1bc0:	83 ec 04             	sub    $0x4,%esp
    1bc3:	6a 10                	push   $0x10
    1bc5:	57                   	push   %edi
    1bc6:	56                   	push   %esi
    1bc7:	e8 be 22 00 00       	call   3e8a <read>
    1bcc:	83 c4 10             	add    $0x10,%esp
    1bcf:	85 c0                	test   %eax,%eax
    1bd1:	7e 3d                	jle    1c10 <concreate+0x1b0>
    if(de.inum == 0)
    1bd3:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1bd8:	74 e6                	je     1bc0 <concreate+0x160>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1bda:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1bde:	75 e0                	jne    1bc0 <concreate+0x160>
    1be0:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1be4:	75 da                	jne    1bc0 <concreate+0x160>
      i = de.name[1] - '0';
    1be6:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1bea:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1bed:	83 f8 27             	cmp    $0x27,%eax
    1bf0:	0f 87 73 01 00 00    	ja     1d69 <concreate+0x309>
      if(fa[i]){
    1bf6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1bfb:	0f 85 4b 01 00 00    	jne    1d4c <concreate+0x2ec>
      fa[i] = 1;
    1c01:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1c06:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1c0a:	eb b4                	jmp    1bc0 <concreate+0x160>
    1c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    1c10:	83 ec 0c             	sub    $0xc,%esp
    1c13:	56                   	push   %esi
    1c14:	e8 81 22 00 00       	call   3e9a <close>
  if(n != 40){
    1c19:	83 c4 10             	add    $0x10,%esp
    1c1c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1c20:	0f 85 0c 01 00 00    	jne    1d32 <concreate+0x2d2>
  for(i = 0; i < 40; i++){
    1c26:	31 f6                	xor    %esi,%esi
    1c28:	eb 54                	jmp    1c7e <concreate+0x21e>
    1c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    1c30:	85 ff                	test   %edi,%edi
    1c32:	74 05                	je     1c39 <concreate+0x1d9>
    1c34:	83 fa 01             	cmp    $0x1,%edx
    1c37:	74 70                	je     1ca9 <concreate+0x249>
      unlink(file);
    1c39:	83 ec 0c             	sub    $0xc,%esp
    1c3c:	53                   	push   %ebx
    1c3d:	e8 80 22 00 00       	call   3ec2 <unlink>
      unlink(file);
    1c42:	89 1c 24             	mov    %ebx,(%esp)
    1c45:	e8 78 22 00 00       	call   3ec2 <unlink>
      unlink(file);
    1c4a:	89 1c 24             	mov    %ebx,(%esp)
    1c4d:	e8 70 22 00 00       	call   3ec2 <unlink>
      unlink(file);
    1c52:	89 1c 24             	mov    %ebx,(%esp)
    1c55:	e8 68 22 00 00       	call   3ec2 <unlink>
    1c5a:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1c5d:	85 ff                	test   %edi,%edi
    1c5f:	0f 84 fc fe ff ff    	je     1b61 <concreate+0x101>
      wait(null);
    1c65:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1c68:	83 c6 01             	add    $0x1,%esi
      wait(null);
    1c6b:	6a 00                	push   $0x0
    1c6d:	e8 08 22 00 00       	call   3e7a <wait>
  for(i = 0; i < 40; i++){
    1c72:	83 c4 10             	add    $0x10,%esp
    1c75:	83 fe 28             	cmp    $0x28,%esi
    1c78:	0f 84 82 00 00 00    	je     1d00 <concreate+0x2a0>
    file[1] = '0' + i;
    1c7e:	8d 46 30             	lea    0x30(%esi),%eax
    1c81:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1c84:	e8 e1 21 00 00       	call   3e6a <fork>
    if(pid < 0){
    1c89:	85 c0                	test   %eax,%eax
    pid = fork();
    1c8b:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1c8d:	0f 88 84 00 00 00    	js     1d17 <concreate+0x2b7>
    if(((i % 3) == 0 && pid == 0) ||
    1c93:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1c98:	f7 e6                	mul    %esi
    1c9a:	d1 ea                	shr    %edx
    1c9c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1c9f:	89 f2                	mov    %esi,%edx
    1ca1:	29 c2                	sub    %eax,%edx
    1ca3:	89 d0                	mov    %edx,%eax
    1ca5:	09 f8                	or     %edi,%eax
    1ca7:	75 87                	jne    1c30 <concreate+0x1d0>
      close(open(file, 0));
    1ca9:	83 ec 08             	sub    $0x8,%esp
    1cac:	6a 00                	push   $0x0
    1cae:	53                   	push   %ebx
    1caf:	e8 fe 21 00 00       	call   3eb2 <open>
    1cb4:	89 04 24             	mov    %eax,(%esp)
    1cb7:	e8 de 21 00 00       	call   3e9a <close>
      close(open(file, 0));
    1cbc:	58                   	pop    %eax
    1cbd:	5a                   	pop    %edx
    1cbe:	6a 00                	push   $0x0
    1cc0:	53                   	push   %ebx
    1cc1:	e8 ec 21 00 00       	call   3eb2 <open>
    1cc6:	89 04 24             	mov    %eax,(%esp)
    1cc9:	e8 cc 21 00 00       	call   3e9a <close>
      close(open(file, 0));
    1cce:	59                   	pop    %ecx
    1ccf:	58                   	pop    %eax
    1cd0:	6a 00                	push   $0x0
    1cd2:	53                   	push   %ebx
    1cd3:	e8 da 21 00 00       	call   3eb2 <open>
    1cd8:	89 04 24             	mov    %eax,(%esp)
    1cdb:	e8 ba 21 00 00       	call   3e9a <close>
      close(open(file, 0));
    1ce0:	58                   	pop    %eax
    1ce1:	5a                   	pop    %edx
    1ce2:	6a 00                	push   $0x0
    1ce4:	53                   	push   %ebx
    1ce5:	e8 c8 21 00 00       	call   3eb2 <open>
    1cea:	89 04 24             	mov    %eax,(%esp)
    1ced:	e8 a8 21 00 00       	call   3e9a <close>
    1cf2:	83 c4 10             	add    $0x10,%esp
    1cf5:	e9 63 ff ff ff       	jmp    1c5d <concreate+0x1fd>
    1cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  printf(1, "concreate ok\n");
    1d00:	83 ec 08             	sub    $0x8,%esp
    1d03:	68 f6 49 00 00       	push   $0x49f6
    1d08:	6a 01                	push   $0x1
    1d0a:	e8 d1 22 00 00       	call   3fe0 <printf>
}
    1d0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d12:	5b                   	pop    %ebx
    1d13:	5e                   	pop    %esi
    1d14:	5f                   	pop    %edi
    1d15:	5d                   	pop    %ebp
    1d16:	c3                   	ret    
      printf(1, "fork failed\n");
    1d17:	83 ec 08             	sub    $0x8,%esp
    1d1a:	68 79 52 00 00       	push   $0x5279
    1d1f:	6a 01                	push   $0x1
    1d21:	e8 ba 22 00 00       	call   3fe0 <printf>
      exit(0);
    1d26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d2d:	e8 40 21 00 00       	call   3e72 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1d32:	51                   	push   %ecx
    1d33:	51                   	push   %ecx
    1d34:	68 40 55 00 00       	push   $0x5540
    1d39:	6a 01                	push   $0x1
    1d3b:	e8 a0 22 00 00       	call   3fe0 <printf>
    exit(0);
    1d40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d47:	e8 26 21 00 00       	call   3e72 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1d4c:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1d4f:	53                   	push   %ebx
    1d50:	50                   	push   %eax
    1d51:	68 d9 49 00 00       	push   $0x49d9
    1d56:	6a 01                	push   $0x1
    1d58:	e8 83 22 00 00       	call   3fe0 <printf>
        exit(0);
    1d5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d64:	e8 09 21 00 00       	call   3e72 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1d69:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1d6c:	56                   	push   %esi
    1d6d:	50                   	push   %eax
    1d6e:	68 c0 49 00 00       	push   $0x49c0
    1d73:	6a 01                	push   $0x1
    1d75:	e8 66 22 00 00       	call   3fe0 <printf>
        exit(0);
    1d7a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d81:	e8 ec 20 00 00       	call   3e72 <exit>
      close(fd);
    1d86:	83 ec 0c             	sub    $0xc,%esp
    1d89:	50                   	push   %eax
    1d8a:	e8 0b 21 00 00       	call   3e9a <close>
    1d8f:	83 c4 10             	add    $0x10,%esp
    1d92:	e9 ca fd ff ff       	jmp    1b61 <concreate+0x101>
    1d97:	89 f6                	mov    %esi,%esi
    1d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001da0 <linkunlink>:
{
    1da0:	55                   	push   %ebp
    1da1:	89 e5                	mov    %esp,%ebp
    1da3:	57                   	push   %edi
    1da4:	56                   	push   %esi
    1da5:	53                   	push   %ebx
    1da6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1da9:	68 04 4a 00 00       	push   $0x4a04
    1dae:	6a 01                	push   $0x1
    1db0:	e8 2b 22 00 00       	call   3fe0 <printf>
  unlink("x");
    1db5:	c7 04 24 91 4c 00 00 	movl   $0x4c91,(%esp)
    1dbc:	e8 01 21 00 00       	call   3ec2 <unlink>
  pid = fork();
    1dc1:	e8 a4 20 00 00       	call   3e6a <fork>
  if(pid < 0){
    1dc6:	83 c4 10             	add    $0x10,%esp
    1dc9:	85 c0                	test   %eax,%eax
  pid = fork();
    1dcb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1dce:	0f 88 b6 00 00 00    	js     1e8a <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1dd4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1dd8:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1ddd:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1de2:	19 ff                	sbb    %edi,%edi
    1de4:	83 e7 60             	and    $0x60,%edi
    1de7:	83 c7 01             	add    $0x1,%edi
    1dea:	eb 1e                	jmp    1e0a <linkunlink+0x6a>
    1dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1df0:	83 fa 01             	cmp    $0x1,%edx
    1df3:	74 7b                	je     1e70 <linkunlink+0xd0>
      unlink("x");
    1df5:	83 ec 0c             	sub    $0xc,%esp
    1df8:	68 91 4c 00 00       	push   $0x4c91
    1dfd:	e8 c0 20 00 00       	call   3ec2 <unlink>
    1e02:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1e05:	83 eb 01             	sub    $0x1,%ebx
    1e08:	74 3d                	je     1e47 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1e0a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1e10:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1e16:	89 f8                	mov    %edi,%eax
    1e18:	f7 e6                	mul    %esi
    1e1a:	d1 ea                	shr    %edx
    1e1c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1e1f:	89 fa                	mov    %edi,%edx
    1e21:	29 c2                	sub    %eax,%edx
    1e23:	75 cb                	jne    1df0 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1e25:	83 ec 08             	sub    $0x8,%esp
    1e28:	68 02 02 00 00       	push   $0x202
    1e2d:	68 91 4c 00 00       	push   $0x4c91
    1e32:	e8 7b 20 00 00       	call   3eb2 <open>
    1e37:	89 04 24             	mov    %eax,(%esp)
    1e3a:	e8 5b 20 00 00       	call   3e9a <close>
    1e3f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1e42:	83 eb 01             	sub    $0x1,%ebx
    1e45:	75 c3                	jne    1e0a <linkunlink+0x6a>
  if(pid)
    1e47:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1e4a:	85 c9                	test   %ecx,%ecx
    1e4c:	74 56                	je     1ea4 <linkunlink+0x104>
    wait(null);
    1e4e:	83 ec 0c             	sub    $0xc,%esp
    1e51:	6a 00                	push   $0x0
    1e53:	e8 22 20 00 00       	call   3e7a <wait>
  printf(1, "linkunlink ok\n");
    1e58:	58                   	pop    %eax
    1e59:	5a                   	pop    %edx
    1e5a:	68 19 4a 00 00       	push   $0x4a19
    1e5f:	6a 01                	push   $0x1
    1e61:	e8 7a 21 00 00       	call   3fe0 <printf>
}
    1e66:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e69:	5b                   	pop    %ebx
    1e6a:	5e                   	pop    %esi
    1e6b:	5f                   	pop    %edi
    1e6c:	5d                   	pop    %ebp
    1e6d:	c3                   	ret    
    1e6e:	66 90                	xchg   %ax,%ax
      link("cat", "x");
    1e70:	83 ec 08             	sub    $0x8,%esp
    1e73:	68 91 4c 00 00       	push   $0x4c91
    1e78:	68 15 4a 00 00       	push   $0x4a15
    1e7d:	e8 50 20 00 00       	call   3ed2 <link>
    1e82:	83 c4 10             	add    $0x10,%esp
    1e85:	e9 7b ff ff ff       	jmp    1e05 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1e8a:	53                   	push   %ebx
    1e8b:	53                   	push   %ebx
    1e8c:	68 79 52 00 00       	push   $0x5279
    1e91:	6a 01                	push   $0x1
    1e93:	e8 48 21 00 00       	call   3fe0 <printf>
    exit(0);
    1e98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e9f:	e8 ce 1f 00 00       	call   3e72 <exit>
    exit(0);
    1ea4:	83 ec 0c             	sub    $0xc,%esp
    1ea7:	6a 00                	push   $0x0
    1ea9:	e8 c4 1f 00 00       	call   3e72 <exit>
    1eae:	66 90                	xchg   %ax,%ax

00001eb0 <bigdir>:
{
    1eb0:	55                   	push   %ebp
    1eb1:	89 e5                	mov    %esp,%ebp
    1eb3:	57                   	push   %edi
    1eb4:	56                   	push   %esi
    1eb5:	53                   	push   %ebx
    1eb6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1eb9:	68 28 4a 00 00       	push   $0x4a28
    1ebe:	6a 01                	push   $0x1
    1ec0:	e8 1b 21 00 00       	call   3fe0 <printf>
  unlink("bd");
    1ec5:	c7 04 24 35 4a 00 00 	movl   $0x4a35,(%esp)
    1ecc:	e8 f1 1f 00 00       	call   3ec2 <unlink>
  fd = open("bd", O_CREATE);
    1ed1:	5a                   	pop    %edx
    1ed2:	59                   	pop    %ecx
    1ed3:	68 00 02 00 00       	push   $0x200
    1ed8:	68 35 4a 00 00       	push   $0x4a35
    1edd:	e8 d0 1f 00 00       	call   3eb2 <open>
  if(fd < 0){
    1ee2:	83 c4 10             	add    $0x10,%esp
    1ee5:	85 c0                	test   %eax,%eax
    1ee7:	0f 88 ec 00 00 00    	js     1fd9 <bigdir+0x129>
  close(fd);
    1eed:	83 ec 0c             	sub    $0xc,%esp
    1ef0:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1ef3:	31 f6                	xor    %esi,%esi
  close(fd);
    1ef5:	50                   	push   %eax
    1ef6:	e8 9f 1f 00 00       	call   3e9a <close>
    1efb:	83 c4 10             	add    $0x10,%esp
    1efe:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1f00:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1f02:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1f05:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1f09:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1f0c:	57                   	push   %edi
    1f0d:	68 35 4a 00 00       	push   $0x4a35
    name[1] = '0' + (i / 64);
    1f12:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1f15:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1f19:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1f1c:	89 f0                	mov    %esi,%eax
    1f1e:	83 e0 3f             	and    $0x3f,%eax
    1f21:	83 c0 30             	add    $0x30,%eax
    1f24:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1f27:	e8 a6 1f 00 00       	call   3ed2 <link>
    1f2c:	83 c4 10             	add    $0x10,%esp
    1f2f:	85 c0                	test   %eax,%eax
    1f31:	89 c3                	mov    %eax,%ebx
    1f33:	75 6e                	jne    1fa3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1f35:	83 c6 01             	add    $0x1,%esi
    1f38:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1f3e:	75 c0                	jne    1f00 <bigdir+0x50>
  unlink("bd");
    1f40:	83 ec 0c             	sub    $0xc,%esp
    1f43:	68 35 4a 00 00       	push   $0x4a35
    1f48:	e8 75 1f 00 00       	call   3ec2 <unlink>
    1f4d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1f50:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1f52:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1f55:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1f59:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1f5c:	57                   	push   %edi
    name[3] = '\0';
    1f5d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1f61:	83 c0 30             	add    $0x30,%eax
    1f64:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1f67:	89 d8                	mov    %ebx,%eax
    1f69:	83 e0 3f             	and    $0x3f,%eax
    1f6c:	83 c0 30             	add    $0x30,%eax
    1f6f:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1f72:	e8 4b 1f 00 00       	call   3ec2 <unlink>
    1f77:	83 c4 10             	add    $0x10,%esp
    1f7a:	85 c0                	test   %eax,%eax
    1f7c:	75 40                	jne    1fbe <bigdir+0x10e>
  for(i = 0; i < 500; i++){
    1f7e:	83 c3 01             	add    $0x1,%ebx
    1f81:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1f87:	75 c7                	jne    1f50 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1f89:	83 ec 08             	sub    $0x8,%esp
    1f8c:	68 77 4a 00 00       	push   $0x4a77
    1f91:	6a 01                	push   $0x1
    1f93:	e8 48 20 00 00       	call   3fe0 <printf>
}
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f9e:	5b                   	pop    %ebx
    1f9f:	5e                   	pop    %esi
    1fa0:	5f                   	pop    %edi
    1fa1:	5d                   	pop    %ebp
    1fa2:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1fa3:	83 ec 08             	sub    $0x8,%esp
    1fa6:	68 4e 4a 00 00       	push   $0x4a4e
    1fab:	6a 01                	push   $0x1
    1fad:	e8 2e 20 00 00       	call   3fe0 <printf>
      exit(0);
    1fb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fb9:	e8 b4 1e 00 00       	call   3e72 <exit>
      printf(1, "bigdir unlink failed");
    1fbe:	83 ec 08             	sub    $0x8,%esp
    1fc1:	68 62 4a 00 00       	push   $0x4a62
    1fc6:	6a 01                	push   $0x1
    1fc8:	e8 13 20 00 00       	call   3fe0 <printf>
      exit(0);
    1fcd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fd4:	e8 99 1e 00 00       	call   3e72 <exit>
    printf(1, "bigdir create failed\n");
    1fd9:	50                   	push   %eax
    1fda:	50                   	push   %eax
    1fdb:	68 38 4a 00 00       	push   $0x4a38
    1fe0:	6a 01                	push   $0x1
    1fe2:	e8 f9 1f 00 00       	call   3fe0 <printf>
    exit(0);
    1fe7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fee:	e8 7f 1e 00 00       	call   3e72 <exit>
    1ff3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002000 <subdir>:
{
    2000:	55                   	push   %ebp
    2001:	89 e5                	mov    %esp,%ebp
    2003:	53                   	push   %ebx
    2004:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    2007:	68 82 4a 00 00       	push   $0x4a82
    200c:	6a 01                	push   $0x1
    200e:	e8 cd 1f 00 00       	call   3fe0 <printf>
  unlink("ff");
    2013:	c7 04 24 0b 4b 00 00 	movl   $0x4b0b,(%esp)
    201a:	e8 a3 1e 00 00       	call   3ec2 <unlink>
  if(mkdir("dd") != 0){
    201f:	c7 04 24 a8 4b 00 00 	movl   $0x4ba8,(%esp)
    2026:	e8 af 1e 00 00       	call   3eda <mkdir>
    202b:	83 c4 10             	add    $0x10,%esp
    202e:	85 c0                	test   %eax,%eax
    2030:	0f 85 4d 06 00 00    	jne    2683 <subdir+0x683>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2036:	83 ec 08             	sub    $0x8,%esp
    2039:	68 02 02 00 00       	push   $0x202
    203e:	68 e1 4a 00 00       	push   $0x4ae1
    2043:	e8 6a 1e 00 00       	call   3eb2 <open>
  if(fd < 0){
    2048:	83 c4 10             	add    $0x10,%esp
    204b:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    204d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    204f:	0f 88 14 06 00 00    	js     2669 <subdir+0x669>
  write(fd, "ff", 2);
    2055:	83 ec 04             	sub    $0x4,%esp
    2058:	6a 02                	push   $0x2
    205a:	68 0b 4b 00 00       	push   $0x4b0b
    205f:	50                   	push   %eax
    2060:	e8 2d 1e 00 00       	call   3e92 <write>
  close(fd);
    2065:	89 1c 24             	mov    %ebx,(%esp)
    2068:	e8 2d 1e 00 00       	call   3e9a <close>
  if(unlink("dd") >= 0){
    206d:	c7 04 24 a8 4b 00 00 	movl   $0x4ba8,(%esp)
    2074:	e8 49 1e 00 00       	call   3ec2 <unlink>
    2079:	83 c4 10             	add    $0x10,%esp
    207c:	85 c0                	test   %eax,%eax
    207e:	0f 89 cb 05 00 00    	jns    264f <subdir+0x64f>
  if(mkdir("/dd/dd") != 0){
    2084:	83 ec 0c             	sub    $0xc,%esp
    2087:	68 bc 4a 00 00       	push   $0x4abc
    208c:	e8 49 1e 00 00       	call   3eda <mkdir>
    2091:	83 c4 10             	add    $0x10,%esp
    2094:	85 c0                	test   %eax,%eax
    2096:	0f 85 99 05 00 00    	jne    2635 <subdir+0x635>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    209c:	83 ec 08             	sub    $0x8,%esp
    209f:	68 02 02 00 00       	push   $0x202
    20a4:	68 de 4a 00 00       	push   $0x4ade
    20a9:	e8 04 1e 00 00       	call   3eb2 <open>
  if(fd < 0){
    20ae:	83 c4 10             	add    $0x10,%esp
    20b1:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    20b3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    20b5:	0f 88 5c 04 00 00    	js     2517 <subdir+0x517>
  write(fd, "FF", 2);
    20bb:	83 ec 04             	sub    $0x4,%esp
    20be:	6a 02                	push   $0x2
    20c0:	68 ff 4a 00 00       	push   $0x4aff
    20c5:	50                   	push   %eax
    20c6:	e8 c7 1d 00 00       	call   3e92 <write>
  close(fd);
    20cb:	89 1c 24             	mov    %ebx,(%esp)
    20ce:	e8 c7 1d 00 00       	call   3e9a <close>
  fd = open("dd/dd/../ff", 0);
    20d3:	58                   	pop    %eax
    20d4:	5a                   	pop    %edx
    20d5:	6a 00                	push   $0x0
    20d7:	68 02 4b 00 00       	push   $0x4b02
    20dc:	e8 d1 1d 00 00       	call   3eb2 <open>
  if(fd < 0){
    20e1:	83 c4 10             	add    $0x10,%esp
    20e4:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    20e6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    20e8:	0f 88 0f 04 00 00    	js     24fd <subdir+0x4fd>
  cc = read(fd, buf, sizeof(buf));
    20ee:	83 ec 04             	sub    $0x4,%esp
    20f1:	68 00 20 00 00       	push   $0x2000
    20f6:	68 c0 8b 00 00       	push   $0x8bc0
    20fb:	50                   	push   %eax
    20fc:	e8 89 1d 00 00       	call   3e8a <read>
  if(cc != 2 || buf[0] != 'f'){
    2101:	83 c4 10             	add    $0x10,%esp
    2104:	83 f8 02             	cmp    $0x2,%eax
    2107:	0f 85 3a 03 00 00    	jne    2447 <subdir+0x447>
    210d:	80 3d c0 8b 00 00 66 	cmpb   $0x66,0x8bc0
    2114:	0f 85 2d 03 00 00    	jne    2447 <subdir+0x447>
  close(fd);
    211a:	83 ec 0c             	sub    $0xc,%esp
    211d:	53                   	push   %ebx
    211e:	e8 77 1d 00 00       	call   3e9a <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2123:	5b                   	pop    %ebx
    2124:	58                   	pop    %eax
    2125:	68 42 4b 00 00       	push   $0x4b42
    212a:	68 de 4a 00 00       	push   $0x4ade
    212f:	e8 9e 1d 00 00       	call   3ed2 <link>
    2134:	83 c4 10             	add    $0x10,%esp
    2137:	85 c0                	test   %eax,%eax
    2139:	0f 85 0c 04 00 00    	jne    254b <subdir+0x54b>
  if(unlink("dd/dd/ff") != 0){
    213f:	83 ec 0c             	sub    $0xc,%esp
    2142:	68 de 4a 00 00       	push   $0x4ade
    2147:	e8 76 1d 00 00       	call   3ec2 <unlink>
    214c:	83 c4 10             	add    $0x10,%esp
    214f:	85 c0                	test   %eax,%eax
    2151:	0f 85 24 03 00 00    	jne    247b <subdir+0x47b>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2157:	83 ec 08             	sub    $0x8,%esp
    215a:	6a 00                	push   $0x0
    215c:	68 de 4a 00 00       	push   $0x4ade
    2161:	e8 4c 1d 00 00       	call   3eb2 <open>
    2166:	83 c4 10             	add    $0x10,%esp
    2169:	85 c0                	test   %eax,%eax
    216b:	0f 89 aa 04 00 00    	jns    261b <subdir+0x61b>
  if(chdir("dd") != 0){
    2171:	83 ec 0c             	sub    $0xc,%esp
    2174:	68 a8 4b 00 00       	push   $0x4ba8
    2179:	e8 64 1d 00 00       	call   3ee2 <chdir>
    217e:	83 c4 10             	add    $0x10,%esp
    2181:	85 c0                	test   %eax,%eax
    2183:	0f 85 78 04 00 00    	jne    2601 <subdir+0x601>
  if(chdir("dd/../../dd") != 0){
    2189:	83 ec 0c             	sub    $0xc,%esp
    218c:	68 76 4b 00 00       	push   $0x4b76
    2191:	e8 4c 1d 00 00       	call   3ee2 <chdir>
    2196:	83 c4 10             	add    $0x10,%esp
    2199:	85 c0                	test   %eax,%eax
    219b:	0f 85 c0 02 00 00    	jne    2461 <subdir+0x461>
  if(chdir("dd/../../../dd") != 0){
    21a1:	83 ec 0c             	sub    $0xc,%esp
    21a4:	68 9c 4b 00 00       	push   $0x4b9c
    21a9:	e8 34 1d 00 00       	call   3ee2 <chdir>
    21ae:	83 c4 10             	add    $0x10,%esp
    21b1:	85 c0                	test   %eax,%eax
    21b3:	0f 85 a8 02 00 00    	jne    2461 <subdir+0x461>
  if(chdir("./..") != 0){
    21b9:	83 ec 0c             	sub    $0xc,%esp
    21bc:	68 ab 4b 00 00       	push   $0x4bab
    21c1:	e8 1c 1d 00 00       	call   3ee2 <chdir>
    21c6:	83 c4 10             	add    $0x10,%esp
    21c9:	85 c0                	test   %eax,%eax
    21cb:	0f 85 60 03 00 00    	jne    2531 <subdir+0x531>
  fd = open("dd/dd/ffff", 0);
    21d1:	83 ec 08             	sub    $0x8,%esp
    21d4:	6a 00                	push   $0x0
    21d6:	68 42 4b 00 00       	push   $0x4b42
    21db:	e8 d2 1c 00 00       	call   3eb2 <open>
  if(fd < 0){
    21e0:	83 c4 10             	add    $0x10,%esp
    21e3:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    21e5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    21e7:	0f 88 ce 05 00 00    	js     27bb <subdir+0x7bb>
  if(read(fd, buf, sizeof(buf)) != 2){
    21ed:	83 ec 04             	sub    $0x4,%esp
    21f0:	68 00 20 00 00       	push   $0x2000
    21f5:	68 c0 8b 00 00       	push   $0x8bc0
    21fa:	50                   	push   %eax
    21fb:	e8 8a 1c 00 00       	call   3e8a <read>
    2200:	83 c4 10             	add    $0x10,%esp
    2203:	83 f8 02             	cmp    $0x2,%eax
    2206:	0f 85 95 05 00 00    	jne    27a1 <subdir+0x7a1>
  close(fd);
    220c:	83 ec 0c             	sub    $0xc,%esp
    220f:	53                   	push   %ebx
    2210:	e8 85 1c 00 00       	call   3e9a <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2215:	59                   	pop    %ecx
    2216:	5b                   	pop    %ebx
    2217:	6a 00                	push   $0x0
    2219:	68 de 4a 00 00       	push   $0x4ade
    221e:	e8 8f 1c 00 00       	call   3eb2 <open>
    2223:	83 c4 10             	add    $0x10,%esp
    2226:	85 c0                	test   %eax,%eax
    2228:	0f 89 81 02 00 00    	jns    24af <subdir+0x4af>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    222e:	83 ec 08             	sub    $0x8,%esp
    2231:	68 02 02 00 00       	push   $0x202
    2236:	68 f6 4b 00 00       	push   $0x4bf6
    223b:	e8 72 1c 00 00       	call   3eb2 <open>
    2240:	83 c4 10             	add    $0x10,%esp
    2243:	85 c0                	test   %eax,%eax
    2245:	0f 89 4a 02 00 00    	jns    2495 <subdir+0x495>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    224b:	83 ec 08             	sub    $0x8,%esp
    224e:	68 02 02 00 00       	push   $0x202
    2253:	68 1b 4c 00 00       	push   $0x4c1b
    2258:	e8 55 1c 00 00       	call   3eb2 <open>
    225d:	83 c4 10             	add    $0x10,%esp
    2260:	85 c0                	test   %eax,%eax
    2262:	0f 89 7f 03 00 00    	jns    25e7 <subdir+0x5e7>
  if(open("dd", O_CREATE) >= 0){
    2268:	83 ec 08             	sub    $0x8,%esp
    226b:	68 00 02 00 00       	push   $0x200
    2270:	68 a8 4b 00 00       	push   $0x4ba8
    2275:	e8 38 1c 00 00       	call   3eb2 <open>
    227a:	83 c4 10             	add    $0x10,%esp
    227d:	85 c0                	test   %eax,%eax
    227f:	0f 89 48 03 00 00    	jns    25cd <subdir+0x5cd>
  if(open("dd", O_RDWR) >= 0){
    2285:	83 ec 08             	sub    $0x8,%esp
    2288:	6a 02                	push   $0x2
    228a:	68 a8 4b 00 00       	push   $0x4ba8
    228f:	e8 1e 1c 00 00       	call   3eb2 <open>
    2294:	83 c4 10             	add    $0x10,%esp
    2297:	85 c0                	test   %eax,%eax
    2299:	0f 89 14 03 00 00    	jns    25b3 <subdir+0x5b3>
  if(open("dd", O_WRONLY) >= 0){
    229f:	83 ec 08             	sub    $0x8,%esp
    22a2:	6a 01                	push   $0x1
    22a4:	68 a8 4b 00 00       	push   $0x4ba8
    22a9:	e8 04 1c 00 00       	call   3eb2 <open>
    22ae:	83 c4 10             	add    $0x10,%esp
    22b1:	85 c0                	test   %eax,%eax
    22b3:	0f 89 e0 02 00 00    	jns    2599 <subdir+0x599>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    22b9:	83 ec 08             	sub    $0x8,%esp
    22bc:	68 8a 4c 00 00       	push   $0x4c8a
    22c1:	68 f6 4b 00 00       	push   $0x4bf6
    22c6:	e8 07 1c 00 00       	call   3ed2 <link>
    22cb:	83 c4 10             	add    $0x10,%esp
    22ce:	85 c0                	test   %eax,%eax
    22d0:	0f 84 a9 02 00 00    	je     257f <subdir+0x57f>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    22d6:	83 ec 08             	sub    $0x8,%esp
    22d9:	68 8a 4c 00 00       	push   $0x4c8a
    22de:	68 1b 4c 00 00       	push   $0x4c1b
    22e3:	e8 ea 1b 00 00       	call   3ed2 <link>
    22e8:	83 c4 10             	add    $0x10,%esp
    22eb:	85 c0                	test   %eax,%eax
    22ed:	0f 84 72 02 00 00    	je     2565 <subdir+0x565>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    22f3:	83 ec 08             	sub    $0x8,%esp
    22f6:	68 42 4b 00 00       	push   $0x4b42
    22fb:	68 e1 4a 00 00       	push   $0x4ae1
    2300:	e8 cd 1b 00 00       	call   3ed2 <link>
    2305:	83 c4 10             	add    $0x10,%esp
    2308:	85 c0                	test   %eax,%eax
    230a:	0f 84 d3 01 00 00    	je     24e3 <subdir+0x4e3>
  if(mkdir("dd/ff/ff") == 0){
    2310:	83 ec 0c             	sub    $0xc,%esp
    2313:	68 f6 4b 00 00       	push   $0x4bf6
    2318:	e8 bd 1b 00 00       	call   3eda <mkdir>
    231d:	83 c4 10             	add    $0x10,%esp
    2320:	85 c0                	test   %eax,%eax
    2322:	0f 84 a1 01 00 00    	je     24c9 <subdir+0x4c9>
  if(mkdir("dd/xx/ff") == 0){
    2328:	83 ec 0c             	sub    $0xc,%esp
    232b:	68 1b 4c 00 00       	push   $0x4c1b
    2330:	e8 a5 1b 00 00       	call   3eda <mkdir>
    2335:	83 c4 10             	add    $0x10,%esp
    2338:	85 c0                	test   %eax,%eax
    233a:	0f 84 47 04 00 00    	je     2787 <subdir+0x787>
  if(mkdir("dd/dd/ffff") == 0){
    2340:	83 ec 0c             	sub    $0xc,%esp
    2343:	68 42 4b 00 00       	push   $0x4b42
    2348:	e8 8d 1b 00 00       	call   3eda <mkdir>
    234d:	83 c4 10             	add    $0x10,%esp
    2350:	85 c0                	test   %eax,%eax
    2352:	0f 84 15 04 00 00    	je     276d <subdir+0x76d>
  if(unlink("dd/xx/ff") == 0){
    2358:	83 ec 0c             	sub    $0xc,%esp
    235b:	68 1b 4c 00 00       	push   $0x4c1b
    2360:	e8 5d 1b 00 00       	call   3ec2 <unlink>
    2365:	83 c4 10             	add    $0x10,%esp
    2368:	85 c0                	test   %eax,%eax
    236a:	0f 84 e3 03 00 00    	je     2753 <subdir+0x753>
  if(unlink("dd/ff/ff") == 0){
    2370:	83 ec 0c             	sub    $0xc,%esp
    2373:	68 f6 4b 00 00       	push   $0x4bf6
    2378:	e8 45 1b 00 00       	call   3ec2 <unlink>
    237d:	83 c4 10             	add    $0x10,%esp
    2380:	85 c0                	test   %eax,%eax
    2382:	0f 84 b1 03 00 00    	je     2739 <subdir+0x739>
  if(chdir("dd/ff") == 0){
    2388:	83 ec 0c             	sub    $0xc,%esp
    238b:	68 e1 4a 00 00       	push   $0x4ae1
    2390:	e8 4d 1b 00 00       	call   3ee2 <chdir>
    2395:	83 c4 10             	add    $0x10,%esp
    2398:	85 c0                	test   %eax,%eax
    239a:	0f 84 7f 03 00 00    	je     271f <subdir+0x71f>
  if(chdir("dd/xx") == 0){
    23a0:	83 ec 0c             	sub    $0xc,%esp
    23a3:	68 8d 4c 00 00       	push   $0x4c8d
    23a8:	e8 35 1b 00 00       	call   3ee2 <chdir>
    23ad:	83 c4 10             	add    $0x10,%esp
    23b0:	85 c0                	test   %eax,%eax
    23b2:	0f 84 4d 03 00 00    	je     2705 <subdir+0x705>
  if(unlink("dd/dd/ffff") != 0){
    23b8:	83 ec 0c             	sub    $0xc,%esp
    23bb:	68 42 4b 00 00       	push   $0x4b42
    23c0:	e8 fd 1a 00 00       	call   3ec2 <unlink>
    23c5:	83 c4 10             	add    $0x10,%esp
    23c8:	85 c0                	test   %eax,%eax
    23ca:	0f 85 ab 00 00 00    	jne    247b <subdir+0x47b>
  if(unlink("dd/ff") != 0){
    23d0:	83 ec 0c             	sub    $0xc,%esp
    23d3:	68 e1 4a 00 00       	push   $0x4ae1
    23d8:	e8 e5 1a 00 00       	call   3ec2 <unlink>
    23dd:	83 c4 10             	add    $0x10,%esp
    23e0:	85 c0                	test   %eax,%eax
    23e2:	0f 85 03 03 00 00    	jne    26eb <subdir+0x6eb>
  if(unlink("dd") == 0){
    23e8:	83 ec 0c             	sub    $0xc,%esp
    23eb:	68 a8 4b 00 00       	push   $0x4ba8
    23f0:	e8 cd 1a 00 00       	call   3ec2 <unlink>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	85 c0                	test   %eax,%eax
    23fa:	0f 84 d1 02 00 00    	je     26d1 <subdir+0x6d1>
  if(unlink("dd/dd") < 0){
    2400:	83 ec 0c             	sub    $0xc,%esp
    2403:	68 bd 4a 00 00       	push   $0x4abd
    2408:	e8 b5 1a 00 00       	call   3ec2 <unlink>
    240d:	83 c4 10             	add    $0x10,%esp
    2410:	85 c0                	test   %eax,%eax
    2412:	0f 88 9f 02 00 00    	js     26b7 <subdir+0x6b7>
  if(unlink("dd") < 0){
    2418:	83 ec 0c             	sub    $0xc,%esp
    241b:	68 a8 4b 00 00       	push   $0x4ba8
    2420:	e8 9d 1a 00 00       	call   3ec2 <unlink>
    2425:	83 c4 10             	add    $0x10,%esp
    2428:	85 c0                	test   %eax,%eax
    242a:	0f 88 6d 02 00 00    	js     269d <subdir+0x69d>
  printf(1, "subdir ok\n");
    2430:	83 ec 08             	sub    $0x8,%esp
    2433:	68 8a 4d 00 00       	push   $0x4d8a
    2438:	6a 01                	push   $0x1
    243a:	e8 a1 1b 00 00       	call   3fe0 <printf>
}
    243f:	83 c4 10             	add    $0x10,%esp
    2442:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2445:	c9                   	leave  
    2446:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    2447:	50                   	push   %eax
    2448:	50                   	push   %eax
    2449:	68 27 4b 00 00       	push   $0x4b27
    244e:	6a 01                	push   $0x1
    2450:	e8 8b 1b 00 00       	call   3fe0 <printf>
    exit(0);
    2455:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    245c:	e8 11 1a 00 00       	call   3e72 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2461:	50                   	push   %eax
    2462:	50                   	push   %eax
    2463:	68 82 4b 00 00       	push   $0x4b82
    2468:	6a 01                	push   $0x1
    246a:	e8 71 1b 00 00       	call   3fe0 <printf>
    exit(0);
    246f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2476:	e8 f7 19 00 00       	call   3e72 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    247b:	52                   	push   %edx
    247c:	52                   	push   %edx
    247d:	68 4d 4b 00 00       	push   $0x4b4d
    2482:	6a 01                	push   $0x1
    2484:	e8 57 1b 00 00       	call   3fe0 <printf>
    exit(0);
    2489:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2490:	e8 dd 19 00 00       	call   3e72 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2495:	50                   	push   %eax
    2496:	50                   	push   %eax
    2497:	68 ff 4b 00 00       	push   $0x4bff
    249c:	6a 01                	push   $0x1
    249e:	e8 3d 1b 00 00       	call   3fe0 <printf>
    exit(0);
    24a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24aa:	e8 c3 19 00 00       	call   3e72 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    24af:	52                   	push   %edx
    24b0:	52                   	push   %edx
    24b1:	68 e4 55 00 00       	push   $0x55e4
    24b6:	6a 01                	push   $0x1
    24b8:	e8 23 1b 00 00       	call   3fe0 <printf>
    exit(0);
    24bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24c4:	e8 a9 19 00 00       	call   3e72 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    24c9:	52                   	push   %edx
    24ca:	52                   	push   %edx
    24cb:	68 93 4c 00 00       	push   $0x4c93
    24d0:	6a 01                	push   $0x1
    24d2:	e8 09 1b 00 00       	call   3fe0 <printf>
    exit(0);
    24d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24de:	e8 8f 19 00 00       	call   3e72 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    24e3:	51                   	push   %ecx
    24e4:	51                   	push   %ecx
    24e5:	68 54 56 00 00       	push   $0x5654
    24ea:	6a 01                	push   $0x1
    24ec:	e8 ef 1a 00 00       	call   3fe0 <printf>
    exit(0);
    24f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24f8:	e8 75 19 00 00       	call   3e72 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    24fd:	50                   	push   %eax
    24fe:	50                   	push   %eax
    24ff:	68 0e 4b 00 00       	push   $0x4b0e
    2504:	6a 01                	push   $0x1
    2506:	e8 d5 1a 00 00       	call   3fe0 <printf>
    exit(0);
    250b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2512:	e8 5b 19 00 00       	call   3e72 <exit>
    printf(1, "create dd/dd/ff failed\n");
    2517:	51                   	push   %ecx
    2518:	51                   	push   %ecx
    2519:	68 e7 4a 00 00       	push   $0x4ae7
    251e:	6a 01                	push   $0x1
    2520:	e8 bb 1a 00 00       	call   3fe0 <printf>
    exit(0);
    2525:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    252c:	e8 41 19 00 00       	call   3e72 <exit>
    printf(1, "chdir ./.. failed\n");
    2531:	50                   	push   %eax
    2532:	50                   	push   %eax
    2533:	68 b0 4b 00 00       	push   $0x4bb0
    2538:	6a 01                	push   $0x1
    253a:	e8 a1 1a 00 00       	call   3fe0 <printf>
    exit(0);
    253f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2546:	e8 27 19 00 00       	call   3e72 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    254b:	51                   	push   %ecx
    254c:	51                   	push   %ecx
    254d:	68 9c 55 00 00       	push   $0x559c
    2552:	6a 01                	push   $0x1
    2554:	e8 87 1a 00 00       	call   3fe0 <printf>
    exit(0);
    2559:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2560:	e8 0d 19 00 00       	call   3e72 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2565:	53                   	push   %ebx
    2566:	53                   	push   %ebx
    2567:	68 30 56 00 00       	push   $0x5630
    256c:	6a 01                	push   $0x1
    256e:	e8 6d 1a 00 00       	call   3fe0 <printf>
    exit(0);
    2573:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    257a:	e8 f3 18 00 00       	call   3e72 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    257f:	50                   	push   %eax
    2580:	50                   	push   %eax
    2581:	68 0c 56 00 00       	push   $0x560c
    2586:	6a 01                	push   $0x1
    2588:	e8 53 1a 00 00       	call   3fe0 <printf>
    exit(0);
    258d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2594:	e8 d9 18 00 00       	call   3e72 <exit>
    printf(1, "open dd wronly succeeded!\n");
    2599:	50                   	push   %eax
    259a:	50                   	push   %eax
    259b:	68 6f 4c 00 00       	push   $0x4c6f
    25a0:	6a 01                	push   $0x1
    25a2:	e8 39 1a 00 00       	call   3fe0 <printf>
    exit(0);
    25a7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25ae:	e8 bf 18 00 00       	call   3e72 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    25b3:	50                   	push   %eax
    25b4:	50                   	push   %eax
    25b5:	68 56 4c 00 00       	push   $0x4c56
    25ba:	6a 01                	push   $0x1
    25bc:	e8 1f 1a 00 00       	call   3fe0 <printf>
    exit(0);
    25c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25c8:	e8 a5 18 00 00       	call   3e72 <exit>
    printf(1, "create dd succeeded!\n");
    25cd:	50                   	push   %eax
    25ce:	50                   	push   %eax
    25cf:	68 40 4c 00 00       	push   $0x4c40
    25d4:	6a 01                	push   $0x1
    25d6:	e8 05 1a 00 00       	call   3fe0 <printf>
    exit(0);
    25db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25e2:	e8 8b 18 00 00       	call   3e72 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    25e7:	50                   	push   %eax
    25e8:	50                   	push   %eax
    25e9:	68 24 4c 00 00       	push   $0x4c24
    25ee:	6a 01                	push   $0x1
    25f0:	e8 eb 19 00 00       	call   3fe0 <printf>
    exit(0);
    25f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25fc:	e8 71 18 00 00       	call   3e72 <exit>
    printf(1, "chdir dd failed\n");
    2601:	50                   	push   %eax
    2602:	50                   	push   %eax
    2603:	68 65 4b 00 00       	push   $0x4b65
    2608:	6a 01                	push   $0x1
    260a:	e8 d1 19 00 00       	call   3fe0 <printf>
    exit(0);
    260f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2616:	e8 57 18 00 00       	call   3e72 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    261b:	50                   	push   %eax
    261c:	50                   	push   %eax
    261d:	68 c0 55 00 00       	push   $0x55c0
    2622:	6a 01                	push   $0x1
    2624:	e8 b7 19 00 00       	call   3fe0 <printf>
    exit(0);
    2629:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2630:	e8 3d 18 00 00       	call   3e72 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2635:	53                   	push   %ebx
    2636:	53                   	push   %ebx
    2637:	68 c3 4a 00 00       	push   $0x4ac3
    263c:	6a 01                	push   $0x1
    263e:	e8 9d 19 00 00       	call   3fe0 <printf>
    exit(0);
    2643:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    264a:	e8 23 18 00 00       	call   3e72 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    264f:	50                   	push   %eax
    2650:	50                   	push   %eax
    2651:	68 74 55 00 00       	push   $0x5574
    2656:	6a 01                	push   $0x1
    2658:	e8 83 19 00 00       	call   3fe0 <printf>
    exit(0);
    265d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2664:	e8 09 18 00 00       	call   3e72 <exit>
    printf(1, "create dd/ff failed\n");
    2669:	50                   	push   %eax
    266a:	50                   	push   %eax
    266b:	68 a7 4a 00 00       	push   $0x4aa7
    2670:	6a 01                	push   $0x1
    2672:	e8 69 19 00 00       	call   3fe0 <printf>
    exit(0);
    2677:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    267e:	e8 ef 17 00 00       	call   3e72 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2683:	50                   	push   %eax
    2684:	50                   	push   %eax
    2685:	68 8f 4a 00 00       	push   $0x4a8f
    268a:	6a 01                	push   $0x1
    268c:	e8 4f 19 00 00       	call   3fe0 <printf>
    exit(0);
    2691:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2698:	e8 d5 17 00 00       	call   3e72 <exit>
    printf(1, "unlink dd failed\n");
    269d:	50                   	push   %eax
    269e:	50                   	push   %eax
    269f:	68 78 4d 00 00       	push   $0x4d78
    26a4:	6a 01                	push   $0x1
    26a6:	e8 35 19 00 00       	call   3fe0 <printf>
    exit(0);
    26ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b2:	e8 bb 17 00 00       	call   3e72 <exit>
    printf(1, "unlink dd/dd failed\n");
    26b7:	52                   	push   %edx
    26b8:	52                   	push   %edx
    26b9:	68 63 4d 00 00       	push   $0x4d63
    26be:	6a 01                	push   $0x1
    26c0:	e8 1b 19 00 00       	call   3fe0 <printf>
    exit(0);
    26c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26cc:	e8 a1 17 00 00       	call   3e72 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    26d1:	51                   	push   %ecx
    26d2:	51                   	push   %ecx
    26d3:	68 78 56 00 00       	push   $0x5678
    26d8:	6a 01                	push   $0x1
    26da:	e8 01 19 00 00       	call   3fe0 <printf>
    exit(0);
    26df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26e6:	e8 87 17 00 00       	call   3e72 <exit>
    printf(1, "unlink dd/ff failed\n");
    26eb:	53                   	push   %ebx
    26ec:	53                   	push   %ebx
    26ed:	68 4e 4d 00 00       	push   $0x4d4e
    26f2:	6a 01                	push   $0x1
    26f4:	e8 e7 18 00 00       	call   3fe0 <printf>
    exit(0);
    26f9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2700:	e8 6d 17 00 00       	call   3e72 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2705:	50                   	push   %eax
    2706:	50                   	push   %eax
    2707:	68 36 4d 00 00       	push   $0x4d36
    270c:	6a 01                	push   $0x1
    270e:	e8 cd 18 00 00       	call   3fe0 <printf>
    exit(0);
    2713:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    271a:	e8 53 17 00 00       	call   3e72 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    271f:	50                   	push   %eax
    2720:	50                   	push   %eax
    2721:	68 1e 4d 00 00       	push   $0x4d1e
    2726:	6a 01                	push   $0x1
    2728:	e8 b3 18 00 00       	call   3fe0 <printf>
    exit(0);
    272d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2734:	e8 39 17 00 00       	call   3e72 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2739:	50                   	push   %eax
    273a:	50                   	push   %eax
    273b:	68 02 4d 00 00       	push   $0x4d02
    2740:	6a 01                	push   $0x1
    2742:	e8 99 18 00 00       	call   3fe0 <printf>
    exit(0);
    2747:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    274e:	e8 1f 17 00 00       	call   3e72 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2753:	50                   	push   %eax
    2754:	50                   	push   %eax
    2755:	68 e6 4c 00 00       	push   $0x4ce6
    275a:	6a 01                	push   $0x1
    275c:	e8 7f 18 00 00       	call   3fe0 <printf>
    exit(0);
    2761:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2768:	e8 05 17 00 00       	call   3e72 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    276d:	50                   	push   %eax
    276e:	50                   	push   %eax
    276f:	68 c9 4c 00 00       	push   $0x4cc9
    2774:	6a 01                	push   $0x1
    2776:	e8 65 18 00 00       	call   3fe0 <printf>
    exit(0);
    277b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2782:	e8 eb 16 00 00       	call   3e72 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2787:	50                   	push   %eax
    2788:	50                   	push   %eax
    2789:	68 ae 4c 00 00       	push   $0x4cae
    278e:	6a 01                	push   $0x1
    2790:	e8 4b 18 00 00       	call   3fe0 <printf>
    exit(0);
    2795:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    279c:	e8 d1 16 00 00       	call   3e72 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    27a1:	50                   	push   %eax
    27a2:	50                   	push   %eax
    27a3:	68 db 4b 00 00       	push   $0x4bdb
    27a8:	6a 01                	push   $0x1
    27aa:	e8 31 18 00 00       	call   3fe0 <printf>
    exit(0);
    27af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27b6:	e8 b7 16 00 00       	call   3e72 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    27bb:	50                   	push   %eax
    27bc:	50                   	push   %eax
    27bd:	68 c3 4b 00 00       	push   $0x4bc3
    27c2:	6a 01                	push   $0x1
    27c4:	e8 17 18 00 00       	call   3fe0 <printf>
    exit(0);
    27c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27d0:	e8 9d 16 00 00       	call   3e72 <exit>
    27d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    27d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027e0 <bigwrite>:
{
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	56                   	push   %esi
    27e4:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    27e5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    27ea:	83 ec 08             	sub    $0x8,%esp
    27ed:	68 95 4d 00 00       	push   $0x4d95
    27f2:	6a 01                	push   $0x1
    27f4:	e8 e7 17 00 00       	call   3fe0 <printf>
  unlink("bigwrite");
    27f9:	c7 04 24 a4 4d 00 00 	movl   $0x4da4,(%esp)
    2800:	e8 bd 16 00 00       	call   3ec2 <unlink>
    2805:	83 c4 10             	add    $0x10,%esp
    2808:	90                   	nop
    2809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2810:	83 ec 08             	sub    $0x8,%esp
    2813:	68 02 02 00 00       	push   $0x202
    2818:	68 a4 4d 00 00       	push   $0x4da4
    281d:	e8 90 16 00 00       	call   3eb2 <open>
    if(fd < 0){
    2822:	83 c4 10             	add    $0x10,%esp
    2825:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2827:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2829:	0f 88 85 00 00 00    	js     28b4 <bigwrite+0xd4>
      int cc = write(fd, buf, sz);
    282f:	83 ec 04             	sub    $0x4,%esp
    2832:	53                   	push   %ebx
    2833:	68 c0 8b 00 00       	push   $0x8bc0
    2838:	50                   	push   %eax
    2839:	e8 54 16 00 00       	call   3e92 <write>
      if(cc != sz){
    283e:	83 c4 10             	add    $0x10,%esp
    2841:	39 d8                	cmp    %ebx,%eax
    2843:	75 55                	jne    289a <bigwrite+0xba>
      int cc = write(fd, buf, sz);
    2845:	83 ec 04             	sub    $0x4,%esp
    2848:	53                   	push   %ebx
    2849:	68 c0 8b 00 00       	push   $0x8bc0
    284e:	56                   	push   %esi
    284f:	e8 3e 16 00 00       	call   3e92 <write>
      if(cc != sz){
    2854:	83 c4 10             	add    $0x10,%esp
    2857:	39 d8                	cmp    %ebx,%eax
    2859:	75 3f                	jne    289a <bigwrite+0xba>
    close(fd);
    285b:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    285e:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2864:	56                   	push   %esi
    2865:	e8 30 16 00 00       	call   3e9a <close>
    unlink("bigwrite");
    286a:	c7 04 24 a4 4d 00 00 	movl   $0x4da4,(%esp)
    2871:	e8 4c 16 00 00       	call   3ec2 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    287f:	75 8f                	jne    2810 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    2881:	83 ec 08             	sub    $0x8,%esp
    2884:	68 d7 4d 00 00       	push   $0x4dd7
    2889:	6a 01                	push   $0x1
    288b:	e8 50 17 00 00       	call   3fe0 <printf>
}
    2890:	83 c4 10             	add    $0x10,%esp
    2893:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2896:	5b                   	pop    %ebx
    2897:	5e                   	pop    %esi
    2898:	5d                   	pop    %ebp
    2899:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    289a:	50                   	push   %eax
    289b:	53                   	push   %ebx
    289c:	68 c5 4d 00 00       	push   $0x4dc5
    28a1:	6a 01                	push   $0x1
    28a3:	e8 38 17 00 00       	call   3fe0 <printf>
        exit(0);
    28a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28af:	e8 be 15 00 00       	call   3e72 <exit>
      printf(1, "cannot create bigwrite\n");
    28b4:	83 ec 08             	sub    $0x8,%esp
    28b7:	68 ad 4d 00 00       	push   $0x4dad
    28bc:	6a 01                	push   $0x1
    28be:	e8 1d 17 00 00       	call   3fe0 <printf>
      exit(0);
    28c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28ca:	e8 a3 15 00 00       	call   3e72 <exit>
    28cf:	90                   	nop

000028d0 <bigfile>:
{
    28d0:	55                   	push   %ebp
    28d1:	89 e5                	mov    %esp,%ebp
    28d3:	57                   	push   %edi
    28d4:	56                   	push   %esi
    28d5:	53                   	push   %ebx
    28d6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    28d9:	68 e4 4d 00 00       	push   $0x4de4
    28de:	6a 01                	push   $0x1
    28e0:	e8 fb 16 00 00       	call   3fe0 <printf>
  unlink("bigfile");
    28e5:	c7 04 24 00 4e 00 00 	movl   $0x4e00,(%esp)
    28ec:	e8 d1 15 00 00       	call   3ec2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    28f1:	58                   	pop    %eax
    28f2:	5a                   	pop    %edx
    28f3:	68 02 02 00 00       	push   $0x202
    28f8:	68 00 4e 00 00       	push   $0x4e00
    28fd:	e8 b0 15 00 00       	call   3eb2 <open>
  if(fd < 0){
    2902:	83 c4 10             	add    $0x10,%esp
    2905:	85 c0                	test   %eax,%eax
    2907:	0f 88 81 01 00 00    	js     2a8e <bigfile+0x1be>
    290d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    290f:	31 db                	xor    %ebx,%ebx
    2911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2918:	83 ec 04             	sub    $0x4,%esp
    291b:	68 58 02 00 00       	push   $0x258
    2920:	53                   	push   %ebx
    2921:	68 c0 8b 00 00       	push   $0x8bc0
    2926:	e8 a5 13 00 00       	call   3cd0 <memset>
    if(write(fd, buf, 600) != 600){
    292b:	83 c4 0c             	add    $0xc,%esp
    292e:	68 58 02 00 00       	push   $0x258
    2933:	68 c0 8b 00 00       	push   $0x8bc0
    2938:	56                   	push   %esi
    2939:	e8 54 15 00 00       	call   3e92 <write>
    293e:	83 c4 10             	add    $0x10,%esp
    2941:	3d 58 02 00 00       	cmp    $0x258,%eax
    2946:	0f 85 0d 01 00 00    	jne    2a59 <bigfile+0x189>
  for(i = 0; i < 20; i++){
    294c:	83 c3 01             	add    $0x1,%ebx
    294f:	83 fb 14             	cmp    $0x14,%ebx
    2952:	75 c4                	jne    2918 <bigfile+0x48>
  close(fd);
    2954:	83 ec 0c             	sub    $0xc,%esp
    2957:	56                   	push   %esi
    2958:	e8 3d 15 00 00       	call   3e9a <close>
  fd = open("bigfile", 0);
    295d:	5e                   	pop    %esi
    295e:	5f                   	pop    %edi
    295f:	6a 00                	push   $0x0
    2961:	68 00 4e 00 00       	push   $0x4e00
    2966:	e8 47 15 00 00       	call   3eb2 <open>
  if(fd < 0){
    296b:	83 c4 10             	add    $0x10,%esp
    296e:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    2970:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2972:	0f 88 fc 00 00 00    	js     2a74 <bigfile+0x1a4>
  total = 0;
    2978:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    297a:	31 ff                	xor    %edi,%edi
    297c:	eb 30                	jmp    29ae <bigfile+0xde>
    297e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    2980:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2985:	0f 85 98 00 00 00    	jne    2a23 <bigfile+0x153>
    if(buf[0] != i/2 || buf[299] != i/2){
    298b:	0f be 05 c0 8b 00 00 	movsbl 0x8bc0,%eax
    2992:	89 fa                	mov    %edi,%edx
    2994:	d1 fa                	sar    %edx
    2996:	39 d0                	cmp    %edx,%eax
    2998:	75 6e                	jne    2a08 <bigfile+0x138>
    299a:	0f be 15 eb 8c 00 00 	movsbl 0x8ceb,%edx
    29a1:	39 d0                	cmp    %edx,%eax
    29a3:	75 63                	jne    2a08 <bigfile+0x138>
    total += cc;
    29a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    29ab:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    29ae:	83 ec 04             	sub    $0x4,%esp
    29b1:	68 2c 01 00 00       	push   $0x12c
    29b6:	68 c0 8b 00 00       	push   $0x8bc0
    29bb:	56                   	push   %esi
    29bc:	e8 c9 14 00 00       	call   3e8a <read>
    if(cc < 0){
    29c1:	83 c4 10             	add    $0x10,%esp
    29c4:	85 c0                	test   %eax,%eax
    29c6:	78 76                	js     2a3e <bigfile+0x16e>
    if(cc == 0)
    29c8:	75 b6                	jne    2980 <bigfile+0xb0>
  close(fd);
    29ca:	83 ec 0c             	sub    $0xc,%esp
    29cd:	56                   	push   %esi
    29ce:	e8 c7 14 00 00       	call   3e9a <close>
  if(total != 20*600){
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    29dc:	0f 85 c6 00 00 00    	jne    2aa8 <bigfile+0x1d8>
  unlink("bigfile");
    29e2:	83 ec 0c             	sub    $0xc,%esp
    29e5:	68 00 4e 00 00       	push   $0x4e00
    29ea:	e8 d3 14 00 00       	call   3ec2 <unlink>
  printf(1, "bigfile test ok\n");
    29ef:	58                   	pop    %eax
    29f0:	5a                   	pop    %edx
    29f1:	68 8f 4e 00 00       	push   $0x4e8f
    29f6:	6a 01                	push   $0x1
    29f8:	e8 e3 15 00 00       	call   3fe0 <printf>
}
    29fd:	83 c4 10             	add    $0x10,%esp
    2a00:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2a03:	5b                   	pop    %ebx
    2a04:	5e                   	pop    %esi
    2a05:	5f                   	pop    %edi
    2a06:	5d                   	pop    %ebp
    2a07:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2a08:	83 ec 08             	sub    $0x8,%esp
    2a0b:	68 5c 4e 00 00       	push   $0x4e5c
    2a10:	6a 01                	push   $0x1
    2a12:	e8 c9 15 00 00       	call   3fe0 <printf>
      exit(0);
    2a17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a1e:	e8 4f 14 00 00       	call   3e72 <exit>
      printf(1, "short read bigfile\n");
    2a23:	83 ec 08             	sub    $0x8,%esp
    2a26:	68 48 4e 00 00       	push   $0x4e48
    2a2b:	6a 01                	push   $0x1
    2a2d:	e8 ae 15 00 00       	call   3fe0 <printf>
      exit(0);
    2a32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a39:	e8 34 14 00 00       	call   3e72 <exit>
      printf(1, "read bigfile failed\n");
    2a3e:	83 ec 08             	sub    $0x8,%esp
    2a41:	68 33 4e 00 00       	push   $0x4e33
    2a46:	6a 01                	push   $0x1
    2a48:	e8 93 15 00 00       	call   3fe0 <printf>
      exit(0);
    2a4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a54:	e8 19 14 00 00       	call   3e72 <exit>
      printf(1, "write bigfile failed\n");
    2a59:	83 ec 08             	sub    $0x8,%esp
    2a5c:	68 08 4e 00 00       	push   $0x4e08
    2a61:	6a 01                	push   $0x1
    2a63:	e8 78 15 00 00       	call   3fe0 <printf>
      exit(0);
    2a68:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a6f:	e8 fe 13 00 00       	call   3e72 <exit>
    printf(1, "cannot open bigfile\n");
    2a74:	53                   	push   %ebx
    2a75:	53                   	push   %ebx
    2a76:	68 1e 4e 00 00       	push   $0x4e1e
    2a7b:	6a 01                	push   $0x1
    2a7d:	e8 5e 15 00 00       	call   3fe0 <printf>
    exit(0);
    2a82:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a89:	e8 e4 13 00 00       	call   3e72 <exit>
    printf(1, "cannot create bigfile");
    2a8e:	50                   	push   %eax
    2a8f:	50                   	push   %eax
    2a90:	68 f2 4d 00 00       	push   $0x4df2
    2a95:	6a 01                	push   $0x1
    2a97:	e8 44 15 00 00       	call   3fe0 <printf>
    exit(0);
    2a9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2aa3:	e8 ca 13 00 00       	call   3e72 <exit>
    printf(1, "read bigfile wrong total\n");
    2aa8:	51                   	push   %ecx
    2aa9:	51                   	push   %ecx
    2aaa:	68 75 4e 00 00       	push   $0x4e75
    2aaf:	6a 01                	push   $0x1
    2ab1:	e8 2a 15 00 00       	call   3fe0 <printf>
    exit(0);
    2ab6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2abd:	e8 b0 13 00 00       	call   3e72 <exit>
    2ac2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002ad0 <fourteen>:
{
    2ad0:	55                   	push   %ebp
    2ad1:	89 e5                	mov    %esp,%ebp
    2ad3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    2ad6:	68 a0 4e 00 00       	push   $0x4ea0
    2adb:	6a 01                	push   $0x1
    2add:	e8 fe 14 00 00       	call   3fe0 <printf>
  if(mkdir("12345678901234") != 0){
    2ae2:	c7 04 24 db 4e 00 00 	movl   $0x4edb,(%esp)
    2ae9:	e8 ec 13 00 00       	call   3eda <mkdir>
    2aee:	83 c4 10             	add    $0x10,%esp
    2af1:	85 c0                	test   %eax,%eax
    2af3:	0f 85 9b 00 00 00    	jne    2b94 <fourteen+0xc4>
  if(mkdir("12345678901234/123456789012345") != 0){
    2af9:	83 ec 0c             	sub    $0xc,%esp
    2afc:	68 98 56 00 00       	push   $0x5698
    2b01:	e8 d4 13 00 00       	call   3eda <mkdir>
    2b06:	83 c4 10             	add    $0x10,%esp
    2b09:	85 c0                	test   %eax,%eax
    2b0b:	0f 85 05 01 00 00    	jne    2c16 <fourteen+0x146>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2b11:	83 ec 08             	sub    $0x8,%esp
    2b14:	68 00 02 00 00       	push   $0x200
    2b19:	68 e8 56 00 00       	push   $0x56e8
    2b1e:	e8 8f 13 00 00       	call   3eb2 <open>
  if(fd < 0){
    2b23:	83 c4 10             	add    $0x10,%esp
    2b26:	85 c0                	test   %eax,%eax
    2b28:	0f 88 ce 00 00 00    	js     2bfc <fourteen+0x12c>
  close(fd);
    2b2e:	83 ec 0c             	sub    $0xc,%esp
    2b31:	50                   	push   %eax
    2b32:	e8 63 13 00 00       	call   3e9a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2b37:	58                   	pop    %eax
    2b38:	5a                   	pop    %edx
    2b39:	6a 00                	push   $0x0
    2b3b:	68 58 57 00 00       	push   $0x5758
    2b40:	e8 6d 13 00 00       	call   3eb2 <open>
  if(fd < 0){
    2b45:	83 c4 10             	add    $0x10,%esp
    2b48:	85 c0                	test   %eax,%eax
    2b4a:	0f 88 92 00 00 00    	js     2be2 <fourteen+0x112>
  close(fd);
    2b50:	83 ec 0c             	sub    $0xc,%esp
    2b53:	50                   	push   %eax
    2b54:	e8 41 13 00 00       	call   3e9a <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2b59:	c7 04 24 cc 4e 00 00 	movl   $0x4ecc,(%esp)
    2b60:	e8 75 13 00 00       	call   3eda <mkdir>
    2b65:	83 c4 10             	add    $0x10,%esp
    2b68:	85 c0                	test   %eax,%eax
    2b6a:	74 5c                	je     2bc8 <fourteen+0xf8>
  if(mkdir("123456789012345/12345678901234") == 0){
    2b6c:	83 ec 0c             	sub    $0xc,%esp
    2b6f:	68 f4 57 00 00       	push   $0x57f4
    2b74:	e8 61 13 00 00       	call   3eda <mkdir>
    2b79:	83 c4 10             	add    $0x10,%esp
    2b7c:	85 c0                	test   %eax,%eax
    2b7e:	74 2e                	je     2bae <fourteen+0xde>
  printf(1, "fourteen ok\n");
    2b80:	83 ec 08             	sub    $0x8,%esp
    2b83:	68 ea 4e 00 00       	push   $0x4eea
    2b88:	6a 01                	push   $0x1
    2b8a:	e8 51 14 00 00       	call   3fe0 <printf>
}
    2b8f:	83 c4 10             	add    $0x10,%esp
    2b92:	c9                   	leave  
    2b93:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2b94:	50                   	push   %eax
    2b95:	50                   	push   %eax
    2b96:	68 af 4e 00 00       	push   $0x4eaf
    2b9b:	6a 01                	push   $0x1
    2b9d:	e8 3e 14 00 00       	call   3fe0 <printf>
    exit(0);
    2ba2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ba9:	e8 c4 12 00 00       	call   3e72 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2bae:	50                   	push   %eax
    2baf:	50                   	push   %eax
    2bb0:	68 14 58 00 00       	push   $0x5814
    2bb5:	6a 01                	push   $0x1
    2bb7:	e8 24 14 00 00       	call   3fe0 <printf>
    exit(0);
    2bbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bc3:	e8 aa 12 00 00       	call   3e72 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2bc8:	52                   	push   %edx
    2bc9:	52                   	push   %edx
    2bca:	68 c4 57 00 00       	push   $0x57c4
    2bcf:	6a 01                	push   $0x1
    2bd1:	e8 0a 14 00 00       	call   3fe0 <printf>
    exit(0);
    2bd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bdd:	e8 90 12 00 00       	call   3e72 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2be2:	51                   	push   %ecx
    2be3:	51                   	push   %ecx
    2be4:	68 88 57 00 00       	push   $0x5788
    2be9:	6a 01                	push   $0x1
    2beb:	e8 f0 13 00 00       	call   3fe0 <printf>
    exit(0);
    2bf0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bf7:	e8 76 12 00 00       	call   3e72 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2bfc:	51                   	push   %ecx
    2bfd:	51                   	push   %ecx
    2bfe:	68 18 57 00 00       	push   $0x5718
    2c03:	6a 01                	push   $0x1
    2c05:	e8 d6 13 00 00       	call   3fe0 <printf>
    exit(0);
    2c0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c11:	e8 5c 12 00 00       	call   3e72 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2c16:	50                   	push   %eax
    2c17:	50                   	push   %eax
    2c18:	68 b8 56 00 00       	push   $0x56b8
    2c1d:	6a 01                	push   $0x1
    2c1f:	e8 bc 13 00 00       	call   3fe0 <printf>
    exit(0);
    2c24:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c2b:	e8 42 12 00 00       	call   3e72 <exit>

00002c30 <rmdot>:
{
    2c30:	55                   	push   %ebp
    2c31:	89 e5                	mov    %esp,%ebp
    2c33:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2c36:	68 f7 4e 00 00       	push   $0x4ef7
    2c3b:	6a 01                	push   $0x1
    2c3d:	e8 9e 13 00 00       	call   3fe0 <printf>
  if(mkdir("dots") != 0){
    2c42:	c7 04 24 03 4f 00 00 	movl   $0x4f03,(%esp)
    2c49:	e8 8c 12 00 00       	call   3eda <mkdir>
    2c4e:	83 c4 10             	add    $0x10,%esp
    2c51:	85 c0                	test   %eax,%eax
    2c53:	0f 85 b4 00 00 00    	jne    2d0d <rmdot+0xdd>
  if(chdir("dots") != 0){
    2c59:	83 ec 0c             	sub    $0xc,%esp
    2c5c:	68 03 4f 00 00       	push   $0x4f03
    2c61:	e8 7c 12 00 00       	call   3ee2 <chdir>
    2c66:	83 c4 10             	add    $0x10,%esp
    2c69:	85 c0                	test   %eax,%eax
    2c6b:	0f 85 52 01 00 00    	jne    2dc3 <rmdot+0x193>
  if(unlink(".") == 0){
    2c71:	83 ec 0c             	sub    $0xc,%esp
    2c74:	68 ae 4b 00 00       	push   $0x4bae
    2c79:	e8 44 12 00 00       	call   3ec2 <unlink>
    2c7e:	83 c4 10             	add    $0x10,%esp
    2c81:	85 c0                	test   %eax,%eax
    2c83:	0f 84 20 01 00 00    	je     2da9 <rmdot+0x179>
  if(unlink("..") == 0){
    2c89:	83 ec 0c             	sub    $0xc,%esp
    2c8c:	68 ad 4b 00 00       	push   $0x4bad
    2c91:	e8 2c 12 00 00       	call   3ec2 <unlink>
    2c96:	83 c4 10             	add    $0x10,%esp
    2c99:	85 c0                	test   %eax,%eax
    2c9b:	0f 84 ee 00 00 00    	je     2d8f <rmdot+0x15f>
  if(chdir("/") != 0){
    2ca1:	83 ec 0c             	sub    $0xc,%esp
    2ca4:	68 81 43 00 00       	push   $0x4381
    2ca9:	e8 34 12 00 00       	call   3ee2 <chdir>
    2cae:	83 c4 10             	add    $0x10,%esp
    2cb1:	85 c0                	test   %eax,%eax
    2cb3:	0f 85 bc 00 00 00    	jne    2d75 <rmdot+0x145>
  if(unlink("dots/.") == 0){
    2cb9:	83 ec 0c             	sub    $0xc,%esp
    2cbc:	68 4b 4f 00 00       	push   $0x4f4b
    2cc1:	e8 fc 11 00 00       	call   3ec2 <unlink>
    2cc6:	83 c4 10             	add    $0x10,%esp
    2cc9:	85 c0                	test   %eax,%eax
    2ccb:	0f 84 8a 00 00 00    	je     2d5b <rmdot+0x12b>
  if(unlink("dots/..") == 0){
    2cd1:	83 ec 0c             	sub    $0xc,%esp
    2cd4:	68 69 4f 00 00       	push   $0x4f69
    2cd9:	e8 e4 11 00 00       	call   3ec2 <unlink>
    2cde:	83 c4 10             	add    $0x10,%esp
    2ce1:	85 c0                	test   %eax,%eax
    2ce3:	74 5c                	je     2d41 <rmdot+0x111>
  if(unlink("dots") != 0){
    2ce5:	83 ec 0c             	sub    $0xc,%esp
    2ce8:	68 03 4f 00 00       	push   $0x4f03
    2ced:	e8 d0 11 00 00       	call   3ec2 <unlink>
    2cf2:	83 c4 10             	add    $0x10,%esp
    2cf5:	85 c0                	test   %eax,%eax
    2cf7:	75 2e                	jne    2d27 <rmdot+0xf7>
  printf(1, "rmdot ok\n");
    2cf9:	83 ec 08             	sub    $0x8,%esp
    2cfc:	68 9e 4f 00 00       	push   $0x4f9e
    2d01:	6a 01                	push   $0x1
    2d03:	e8 d8 12 00 00       	call   3fe0 <printf>
}
    2d08:	83 c4 10             	add    $0x10,%esp
    2d0b:	c9                   	leave  
    2d0c:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2d0d:	50                   	push   %eax
    2d0e:	50                   	push   %eax
    2d0f:	68 08 4f 00 00       	push   $0x4f08
    2d14:	6a 01                	push   $0x1
    2d16:	e8 c5 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d22:	e8 4b 11 00 00       	call   3e72 <exit>
    printf(1, "unlink dots failed!\n");
    2d27:	50                   	push   %eax
    2d28:	50                   	push   %eax
    2d29:	68 89 4f 00 00       	push   $0x4f89
    2d2e:	6a 01                	push   $0x1
    2d30:	e8 ab 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d35:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d3c:	e8 31 11 00 00       	call   3e72 <exit>
    printf(1, "unlink dots/.. worked!\n");
    2d41:	52                   	push   %edx
    2d42:	52                   	push   %edx
    2d43:	68 71 4f 00 00       	push   $0x4f71
    2d48:	6a 01                	push   $0x1
    2d4a:	e8 91 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d4f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d56:	e8 17 11 00 00       	call   3e72 <exit>
    printf(1, "unlink dots/. worked!\n");
    2d5b:	51                   	push   %ecx
    2d5c:	51                   	push   %ecx
    2d5d:	68 52 4f 00 00       	push   $0x4f52
    2d62:	6a 01                	push   $0x1
    2d64:	e8 77 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d70:	e8 fd 10 00 00       	call   3e72 <exit>
    printf(1, "chdir / failed\n");
    2d75:	50                   	push   %eax
    2d76:	50                   	push   %eax
    2d77:	68 83 43 00 00       	push   $0x4383
    2d7c:	6a 01                	push   $0x1
    2d7e:	e8 5d 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d83:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d8a:	e8 e3 10 00 00       	call   3e72 <exit>
    printf(1, "rm .. worked!\n");
    2d8f:	50                   	push   %eax
    2d90:	50                   	push   %eax
    2d91:	68 3c 4f 00 00       	push   $0x4f3c
    2d96:	6a 01                	push   $0x1
    2d98:	e8 43 12 00 00       	call   3fe0 <printf>
    exit(0);
    2d9d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2da4:	e8 c9 10 00 00       	call   3e72 <exit>
    printf(1, "rm . worked!\n");
    2da9:	50                   	push   %eax
    2daa:	50                   	push   %eax
    2dab:	68 2e 4f 00 00       	push   $0x4f2e
    2db0:	6a 01                	push   $0x1
    2db2:	e8 29 12 00 00       	call   3fe0 <printf>
    exit(0);
    2db7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2dbe:	e8 af 10 00 00       	call   3e72 <exit>
    printf(1, "chdir dots failed\n");
    2dc3:	50                   	push   %eax
    2dc4:	50                   	push   %eax
    2dc5:	68 1b 4f 00 00       	push   $0x4f1b
    2dca:	6a 01                	push   $0x1
    2dcc:	e8 0f 12 00 00       	call   3fe0 <printf>
    exit(0);
    2dd1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2dd8:	e8 95 10 00 00       	call   3e72 <exit>
    2ddd:	8d 76 00             	lea    0x0(%esi),%esi

00002de0 <dirfile>:
{
    2de0:	55                   	push   %ebp
    2de1:	89 e5                	mov    %esp,%ebp
    2de3:	53                   	push   %ebx
    2de4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2de7:	68 a8 4f 00 00       	push   $0x4fa8
    2dec:	6a 01                	push   $0x1
    2dee:	e8 ed 11 00 00       	call   3fe0 <printf>
  fd = open("dirfile", O_CREATE);
    2df3:	59                   	pop    %ecx
    2df4:	5b                   	pop    %ebx
    2df5:	68 00 02 00 00       	push   $0x200
    2dfa:	68 b5 4f 00 00       	push   $0x4fb5
    2dff:	e8 ae 10 00 00       	call   3eb2 <open>
  if(fd < 0){
    2e04:	83 c4 10             	add    $0x10,%esp
    2e07:	85 c0                	test   %eax,%eax
    2e09:	0f 88 51 01 00 00    	js     2f60 <dirfile+0x180>
  close(fd);
    2e0f:	83 ec 0c             	sub    $0xc,%esp
    2e12:	50                   	push   %eax
    2e13:	e8 82 10 00 00       	call   3e9a <close>
  if(chdir("dirfile") == 0){
    2e18:	c7 04 24 b5 4f 00 00 	movl   $0x4fb5,(%esp)
    2e1f:	e8 be 10 00 00       	call   3ee2 <chdir>
    2e24:	83 c4 10             	add    $0x10,%esp
    2e27:	85 c0                	test   %eax,%eax
    2e29:	0f 84 17 01 00 00    	je     2f46 <dirfile+0x166>
  fd = open("dirfile/xx", 0);
    2e2f:	83 ec 08             	sub    $0x8,%esp
    2e32:	6a 00                	push   $0x0
    2e34:	68 ee 4f 00 00       	push   $0x4fee
    2e39:	e8 74 10 00 00       	call   3eb2 <open>
  if(fd >= 0){
    2e3e:	83 c4 10             	add    $0x10,%esp
    2e41:	85 c0                	test   %eax,%eax
    2e43:	0f 89 e3 00 00 00    	jns    2f2c <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    2e49:	83 ec 08             	sub    $0x8,%esp
    2e4c:	68 00 02 00 00       	push   $0x200
    2e51:	68 ee 4f 00 00       	push   $0x4fee
    2e56:	e8 57 10 00 00       	call   3eb2 <open>
  if(fd >= 0){
    2e5b:	83 c4 10             	add    $0x10,%esp
    2e5e:	85 c0                	test   %eax,%eax
    2e60:	0f 89 c6 00 00 00    	jns    2f2c <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2e66:	83 ec 0c             	sub    $0xc,%esp
    2e69:	68 ee 4f 00 00       	push   $0x4fee
    2e6e:	e8 67 10 00 00       	call   3eda <mkdir>
    2e73:	83 c4 10             	add    $0x10,%esp
    2e76:	85 c0                	test   %eax,%eax
    2e78:	0f 84 7e 01 00 00    	je     2ffc <dirfile+0x21c>
  if(unlink("dirfile/xx") == 0){
    2e7e:	83 ec 0c             	sub    $0xc,%esp
    2e81:	68 ee 4f 00 00       	push   $0x4fee
    2e86:	e8 37 10 00 00       	call   3ec2 <unlink>
    2e8b:	83 c4 10             	add    $0x10,%esp
    2e8e:	85 c0                	test   %eax,%eax
    2e90:	0f 84 4c 01 00 00    	je     2fe2 <dirfile+0x202>
  if(link("README", "dirfile/xx") == 0){
    2e96:	83 ec 08             	sub    $0x8,%esp
    2e99:	68 ee 4f 00 00       	push   $0x4fee
    2e9e:	68 52 50 00 00       	push   $0x5052
    2ea3:	e8 2a 10 00 00       	call   3ed2 <link>
    2ea8:	83 c4 10             	add    $0x10,%esp
    2eab:	85 c0                	test   %eax,%eax
    2ead:	0f 84 15 01 00 00    	je     2fc8 <dirfile+0x1e8>
  if(unlink("dirfile") != 0){
    2eb3:	83 ec 0c             	sub    $0xc,%esp
    2eb6:	68 b5 4f 00 00       	push   $0x4fb5
    2ebb:	e8 02 10 00 00       	call   3ec2 <unlink>
    2ec0:	83 c4 10             	add    $0x10,%esp
    2ec3:	85 c0                	test   %eax,%eax
    2ec5:	0f 85 e3 00 00 00    	jne    2fae <dirfile+0x1ce>
  fd = open(".", O_RDWR);
    2ecb:	83 ec 08             	sub    $0x8,%esp
    2ece:	6a 02                	push   $0x2
    2ed0:	68 ae 4b 00 00       	push   $0x4bae
    2ed5:	e8 d8 0f 00 00       	call   3eb2 <open>
  if(fd >= 0){
    2eda:	83 c4 10             	add    $0x10,%esp
    2edd:	85 c0                	test   %eax,%eax
    2edf:	0f 89 af 00 00 00    	jns    2f94 <dirfile+0x1b4>
  fd = open(".", 0);
    2ee5:	83 ec 08             	sub    $0x8,%esp
    2ee8:	6a 00                	push   $0x0
    2eea:	68 ae 4b 00 00       	push   $0x4bae
    2eef:	e8 be 0f 00 00       	call   3eb2 <open>
  if(write(fd, "x", 1) > 0){
    2ef4:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    2ef7:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2ef9:	6a 01                	push   $0x1
    2efb:	68 91 4c 00 00       	push   $0x4c91
    2f00:	50                   	push   %eax
    2f01:	e8 8c 0f 00 00       	call   3e92 <write>
    2f06:	83 c4 10             	add    $0x10,%esp
    2f09:	85 c0                	test   %eax,%eax
    2f0b:	7f 6d                	jg     2f7a <dirfile+0x19a>
  close(fd);
    2f0d:	83 ec 0c             	sub    $0xc,%esp
    2f10:	53                   	push   %ebx
    2f11:	e8 84 0f 00 00       	call   3e9a <close>
  printf(1, "dir vs file OK\n");
    2f16:	58                   	pop    %eax
    2f17:	5a                   	pop    %edx
    2f18:	68 85 50 00 00       	push   $0x5085
    2f1d:	6a 01                	push   $0x1
    2f1f:	e8 bc 10 00 00       	call   3fe0 <printf>
}
    2f24:	83 c4 10             	add    $0x10,%esp
    2f27:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2f2a:	c9                   	leave  
    2f2b:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2f2c:	50                   	push   %eax
    2f2d:	50                   	push   %eax
    2f2e:	68 f9 4f 00 00       	push   $0x4ff9
    2f33:	6a 01                	push   $0x1
    2f35:	e8 a6 10 00 00       	call   3fe0 <printf>
    exit(0);
    2f3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f41:	e8 2c 0f 00 00       	call   3e72 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2f46:	50                   	push   %eax
    2f47:	50                   	push   %eax
    2f48:	68 d4 4f 00 00       	push   $0x4fd4
    2f4d:	6a 01                	push   $0x1
    2f4f:	e8 8c 10 00 00       	call   3fe0 <printf>
    exit(0);
    2f54:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f5b:	e8 12 0f 00 00       	call   3e72 <exit>
    printf(1, "create dirfile failed\n");
    2f60:	52                   	push   %edx
    2f61:	52                   	push   %edx
    2f62:	68 bd 4f 00 00       	push   $0x4fbd
    2f67:	6a 01                	push   $0x1
    2f69:	e8 72 10 00 00       	call   3fe0 <printf>
    exit(0);
    2f6e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f75:	e8 f8 0e 00 00       	call   3e72 <exit>
    printf(1, "write . succeeded!\n");
    2f7a:	51                   	push   %ecx
    2f7b:	51                   	push   %ecx
    2f7c:	68 71 50 00 00       	push   $0x5071
    2f81:	6a 01                	push   $0x1
    2f83:	e8 58 10 00 00       	call   3fe0 <printf>
    exit(0);
    2f88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f8f:	e8 de 0e 00 00       	call   3e72 <exit>
    printf(1, "open . for writing succeeded!\n");
    2f94:	53                   	push   %ebx
    2f95:	53                   	push   %ebx
    2f96:	68 68 58 00 00       	push   $0x5868
    2f9b:	6a 01                	push   $0x1
    2f9d:	e8 3e 10 00 00       	call   3fe0 <printf>
    exit(0);
    2fa2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fa9:	e8 c4 0e 00 00       	call   3e72 <exit>
    printf(1, "unlink dirfile failed!\n");
    2fae:	50                   	push   %eax
    2faf:	50                   	push   %eax
    2fb0:	68 59 50 00 00       	push   $0x5059
    2fb5:	6a 01                	push   $0x1
    2fb7:	e8 24 10 00 00       	call   3fe0 <printf>
    exit(0);
    2fbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fc3:	e8 aa 0e 00 00       	call   3e72 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2fc8:	50                   	push   %eax
    2fc9:	50                   	push   %eax
    2fca:	68 48 58 00 00       	push   $0x5848
    2fcf:	6a 01                	push   $0x1
    2fd1:	e8 0a 10 00 00       	call   3fe0 <printf>
    exit(0);
    2fd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fdd:	e8 90 0e 00 00       	call   3e72 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2fe2:	50                   	push   %eax
    2fe3:	50                   	push   %eax
    2fe4:	68 34 50 00 00       	push   $0x5034
    2fe9:	6a 01                	push   $0x1
    2feb:	e8 f0 0f 00 00       	call   3fe0 <printf>
    exit(0);
    2ff0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ff7:	e8 76 0e 00 00       	call   3e72 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2ffc:	50                   	push   %eax
    2ffd:	50                   	push   %eax
    2ffe:	68 17 50 00 00       	push   $0x5017
    3003:	6a 01                	push   $0x1
    3005:	e8 d6 0f 00 00       	call   3fe0 <printf>
    exit(0);
    300a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3011:	e8 5c 0e 00 00       	call   3e72 <exit>
    3016:	8d 76 00             	lea    0x0(%esi),%esi
    3019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003020 <iref>:
{
    3020:	55                   	push   %ebp
    3021:	89 e5                	mov    %esp,%ebp
    3023:	53                   	push   %ebx
  printf(1, "empty file name\n");
    3024:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    3029:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    302c:	68 95 50 00 00       	push   $0x5095
    3031:	6a 01                	push   $0x1
    3033:	e8 a8 0f 00 00       	call   3fe0 <printf>
    3038:	83 c4 10             	add    $0x10,%esp
    303b:	90                   	nop
    303c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    3040:	83 ec 0c             	sub    $0xc,%esp
    3043:	68 a6 50 00 00       	push   $0x50a6
    3048:	e8 8d 0e 00 00       	call   3eda <mkdir>
    304d:	83 c4 10             	add    $0x10,%esp
    3050:	85 c0                	test   %eax,%eax
    3052:	0f 85 bb 00 00 00    	jne    3113 <iref+0xf3>
    if(chdir("irefd") != 0){
    3058:	83 ec 0c             	sub    $0xc,%esp
    305b:	68 a6 50 00 00       	push   $0x50a6
    3060:	e8 7d 0e 00 00       	call   3ee2 <chdir>
    3065:	83 c4 10             	add    $0x10,%esp
    3068:	85 c0                	test   %eax,%eax
    306a:	0f 85 be 00 00 00    	jne    312e <iref+0x10e>
    mkdir("");
    3070:	83 ec 0c             	sub    $0xc,%esp
    3073:	68 5b 47 00 00       	push   $0x475b
    3078:	e8 5d 0e 00 00       	call   3eda <mkdir>
    link("README", "");
    307d:	59                   	pop    %ecx
    307e:	58                   	pop    %eax
    307f:	68 5b 47 00 00       	push   $0x475b
    3084:	68 52 50 00 00       	push   $0x5052
    3089:	e8 44 0e 00 00       	call   3ed2 <link>
    fd = open("", O_CREATE);
    308e:	58                   	pop    %eax
    308f:	5a                   	pop    %edx
    3090:	68 00 02 00 00       	push   $0x200
    3095:	68 5b 47 00 00       	push   $0x475b
    309a:	e8 13 0e 00 00       	call   3eb2 <open>
    if(fd >= 0)
    309f:	83 c4 10             	add    $0x10,%esp
    30a2:	85 c0                	test   %eax,%eax
    30a4:	78 0c                	js     30b2 <iref+0x92>
      close(fd);
    30a6:	83 ec 0c             	sub    $0xc,%esp
    30a9:	50                   	push   %eax
    30aa:	e8 eb 0d 00 00       	call   3e9a <close>
    30af:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    30b2:	83 ec 08             	sub    $0x8,%esp
    30b5:	68 00 02 00 00       	push   $0x200
    30ba:	68 90 4c 00 00       	push   $0x4c90
    30bf:	e8 ee 0d 00 00       	call   3eb2 <open>
    if(fd >= 0)
    30c4:	83 c4 10             	add    $0x10,%esp
    30c7:	85 c0                	test   %eax,%eax
    30c9:	78 0c                	js     30d7 <iref+0xb7>
      close(fd);
    30cb:	83 ec 0c             	sub    $0xc,%esp
    30ce:	50                   	push   %eax
    30cf:	e8 c6 0d 00 00       	call   3e9a <close>
    30d4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    30d7:	83 ec 0c             	sub    $0xc,%esp
    30da:	68 90 4c 00 00       	push   $0x4c90
    30df:	e8 de 0d 00 00       	call   3ec2 <unlink>
  for(i = 0; i < 50 + 1; i++){
    30e4:	83 c4 10             	add    $0x10,%esp
    30e7:	83 eb 01             	sub    $0x1,%ebx
    30ea:	0f 85 50 ff ff ff    	jne    3040 <iref+0x20>
  chdir("/");
    30f0:	83 ec 0c             	sub    $0xc,%esp
    30f3:	68 81 43 00 00       	push   $0x4381
    30f8:	e8 e5 0d 00 00       	call   3ee2 <chdir>
  printf(1, "empty file name OK\n");
    30fd:	58                   	pop    %eax
    30fe:	5a                   	pop    %edx
    30ff:	68 d4 50 00 00       	push   $0x50d4
    3104:	6a 01                	push   $0x1
    3106:	e8 d5 0e 00 00       	call   3fe0 <printf>
}
    310b:	83 c4 10             	add    $0x10,%esp
    310e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3111:	c9                   	leave  
    3112:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    3113:	83 ec 08             	sub    $0x8,%esp
    3116:	68 ac 50 00 00       	push   $0x50ac
    311b:	6a 01                	push   $0x1
    311d:	e8 be 0e 00 00       	call   3fe0 <printf>
      exit(0);
    3122:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3129:	e8 44 0d 00 00       	call   3e72 <exit>
      printf(1, "chdir irefd failed\n");
    312e:	83 ec 08             	sub    $0x8,%esp
    3131:	68 c0 50 00 00       	push   $0x50c0
    3136:	6a 01                	push   $0x1
    3138:	e8 a3 0e 00 00       	call   3fe0 <printf>
      exit(0);
    313d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3144:	e8 29 0d 00 00       	call   3e72 <exit>
    3149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003150 <forktest>:
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    3154:	31 db                	xor    %ebx,%ebx
{
    3156:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    3159:	68 e8 50 00 00       	push   $0x50e8
    315e:	6a 01                	push   $0x1
    3160:	e8 7b 0e 00 00       	call   3fe0 <printf>
    3165:	83 c4 10             	add    $0x10,%esp
    3168:	eb 13                	jmp    317d <forktest+0x2d>
    316a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    3170:	74 79                	je     31eb <forktest+0x9b>
  for(n=0; n<1000; n++){
    3172:	83 c3 01             	add    $0x1,%ebx
    3175:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    317b:	74 53                	je     31d0 <forktest+0x80>
    pid = fork();
    317d:	e8 e8 0c 00 00       	call   3e6a <fork>
    if(pid < 0)
    3182:	85 c0                	test   %eax,%eax
    3184:	79 ea                	jns    3170 <forktest+0x20>
  for(; n > 0; n--){
    3186:	85 db                	test   %ebx,%ebx
    3188:	74 1c                	je     31a6 <forktest+0x56>
    318a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait(null) < 0){
    3190:	83 ec 0c             	sub    $0xc,%esp
    3193:	6a 00                	push   $0x0
    3195:	e8 e0 0c 00 00       	call   3e7a <wait>
    319a:	83 c4 10             	add    $0x10,%esp
    319d:	85 c0                	test   %eax,%eax
    319f:	78 54                	js     31f5 <forktest+0xa5>
  for(; n > 0; n--){
    31a1:	83 eb 01             	sub    $0x1,%ebx
    31a4:	75 ea                	jne    3190 <forktest+0x40>
  if(wait(null) != -1){
    31a6:	83 ec 0c             	sub    $0xc,%esp
    31a9:	6a 00                	push   $0x0
    31ab:	e8 ca 0c 00 00       	call   3e7a <wait>
    31b0:	83 c4 10             	add    $0x10,%esp
    31b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b6:	75 58                	jne    3210 <forktest+0xc0>
  printf(1, "fork test OK\n");
    31b8:	83 ec 08             	sub    $0x8,%esp
    31bb:	68 1a 51 00 00       	push   $0x511a
    31c0:	6a 01                	push   $0x1
    31c2:	e8 19 0e 00 00       	call   3fe0 <printf>
}
    31c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    31ca:	c9                   	leave  
    31cb:	c3                   	ret    
    31cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    31d0:	83 ec 08             	sub    $0x8,%esp
    31d3:	68 88 58 00 00       	push   $0x5888
    31d8:	6a 01                	push   $0x1
    31da:	e8 01 0e 00 00       	call   3fe0 <printf>
    exit(0);
    31df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31e6:	e8 87 0c 00 00       	call   3e72 <exit>
      exit(0);
    31eb:	83 ec 0c             	sub    $0xc,%esp
    31ee:	6a 00                	push   $0x0
    31f0:	e8 7d 0c 00 00       	call   3e72 <exit>
      printf(1, "wait stopped early\n");
    31f5:	83 ec 08             	sub    $0x8,%esp
    31f8:	68 f3 50 00 00       	push   $0x50f3
    31fd:	6a 01                	push   $0x1
    31ff:	e8 dc 0d 00 00       	call   3fe0 <printf>
      exit(0);
    3204:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    320b:	e8 62 0c 00 00       	call   3e72 <exit>
    printf(1, "wait got too many\n");
    3210:	50                   	push   %eax
    3211:	50                   	push   %eax
    3212:	68 07 51 00 00       	push   $0x5107
    3217:	6a 01                	push   $0x1
    3219:	e8 c2 0d 00 00       	call   3fe0 <printf>
    exit(0);
    321e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3225:	e8 48 0c 00 00       	call   3e72 <exit>
    322a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003230 <sbrktest>:
{
    3230:	55                   	push   %ebp
    3231:	89 e5                	mov    %esp,%ebp
    3233:	57                   	push   %edi
    3234:	56                   	push   %esi
    3235:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    3236:	31 ff                	xor    %edi,%edi
{
    3238:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    323b:	68 28 51 00 00       	push   $0x5128
    3240:	ff 35 e8 63 00 00    	pushl  0x63e8
    3246:	e8 95 0d 00 00       	call   3fe0 <printf>
  oldbrk = sbrk(0);
    324b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3252:	e8 a3 0c 00 00       	call   3efa <sbrk>
  a = sbrk(0);
    3257:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    325e:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    3260:	e8 95 0c 00 00       	call   3efa <sbrk>
    3265:	83 c4 10             	add    $0x10,%esp
    3268:	89 c6                	mov    %eax,%esi
    326a:	eb 06                	jmp    3272 <sbrktest+0x42>
    326c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    3270:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    3272:	83 ec 0c             	sub    $0xc,%esp
    3275:	6a 01                	push   $0x1
    3277:	e8 7e 0c 00 00       	call   3efa <sbrk>
    if(b != a){
    327c:	83 c4 10             	add    $0x10,%esp
    327f:	39 f0                	cmp    %esi,%eax
    3281:	0f 85 79 02 00 00    	jne    3500 <sbrktest+0x2d0>
  for(i = 0; i < 5000; i++){
    3287:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    328a:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    328d:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    3290:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    3296:	75 d8                	jne    3270 <sbrktest+0x40>
  pid = fork();
    3298:	e8 cd 0b 00 00       	call   3e6a <fork>
  if(pid < 0){
    329d:	85 c0                	test   %eax,%eax
  pid = fork();
    329f:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    32a1:	0f 88 ed 03 00 00    	js     3694 <sbrktest+0x464>
  c = sbrk(1);
    32a7:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    32aa:	83 c6 02             	add    $0x2,%esi
  c = sbrk(1);
    32ad:	6a 01                	push   $0x1
    32af:	e8 46 0c 00 00       	call   3efa <sbrk>
  c = sbrk(1);
    32b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32bb:	e8 3a 0c 00 00       	call   3efa <sbrk>
  if(c != a + 1){
    32c0:	83 c4 10             	add    $0x10,%esp
    32c3:	39 f0                	cmp    %esi,%eax
    32c5:	0f 85 ab 03 00 00    	jne    3676 <sbrktest+0x446>
  if(pid == 0)
    32cb:	85 ff                	test   %edi,%edi
    32cd:	0f 84 99 03 00 00    	je     366c <sbrktest+0x43c>
  wait(null);
    32d3:	83 ec 0c             	sub    $0xc,%esp
    32d6:	6a 00                	push   $0x0
    32d8:	e8 9d 0b 00 00       	call   3e7a <wait>
  a = sbrk(0);
    32dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32e4:	e8 11 0c 00 00       	call   3efa <sbrk>
    32e9:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    32eb:	b8 00 00 40 06       	mov    $0x6400000,%eax
    32f0:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    32f2:	89 04 24             	mov    %eax,(%esp)
    32f5:	e8 00 0c 00 00       	call   3efa <sbrk>
  if (p != a) {
    32fa:	83 c4 10             	add    $0x10,%esp
    32fd:	39 c6                	cmp    %eax,%esi
    32ff:	0f 85 49 03 00 00    	jne    364e <sbrktest+0x41e>
  a = sbrk(0);
    3305:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    3308:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    330f:	6a 00                	push   $0x0
    3311:	e8 e4 0b 00 00       	call   3efa <sbrk>
  c = sbrk(-4096);
    3316:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    331d:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    331f:	e8 d6 0b 00 00       	call   3efa <sbrk>
  if(c == (char*)0xffffffff){
    3324:	83 c4 10             	add    $0x10,%esp
    3327:	83 f8 ff             	cmp    $0xffffffff,%eax
    332a:	0f 84 00 03 00 00    	je     3630 <sbrktest+0x400>
  c = sbrk(0);
    3330:	83 ec 0c             	sub    $0xc,%esp
    3333:	6a 00                	push   $0x0
    3335:	e8 c0 0b 00 00       	call   3efa <sbrk>
  if(c != a - 4096){
    333a:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    3340:	83 c4 10             	add    $0x10,%esp
    3343:	39 d0                	cmp    %edx,%eax
    3345:	0f 85 c7 02 00 00    	jne    3612 <sbrktest+0x3e2>
  a = sbrk(0);
    334b:	83 ec 0c             	sub    $0xc,%esp
    334e:	6a 00                	push   $0x0
    3350:	e8 a5 0b 00 00       	call   3efa <sbrk>
    3355:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    3357:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    335e:	e8 97 0b 00 00       	call   3efa <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3363:	83 c4 10             	add    $0x10,%esp
    3366:	39 c6                	cmp    %eax,%esi
  c = sbrk(4096);
    3368:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    336a:	0f 85 84 02 00 00    	jne    35f4 <sbrktest+0x3c4>
    3370:	83 ec 0c             	sub    $0xc,%esp
    3373:	6a 00                	push   $0x0
    3375:	e8 80 0b 00 00       	call   3efa <sbrk>
    337a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    3380:	83 c4 10             	add    $0x10,%esp
    3383:	39 d0                	cmp    %edx,%eax
    3385:	0f 85 69 02 00 00    	jne    35f4 <sbrktest+0x3c4>
  if(*lastaddr == 99){
    338b:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3392:	0f 84 3e 02 00 00    	je     35d6 <sbrktest+0x3a6>
  a = sbrk(0);
    3398:	83 ec 0c             	sub    $0xc,%esp
    339b:	6a 00                	push   $0x0
    339d:	e8 58 0b 00 00       	call   3efa <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    33a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    33a9:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    33ab:	e8 4a 0b 00 00       	call   3efa <sbrk>
    33b0:	89 d9                	mov    %ebx,%ecx
    33b2:	29 c1                	sub    %eax,%ecx
    33b4:	89 0c 24             	mov    %ecx,(%esp)
    33b7:	e8 3e 0b 00 00       	call   3efa <sbrk>
  if(c != a){
    33bc:	83 c4 10             	add    $0x10,%esp
    33bf:	39 c6                	cmp    %eax,%esi
    33c1:	0f 85 f1 01 00 00    	jne    35b8 <sbrktest+0x388>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33c7:	be 00 00 00 80       	mov    $0x80000000,%esi
    ppid = getpid();
    33cc:	e8 21 0b 00 00       	call   3ef2 <getpid>
    33d1:	89 c7                	mov    %eax,%edi
    pid = fork();
    33d3:	e8 92 0a 00 00       	call   3e6a <fork>
    if(pid < 0){
    33d8:	85 c0                	test   %eax,%eax
    33da:	0f 88 ba 01 00 00    	js     359a <sbrktest+0x36a>
    if(pid == 0){
    33e0:	0f 84 8b 01 00 00    	je     3571 <sbrktest+0x341>
    wait(null);
    33e6:	83 ec 0c             	sub    $0xc,%esp
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33e9:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    wait(null);
    33ef:	6a 00                	push   $0x0
    33f1:	e8 84 0a 00 00       	call   3e7a <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33f6:	83 c4 10             	add    $0x10,%esp
    33f9:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    33ff:	75 cb                	jne    33cc <sbrktest+0x19c>
  if(pipe(fds) != 0){
    3401:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3404:	83 ec 0c             	sub    $0xc,%esp
    3407:	50                   	push   %eax
    3408:	e8 75 0a 00 00       	call   3e82 <pipe>
    340d:	83 c4 10             	add    $0x10,%esp
    3410:	85 c0                	test   %eax,%eax
    3412:	0f 85 3f 01 00 00    	jne    3557 <sbrktest+0x327>
    3418:	8d 7d c0             	lea    -0x40(%ebp),%edi
    341b:	89 fe                	mov    %edi,%esi
    341d:	eb 23                	jmp    3442 <sbrktest+0x212>
    if(pids[i] != -1)
    341f:	83 f8 ff             	cmp    $0xffffffff,%eax
    3422:	74 14                	je     3438 <sbrktest+0x208>
      read(fds[0], &scratch, 1);
    3424:	8d 45 b7             	lea    -0x49(%ebp),%eax
    3427:	83 ec 04             	sub    $0x4,%esp
    342a:	6a 01                	push   $0x1
    342c:	50                   	push   %eax
    342d:	ff 75 b8             	pushl  -0x48(%ebp)
    3430:	e8 55 0a 00 00       	call   3e8a <read>
    3435:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3438:	8d 45 e8             	lea    -0x18(%ebp),%eax
    343b:	83 c6 04             	add    $0x4,%esi
    343e:	39 c6                	cmp    %eax,%esi
    3440:	74 50                	je     3492 <sbrktest+0x262>
    if((pids[i] = fork()) == 0){
    3442:	e8 23 0a 00 00       	call   3e6a <fork>
    3447:	85 c0                	test   %eax,%eax
    3449:	89 06                	mov    %eax,(%esi)
    344b:	75 d2                	jne    341f <sbrktest+0x1ef>
      sbrk(BIG - (uint)sbrk(0));
    344d:	83 ec 0c             	sub    $0xc,%esp
    3450:	6a 00                	push   $0x0
    3452:	e8 a3 0a 00 00       	call   3efa <sbrk>
    3457:	ba 00 00 40 06       	mov    $0x6400000,%edx
    345c:	29 c2                	sub    %eax,%edx
    345e:	89 14 24             	mov    %edx,(%esp)
    3461:	e8 94 0a 00 00       	call   3efa <sbrk>
      write(fds[1], "x", 1);
    3466:	83 c4 0c             	add    $0xc,%esp
    3469:	6a 01                	push   $0x1
    346b:	68 91 4c 00 00       	push   $0x4c91
    3470:	ff 75 bc             	pushl  -0x44(%ebp)
    3473:	e8 1a 0a 00 00       	call   3e92 <write>
    3478:	83 c4 10             	add    $0x10,%esp
    347b:	90                   	nop
    347c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    3480:	83 ec 0c             	sub    $0xc,%esp
    3483:	68 e8 03 00 00       	push   $0x3e8
    3488:	e8 75 0a 00 00       	call   3f02 <sleep>
    348d:	83 c4 10             	add    $0x10,%esp
    3490:	eb ee                	jmp    3480 <sbrktest+0x250>
  c = sbrk(4096);
    3492:	83 ec 0c             	sub    $0xc,%esp
    3495:	68 00 10 00 00       	push   $0x1000
    349a:	e8 5b 0a 00 00       	call   3efa <sbrk>
    349f:	83 c4 10             	add    $0x10,%esp
    34a2:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    34a5:	8b 07                	mov    (%edi),%eax
    34a7:	83 f8 ff             	cmp    $0xffffffff,%eax
    34aa:	74 18                	je     34c4 <sbrktest+0x294>
    kill(pids[i]);
    34ac:	83 ec 0c             	sub    $0xc,%esp
    34af:	50                   	push   %eax
    34b0:	e8 ed 09 00 00       	call   3ea2 <kill>
    wait(null);
    34b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34bc:	e8 b9 09 00 00       	call   3e7a <wait>
    34c1:	83 c4 10             	add    $0x10,%esp
    34c4:	83 c7 04             	add    $0x4,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    34c7:	39 fe                	cmp    %edi,%esi
    34c9:	75 da                	jne    34a5 <sbrktest+0x275>
  if(c == (char*)0xffffffff){
    34cb:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    34cf:	74 68                	je     3539 <sbrktest+0x309>
  if(sbrk(0) > oldbrk)
    34d1:	83 ec 0c             	sub    $0xc,%esp
    34d4:	6a 00                	push   $0x0
    34d6:	e8 1f 0a 00 00       	call   3efa <sbrk>
    34db:	83 c4 10             	add    $0x10,%esp
    34de:	39 d8                	cmp    %ebx,%eax
    34e0:	77 3e                	ja     3520 <sbrktest+0x2f0>
  printf(stdout, "sbrk test OK\n");
    34e2:	83 ec 08             	sub    $0x8,%esp
    34e5:	68 d0 51 00 00       	push   $0x51d0
    34ea:	ff 35 e8 63 00 00    	pushl  0x63e8
    34f0:	e8 eb 0a 00 00       	call   3fe0 <printf>
}
    34f5:	83 c4 10             	add    $0x10,%esp
    34f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    34fb:	5b                   	pop    %ebx
    34fc:	5e                   	pop    %esi
    34fd:	5f                   	pop    %edi
    34fe:	5d                   	pop    %ebp
    34ff:	c3                   	ret    
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3500:	83 ec 0c             	sub    $0xc,%esp
    3503:	50                   	push   %eax
    3504:	56                   	push   %esi
    3505:	57                   	push   %edi
    3506:	68 33 51 00 00       	push   $0x5133
    350b:	ff 35 e8 63 00 00    	pushl  0x63e8
    3511:	e8 ca 0a 00 00       	call   3fe0 <printf>
      exit(0);
    3516:	83 c4 14             	add    $0x14,%esp
    3519:	6a 00                	push   $0x0
    351b:	e8 52 09 00 00       	call   3e72 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    3520:	83 ec 0c             	sub    $0xc,%esp
    3523:	6a 00                	push   $0x0
    3525:	e8 d0 09 00 00       	call   3efa <sbrk>
    352a:	29 c3                	sub    %eax,%ebx
    352c:	89 1c 24             	mov    %ebx,(%esp)
    352f:	e8 c6 09 00 00       	call   3efa <sbrk>
    3534:	83 c4 10             	add    $0x10,%esp
    3537:	eb a9                	jmp    34e2 <sbrktest+0x2b2>
    printf(stdout, "failed sbrk leaked memory\n");
    3539:	50                   	push   %eax
    353a:	50                   	push   %eax
    353b:	68 b5 51 00 00       	push   $0x51b5
    3540:	ff 35 e8 63 00 00    	pushl  0x63e8
    3546:	e8 95 0a 00 00       	call   3fe0 <printf>
    exit(0);
    354b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3552:	e8 1b 09 00 00       	call   3e72 <exit>
    printf(1, "pipe() failed\n");
    3557:	52                   	push   %edx
    3558:	52                   	push   %edx
    3559:	68 71 46 00 00       	push   $0x4671
    355e:	6a 01                	push   $0x1
    3560:	e8 7b 0a 00 00       	call   3fe0 <printf>
    exit(0);
    3565:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    356c:	e8 01 09 00 00       	call   3e72 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3571:	0f be 06             	movsbl (%esi),%eax
    3574:	50                   	push   %eax
    3575:	56                   	push   %esi
    3576:	68 9c 51 00 00       	push   $0x519c
    357b:	ff 35 e8 63 00 00    	pushl  0x63e8
    3581:	e8 5a 0a 00 00       	call   3fe0 <printf>
      kill(ppid);
    3586:	89 3c 24             	mov    %edi,(%esp)
    3589:	e8 14 09 00 00       	call   3ea2 <kill>
      exit(0);
    358e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3595:	e8 d8 08 00 00       	call   3e72 <exit>
      printf(stdout, "fork failed\n");
    359a:	51                   	push   %ecx
    359b:	51                   	push   %ecx
    359c:	68 79 52 00 00       	push   $0x5279
    35a1:	ff 35 e8 63 00 00    	pushl  0x63e8
    35a7:	e8 34 0a 00 00       	call   3fe0 <printf>
      exit(0);
    35ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35b3:	e8 ba 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    35b8:	50                   	push   %eax
    35b9:	56                   	push   %esi
    35ba:	68 7c 59 00 00       	push   $0x597c
    35bf:	ff 35 e8 63 00 00    	pushl  0x63e8
    35c5:	e8 16 0a 00 00       	call   3fe0 <printf>
    exit(0);
    35ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35d1:	e8 9c 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    35d6:	53                   	push   %ebx
    35d7:	53                   	push   %ebx
    35d8:	68 4c 59 00 00       	push   $0x594c
    35dd:	ff 35 e8 63 00 00    	pushl  0x63e8
    35e3:	e8 f8 09 00 00       	call   3fe0 <printf>
    exit(0);
    35e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35ef:	e8 7e 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    35f4:	57                   	push   %edi
    35f5:	56                   	push   %esi
    35f6:	68 24 59 00 00       	push   $0x5924
    35fb:	ff 35 e8 63 00 00    	pushl  0x63e8
    3601:	e8 da 09 00 00       	call   3fe0 <printf>
    exit(0);
    3606:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    360d:	e8 60 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3612:	50                   	push   %eax
    3613:	56                   	push   %esi
    3614:	68 ec 58 00 00       	push   $0x58ec
    3619:	ff 35 e8 63 00 00    	pushl  0x63e8
    361f:	e8 bc 09 00 00       	call   3fe0 <printf>
    exit(0);
    3624:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    362b:	e8 42 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    3630:	56                   	push   %esi
    3631:	56                   	push   %esi
    3632:	68 81 51 00 00       	push   $0x5181
    3637:	ff 35 e8 63 00 00    	pushl  0x63e8
    363d:	e8 9e 09 00 00       	call   3fe0 <printf>
    exit(0);
    3642:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3649:	e8 24 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    364e:	57                   	push   %edi
    364f:	57                   	push   %edi
    3650:	68 ac 58 00 00       	push   $0x58ac
    3655:	ff 35 e8 63 00 00    	pushl  0x63e8
    365b:	e8 80 09 00 00       	call   3fe0 <printf>
    exit(0);
    3660:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3667:	e8 06 08 00 00       	call   3e72 <exit>
    exit(0);
    366c:	83 ec 0c             	sub    $0xc,%esp
    366f:	6a 00                	push   $0x0
    3671:	e8 fc 07 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3676:	50                   	push   %eax
    3677:	50                   	push   %eax
    3678:	68 65 51 00 00       	push   $0x5165
    367d:	ff 35 e8 63 00 00    	pushl  0x63e8
    3683:	e8 58 09 00 00       	call   3fe0 <printf>
    exit(0);
    3688:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    368f:	e8 de 07 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3694:	50                   	push   %eax
    3695:	50                   	push   %eax
    3696:	68 4e 51 00 00       	push   $0x514e
    369b:	ff 35 e8 63 00 00    	pushl  0x63e8
    36a1:	e8 3a 09 00 00       	call   3fe0 <printf>
    exit(0);
    36a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36ad:	e8 c0 07 00 00       	call   3e72 <exit>
    36b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036c0 <validateint>:
{
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
}
    36c3:	5d                   	pop    %ebp
    36c4:	c3                   	ret    
    36c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036d0 <validatetest>:
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	56                   	push   %esi
    36d4:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    36d5:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    36d7:	83 ec 08             	sub    $0x8,%esp
    36da:	68 de 51 00 00       	push   $0x51de
    36df:	ff 35 e8 63 00 00    	pushl  0x63e8
    36e5:	e8 f6 08 00 00       	call   3fe0 <printf>
    36ea:	83 c4 10             	add    $0x10,%esp
    36ed:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    36f0:	e8 75 07 00 00       	call   3e6a <fork>
    36f5:	85 c0                	test   %eax,%eax
    36f7:	89 c6                	mov    %eax,%esi
    36f9:	74 6a                	je     3765 <validatetest+0x95>
    sleep(0);
    36fb:	83 ec 0c             	sub    $0xc,%esp
    36fe:	6a 00                	push   $0x0
    3700:	e8 fd 07 00 00       	call   3f02 <sleep>
    sleep(0);
    3705:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    370c:	e8 f1 07 00 00       	call   3f02 <sleep>
    kill(pid);
    3711:	89 34 24             	mov    %esi,(%esp)
    3714:	e8 89 07 00 00       	call   3ea2 <kill>
    wait(null);
    3719:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3720:	e8 55 07 00 00       	call   3e7a <wait>
    if(link("nosuchfile", (char*)p) != -1){
    3725:	58                   	pop    %eax
    3726:	5a                   	pop    %edx
    3727:	53                   	push   %ebx
    3728:	68 ed 51 00 00       	push   $0x51ed
    372d:	e8 a0 07 00 00       	call   3ed2 <link>
    3732:	83 c4 10             	add    $0x10,%esp
    3735:	83 f8 ff             	cmp    $0xffffffff,%eax
    3738:	75 35                	jne    376f <validatetest+0x9f>
  for(p = 0; p <= (uint)hi; p += 4096){
    373a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3740:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3746:	75 a8                	jne    36f0 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3748:	83 ec 08             	sub    $0x8,%esp
    374b:	68 11 52 00 00       	push   $0x5211
    3750:	ff 35 e8 63 00 00    	pushl  0x63e8
    3756:	e8 85 08 00 00       	call   3fe0 <printf>
}
    375b:	83 c4 10             	add    $0x10,%esp
    375e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3761:	5b                   	pop    %ebx
    3762:	5e                   	pop    %esi
    3763:	5d                   	pop    %ebp
    3764:	c3                   	ret    
      exit(0);
    3765:	83 ec 0c             	sub    $0xc,%esp
    3768:	6a 00                	push   $0x0
    376a:	e8 03 07 00 00       	call   3e72 <exit>
      printf(stdout, "link should not succeed\n");
    376f:	83 ec 08             	sub    $0x8,%esp
    3772:	68 f8 51 00 00       	push   $0x51f8
    3777:	ff 35 e8 63 00 00    	pushl  0x63e8
    377d:	e8 5e 08 00 00       	call   3fe0 <printf>
      exit(0);
    3782:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3789:	e8 e4 06 00 00       	call   3e72 <exit>
    378e:	66 90                	xchg   %ax,%ax

00003790 <bsstest>:
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3796:	68 1e 52 00 00       	push   $0x521e
    379b:	ff 35 e8 63 00 00    	pushl  0x63e8
    37a1:	e8 3a 08 00 00       	call   3fe0 <printf>
    if(uninit[i] != '\0'){
    37a6:	83 c4 10             	add    $0x10,%esp
    37a9:	80 3d a0 64 00 00 00 	cmpb   $0x0,0x64a0
    37b0:	75 39                	jne    37eb <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    37b2:	b8 01 00 00 00       	mov    $0x1,%eax
    37b7:	89 f6                	mov    %esi,%esi
    37b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(uninit[i] != '\0'){
    37c0:	80 b8 a0 64 00 00 00 	cmpb   $0x0,0x64a0(%eax)
    37c7:	75 22                	jne    37eb <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    37c9:	83 c0 01             	add    $0x1,%eax
    37cc:	3d 10 27 00 00       	cmp    $0x2710,%eax
    37d1:	75 ed                	jne    37c0 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    37d3:	83 ec 08             	sub    $0x8,%esp
    37d6:	68 39 52 00 00       	push   $0x5239
    37db:	ff 35 e8 63 00 00    	pushl  0x63e8
    37e1:	e8 fa 07 00 00       	call   3fe0 <printf>
}
    37e6:	83 c4 10             	add    $0x10,%esp
    37e9:	c9                   	leave  
    37ea:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    37eb:	83 ec 08             	sub    $0x8,%esp
    37ee:	68 28 52 00 00       	push   $0x5228
    37f3:	ff 35 e8 63 00 00    	pushl  0x63e8
    37f9:	e8 e2 07 00 00       	call   3fe0 <printf>
      exit(0);
    37fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3805:	e8 68 06 00 00       	call   3e72 <exit>
    380a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003810 <bigargtest>:
{
    3810:	55                   	push   %ebp
    3811:	89 e5                	mov    %esp,%ebp
    3813:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3816:	68 46 52 00 00       	push   $0x5246
    381b:	e8 a2 06 00 00       	call   3ec2 <unlink>
  pid = fork();
    3820:	e8 45 06 00 00       	call   3e6a <fork>
  if(pid == 0){
    3825:	83 c4 10             	add    $0x10,%esp
    3828:	85 c0                	test   %eax,%eax
    382a:	74 43                	je     386f <bigargtest+0x5f>
  } else if(pid < 0){
    382c:	0f 88 d8 00 00 00    	js     390a <bigargtest+0xfa>
  wait(null);
    3832:	83 ec 0c             	sub    $0xc,%esp
    3835:	6a 00                	push   $0x0
    3837:	e8 3e 06 00 00       	call   3e7a <wait>
  fd = open("bigarg-ok", 0);
    383c:	5a                   	pop    %edx
    383d:	59                   	pop    %ecx
    383e:	6a 00                	push   $0x0
    3840:	68 46 52 00 00       	push   $0x5246
    3845:	e8 68 06 00 00       	call   3eb2 <open>
  if(fd < 0){
    384a:	83 c4 10             	add    $0x10,%esp
    384d:	85 c0                	test   %eax,%eax
    384f:	0f 88 97 00 00 00    	js     38ec <bigargtest+0xdc>
  close(fd);
    3855:	83 ec 0c             	sub    $0xc,%esp
    3858:	50                   	push   %eax
    3859:	e8 3c 06 00 00       	call   3e9a <close>
  unlink("bigarg-ok");
    385e:	c7 04 24 46 52 00 00 	movl   $0x5246,(%esp)
    3865:	e8 58 06 00 00       	call   3ec2 <unlink>
}
    386a:	83 c4 10             	add    $0x10,%esp
    386d:	c9                   	leave  
    386e:	c3                   	ret    
    386f:	b8 00 64 00 00       	mov    $0x6400,%eax
    3874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3878:	c7 00 a0 59 00 00    	movl   $0x59a0,(%eax)
    387e:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    3881:	3d 7c 64 00 00       	cmp    $0x647c,%eax
    3886:	75 f0                	jne    3878 <bigargtest+0x68>
    printf(stdout, "bigarg test\n");
    3888:	50                   	push   %eax
    3889:	50                   	push   %eax
    388a:	68 50 52 00 00       	push   $0x5250
    388f:	ff 35 e8 63 00 00    	pushl  0x63e8
    args[MAXARG-1] = 0;
    3895:	c7 05 7c 64 00 00 00 	movl   $0x0,0x647c
    389c:	00 00 00 
    printf(stdout, "bigarg test\n");
    389f:	e8 3c 07 00 00       	call   3fe0 <printf>
    exec("echo", args);
    38a4:	58                   	pop    %eax
    38a5:	5a                   	pop    %edx
    38a6:	68 00 64 00 00       	push   $0x6400
    38ab:	68 1d 44 00 00       	push   $0x441d
    38b0:	e8 f5 05 00 00       	call   3eaa <exec>
    printf(stdout, "bigarg test ok\n");
    38b5:	59                   	pop    %ecx
    38b6:	58                   	pop    %eax
    38b7:	68 5d 52 00 00       	push   $0x525d
    38bc:	ff 35 e8 63 00 00    	pushl  0x63e8
    38c2:	e8 19 07 00 00       	call   3fe0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    38c7:	58                   	pop    %eax
    38c8:	5a                   	pop    %edx
    38c9:	68 00 02 00 00       	push   $0x200
    38ce:	68 46 52 00 00       	push   $0x5246
    38d3:	e8 da 05 00 00       	call   3eb2 <open>
    close(fd);
    38d8:	89 04 24             	mov    %eax,(%esp)
    38db:	e8 ba 05 00 00       	call   3e9a <close>
    exit(0);
    38e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38e7:	e8 86 05 00 00       	call   3e72 <exit>
    printf(stdout, "bigarg test failed!\n");
    38ec:	50                   	push   %eax
    38ed:	50                   	push   %eax
    38ee:	68 86 52 00 00       	push   $0x5286
    38f3:	ff 35 e8 63 00 00    	pushl  0x63e8
    38f9:	e8 e2 06 00 00       	call   3fe0 <printf>
    exit(0);
    38fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3905:	e8 68 05 00 00       	call   3e72 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    390a:	50                   	push   %eax
    390b:	50                   	push   %eax
    390c:	68 6d 52 00 00       	push   $0x526d
    3911:	ff 35 e8 63 00 00    	pushl  0x63e8
    3917:	e8 c4 06 00 00       	call   3fe0 <printf>
    exit(0);
    391c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3923:	e8 4a 05 00 00       	call   3e72 <exit>
    3928:	90                   	nop
    3929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003930 <fsfull>:
{
    3930:	55                   	push   %ebp
    3931:	89 e5                	mov    %esp,%ebp
    3933:	57                   	push   %edi
    3934:	56                   	push   %esi
    3935:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    3936:	31 db                	xor    %ebx,%ebx
{
    3938:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    393b:	68 9b 52 00 00       	push   $0x529b
    3940:	6a 01                	push   $0x1
    3942:	e8 99 06 00 00       	call   3fe0 <printf>
    3947:	83 c4 10             	add    $0x10,%esp
    394a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3950:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3955:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    395a:	83 ec 04             	sub    $0x4,%esp
    name[1] = '0' + nfiles / 1000;
    395d:	f7 e3                	mul    %ebx
    name[0] = 'f';
    395f:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    3963:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3967:	c1 ea 06             	shr    $0x6,%edx
    396a:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    396d:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3973:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3976:	89 d8                	mov    %ebx,%eax
    3978:	29 d0                	sub    %edx,%eax
    397a:	89 c2                	mov    %eax,%edx
    397c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3981:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    3983:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3988:	c1 ea 05             	shr    $0x5,%edx
    398b:	83 c2 30             	add    $0x30,%edx
    398e:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3991:	f7 e3                	mul    %ebx
    3993:	89 d8                	mov    %ebx,%eax
    3995:	c1 ea 05             	shr    $0x5,%edx
    3998:	6b d2 64             	imul   $0x64,%edx,%edx
    399b:	29 d0                	sub    %edx,%eax
    399d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    399f:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    39a1:	c1 ea 03             	shr    $0x3,%edx
    39a4:	83 c2 30             	add    $0x30,%edx
    39a7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    39aa:	f7 e1                	mul    %ecx
    39ac:	89 d9                	mov    %ebx,%ecx
    39ae:	c1 ea 03             	shr    $0x3,%edx
    39b1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    39b4:	01 c0                	add    %eax,%eax
    39b6:	29 c1                	sub    %eax,%ecx
    39b8:	89 c8                	mov    %ecx,%eax
    39ba:	83 c0 30             	add    $0x30,%eax
    39bd:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    39c0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    39c3:	50                   	push   %eax
    39c4:	68 a8 52 00 00       	push   $0x52a8
    39c9:	6a 01                	push   $0x1
    39cb:	e8 10 06 00 00       	call   3fe0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    39d0:	58                   	pop    %eax
    39d1:	8d 45 a8             	lea    -0x58(%ebp),%eax
    39d4:	5a                   	pop    %edx
    39d5:	68 02 02 00 00       	push   $0x202
    39da:	50                   	push   %eax
    39db:	e8 d2 04 00 00       	call   3eb2 <open>
    if(fd < 0){
    39e0:	83 c4 10             	add    $0x10,%esp
    39e3:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    39e5:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    39e7:	78 57                	js     3a40 <fsfull+0x110>
    int total = 0;
    39e9:	31 f6                	xor    %esi,%esi
    39eb:	eb 05                	jmp    39f2 <fsfull+0xc2>
    39ed:	8d 76 00             	lea    0x0(%esi),%esi
      total += cc;
    39f0:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    39f2:	83 ec 04             	sub    $0x4,%esp
    39f5:	68 00 02 00 00       	push   $0x200
    39fa:	68 c0 8b 00 00       	push   $0x8bc0
    39ff:	57                   	push   %edi
    3a00:	e8 8d 04 00 00       	call   3e92 <write>
      if(cc < 512)
    3a05:	83 c4 10             	add    $0x10,%esp
    3a08:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3a0d:	7f e1                	jg     39f0 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    3a0f:	83 ec 04             	sub    $0x4,%esp
    3a12:	56                   	push   %esi
    3a13:	68 c4 52 00 00       	push   $0x52c4
    3a18:	6a 01                	push   $0x1
    3a1a:	e8 c1 05 00 00       	call   3fe0 <printf>
    close(fd);
    3a1f:	89 3c 24             	mov    %edi,(%esp)
    3a22:	e8 73 04 00 00       	call   3e9a <close>
    if(total == 0)
    3a27:	83 c4 10             	add    $0x10,%esp
    3a2a:	85 f6                	test   %esi,%esi
    3a2c:	74 28                	je     3a56 <fsfull+0x126>
  for(nfiles = 0; ; nfiles++){
    3a2e:	83 c3 01             	add    $0x1,%ebx
    3a31:	e9 1a ff ff ff       	jmp    3950 <fsfull+0x20>
    3a36:	8d 76 00             	lea    0x0(%esi),%esi
    3a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "open %s failed\n", name);
    3a40:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3a43:	83 ec 04             	sub    $0x4,%esp
    3a46:	50                   	push   %eax
    3a47:	68 b4 52 00 00       	push   $0x52b4
    3a4c:	6a 01                	push   $0x1
    3a4e:	e8 8d 05 00 00       	call   3fe0 <printf>
      break;
    3a53:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    3a56:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    3a5b:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    name[1] = '0' + nfiles / 1000;
    3a60:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3a62:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    unlink(name);
    3a67:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + nfiles / 1000;
    3a6a:	f7 e7                	mul    %edi
    name[0] = 'f';
    3a6c:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    3a70:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3a74:	c1 ea 06             	shr    $0x6,%edx
    3a77:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3a7a:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3a80:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3a83:	89 d8                	mov    %ebx,%eax
    3a85:	29 d0                	sub    %edx,%eax
    3a87:	f7 e6                	mul    %esi
    name[3] = '0' + (nfiles % 100) / 10;
    3a89:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3a8b:	c1 ea 05             	shr    $0x5,%edx
    3a8e:	83 c2 30             	add    $0x30,%edx
    3a91:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3a94:	f7 e6                	mul    %esi
    3a96:	89 d8                	mov    %ebx,%eax
    3a98:	c1 ea 05             	shr    $0x5,%edx
    3a9b:	6b d2 64             	imul   $0x64,%edx,%edx
    3a9e:	29 d0                	sub    %edx,%eax
    3aa0:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    3aa2:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3aa4:	c1 ea 03             	shr    $0x3,%edx
    3aa7:	83 c2 30             	add    $0x30,%edx
    3aaa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3aad:	f7 e1                	mul    %ecx
    3aaf:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    3ab1:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    3ab4:	c1 ea 03             	shr    $0x3,%edx
    3ab7:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3aba:	01 c0                	add    %eax,%eax
    3abc:	29 c1                	sub    %eax,%ecx
    3abe:	89 c8                	mov    %ecx,%eax
    3ac0:	83 c0 30             	add    $0x30,%eax
    3ac3:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3ac6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3ac9:	50                   	push   %eax
    3aca:	e8 f3 03 00 00       	call   3ec2 <unlink>
  while(nfiles >= 0){
    3acf:	83 c4 10             	add    $0x10,%esp
    3ad2:	83 fb ff             	cmp    $0xffffffff,%ebx
    3ad5:	75 89                	jne    3a60 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    3ad7:	83 ec 08             	sub    $0x8,%esp
    3ada:	68 d4 52 00 00       	push   $0x52d4
    3adf:	6a 01                	push   $0x1
    3ae1:	e8 fa 04 00 00       	call   3fe0 <printf>
}
    3ae6:	83 c4 10             	add    $0x10,%esp
    3ae9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3aec:	5b                   	pop    %ebx
    3aed:	5e                   	pop    %esi
    3aee:	5f                   	pop    %edi
    3aef:	5d                   	pop    %ebp
    3af0:	c3                   	ret    
    3af1:	eb 0d                	jmp    3b00 <uio>
    3af3:	90                   	nop
    3af4:	90                   	nop
    3af5:	90                   	nop
    3af6:	90                   	nop
    3af7:	90                   	nop
    3af8:	90                   	nop
    3af9:	90                   	nop
    3afa:	90                   	nop
    3afb:	90                   	nop
    3afc:	90                   	nop
    3afd:	90                   	nop
    3afe:	90                   	nop
    3aff:	90                   	nop

00003b00 <uio>:
{
    3b00:	55                   	push   %ebp
    3b01:	89 e5                	mov    %esp,%ebp
    3b03:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    3b06:	68 ea 52 00 00       	push   $0x52ea
    3b0b:	6a 01                	push   $0x1
    3b0d:	e8 ce 04 00 00       	call   3fe0 <printf>
  pid = fork();
    3b12:	e8 53 03 00 00       	call   3e6a <fork>
  if(pid == 0){
    3b17:	83 c4 10             	add    $0x10,%esp
    3b1a:	85 c0                	test   %eax,%eax
    3b1c:	74 1f                	je     3b3d <uio+0x3d>
  } else if(pid < 0){
    3b1e:	78 48                	js     3b68 <uio+0x68>
  wait(null);
    3b20:	83 ec 0c             	sub    $0xc,%esp
    3b23:	6a 00                	push   $0x0
    3b25:	e8 50 03 00 00       	call   3e7a <wait>
  printf(1, "uio test done\n");
    3b2a:	58                   	pop    %eax
    3b2b:	5a                   	pop    %edx
    3b2c:	68 f4 52 00 00       	push   $0x52f4
    3b31:	6a 01                	push   $0x1
    3b33:	e8 a8 04 00 00       	call   3fe0 <printf>
}
    3b38:	83 c4 10             	add    $0x10,%esp
    3b3b:	c9                   	leave  
    3b3c:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3b3d:	b8 09 00 00 00       	mov    $0x9,%eax
    3b42:	ba 70 00 00 00       	mov    $0x70,%edx
    3b47:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3b48:	ba 71 00 00 00       	mov    $0x71,%edx
    3b4d:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3b4e:	50                   	push   %eax
    3b4f:	50                   	push   %eax
    3b50:	68 80 5a 00 00       	push   $0x5a80
    3b55:	6a 01                	push   $0x1
    3b57:	e8 84 04 00 00       	call   3fe0 <printf>
    exit(0);
    3b5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b63:	e8 0a 03 00 00       	call   3e72 <exit>
    printf (1, "fork failed\n");
    3b68:	51                   	push   %ecx
    3b69:	51                   	push   %ecx
    3b6a:	68 79 52 00 00       	push   $0x5279
    3b6f:	6a 01                	push   $0x1
    3b71:	e8 6a 04 00 00       	call   3fe0 <printf>
    exit(0);
    3b76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b7d:	e8 f0 02 00 00       	call   3e72 <exit>
    3b82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b90 <argptest>:
{
    3b90:	55                   	push   %ebp
    3b91:	89 e5                	mov    %esp,%ebp
    3b93:	53                   	push   %ebx
    3b94:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    3b97:	6a 00                	push   $0x0
    3b99:	68 03 53 00 00       	push   $0x5303
    3b9e:	e8 0f 03 00 00       	call   3eb2 <open>
  if (fd < 0) {
    3ba3:	83 c4 10             	add    $0x10,%esp
    3ba6:	85 c0                	test   %eax,%eax
    3ba8:	78 39                	js     3be3 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    3baa:	83 ec 0c             	sub    $0xc,%esp
    3bad:	89 c3                	mov    %eax,%ebx
    3baf:	6a 00                	push   $0x0
    3bb1:	e8 44 03 00 00       	call   3efa <sbrk>
    3bb6:	83 c4 0c             	add    $0xc,%esp
    3bb9:	83 e8 01             	sub    $0x1,%eax
    3bbc:	6a ff                	push   $0xffffffff
    3bbe:	50                   	push   %eax
    3bbf:	53                   	push   %ebx
    3bc0:	e8 c5 02 00 00       	call   3e8a <read>
  close(fd);
    3bc5:	89 1c 24             	mov    %ebx,(%esp)
    3bc8:	e8 cd 02 00 00       	call   3e9a <close>
  printf(1, "arg test passed\n");
    3bcd:	58                   	pop    %eax
    3bce:	5a                   	pop    %edx
    3bcf:	68 15 53 00 00       	push   $0x5315
    3bd4:	6a 01                	push   $0x1
    3bd6:	e8 05 04 00 00       	call   3fe0 <printf>
}
    3bdb:	83 c4 10             	add    $0x10,%esp
    3bde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3be1:	c9                   	leave  
    3be2:	c3                   	ret    
    printf(2, "open failed\n");
    3be3:	51                   	push   %ecx
    3be4:	51                   	push   %ecx
    3be5:	68 08 53 00 00       	push   $0x5308
    3bea:	6a 02                	push   $0x2
    3bec:	e8 ef 03 00 00       	call   3fe0 <printf>
    exit(0);
    3bf1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3bf8:	e8 75 02 00 00       	call   3e72 <exit>
    3bfd:	8d 76 00             	lea    0x0(%esi),%esi

00003c00 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3c00:	69 05 e4 63 00 00 0d 	imul   $0x19660d,0x63e4,%eax
    3c07:	66 19 00 
{
    3c0a:	55                   	push   %ebp
    3c0b:	89 e5                	mov    %esp,%ebp
}
    3c0d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    3c0e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3c13:	a3 e4 63 00 00       	mov    %eax,0x63e4
}
    3c18:	c3                   	ret    
    3c19:	66 90                	xchg   %ax,%ax
    3c1b:	66 90                	xchg   %ax,%ax
    3c1d:	66 90                	xchg   %ax,%ax
    3c1f:	90                   	nop

00003c20 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3c20:	55                   	push   %ebp
    3c21:	89 e5                	mov    %esp,%ebp
    3c23:	53                   	push   %ebx
    3c24:	8b 45 08             	mov    0x8(%ebp),%eax
    3c27:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3c2a:	89 c2                	mov    %eax,%edx
    3c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3c30:	83 c1 01             	add    $0x1,%ecx
    3c33:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3c37:	83 c2 01             	add    $0x1,%edx
    3c3a:	84 db                	test   %bl,%bl
    3c3c:	88 5a ff             	mov    %bl,-0x1(%edx)
    3c3f:	75 ef                	jne    3c30 <strcpy+0x10>
    ;
  return os;
}
    3c41:	5b                   	pop    %ebx
    3c42:	5d                   	pop    %ebp
    3c43:	c3                   	ret    
    3c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003c50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3c50:	55                   	push   %ebp
    3c51:	89 e5                	mov    %esp,%ebp
    3c53:	53                   	push   %ebx
    3c54:	8b 55 08             	mov    0x8(%ebp),%edx
    3c57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    3c5a:	0f b6 02             	movzbl (%edx),%eax
    3c5d:	0f b6 19             	movzbl (%ecx),%ebx
    3c60:	84 c0                	test   %al,%al
    3c62:	75 1c                	jne    3c80 <strcmp+0x30>
    3c64:	eb 2a                	jmp    3c90 <strcmp+0x40>
    3c66:	8d 76 00             	lea    0x0(%esi),%esi
    3c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3c70:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3c73:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3c76:	83 c1 01             	add    $0x1,%ecx
    3c79:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    3c7c:	84 c0                	test   %al,%al
    3c7e:	74 10                	je     3c90 <strcmp+0x40>
    3c80:	38 d8                	cmp    %bl,%al
    3c82:	74 ec                	je     3c70 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    3c84:	29 d8                	sub    %ebx,%eax
}
    3c86:	5b                   	pop    %ebx
    3c87:	5d                   	pop    %ebp
    3c88:	c3                   	ret    
    3c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c90:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    3c92:	29 d8                	sub    %ebx,%eax
}
    3c94:	5b                   	pop    %ebx
    3c95:	5d                   	pop    %ebp
    3c96:	c3                   	ret    
    3c97:	89 f6                	mov    %esi,%esi
    3c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003ca0 <strlen>:

uint
strlen(const char *s)
{
    3ca0:	55                   	push   %ebp
    3ca1:	89 e5                	mov    %esp,%ebp
    3ca3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3ca6:	80 39 00             	cmpb   $0x0,(%ecx)
    3ca9:	74 15                	je     3cc0 <strlen+0x20>
    3cab:	31 d2                	xor    %edx,%edx
    3cad:	8d 76 00             	lea    0x0(%esi),%esi
    3cb0:	83 c2 01             	add    $0x1,%edx
    3cb3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3cb7:	89 d0                	mov    %edx,%eax
    3cb9:	75 f5                	jne    3cb0 <strlen+0x10>
    ;
  return n;
}
    3cbb:	5d                   	pop    %ebp
    3cbc:	c3                   	ret    
    3cbd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    3cc0:	31 c0                	xor    %eax,%eax
}
    3cc2:	5d                   	pop    %ebp
    3cc3:	c3                   	ret    
    3cc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3cca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003cd0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3cd0:	55                   	push   %ebp
    3cd1:	89 e5                	mov    %esp,%ebp
    3cd3:	57                   	push   %edi
    3cd4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3cd7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3cda:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cdd:	89 d7                	mov    %edx,%edi
    3cdf:	fc                   	cld    
    3ce0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3ce2:	89 d0                	mov    %edx,%eax
    3ce4:	5f                   	pop    %edi
    3ce5:	5d                   	pop    %ebp
    3ce6:	c3                   	ret    
    3ce7:	89 f6                	mov    %esi,%esi
    3ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003cf0 <strchr>:

char*
strchr(const char *s, char c)
{
    3cf0:	55                   	push   %ebp
    3cf1:	89 e5                	mov    %esp,%ebp
    3cf3:	53                   	push   %ebx
    3cf4:	8b 45 08             	mov    0x8(%ebp),%eax
    3cf7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    3cfa:	0f b6 10             	movzbl (%eax),%edx
    3cfd:	84 d2                	test   %dl,%dl
    3cff:	74 1d                	je     3d1e <strchr+0x2e>
    if(*s == c)
    3d01:	38 d3                	cmp    %dl,%bl
    3d03:	89 d9                	mov    %ebx,%ecx
    3d05:	75 0d                	jne    3d14 <strchr+0x24>
    3d07:	eb 17                	jmp    3d20 <strchr+0x30>
    3d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3d10:	38 ca                	cmp    %cl,%dl
    3d12:	74 0c                	je     3d20 <strchr+0x30>
  for(; *s; s++)
    3d14:	83 c0 01             	add    $0x1,%eax
    3d17:	0f b6 10             	movzbl (%eax),%edx
    3d1a:	84 d2                	test   %dl,%dl
    3d1c:	75 f2                	jne    3d10 <strchr+0x20>
      return (char*)s;
  return 0;
    3d1e:	31 c0                	xor    %eax,%eax
}
    3d20:	5b                   	pop    %ebx
    3d21:	5d                   	pop    %ebp
    3d22:	c3                   	ret    
    3d23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d30 <gets>:

char*
gets(char *buf, int max)
{
    3d30:	55                   	push   %ebp
    3d31:	89 e5                	mov    %esp,%ebp
    3d33:	57                   	push   %edi
    3d34:	56                   	push   %esi
    3d35:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d36:	31 f6                	xor    %esi,%esi
    3d38:	89 f3                	mov    %esi,%ebx
{
    3d3a:	83 ec 1c             	sub    $0x1c,%esp
    3d3d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    3d40:	eb 2f                	jmp    3d71 <gets+0x41>
    3d42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    3d48:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3d4b:	83 ec 04             	sub    $0x4,%esp
    3d4e:	6a 01                	push   $0x1
    3d50:	50                   	push   %eax
    3d51:	6a 00                	push   $0x0
    3d53:	e8 32 01 00 00       	call   3e8a <read>
    if(cc < 1)
    3d58:	83 c4 10             	add    $0x10,%esp
    3d5b:	85 c0                	test   %eax,%eax
    3d5d:	7e 1c                	jle    3d7b <gets+0x4b>
      break;
    buf[i++] = c;
    3d5f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3d63:	83 c7 01             	add    $0x1,%edi
    3d66:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    3d69:	3c 0a                	cmp    $0xa,%al
    3d6b:	74 23                	je     3d90 <gets+0x60>
    3d6d:	3c 0d                	cmp    $0xd,%al
    3d6f:	74 1f                	je     3d90 <gets+0x60>
  for(i=0; i+1 < max; ){
    3d71:	83 c3 01             	add    $0x1,%ebx
    3d74:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3d77:	89 fe                	mov    %edi,%esi
    3d79:	7c cd                	jl     3d48 <gets+0x18>
    3d7b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    3d7d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    3d80:	c6 03 00             	movb   $0x0,(%ebx)
}
    3d83:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d86:	5b                   	pop    %ebx
    3d87:	5e                   	pop    %esi
    3d88:	5f                   	pop    %edi
    3d89:	5d                   	pop    %ebp
    3d8a:	c3                   	ret    
    3d8b:	90                   	nop
    3d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3d90:	8b 75 08             	mov    0x8(%ebp),%esi
    3d93:	8b 45 08             	mov    0x8(%ebp),%eax
    3d96:	01 de                	add    %ebx,%esi
    3d98:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    3d9a:	c6 03 00             	movb   $0x0,(%ebx)
}
    3d9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3da0:	5b                   	pop    %ebx
    3da1:	5e                   	pop    %esi
    3da2:	5f                   	pop    %edi
    3da3:	5d                   	pop    %ebp
    3da4:	c3                   	ret    
    3da5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003db0 <stat>:

int
stat(const char *n, struct stat *st)
{
    3db0:	55                   	push   %ebp
    3db1:	89 e5                	mov    %esp,%ebp
    3db3:	56                   	push   %esi
    3db4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3db5:	83 ec 08             	sub    $0x8,%esp
    3db8:	6a 00                	push   $0x0
    3dba:	ff 75 08             	pushl  0x8(%ebp)
    3dbd:	e8 f0 00 00 00       	call   3eb2 <open>
  if(fd < 0)
    3dc2:	83 c4 10             	add    $0x10,%esp
    3dc5:	85 c0                	test   %eax,%eax
    3dc7:	78 27                	js     3df0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3dc9:	83 ec 08             	sub    $0x8,%esp
    3dcc:	ff 75 0c             	pushl  0xc(%ebp)
    3dcf:	89 c3                	mov    %eax,%ebx
    3dd1:	50                   	push   %eax
    3dd2:	e8 f3 00 00 00       	call   3eca <fstat>
  close(fd);
    3dd7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    3dda:	89 c6                	mov    %eax,%esi
  close(fd);
    3ddc:	e8 b9 00 00 00       	call   3e9a <close>
  return r;
    3de1:	83 c4 10             	add    $0x10,%esp
}
    3de4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3de7:	89 f0                	mov    %esi,%eax
    3de9:	5b                   	pop    %ebx
    3dea:	5e                   	pop    %esi
    3deb:	5d                   	pop    %ebp
    3dec:	c3                   	ret    
    3ded:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3df0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3df5:	eb ed                	jmp    3de4 <stat+0x34>
    3df7:	89 f6                	mov    %esi,%esi
    3df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003e00 <atoi>:

int
atoi(const char *s)
{
    3e00:	55                   	push   %ebp
    3e01:	89 e5                	mov    %esp,%ebp
    3e03:	53                   	push   %ebx
    3e04:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3e07:	0f be 11             	movsbl (%ecx),%edx
    3e0a:	8d 42 d0             	lea    -0x30(%edx),%eax
    3e0d:	3c 09                	cmp    $0x9,%al
  n = 0;
    3e0f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    3e14:	77 1f                	ja     3e35 <atoi+0x35>
    3e16:	8d 76 00             	lea    0x0(%esi),%esi
    3e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3e20:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3e23:	83 c1 01             	add    $0x1,%ecx
    3e26:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    3e2a:	0f be 11             	movsbl (%ecx),%edx
    3e2d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3e30:	80 fb 09             	cmp    $0x9,%bl
    3e33:	76 eb                	jbe    3e20 <atoi+0x20>
  return n;
}
    3e35:	5b                   	pop    %ebx
    3e36:	5d                   	pop    %ebp
    3e37:	c3                   	ret    
    3e38:	90                   	nop
    3e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003e40 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3e40:	55                   	push   %ebp
    3e41:	89 e5                	mov    %esp,%ebp
    3e43:	56                   	push   %esi
    3e44:	53                   	push   %ebx
    3e45:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3e48:	8b 45 08             	mov    0x8(%ebp),%eax
    3e4b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3e4e:	85 db                	test   %ebx,%ebx
    3e50:	7e 14                	jle    3e66 <memmove+0x26>
    3e52:	31 d2                	xor    %edx,%edx
    3e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3e58:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3e5c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3e5f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    3e62:	39 d3                	cmp    %edx,%ebx
    3e64:	75 f2                	jne    3e58 <memmove+0x18>
  return vdst;
}
    3e66:	5b                   	pop    %ebx
    3e67:	5e                   	pop    %esi
    3e68:	5d                   	pop    %ebp
    3e69:	c3                   	ret    

00003e6a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3e6a:	b8 01 00 00 00       	mov    $0x1,%eax
    3e6f:	cd 40                	int    $0x40
    3e71:	c3                   	ret    

00003e72 <exit>:
SYSCALL(exit)
    3e72:	b8 02 00 00 00       	mov    $0x2,%eax
    3e77:	cd 40                	int    $0x40
    3e79:	c3                   	ret    

00003e7a <wait>:
SYSCALL(wait)
    3e7a:	b8 03 00 00 00       	mov    $0x3,%eax
    3e7f:	cd 40                	int    $0x40
    3e81:	c3                   	ret    

00003e82 <pipe>:
SYSCALL(pipe)
    3e82:	b8 04 00 00 00       	mov    $0x4,%eax
    3e87:	cd 40                	int    $0x40
    3e89:	c3                   	ret    

00003e8a <read>:
SYSCALL(read)
    3e8a:	b8 05 00 00 00       	mov    $0x5,%eax
    3e8f:	cd 40                	int    $0x40
    3e91:	c3                   	ret    

00003e92 <write>:
SYSCALL(write)
    3e92:	b8 10 00 00 00       	mov    $0x10,%eax
    3e97:	cd 40                	int    $0x40
    3e99:	c3                   	ret    

00003e9a <close>:
SYSCALL(close)
    3e9a:	b8 15 00 00 00       	mov    $0x15,%eax
    3e9f:	cd 40                	int    $0x40
    3ea1:	c3                   	ret    

00003ea2 <kill>:
SYSCALL(kill)
    3ea2:	b8 06 00 00 00       	mov    $0x6,%eax
    3ea7:	cd 40                	int    $0x40
    3ea9:	c3                   	ret    

00003eaa <exec>:
SYSCALL(exec)
    3eaa:	b8 07 00 00 00       	mov    $0x7,%eax
    3eaf:	cd 40                	int    $0x40
    3eb1:	c3                   	ret    

00003eb2 <open>:
SYSCALL(open)
    3eb2:	b8 0f 00 00 00       	mov    $0xf,%eax
    3eb7:	cd 40                	int    $0x40
    3eb9:	c3                   	ret    

00003eba <mknod>:
SYSCALL(mknod)
    3eba:	b8 11 00 00 00       	mov    $0x11,%eax
    3ebf:	cd 40                	int    $0x40
    3ec1:	c3                   	ret    

00003ec2 <unlink>:
SYSCALL(unlink)
    3ec2:	b8 12 00 00 00       	mov    $0x12,%eax
    3ec7:	cd 40                	int    $0x40
    3ec9:	c3                   	ret    

00003eca <fstat>:
SYSCALL(fstat)
    3eca:	b8 08 00 00 00       	mov    $0x8,%eax
    3ecf:	cd 40                	int    $0x40
    3ed1:	c3                   	ret    

00003ed2 <link>:
SYSCALL(link)
    3ed2:	b8 13 00 00 00       	mov    $0x13,%eax
    3ed7:	cd 40                	int    $0x40
    3ed9:	c3                   	ret    

00003eda <mkdir>:
SYSCALL(mkdir)
    3eda:	b8 14 00 00 00       	mov    $0x14,%eax
    3edf:	cd 40                	int    $0x40
    3ee1:	c3                   	ret    

00003ee2 <chdir>:
SYSCALL(chdir)
    3ee2:	b8 09 00 00 00       	mov    $0x9,%eax
    3ee7:	cd 40                	int    $0x40
    3ee9:	c3                   	ret    

00003eea <dup>:
SYSCALL(dup)
    3eea:	b8 0a 00 00 00       	mov    $0xa,%eax
    3eef:	cd 40                	int    $0x40
    3ef1:	c3                   	ret    

00003ef2 <getpid>:
SYSCALL(getpid)
    3ef2:	b8 0b 00 00 00       	mov    $0xb,%eax
    3ef7:	cd 40                	int    $0x40
    3ef9:	c3                   	ret    

00003efa <sbrk>:
SYSCALL(sbrk)
    3efa:	b8 0c 00 00 00       	mov    $0xc,%eax
    3eff:	cd 40                	int    $0x40
    3f01:	c3                   	ret    

00003f02 <sleep>:
SYSCALL(sleep)
    3f02:	b8 0d 00 00 00       	mov    $0xd,%eax
    3f07:	cd 40                	int    $0x40
    3f09:	c3                   	ret    

00003f0a <uptime>:
SYSCALL(uptime)
    3f0a:	b8 0e 00 00 00       	mov    $0xe,%eax
    3f0f:	cd 40                	int    $0x40
    3f11:	c3                   	ret    

00003f12 <memsize>:
SYSCALL(memsize)
    3f12:	b8 16 00 00 00       	mov    $0x16,%eax
    3f17:	cd 40                	int    $0x40
    3f19:	c3                   	ret    

00003f1a <set_ps_priority>:
SYSCALL(set_ps_priority)
    3f1a:	b8 17 00 00 00       	mov    $0x17,%eax
    3f1f:	cd 40                	int    $0x40
    3f21:	c3                   	ret    

00003f22 <set_cfs_priority>:
SYSCALL(set_cfs_priority)
    3f22:	b8 18 00 00 00       	mov    $0x18,%eax
    3f27:	cd 40                	int    $0x40
    3f29:	c3                   	ret    

00003f2a <policy>:
SYSCALL(policy)
    3f2a:	b8 19 00 00 00       	mov    $0x19,%eax
    3f2f:	cd 40                	int    $0x40
    3f31:	c3                   	ret    

00003f32 <proc_info>:
    3f32:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3f37:	cd 40                	int    $0x40
    3f39:	c3                   	ret    
    3f3a:	66 90                	xchg   %ax,%ax
    3f3c:	66 90                	xchg   %ax,%ax
    3f3e:	66 90                	xchg   %ax,%ax

00003f40 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3f40:	55                   	push   %ebp
    3f41:	89 e5                	mov    %esp,%ebp
    3f43:	57                   	push   %edi
    3f44:	56                   	push   %esi
    3f45:	53                   	push   %ebx
    3f46:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3f49:	85 d2                	test   %edx,%edx
{
    3f4b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    3f4e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    3f50:	79 76                	jns    3fc8 <printint+0x88>
    3f52:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3f56:	74 70                	je     3fc8 <printint+0x88>
    x = -xx;
    3f58:	f7 d8                	neg    %eax
    neg = 1;
    3f5a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3f61:	31 f6                	xor    %esi,%esi
    3f63:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3f66:	eb 0a                	jmp    3f72 <printint+0x32>
    3f68:	90                   	nop
    3f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    3f70:	89 fe                	mov    %edi,%esi
    3f72:	31 d2                	xor    %edx,%edx
    3f74:	8d 7e 01             	lea    0x1(%esi),%edi
    3f77:	f7 f1                	div    %ecx
    3f79:	0f b6 92 d8 5a 00 00 	movzbl 0x5ad8(%edx),%edx
  }while((x /= base) != 0);
    3f80:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    3f82:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    3f85:	75 e9                	jne    3f70 <printint+0x30>
  if(neg)
    3f87:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3f8a:	85 c0                	test   %eax,%eax
    3f8c:	74 08                	je     3f96 <printint+0x56>
    buf[i++] = '-';
    3f8e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    3f93:	8d 7e 02             	lea    0x2(%esi),%edi
    3f96:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    3f9a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    3f9d:	8d 76 00             	lea    0x0(%esi),%esi
    3fa0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    3fa3:	83 ec 04             	sub    $0x4,%esp
    3fa6:	83 ee 01             	sub    $0x1,%esi
    3fa9:	6a 01                	push   $0x1
    3fab:	53                   	push   %ebx
    3fac:	57                   	push   %edi
    3fad:	88 45 d7             	mov    %al,-0x29(%ebp)
    3fb0:	e8 dd fe ff ff       	call   3e92 <write>

  while(--i >= 0)
    3fb5:	83 c4 10             	add    $0x10,%esp
    3fb8:	39 de                	cmp    %ebx,%esi
    3fba:	75 e4                	jne    3fa0 <printint+0x60>
    putc(fd, buf[i]);
}
    3fbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fbf:	5b                   	pop    %ebx
    3fc0:	5e                   	pop    %esi
    3fc1:	5f                   	pop    %edi
    3fc2:	5d                   	pop    %ebp
    3fc3:	c3                   	ret    
    3fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    3fc8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3fcf:	eb 90                	jmp    3f61 <printint+0x21>
    3fd1:	eb 0d                	jmp    3fe0 <printf>
    3fd3:	90                   	nop
    3fd4:	90                   	nop
    3fd5:	90                   	nop
    3fd6:	90                   	nop
    3fd7:	90                   	nop
    3fd8:	90                   	nop
    3fd9:	90                   	nop
    3fda:	90                   	nop
    3fdb:	90                   	nop
    3fdc:	90                   	nop
    3fdd:	90                   	nop
    3fde:	90                   	nop
    3fdf:	90                   	nop

00003fe0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3fe0:	55                   	push   %ebp
    3fe1:	89 e5                	mov    %esp,%ebp
    3fe3:	57                   	push   %edi
    3fe4:	56                   	push   %esi
    3fe5:	53                   	push   %ebx
    3fe6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fe9:	8b 75 0c             	mov    0xc(%ebp),%esi
    3fec:	0f b6 1e             	movzbl (%esi),%ebx
    3fef:	84 db                	test   %bl,%bl
    3ff1:	0f 84 b3 00 00 00    	je     40aa <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    3ff7:	8d 45 10             	lea    0x10(%ebp),%eax
    3ffa:	83 c6 01             	add    $0x1,%esi
  state = 0;
    3ffd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    3fff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4002:	eb 2f                	jmp    4033 <printf+0x53>
    4004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4008:	83 f8 25             	cmp    $0x25,%eax
    400b:	0f 84 a7 00 00 00    	je     40b8 <printf+0xd8>
  write(fd, &c, 1);
    4011:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    4014:	83 ec 04             	sub    $0x4,%esp
    4017:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    401a:	6a 01                	push   $0x1
    401c:	50                   	push   %eax
    401d:	ff 75 08             	pushl  0x8(%ebp)
    4020:	e8 6d fe ff ff       	call   3e92 <write>
    4025:	83 c4 10             	add    $0x10,%esp
    4028:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    402b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    402f:	84 db                	test   %bl,%bl
    4031:	74 77                	je     40aa <printf+0xca>
    if(state == 0){
    4033:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    4035:	0f be cb             	movsbl %bl,%ecx
    4038:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    403b:	74 cb                	je     4008 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    403d:	83 ff 25             	cmp    $0x25,%edi
    4040:	75 e6                	jne    4028 <printf+0x48>
      if(c == 'd'){
    4042:	83 f8 64             	cmp    $0x64,%eax
    4045:	0f 84 05 01 00 00    	je     4150 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    404b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    4051:	83 f9 70             	cmp    $0x70,%ecx
    4054:	74 72                	je     40c8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4056:	83 f8 73             	cmp    $0x73,%eax
    4059:	0f 84 99 00 00 00    	je     40f8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    405f:	83 f8 63             	cmp    $0x63,%eax
    4062:	0f 84 08 01 00 00    	je     4170 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4068:	83 f8 25             	cmp    $0x25,%eax
    406b:	0f 84 ef 00 00 00    	je     4160 <printf+0x180>
  write(fd, &c, 1);
    4071:	8d 45 e7             	lea    -0x19(%ebp),%eax
    4074:	83 ec 04             	sub    $0x4,%esp
    4077:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    407b:	6a 01                	push   $0x1
    407d:	50                   	push   %eax
    407e:	ff 75 08             	pushl  0x8(%ebp)
    4081:	e8 0c fe ff ff       	call   3e92 <write>
    4086:	83 c4 0c             	add    $0xc,%esp
    4089:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    408c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    408f:	6a 01                	push   $0x1
    4091:	50                   	push   %eax
    4092:	ff 75 08             	pushl  0x8(%ebp)
    4095:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4098:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    409a:	e8 f3 fd ff ff       	call   3e92 <write>
  for(i = 0; fmt[i]; i++){
    409f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    40a3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    40a6:	84 db                	test   %bl,%bl
    40a8:	75 89                	jne    4033 <printf+0x53>
    }
  }
}
    40aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
    40ad:	5b                   	pop    %ebx
    40ae:	5e                   	pop    %esi
    40af:	5f                   	pop    %edi
    40b0:	5d                   	pop    %ebp
    40b1:	c3                   	ret    
    40b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    40b8:	bf 25 00 00 00       	mov    $0x25,%edi
    40bd:	e9 66 ff ff ff       	jmp    4028 <printf+0x48>
    40c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    40c8:	83 ec 0c             	sub    $0xc,%esp
    40cb:	b9 10 00 00 00       	mov    $0x10,%ecx
    40d0:	6a 00                	push   $0x0
    40d2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    40d5:	8b 45 08             	mov    0x8(%ebp),%eax
    40d8:	8b 17                	mov    (%edi),%edx
    40da:	e8 61 fe ff ff       	call   3f40 <printint>
        ap++;
    40df:	89 f8                	mov    %edi,%eax
    40e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
    40e4:	31 ff                	xor    %edi,%edi
        ap++;
    40e6:	83 c0 04             	add    $0x4,%eax
    40e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    40ec:	e9 37 ff ff ff       	jmp    4028 <printf+0x48>
    40f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    40f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    40fb:	8b 08                	mov    (%eax),%ecx
        ap++;
    40fd:	83 c0 04             	add    $0x4,%eax
    4100:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    4103:	85 c9                	test   %ecx,%ecx
    4105:	0f 84 8e 00 00 00    	je     4199 <printf+0x1b9>
        while(*s != 0){
    410b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    410e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    4110:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    4112:	84 c0                	test   %al,%al
    4114:	0f 84 0e ff ff ff    	je     4028 <printf+0x48>
    411a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    411d:	89 de                	mov    %ebx,%esi
    411f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    4122:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    4125:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    4128:	83 ec 04             	sub    $0x4,%esp
          s++;
    412b:	83 c6 01             	add    $0x1,%esi
    412e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    4131:	6a 01                	push   $0x1
    4133:	57                   	push   %edi
    4134:	53                   	push   %ebx
    4135:	e8 58 fd ff ff       	call   3e92 <write>
        while(*s != 0){
    413a:	0f b6 06             	movzbl (%esi),%eax
    413d:	83 c4 10             	add    $0x10,%esp
    4140:	84 c0                	test   %al,%al
    4142:	75 e4                	jne    4128 <printf+0x148>
    4144:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    4147:	31 ff                	xor    %edi,%edi
    4149:	e9 da fe ff ff       	jmp    4028 <printf+0x48>
    414e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    4150:	83 ec 0c             	sub    $0xc,%esp
    4153:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4158:	6a 01                	push   $0x1
    415a:	e9 73 ff ff ff       	jmp    40d2 <printf+0xf2>
    415f:	90                   	nop
  write(fd, &c, 1);
    4160:	83 ec 04             	sub    $0x4,%esp
    4163:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    4166:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    4169:	6a 01                	push   $0x1
    416b:	e9 21 ff ff ff       	jmp    4091 <printf+0xb1>
        putc(fd, *ap);
    4170:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    4173:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    4176:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    4178:	6a 01                	push   $0x1
        ap++;
    417a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    417d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    4180:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4183:	50                   	push   %eax
    4184:	ff 75 08             	pushl  0x8(%ebp)
    4187:	e8 06 fd ff ff       	call   3e92 <write>
        ap++;
    418c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    418f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4192:	31 ff                	xor    %edi,%edi
    4194:	e9 8f fe ff ff       	jmp    4028 <printf+0x48>
          s = "(null)";
    4199:	bb d0 5a 00 00       	mov    $0x5ad0,%ebx
        while(*s != 0){
    419e:	b8 28 00 00 00       	mov    $0x28,%eax
    41a3:	e9 72 ff ff ff       	jmp    411a <printf+0x13a>
    41a8:	66 90                	xchg   %ax,%ax
    41aa:	66 90                	xchg   %ax,%ax
    41ac:	66 90                	xchg   %ax,%ax
    41ae:	66 90                	xchg   %ax,%ax

000041b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    41b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41b1:	a1 80 64 00 00       	mov    0x6480,%eax
{
    41b6:	89 e5                	mov    %esp,%ebp
    41b8:	57                   	push   %edi
    41b9:	56                   	push   %esi
    41ba:	53                   	push   %ebx
    41bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    41be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    41c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41c8:	39 c8                	cmp    %ecx,%eax
    41ca:	8b 10                	mov    (%eax),%edx
    41cc:	73 32                	jae    4200 <free+0x50>
    41ce:	39 d1                	cmp    %edx,%ecx
    41d0:	72 04                	jb     41d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    41d2:	39 d0                	cmp    %edx,%eax
    41d4:	72 32                	jb     4208 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    41d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    41d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    41dc:	39 fa                	cmp    %edi,%edx
    41de:	74 30                	je     4210 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    41e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    41e3:	8b 50 04             	mov    0x4(%eax),%edx
    41e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    41e9:	39 f1                	cmp    %esi,%ecx
    41eb:	74 3a                	je     4227 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    41ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
    41ef:	a3 80 64 00 00       	mov    %eax,0x6480
}
    41f4:	5b                   	pop    %ebx
    41f5:	5e                   	pop    %esi
    41f6:	5f                   	pop    %edi
    41f7:	5d                   	pop    %ebp
    41f8:	c3                   	ret    
    41f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4200:	39 d0                	cmp    %edx,%eax
    4202:	72 04                	jb     4208 <free+0x58>
    4204:	39 d1                	cmp    %edx,%ecx
    4206:	72 ce                	jb     41d6 <free+0x26>
{
    4208:	89 d0                	mov    %edx,%eax
    420a:	eb bc                	jmp    41c8 <free+0x18>
    420c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    4210:	03 72 04             	add    0x4(%edx),%esi
    4213:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4216:	8b 10                	mov    (%eax),%edx
    4218:	8b 12                	mov    (%edx),%edx
    421a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    421d:	8b 50 04             	mov    0x4(%eax),%edx
    4220:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4223:	39 f1                	cmp    %esi,%ecx
    4225:	75 c6                	jne    41ed <free+0x3d>
    p->s.size += bp->s.size;
    4227:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    422a:	a3 80 64 00 00       	mov    %eax,0x6480
    p->s.size += bp->s.size;
    422f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4232:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4235:	89 10                	mov    %edx,(%eax)
}
    4237:	5b                   	pop    %ebx
    4238:	5e                   	pop    %esi
    4239:	5f                   	pop    %edi
    423a:	5d                   	pop    %ebp
    423b:	c3                   	ret    
    423c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004240 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4240:	55                   	push   %ebp
    4241:	89 e5                	mov    %esp,%ebp
    4243:	57                   	push   %edi
    4244:	56                   	push   %esi
    4245:	53                   	push   %ebx
    4246:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4249:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    424c:	8b 15 80 64 00 00    	mov    0x6480,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4252:	8d 78 07             	lea    0x7(%eax),%edi
    4255:	c1 ef 03             	shr    $0x3,%edi
    4258:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    425b:	85 d2                	test   %edx,%edx
    425d:	0f 84 9d 00 00 00    	je     4300 <malloc+0xc0>
    4263:	8b 02                	mov    (%edx),%eax
    4265:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    4268:	39 cf                	cmp    %ecx,%edi
    426a:	76 6c                	jbe    42d8 <malloc+0x98>
    426c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4272:	bb 00 10 00 00       	mov    $0x1000,%ebx
    4277:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    427a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    4281:	eb 0e                	jmp    4291 <malloc+0x51>
    4283:	90                   	nop
    4284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4288:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    428a:	8b 48 04             	mov    0x4(%eax),%ecx
    428d:	39 f9                	cmp    %edi,%ecx
    428f:	73 47                	jae    42d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4291:	39 05 80 64 00 00    	cmp    %eax,0x6480
    4297:	89 c2                	mov    %eax,%edx
    4299:	75 ed                	jne    4288 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    429b:	83 ec 0c             	sub    $0xc,%esp
    429e:	56                   	push   %esi
    429f:	e8 56 fc ff ff       	call   3efa <sbrk>
  if(p == (char*)-1)
    42a4:	83 c4 10             	add    $0x10,%esp
    42a7:	83 f8 ff             	cmp    $0xffffffff,%eax
    42aa:	74 1c                	je     42c8 <malloc+0x88>
  hp->s.size = nu;
    42ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    42af:	83 ec 0c             	sub    $0xc,%esp
    42b2:	83 c0 08             	add    $0x8,%eax
    42b5:	50                   	push   %eax
    42b6:	e8 f5 fe ff ff       	call   41b0 <free>
  return freep;
    42bb:	8b 15 80 64 00 00    	mov    0x6480,%edx
      if((p = morecore(nunits)) == 0)
    42c1:	83 c4 10             	add    $0x10,%esp
    42c4:	85 d2                	test   %edx,%edx
    42c6:	75 c0                	jne    4288 <malloc+0x48>
        return 0;
  }
}
    42c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    42cb:	31 c0                	xor    %eax,%eax
}
    42cd:	5b                   	pop    %ebx
    42ce:	5e                   	pop    %esi
    42cf:	5f                   	pop    %edi
    42d0:	5d                   	pop    %ebp
    42d1:	c3                   	ret    
    42d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    42d8:	39 cf                	cmp    %ecx,%edi
    42da:	74 54                	je     4330 <malloc+0xf0>
        p->s.size -= nunits;
    42dc:	29 f9                	sub    %edi,%ecx
    42de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    42e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    42e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    42e7:	89 15 80 64 00 00    	mov    %edx,0x6480
}
    42ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    42f0:	83 c0 08             	add    $0x8,%eax
}
    42f3:	5b                   	pop    %ebx
    42f4:	5e                   	pop    %esi
    42f5:	5f                   	pop    %edi
    42f6:	5d                   	pop    %ebp
    42f7:	c3                   	ret    
    42f8:	90                   	nop
    42f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    4300:	c7 05 80 64 00 00 84 	movl   $0x6484,0x6480
    4307:	64 00 00 
    430a:	c7 05 84 64 00 00 84 	movl   $0x6484,0x6484
    4311:	64 00 00 
    base.s.size = 0;
    4314:	b8 84 64 00 00       	mov    $0x6484,%eax
    4319:	c7 05 88 64 00 00 00 	movl   $0x0,0x6488
    4320:	00 00 00 
    4323:	e9 44 ff ff ff       	jmp    426c <malloc+0x2c>
    4328:	90                   	nop
    4329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    4330:	8b 08                	mov    (%eax),%ecx
    4332:	89 0a                	mov    %ecx,(%edx)
    4334:	eb b1                	jmp    42e7 <malloc+0xa7>

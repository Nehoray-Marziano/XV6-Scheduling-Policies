
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 86 00 00 00    	jg     a7 <main+0xa7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 c9 12 00 00       	push   $0x12c9
      2b:	e8 72 0d 00 00       	call   da2 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2f                	jmp    68 <main+0x68>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 02 19 00 00 20 	cmpb   $0x20,0x1902
      47:	0f 84 87 00 00 00    	je     d4 <main+0xd4>
int
fork1(void)
{
  int pid;

  pid = fork();
      4d:	e8 08 0d 00 00       	call   d5a <fork>
  if(pid == -1)
      52:	83 f8 ff             	cmp    $0xffffffff,%eax
      55:	74 43                	je     9a <main+0x9a>
    if(fork1() == 0)
      57:	85 c0                	test   %eax,%eax
      59:	74 64                	je     bf <main+0xbf>
    wait(null);
      5b:	83 ec 0c             	sub    $0xc,%esp
      5e:	6a 00                	push   $0x0
      60:	e8 05 0d 00 00       	call   d6a <wait>
      65:	83 c4 10             	add    $0x10,%esp
  while(getcmd(buf, sizeof(buf)) >= 0){
      68:	83 ec 08             	sub    $0x8,%esp
      6b:	6a 64                	push   $0x64
      6d:	68 00 19 00 00       	push   $0x1900
      72:	e8 a9 00 00 00       	call   120 <getcmd>
      77:	83 c4 10             	add    $0x10,%esp
      7a:	85 c0                	test   %eax,%eax
      7c:	78 37                	js     b5 <main+0xb5>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      7e:	80 3d 00 19 00 00 63 	cmpb   $0x63,0x1900
      85:	75 c6                	jne    4d <main+0x4d>
      87:	80 3d 01 19 00 00 64 	cmpb   $0x64,0x1901
      8e:	74 b0                	je     40 <main+0x40>
  pid = fork();
      90:	e8 c5 0c 00 00       	call   d5a <fork>
  if(pid == -1)
      95:	83 f8 ff             	cmp    $0xffffffff,%eax
      98:	75 bd                	jne    57 <main+0x57>
    panic("fork");
      9a:	83 ec 0c             	sub    $0xc,%esp
      9d:	68 52 12 00 00       	push   $0x1252
      a2:	e8 c9 00 00 00       	call   170 <panic>
      close(fd);
      a7:	83 ec 0c             	sub    $0xc,%esp
      aa:	50                   	push   %eax
      ab:	e8 da 0c 00 00       	call   d8a <close>
      break;
      b0:	83 c4 10             	add    $0x10,%esp
      b3:	eb b3                	jmp    68 <main+0x68>
  exit(0);
      b5:	83 ec 0c             	sub    $0xc,%esp
      b8:	6a 00                	push   $0x0
      ba:	e8 a3 0c 00 00       	call   d62 <exit>
      runcmd(parsecmd(buf));
      bf:	83 ec 0c             	sub    $0xc,%esp
      c2:	68 00 19 00 00       	push   $0x1900
      c7:	e8 d4 09 00 00       	call   aa0 <parsecmd>
      cc:	89 04 24             	mov    %eax,(%esp)
      cf:	e8 cc 00 00 00       	call   1a0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      d4:	83 ec 0c             	sub    $0xc,%esp
      d7:	68 00 19 00 00       	push   $0x1900
      dc:	e8 af 0a 00 00       	call   b90 <strlen>
      if(chdir(buf+3) < 0)
      e1:	c7 04 24 03 19 00 00 	movl   $0x1903,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e8:	c6 80 ff 18 00 00 00 	movb   $0x0,0x18ff(%eax)
      if(chdir(buf+3) < 0)
      ef:	e8 de 0c 00 00       	call   dd2 <chdir>
      f4:	83 c4 10             	add    $0x10,%esp
      f7:	85 c0                	test   %eax,%eax
      f9:	0f 89 69 ff ff ff    	jns    68 <main+0x68>
        printf(2, "cannot cd %s\n", buf+3);
      ff:	50                   	push   %eax
     100:	68 03 19 00 00       	push   $0x1903
     105:	68 d1 12 00 00       	push   $0x12d1
     10a:	6a 02                	push   $0x2
     10c:	e8 bf 0d 00 00       	call   ed0 <printf>
     111:	83 c4 10             	add    $0x10,%esp
     114:	e9 4f ff ff ff       	jmp    68 <main+0x68>
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <getcmd>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	56                   	push   %esi
     124:	53                   	push   %ebx
     125:	8b 75 0c             	mov    0xc(%ebp),%esi
     128:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     12b:	83 ec 08             	sub    $0x8,%esp
     12e:	68 28 12 00 00       	push   $0x1228
     133:	6a 02                	push   $0x2
     135:	e8 96 0d 00 00       	call   ed0 <printf>
  memset(buf, 0, nbuf);
     13a:	83 c4 0c             	add    $0xc,%esp
     13d:	56                   	push   %esi
     13e:	6a 00                	push   $0x0
     140:	53                   	push   %ebx
     141:	e8 7a 0a 00 00       	call   bc0 <memset>
  gets(buf, nbuf);
     146:	58                   	pop    %eax
     147:	5a                   	pop    %edx
     148:	56                   	push   %esi
     149:	53                   	push   %ebx
     14a:	e8 d1 0a 00 00       	call   c20 <gets>
  if(buf[0] == 0) // EOF
     14f:	83 c4 10             	add    $0x10,%esp
     152:	31 c0                	xor    %eax,%eax
     154:	80 3b 00             	cmpb   $0x0,(%ebx)
     157:	0f 94 c0             	sete   %al
}
     15a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(buf[0] == 0) // EOF
     15d:	f7 d8                	neg    %eax
}
     15f:	5b                   	pop    %ebx
     160:	5e                   	pop    %esi
     161:	5d                   	pop    %ebp
     162:	c3                   	ret    
     163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	pushl  0x8(%ebp)
     179:	68 c5 12 00 00       	push   $0x12c5
     17e:	6a 02                	push   $0x2
     180:	e8 4b 0d 00 00       	call   ed0 <printf>
  exit(0);
     185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     18c:	e8 d1 0b 00 00       	call   d62 <exit>
     191:	eb 0d                	jmp    1a0 <runcmd>
     193:	90                   	nop
     194:	90                   	nop
     195:	90                   	nop
     196:	90                   	nop
     197:	90                   	nop
     198:	90                   	nop
     199:	90                   	nop
     19a:	90                   	nop
     19b:	90                   	nop
     19c:	90                   	nop
     19d:	90                   	nop
     19e:	90                   	nop
     19f:	90                   	nop

000001a0 <runcmd>:
{
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 14             	sub    $0x14,%esp
     1a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1aa:	85 db                	test   %ebx,%ebx
     1ac:	74 3a                	je     1e8 <runcmd+0x48>
  switch(cmd->type){
     1ae:	83 3b 05             	cmpl   $0x5,(%ebx)
     1b1:	0f 87 23 01 00 00    	ja     2da <runcmd+0x13a>
     1b7:	8b 03                	mov    (%ebx),%eax
     1b9:	ff 24 85 e0 12 00 00 	jmp    *0x12e0(,%eax,4)
    if(ecmd->argv[0] == 0)
     1c0:	8b 43 04             	mov    0x4(%ebx),%eax
     1c3:	85 c0                	test   %eax,%eax
     1c5:	74 21                	je     1e8 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     1c7:	8d 53 04             	lea    0x4(%ebx),%edx
     1ca:	51                   	push   %ecx
     1cb:	51                   	push   %ecx
     1cc:	52                   	push   %edx
     1cd:	50                   	push   %eax
     1ce:	e8 c7 0b 00 00       	call   d9a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1d3:	83 c4 0c             	add    $0xc,%esp
     1d6:	ff 73 04             	pushl  0x4(%ebx)
     1d9:	68 32 12 00 00       	push   $0x1232
     1de:	6a 02                	push   $0x2
     1e0:	e8 eb 0c 00 00       	call   ed0 <printf>
    break;
     1e5:	83 c4 10             	add    $0x10,%esp
    exit(0);
     1e8:	83 ec 0c             	sub    $0xc,%esp
     1eb:	6a 00                	push   $0x0
     1ed:	e8 70 0b 00 00       	call   d62 <exit>
  pid = fork();
     1f2:	e8 63 0b 00 00       	call   d5a <fork>
  if(pid == -1)
     1f7:	83 f8 ff             	cmp    $0xffffffff,%eax
     1fa:	0f 84 e7 00 00 00    	je     2e7 <runcmd+0x147>
    if(fork1() == 0)
     200:	85 c0                	test   %eax,%eax
     202:	75 e4                	jne    1e8 <runcmd+0x48>
      runcmd(bcmd->cmd);
     204:	83 ec 0c             	sub    $0xc,%esp
     207:	ff 73 04             	pushl  0x4(%ebx)
     20a:	e8 91 ff ff ff       	call   1a0 <runcmd>
    close(rcmd->fd);
     20f:	83 ec 0c             	sub    $0xc,%esp
     212:	ff 73 14             	pushl  0x14(%ebx)
     215:	e8 70 0b 00 00       	call   d8a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     21a:	58                   	pop    %eax
     21b:	5a                   	pop    %edx
     21c:	ff 73 10             	pushl  0x10(%ebx)
     21f:	ff 73 08             	pushl  0x8(%ebx)
     222:	e8 7b 0b 00 00       	call   da2 <open>
     227:	83 c4 10             	add    $0x10,%esp
     22a:	85 c0                	test   %eax,%eax
     22c:	79 d6                	jns    204 <runcmd+0x64>
      printf(2, "open %s failed\n", rcmd->file);
     22e:	51                   	push   %ecx
     22f:	ff 73 08             	pushl  0x8(%ebx)
     232:	68 42 12 00 00       	push   $0x1242
     237:	6a 02                	push   $0x2
     239:	e8 92 0c 00 00       	call   ed0 <printf>
      exit(0);
     23e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     245:	e8 18 0b 00 00       	call   d62 <exit>
    if(pipe(p) < 0)
     24a:	8d 45 f0             	lea    -0x10(%ebp),%eax
     24d:	83 ec 0c             	sub    $0xc,%esp
     250:	50                   	push   %eax
     251:	e8 1c 0b 00 00       	call   d72 <pipe>
     256:	83 c4 10             	add    $0x10,%esp
     259:	85 c0                	test   %eax,%eax
     25b:	0f 88 c1 00 00 00    	js     322 <runcmd+0x182>
  pid = fork();
     261:	e8 f4 0a 00 00       	call   d5a <fork>
  if(pid == -1)
     266:	83 f8 ff             	cmp    $0xffffffff,%eax
     269:	74 7c                	je     2e7 <runcmd+0x147>
    if(fork1() == 0){
     26b:	85 c0                	test   %eax,%eax
     26d:	0f 84 bc 00 00 00    	je     32f <runcmd+0x18f>
  pid = fork();
     273:	e8 e2 0a 00 00       	call   d5a <fork>
  if(pid == -1)
     278:	83 f8 ff             	cmp    $0xffffffff,%eax
     27b:	74 6a                	je     2e7 <runcmd+0x147>
    if(fork1() == 0){
     27d:	85 c0                	test   %eax,%eax
     27f:	74 73                	je     2f4 <runcmd+0x154>
    close(p[0]);
     281:	83 ec 0c             	sub    $0xc,%esp
     284:	ff 75 f0             	pushl  -0x10(%ebp)
     287:	e8 fe 0a 00 00       	call   d8a <close>
    close(p[1]);
     28c:	58                   	pop    %eax
     28d:	ff 75 f4             	pushl  -0xc(%ebp)
     290:	e8 f5 0a 00 00       	call   d8a <close>
    wait(null);
     295:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     29c:	e8 c9 0a 00 00       	call   d6a <wait>
    wait(null);
     2a1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2a8:	e8 bd 0a 00 00       	call   d6a <wait>
    break;
     2ad:	83 c4 10             	add    $0x10,%esp
     2b0:	e9 33 ff ff ff       	jmp    1e8 <runcmd+0x48>
  pid = fork();
     2b5:	e8 a0 0a 00 00       	call   d5a <fork>
  if(pid == -1)
     2ba:	83 f8 ff             	cmp    $0xffffffff,%eax
     2bd:	74 28                	je     2e7 <runcmd+0x147>
    if(fork1() == 0)
     2bf:	85 c0                	test   %eax,%eax
     2c1:	0f 84 3d ff ff ff    	je     204 <runcmd+0x64>
    wait(null);
     2c7:	83 ec 0c             	sub    $0xc,%esp
     2ca:	6a 00                	push   $0x0
     2cc:	e8 99 0a 00 00       	call   d6a <wait>
    runcmd(lcmd->right);
     2d1:	5a                   	pop    %edx
     2d2:	ff 73 08             	pushl  0x8(%ebx)
     2d5:	e8 c6 fe ff ff       	call   1a0 <runcmd>
    panic("runcmd");
     2da:	83 ec 0c             	sub    $0xc,%esp
     2dd:	68 2b 12 00 00       	push   $0x122b
     2e2:	e8 89 fe ff ff       	call   170 <panic>
    panic("fork");
     2e7:	83 ec 0c             	sub    $0xc,%esp
     2ea:	68 52 12 00 00       	push   $0x1252
     2ef:	e8 7c fe ff ff       	call   170 <panic>
      close(0);
     2f4:	83 ec 0c             	sub    $0xc,%esp
     2f7:	6a 00                	push   $0x0
     2f9:	e8 8c 0a 00 00       	call   d8a <close>
      dup(p[0]);
     2fe:	5a                   	pop    %edx
     2ff:	ff 75 f0             	pushl  -0x10(%ebp)
     302:	e8 d3 0a 00 00       	call   dda <dup>
      close(p[0]);
     307:	59                   	pop    %ecx
     308:	ff 75 f0             	pushl  -0x10(%ebp)
     30b:	e8 7a 0a 00 00       	call   d8a <close>
      close(p[1]);
     310:	58                   	pop    %eax
     311:	ff 75 f4             	pushl  -0xc(%ebp)
     314:	e8 71 0a 00 00       	call   d8a <close>
      runcmd(pcmd->right);
     319:	58                   	pop    %eax
     31a:	ff 73 08             	pushl  0x8(%ebx)
     31d:	e8 7e fe ff ff       	call   1a0 <runcmd>
      panic("pipe");
     322:	83 ec 0c             	sub    $0xc,%esp
     325:	68 57 12 00 00       	push   $0x1257
     32a:	e8 41 fe ff ff       	call   170 <panic>
      close(1);
     32f:	83 ec 0c             	sub    $0xc,%esp
     332:	6a 01                	push   $0x1
     334:	e8 51 0a 00 00       	call   d8a <close>
      dup(p[1]);
     339:	58                   	pop    %eax
     33a:	ff 75 f4             	pushl  -0xc(%ebp)
     33d:	e8 98 0a 00 00       	call   dda <dup>
      close(p[0]);
     342:	58                   	pop    %eax
     343:	ff 75 f0             	pushl  -0x10(%ebp)
     346:	e8 3f 0a 00 00       	call   d8a <close>
      close(p[1]);
     34b:	58                   	pop    %eax
     34c:	ff 75 f4             	pushl  -0xc(%ebp)
     34f:	e8 36 0a 00 00       	call   d8a <close>
      runcmd(pcmd->left);
     354:	58                   	pop    %eax
     355:	ff 73 04             	pushl  0x4(%ebx)
     358:	e8 43 fe ff ff       	call   1a0 <runcmd>
     35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <fork1>:
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     366:	e8 ef 09 00 00       	call   d5a <fork>
  if(pid == -1)
     36b:	83 f8 ff             	cmp    $0xffffffff,%eax
     36e:	74 02                	je     372 <fork1+0x12>
  return pid;
}
     370:	c9                   	leave  
     371:	c3                   	ret    
    panic("fork");
     372:	83 ec 0c             	sub    $0xc,%esp
     375:	68 52 12 00 00       	push   $0x1252
     37a:	e8 f1 fd ff ff       	call   170 <panic>
     37f:	90                   	nop

00000380 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 54                	push   $0x54
     389:	e8 a2 0d 00 00       	call   1130 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     391:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     393:	6a 54                	push   $0x54
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 23 08 00 00       	call   bc0 <memset>
  cmd->type = EXEC;
     39d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3a3:	89 d8                	mov    %ebx,%eax
     3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a8:	c9                   	leave  
     3a9:	c3                   	ret    
     3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003b0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	6a 18                	push   $0x18
     3b9:	e8 72 0d 00 00       	call   1130 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     3c1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c3:	6a 18                	push   $0x18
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 f3 07 00 00       	call   bc0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     3d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3df:	8b 45 10             	mov    0x10(%ebp),%eax
     3e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3e5:	8b 45 14             	mov    0x14(%ebp),%eax
     3e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3eb:	8b 45 18             	mov    0x18(%ebp),%eax
     3ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3f1:	89 d8                	mov    %ebx,%eax
     3f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f6:	c9                   	leave  
     3f7:	c3                   	ret    
     3f8:	90                   	nop
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 22 0d 00 00       	call   1130 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     411:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     413:	6a 0c                	push   $0xc
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 a3 07 00 00       	call   bc0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     420:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d 76 00             	lea    0x0(%esi),%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 0c                	push   $0xc
     449:	e8 e2 0c 00 00       	call   1130 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     451:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     453:	6a 0c                	push   $0xc
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 63 07 00 00       	call   bc0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     460:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     469:	8b 45 0c             	mov    0xc(%ebp),%eax
     46c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     46f:	89 d8                	mov    %ebx,%eax
     471:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     474:	c9                   	leave  
     475:	c3                   	ret    
     476:	8d 76 00             	lea    0x0(%esi),%esi
     479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	53                   	push   %ebx
     484:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     487:	6a 08                	push   $0x8
     489:	e8 a2 0c 00 00       	call   1130 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     48e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     491:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     493:	6a 08                	push   $0x8
     495:	6a 00                	push   $0x0
     497:	50                   	push   %eax
     498:	e8 23 07 00 00       	call   bc0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     49d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     4a0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4a6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4a9:	89 d8                	mov    %ebx,%eax
     4ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4ae:	c9                   	leave  
     4af:	c3                   	ret    

000004b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	57                   	push   %edi
     4b4:	56                   	push   %esi
     4b5:	53                   	push   %ebx
     4b6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     4b9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     4bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     4c2:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     4c4:	39 de                	cmp    %ebx,%esi
     4c6:	72 0f                	jb     4d7 <gettoken+0x27>
     4c8:	eb 25                	jmp    4ef <gettoken+0x3f>
     4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     4d0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     4d3:	39 f3                	cmp    %esi,%ebx
     4d5:	74 18                	je     4ef <gettoken+0x3f>
     4d7:	0f be 06             	movsbl (%esi),%eax
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	50                   	push   %eax
     4de:	68 dc 18 00 00       	push   $0x18dc
     4e3:	e8 f8 06 00 00       	call   be0 <strchr>
     4e8:	83 c4 10             	add    $0x10,%esp
     4eb:	85 c0                	test   %eax,%eax
     4ed:	75 e1                	jne    4d0 <gettoken+0x20>
  if(q)
     4ef:	85 ff                	test   %edi,%edi
     4f1:	74 02                	je     4f5 <gettoken+0x45>
    *q = s;
     4f3:	89 37                	mov    %esi,(%edi)
  ret = *s;
     4f5:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     4f8:	3c 29                	cmp    $0x29,%al
     4fa:	7f 54                	jg     550 <gettoken+0xa0>
     4fc:	3c 28                	cmp    $0x28,%al
     4fe:	0f 8d c8 00 00 00    	jge    5cc <gettoken+0x11c>
     504:	31 ff                	xor    %edi,%edi
     506:	84 c0                	test   %al,%al
     508:	0f 85 d2 00 00 00    	jne    5e0 <gettoken+0x130>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     50e:	8b 55 14             	mov    0x14(%ebp),%edx
     511:	85 d2                	test   %edx,%edx
     513:	74 05                	je     51a <gettoken+0x6a>
    *eq = s;
     515:	8b 45 14             	mov    0x14(%ebp),%eax
     518:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     51a:	39 de                	cmp    %ebx,%esi
     51c:	72 09                	jb     527 <gettoken+0x77>
     51e:	eb 1f                	jmp    53f <gettoken+0x8f>
    s++;
     520:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     523:	39 f3                	cmp    %esi,%ebx
     525:	74 18                	je     53f <gettoken+0x8f>
     527:	0f be 06             	movsbl (%esi),%eax
     52a:	83 ec 08             	sub    $0x8,%esp
     52d:	50                   	push   %eax
     52e:	68 dc 18 00 00       	push   $0x18dc
     533:	e8 a8 06 00 00       	call   be0 <strchr>
     538:	83 c4 10             	add    $0x10,%esp
     53b:	85 c0                	test   %eax,%eax
     53d:	75 e1                	jne    520 <gettoken+0x70>
  *ps = s;
     53f:	8b 45 08             	mov    0x8(%ebp),%eax
     542:	89 30                	mov    %esi,(%eax)
  return ret;
}
     544:	8d 65 f4             	lea    -0xc(%ebp),%esp
     547:	89 f8                	mov    %edi,%eax
     549:	5b                   	pop    %ebx
     54a:	5e                   	pop    %esi
     54b:	5f                   	pop    %edi
     54c:	5d                   	pop    %ebp
     54d:	c3                   	ret    
     54e:	66 90                	xchg   %ax,%ax
  switch(*s){
     550:	3c 3e                	cmp    $0x3e,%al
     552:	75 1c                	jne    570 <gettoken+0xc0>
    if(*s == '>'){
     554:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     558:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     55b:	0f 84 a4 00 00 00    	je     605 <gettoken+0x155>
    s++;
     561:	89 c6                	mov    %eax,%esi
     563:	bf 3e 00 00 00       	mov    $0x3e,%edi
     568:	eb a4                	jmp    50e <gettoken+0x5e>
     56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     570:	7f 56                	jg     5c8 <gettoken+0x118>
     572:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     575:	80 f9 01             	cmp    $0x1,%cl
     578:	76 52                	jbe    5cc <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     57a:	39 f3                	cmp    %esi,%ebx
     57c:	77 24                	ja     5a2 <gettoken+0xf2>
     57e:	eb 70                	jmp    5f0 <gettoken+0x140>
     580:	0f be 06             	movsbl (%esi),%eax
     583:	83 ec 08             	sub    $0x8,%esp
     586:	50                   	push   %eax
     587:	68 d4 18 00 00       	push   $0x18d4
     58c:	e8 4f 06 00 00       	call   be0 <strchr>
     591:	83 c4 10             	add    $0x10,%esp
     594:	85 c0                	test   %eax,%eax
     596:	75 1f                	jne    5b7 <gettoken+0x107>
      s++;
     598:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     59b:	39 f3                	cmp    %esi,%ebx
     59d:	74 51                	je     5f0 <gettoken+0x140>
     59f:	0f be 06             	movsbl (%esi),%eax
     5a2:	83 ec 08             	sub    $0x8,%esp
     5a5:	50                   	push   %eax
     5a6:	68 dc 18 00 00       	push   $0x18dc
     5ab:	e8 30 06 00 00       	call   be0 <strchr>
     5b0:	83 c4 10             	add    $0x10,%esp
     5b3:	85 c0                	test   %eax,%eax
     5b5:	74 c9                	je     580 <gettoken+0xd0>
    ret = 'a';
     5b7:	bf 61 00 00 00       	mov    $0x61,%edi
     5bc:	e9 4d ff ff ff       	jmp    50e <gettoken+0x5e>
     5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5c8:	3c 7c                	cmp    $0x7c,%al
     5ca:	75 ae                	jne    57a <gettoken+0xca>
  ret = *s;
     5cc:	0f be f8             	movsbl %al,%edi
    s++;
     5cf:	83 c6 01             	add    $0x1,%esi
    break;
     5d2:	e9 37 ff ff ff       	jmp    50e <gettoken+0x5e>
     5d7:	89 f6                	mov    %esi,%esi
     5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  switch(*s){
     5e0:	3c 26                	cmp    $0x26,%al
     5e2:	75 96                	jne    57a <gettoken+0xca>
     5e4:	eb e6                	jmp    5cc <gettoken+0x11c>
     5e6:	8d 76 00             	lea    0x0(%esi),%esi
     5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(eq)
     5f0:	8b 45 14             	mov    0x14(%ebp),%eax
     5f3:	bf 61 00 00 00       	mov    $0x61,%edi
     5f8:	85 c0                	test   %eax,%eax
     5fa:	0f 85 15 ff ff ff    	jne    515 <gettoken+0x65>
     600:	e9 3a ff ff ff       	jmp    53f <gettoken+0x8f>
      s++;
     605:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     608:	bf 2b 00 00 00       	mov    $0x2b,%edi
     60d:	e9 fc fe ff ff       	jmp    50e <gettoken+0x5e>
     612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000620 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
     626:	83 ec 0c             	sub    $0xc,%esp
     629:	8b 7d 08             	mov    0x8(%ebp),%edi
     62c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     62f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     631:	39 f3                	cmp    %esi,%ebx
     633:	72 12                	jb     647 <peek+0x27>
     635:	eb 28                	jmp    65f <peek+0x3f>
     637:	89 f6                	mov    %esi,%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     640:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     643:	39 de                	cmp    %ebx,%esi
     645:	74 18                	je     65f <peek+0x3f>
     647:	0f be 03             	movsbl (%ebx),%eax
     64a:	83 ec 08             	sub    $0x8,%esp
     64d:	50                   	push   %eax
     64e:	68 dc 18 00 00       	push   $0x18dc
     653:	e8 88 05 00 00       	call   be0 <strchr>
     658:	83 c4 10             	add    $0x10,%esp
     65b:	85 c0                	test   %eax,%eax
     65d:	75 e1                	jne    640 <peek+0x20>
  *ps = s;
     65f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     661:	0f be 13             	movsbl (%ebx),%edx
     664:	31 c0                	xor    %eax,%eax
     666:	84 d2                	test   %dl,%dl
     668:	74 17                	je     681 <peek+0x61>
     66a:	83 ec 08             	sub    $0x8,%esp
     66d:	52                   	push   %edx
     66e:	ff 75 10             	pushl  0x10(%ebp)
     671:	e8 6a 05 00 00       	call   be0 <strchr>
     676:	83 c4 10             	add    $0x10,%esp
     679:	85 c0                	test   %eax,%eax
     67b:	0f 95 c0             	setne  %al
     67e:	0f b6 c0             	movzbl %al,%eax
}
     681:	8d 65 f4             	lea    -0xc(%ebp),%esp
     684:	5b                   	pop    %ebx
     685:	5e                   	pop    %esi
     686:	5f                   	pop    %edi
     687:	5d                   	pop    %ebp
     688:	c3                   	ret    
     689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	57                   	push   %edi
     694:	56                   	push   %esi
     695:	53                   	push   %ebx
     696:	83 ec 1c             	sub    $0x1c,%esp
     699:	8b 75 0c             	mov    0xc(%ebp),%esi
     69c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     69f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6a0:	83 ec 04             	sub    $0x4,%esp
     6a3:	68 79 12 00 00       	push   $0x1279
     6a8:	53                   	push   %ebx
     6a9:	56                   	push   %esi
     6aa:	e8 71 ff ff ff       	call   620 <peek>
     6af:	83 c4 10             	add    $0x10,%esp
     6b2:	85 c0                	test   %eax,%eax
     6b4:	74 6a                	je     720 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     6b6:	6a 00                	push   $0x0
     6b8:	6a 00                	push   $0x0
     6ba:	53                   	push   %ebx
     6bb:	56                   	push   %esi
     6bc:	e8 ef fd ff ff       	call   4b0 <gettoken>
     6c1:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6c3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6c6:	50                   	push   %eax
     6c7:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6ca:	50                   	push   %eax
     6cb:	53                   	push   %ebx
     6cc:	56                   	push   %esi
     6cd:	e8 de fd ff ff       	call   4b0 <gettoken>
     6d2:	83 c4 20             	add    $0x20,%esp
     6d5:	83 f8 61             	cmp    $0x61,%eax
     6d8:	75 51                	jne    72b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     6da:	83 ff 3c             	cmp    $0x3c,%edi
     6dd:	74 31                	je     710 <parseredirs+0x80>
     6df:	83 ff 3e             	cmp    $0x3e,%edi
     6e2:	74 05                	je     6e9 <parseredirs+0x59>
     6e4:	83 ff 2b             	cmp    $0x2b,%edi
     6e7:	75 b7                	jne    6a0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6e9:	83 ec 0c             	sub    $0xc,%esp
     6ec:	6a 01                	push   $0x1
     6ee:	68 01 02 00 00       	push   $0x201
     6f3:	ff 75 e4             	pushl  -0x1c(%ebp)
     6f6:	ff 75 e0             	pushl  -0x20(%ebp)
     6f9:	ff 75 08             	pushl  0x8(%ebp)
     6fc:	e8 af fc ff ff       	call   3b0 <redircmd>
      break;
     701:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     704:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     707:	eb 97                	jmp    6a0 <parseredirs+0x10>
     709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     710:	83 ec 0c             	sub    $0xc,%esp
     713:	6a 00                	push   $0x0
     715:	6a 00                	push   $0x0
     717:	eb da                	jmp    6f3 <parseredirs+0x63>
     719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     720:	8b 45 08             	mov    0x8(%ebp),%eax
     723:	8d 65 f4             	lea    -0xc(%ebp),%esp
     726:	5b                   	pop    %ebx
     727:	5e                   	pop    %esi
     728:	5f                   	pop    %edi
     729:	5d                   	pop    %ebp
     72a:	c3                   	ret    
      panic("missing file for redirection");
     72b:	83 ec 0c             	sub    $0xc,%esp
     72e:	68 5c 12 00 00       	push   $0x125c
     733:	e8 38 fa ff ff       	call   170 <panic>
     738:	90                   	nop
     739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	83 ec 30             	sub    $0x30,%esp
     749:	8b 75 08             	mov    0x8(%ebp),%esi
     74c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     74f:	68 7c 12 00 00       	push   $0x127c
     754:	57                   	push   %edi
     755:	56                   	push   %esi
     756:	e8 c5 fe ff ff       	call   620 <peek>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	85 c0                	test   %eax,%eax
     760:	0f 85 92 00 00 00    	jne    7f8 <parseexec+0xb8>
     766:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     768:	e8 13 fc ff ff       	call   380 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     76d:	83 ec 04             	sub    $0x4,%esp
  ret = execcmd();
     770:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     773:	57                   	push   %edi
     774:	56                   	push   %esi
     775:	50                   	push   %eax
     776:	e8 15 ff ff ff       	call   690 <parseredirs>
     77b:	83 c4 10             	add    $0x10,%esp
     77e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     781:	eb 18                	jmp    79b <parseexec+0x5b>
     783:	90                   	nop
     784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     788:	83 ec 04             	sub    $0x4,%esp
     78b:	57                   	push   %edi
     78c:	56                   	push   %esi
     78d:	ff 75 d4             	pushl  -0x2c(%ebp)
     790:	e8 fb fe ff ff       	call   690 <parseredirs>
     795:	83 c4 10             	add    $0x10,%esp
     798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     79b:	83 ec 04             	sub    $0x4,%esp
     79e:	68 93 12 00 00       	push   $0x1293
     7a3:	57                   	push   %edi
     7a4:	56                   	push   %esi
     7a5:	e8 76 fe ff ff       	call   620 <peek>
     7aa:	83 c4 10             	add    $0x10,%esp
     7ad:	85 c0                	test   %eax,%eax
     7af:	75 67                	jne    818 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7b1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7b4:	50                   	push   %eax
     7b5:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7b8:	50                   	push   %eax
     7b9:	57                   	push   %edi
     7ba:	56                   	push   %esi
     7bb:	e8 f0 fc ff ff       	call   4b0 <gettoken>
     7c0:	83 c4 10             	add    $0x10,%esp
     7c3:	85 c0                	test   %eax,%eax
     7c5:	74 51                	je     818 <parseexec+0xd8>
    if(tok != 'a')
     7c7:	83 f8 61             	cmp    $0x61,%eax
     7ca:	75 6b                	jne    837 <parseexec+0xf7>
    cmd->argv[argc] = q;
     7cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7cf:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7d2:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     7d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7d9:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     7dd:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     7e0:	83 fb 0a             	cmp    $0xa,%ebx
     7e3:	75 a3                	jne    788 <parseexec+0x48>
      panic("too many args");
     7e5:	83 ec 0c             	sub    $0xc,%esp
     7e8:	68 85 12 00 00       	push   $0x1285
     7ed:	e8 7e f9 ff ff       	call   170 <panic>
     7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	57                   	push   %edi
     7fc:	56                   	push   %esi
     7fd:	e8 5e 01 00 00       	call   960 <parseblock>
     802:	83 c4 10             	add    $0x10,%esp
     805:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     80b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     80e:	5b                   	pop    %ebx
     80f:	5e                   	pop    %esi
     810:	5f                   	pop    %edi
     811:	5d                   	pop    %ebp
     812:	c3                   	ret    
     813:	90                   	nop
     814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     818:	8b 45 d0             	mov    -0x30(%ebp),%eax
     81b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     81e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     825:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     82c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     82f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     832:	5b                   	pop    %ebx
     833:	5e                   	pop    %esi
     834:	5f                   	pop    %edi
     835:	5d                   	pop    %ebp
     836:	c3                   	ret    
      panic("syntax");
     837:	83 ec 0c             	sub    $0xc,%esp
     83a:	68 7e 12 00 00       	push   $0x127e
     83f:	e8 2c f9 ff ff       	call   170 <panic>
     844:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     84a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000850 <parsepipe>:
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 14             	sub    $0x14,%esp
     859:	8b 5d 08             	mov    0x8(%ebp),%ebx
     85c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     85f:	56                   	push   %esi
     860:	53                   	push   %ebx
     861:	e8 da fe ff ff       	call   740 <parseexec>
  if(peek(ps, es, "|")){
     866:	83 c4 0c             	add    $0xc,%esp
  cmd = parseexec(ps, es);
     869:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     86b:	68 98 12 00 00       	push   $0x1298
     870:	56                   	push   %esi
     871:	53                   	push   %ebx
     872:	e8 a9 fd ff ff       	call   620 <peek>
     877:	83 c4 10             	add    $0x10,%esp
     87a:	85 c0                	test   %eax,%eax
     87c:	75 12                	jne    890 <parsepipe+0x40>
}
     87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     881:	89 f8                	mov    %edi,%eax
     883:	5b                   	pop    %ebx
     884:	5e                   	pop    %esi
     885:	5f                   	pop    %edi
     886:	5d                   	pop    %ebp
     887:	c3                   	ret    
     888:	90                   	nop
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	e8 15 fc ff ff       	call   4b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     89b:	58                   	pop    %eax
     89c:	5a                   	pop    %edx
     89d:	56                   	push   %esi
     89e:	53                   	push   %ebx
     89f:	e8 ac ff ff ff       	call   850 <parsepipe>
     8a4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8a7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8aa:	83 c4 10             	add    $0x10,%esp
}
     8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b0:	5b                   	pop    %ebx
     8b1:	5e                   	pop    %esi
     8b2:	5f                   	pop    %edi
     8b3:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8b4:	e9 47 fb ff ff       	jmp    400 <pipecmd>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008c0 <parseline>:
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	57                   	push   %edi
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	83 ec 14             	sub    $0x14,%esp
     8c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     8cf:	56                   	push   %esi
     8d0:	53                   	push   %ebx
     8d1:	e8 7a ff ff ff       	call   850 <parsepipe>
  while(peek(ps, es, "&")){
     8d6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     8d9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     8db:	eb 1b                	jmp    8f8 <parseline+0x38>
     8dd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8e0:	6a 00                	push   $0x0
     8e2:	6a 00                	push   $0x0
     8e4:	56                   	push   %esi
     8e5:	53                   	push   %ebx
     8e6:	e8 c5 fb ff ff       	call   4b0 <gettoken>
    cmd = backcmd(cmd);
     8eb:	89 3c 24             	mov    %edi,(%esp)
     8ee:	e8 8d fb ff ff       	call   480 <backcmd>
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     8f8:	83 ec 04             	sub    $0x4,%esp
     8fb:	68 9a 12 00 00       	push   $0x129a
     900:	56                   	push   %esi
     901:	53                   	push   %ebx
     902:	e8 19 fd ff ff       	call   620 <peek>
     907:	83 c4 10             	add    $0x10,%esp
     90a:	85 c0                	test   %eax,%eax
     90c:	75 d2                	jne    8e0 <parseline+0x20>
  if(peek(ps, es, ";")){
     90e:	83 ec 04             	sub    $0x4,%esp
     911:	68 96 12 00 00       	push   $0x1296
     916:	56                   	push   %esi
     917:	53                   	push   %ebx
     918:	e8 03 fd ff ff       	call   620 <peek>
     91d:	83 c4 10             	add    $0x10,%esp
     920:	85 c0                	test   %eax,%eax
     922:	75 0c                	jne    930 <parseline+0x70>
}
     924:	8d 65 f4             	lea    -0xc(%ebp),%esp
     927:	89 f8                	mov    %edi,%eax
     929:	5b                   	pop    %ebx
     92a:	5e                   	pop    %esi
     92b:	5f                   	pop    %edi
     92c:	5d                   	pop    %ebp
     92d:	c3                   	ret    
     92e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     930:	6a 00                	push   $0x0
     932:	6a 00                	push   $0x0
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	e8 75 fb ff ff       	call   4b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     93b:	58                   	pop    %eax
     93c:	5a                   	pop    %edx
     93d:	56                   	push   %esi
     93e:	53                   	push   %ebx
     93f:	e8 7c ff ff ff       	call   8c0 <parseline>
     944:	89 7d 08             	mov    %edi,0x8(%ebp)
     947:	89 45 0c             	mov    %eax,0xc(%ebp)
     94a:	83 c4 10             	add    $0x10,%esp
}
     94d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     950:	5b                   	pop    %ebx
     951:	5e                   	pop    %esi
     952:	5f                   	pop    %edi
     953:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     954:	e9 e7 fa ff ff       	jmp    440 <listcmd>
     959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000960 <parseblock>:
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	57                   	push   %edi
     964:	56                   	push   %esi
     965:	53                   	push   %ebx
     966:	83 ec 10             	sub    $0x10,%esp
     969:	8b 5d 08             	mov    0x8(%ebp),%ebx
     96c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     96f:	68 7c 12 00 00       	push   $0x127c
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
     976:	e8 a5 fc ff ff       	call   620 <peek>
     97b:	83 c4 10             	add    $0x10,%esp
     97e:	85 c0                	test   %eax,%eax
     980:	74 4a                	je     9cc <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     982:	6a 00                	push   $0x0
     984:	6a 00                	push   $0x0
     986:	56                   	push   %esi
     987:	53                   	push   %ebx
     988:	e8 23 fb ff ff       	call   4b0 <gettoken>
  cmd = parseline(ps, es);
     98d:	58                   	pop    %eax
     98e:	5a                   	pop    %edx
     98f:	56                   	push   %esi
     990:	53                   	push   %ebx
     991:	e8 2a ff ff ff       	call   8c0 <parseline>
  if(!peek(ps, es, ")"))
     996:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(ps, es);
     999:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     99b:	68 b8 12 00 00       	push   $0x12b8
     9a0:	56                   	push   %esi
     9a1:	53                   	push   %ebx
     9a2:	e8 79 fc ff ff       	call   620 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	74 2b                	je     9d9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     9ae:	6a 00                	push   $0x0
     9b0:	6a 00                	push   $0x0
     9b2:	56                   	push   %esi
     9b3:	53                   	push   %ebx
     9b4:	e8 f7 fa ff ff       	call   4b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     9b9:	83 c4 0c             	add    $0xc,%esp
     9bc:	56                   	push   %esi
     9bd:	53                   	push   %ebx
     9be:	57                   	push   %edi
     9bf:	e8 cc fc ff ff       	call   690 <parseredirs>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	5b                   	pop    %ebx
     9c8:	5e                   	pop    %esi
     9c9:	5f                   	pop    %edi
     9ca:	5d                   	pop    %ebp
     9cb:	c3                   	ret    
    panic("parseblock");
     9cc:	83 ec 0c             	sub    $0xc,%esp
     9cf:	68 9c 12 00 00       	push   $0x129c
     9d4:	e8 97 f7 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     9d9:	83 ec 0c             	sub    $0xc,%esp
     9dc:	68 a7 12 00 00       	push   $0x12a7
     9e1:	e8 8a f7 ff ff       	call   170 <panic>
     9e6:	8d 76 00             	lea    0x0(%esi),%esi
     9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	53                   	push   %ebx
     9f4:	83 ec 04             	sub    $0x4,%esp
     9f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9fa:	85 db                	test   %ebx,%ebx
     9fc:	74 20                	je     a1e <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
     9fe:	83 3b 05             	cmpl   $0x5,(%ebx)
     a01:	77 1b                	ja     a1e <nulterminate+0x2e>
     a03:	8b 03                	mov    (%ebx),%eax
     a05:	ff 24 85 f8 12 00 00 	jmp    *0x12f8(,%eax,4)
     a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a10:	83 ec 0c             	sub    $0xc,%esp
     a13:	ff 73 04             	pushl  0x4(%ebx)
     a16:	e8 d5 ff ff ff       	call   9f0 <nulterminate>
    break;
     a1b:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     a1e:	89 d8                	mov    %ebx,%eax
     a20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a23:	c9                   	leave  
     a24:	c3                   	ret    
     a25:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(lcmd->left);
     a28:	83 ec 0c             	sub    $0xc,%esp
     a2b:	ff 73 04             	pushl  0x4(%ebx)
     a2e:	e8 bd ff ff ff       	call   9f0 <nulterminate>
    nulterminate(lcmd->right);
     a33:	58                   	pop    %eax
     a34:	ff 73 08             	pushl  0x8(%ebx)
     a37:	e8 b4 ff ff ff       	call   9f0 <nulterminate>
}
     a3c:	89 d8                	mov    %ebx,%eax
    break;
     a3e:	83 c4 10             	add    $0x10,%esp
}
     a41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a44:	c9                   	leave  
     a45:	c3                   	ret    
     a46:	8d 76 00             	lea    0x0(%esi),%esi
     a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     a50:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a53:	8d 43 08             	lea    0x8(%ebx),%eax
     a56:	85 c9                	test   %ecx,%ecx
     a58:	74 c4                	je     a1e <nulterminate+0x2e>
     a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a60:	8b 50 24             	mov    0x24(%eax),%edx
     a63:	83 c0 04             	add    $0x4,%eax
     a66:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     a69:	8b 50 fc             	mov    -0x4(%eax),%edx
     a6c:	85 d2                	test   %edx,%edx
     a6e:	75 f0                	jne    a60 <nulterminate+0x70>
}
     a70:	89 d8                	mov    %ebx,%eax
     a72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a75:	c9                   	leave  
     a76:	c3                   	ret    
     a77:	89 f6                	mov    %esi,%esi
     a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(rcmd->cmd);
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 73 04             	pushl  0x4(%ebx)
     a86:	e8 65 ff ff ff       	call   9f0 <nulterminate>
    *rcmd->efile = 0;
     a8b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a8e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     a91:	c6 00 00             	movb   $0x0,(%eax)
}
     a94:	89 d8                	mov    %ebx,%eax
     a96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a99:	c9                   	leave  
     a9a:	c3                   	ret    
     a9b:	90                   	nop
     a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <parsecmd>:
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	56                   	push   %esi
     aa4:	53                   	push   %ebx
  es = s + strlen(s);
     aa5:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aa8:	83 ec 0c             	sub    $0xc,%esp
     aab:	53                   	push   %ebx
     aac:	e8 df 00 00 00       	call   b90 <strlen>
  cmd = parseline(&s, es);
     ab1:	59                   	pop    %ecx
  es = s + strlen(s);
     ab2:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     ab4:	8d 45 08             	lea    0x8(%ebp),%eax
     ab7:	5e                   	pop    %esi
     ab8:	53                   	push   %ebx
     ab9:	50                   	push   %eax
     aba:	e8 01 fe ff ff       	call   8c0 <parseline>
     abf:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     ac1:	8d 45 08             	lea    0x8(%ebp),%eax
     ac4:	83 c4 0c             	add    $0xc,%esp
     ac7:	68 41 12 00 00       	push   $0x1241
     acc:	53                   	push   %ebx
     acd:	50                   	push   %eax
     ace:	e8 4d fb ff ff       	call   620 <peek>
  if(s != es){
     ad3:	8b 45 08             	mov    0x8(%ebp),%eax
     ad6:	83 c4 10             	add    $0x10,%esp
     ad9:	39 d8                	cmp    %ebx,%eax
     adb:	75 12                	jne    aef <parsecmd+0x4f>
  nulterminate(cmd);
     add:	83 ec 0c             	sub    $0xc,%esp
     ae0:	56                   	push   %esi
     ae1:	e8 0a ff ff ff       	call   9f0 <nulterminate>
}
     ae6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ae9:	89 f0                	mov    %esi,%eax
     aeb:	5b                   	pop    %ebx
     aec:	5e                   	pop    %esi
     aed:	5d                   	pop    %ebp
     aee:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     aef:	52                   	push   %edx
     af0:	50                   	push   %eax
     af1:	68 ba 12 00 00       	push   $0x12ba
     af6:	6a 02                	push   $0x2
     af8:	e8 d3 03 00 00       	call   ed0 <printf>
    panic("syntax");
     afd:	c7 04 24 7e 12 00 00 	movl   $0x127e,(%esp)
     b04:	e8 67 f6 ff ff       	call   170 <panic>
     b09:	66 90                	xchg   %ax,%ax
     b0b:	66 90                	xchg   %ax,%ax
     b0d:	66 90                	xchg   %ax,%ax
     b0f:	90                   	nop

00000b10 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	53                   	push   %ebx
     b14:	8b 45 08             	mov    0x8(%ebp),%eax
     b17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b1a:	89 c2                	mov    %eax,%edx
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b20:	83 c1 01             	add    $0x1,%ecx
     b23:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     b27:	83 c2 01             	add    $0x1,%edx
     b2a:	84 db                	test   %bl,%bl
     b2c:	88 5a ff             	mov    %bl,-0x1(%edx)
     b2f:	75 ef                	jne    b20 <strcpy+0x10>
    ;
  return os;
}
     b31:	5b                   	pop    %ebx
     b32:	5d                   	pop    %ebp
     b33:	c3                   	ret    
     b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b40 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	53                   	push   %ebx
     b44:	8b 55 08             	mov    0x8(%ebp),%edx
     b47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b4a:	0f b6 02             	movzbl (%edx),%eax
     b4d:	0f b6 19             	movzbl (%ecx),%ebx
     b50:	84 c0                	test   %al,%al
     b52:	75 1c                	jne    b70 <strcmp+0x30>
     b54:	eb 2a                	jmp    b80 <strcmp+0x40>
     b56:	8d 76 00             	lea    0x0(%esi),%esi
     b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     b60:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     b63:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     b66:	83 c1 01             	add    $0x1,%ecx
     b69:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
     b6c:	84 c0                	test   %al,%al
     b6e:	74 10                	je     b80 <strcmp+0x40>
     b70:	38 d8                	cmp    %bl,%al
     b72:	74 ec                	je     b60 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     b74:	29 d8                	sub    %ebx,%eax
}
     b76:	5b                   	pop    %ebx
     b77:	5d                   	pop    %ebp
     b78:	c3                   	ret    
     b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b80:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     b82:	29 d8                	sub    %ebx,%eax
}
     b84:	5b                   	pop    %ebx
     b85:	5d                   	pop    %ebp
     b86:	c3                   	ret    
     b87:	89 f6                	mov    %esi,%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <strlen>:

uint
strlen(const char *s)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b96:	80 39 00             	cmpb   $0x0,(%ecx)
     b99:	74 15                	je     bb0 <strlen+0x20>
     b9b:	31 d2                	xor    %edx,%edx
     b9d:	8d 76 00             	lea    0x0(%esi),%esi
     ba0:	83 c2 01             	add    $0x1,%edx
     ba3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ba7:	89 d0                	mov    %edx,%eax
     ba9:	75 f5                	jne    ba0 <strlen+0x10>
    ;
  return n;
}
     bab:	5d                   	pop    %ebp
     bac:	c3                   	ret    
     bad:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
     bb0:	31 c0                	xor    %eax,%eax
}
     bb2:	5d                   	pop    %ebp
     bb3:	c3                   	ret    
     bb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bc0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	57                   	push   %edi
     bc4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     bc7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     bca:	8b 45 0c             	mov    0xc(%ebp),%eax
     bcd:	89 d7                	mov    %edx,%edi
     bcf:	fc                   	cld    
     bd0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     bd2:	89 d0                	mov    %edx,%eax
     bd4:	5f                   	pop    %edi
     bd5:	5d                   	pop    %ebp
     bd6:	c3                   	ret    
     bd7:	89 f6                	mov    %esi,%esi
     bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000be0 <strchr>:

char*
strchr(const char *s, char c)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	53                   	push   %ebx
     be4:	8b 45 08             	mov    0x8(%ebp),%eax
     be7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     bea:	0f b6 10             	movzbl (%eax),%edx
     bed:	84 d2                	test   %dl,%dl
     bef:	74 1d                	je     c0e <strchr+0x2e>
    if(*s == c)
     bf1:	38 d3                	cmp    %dl,%bl
     bf3:	89 d9                	mov    %ebx,%ecx
     bf5:	75 0d                	jne    c04 <strchr+0x24>
     bf7:	eb 17                	jmp    c10 <strchr+0x30>
     bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c00:	38 ca                	cmp    %cl,%dl
     c02:	74 0c                	je     c10 <strchr+0x30>
  for(; *s; s++)
     c04:	83 c0 01             	add    $0x1,%eax
     c07:	0f b6 10             	movzbl (%eax),%edx
     c0a:	84 d2                	test   %dl,%dl
     c0c:	75 f2                	jne    c00 <strchr+0x20>
      return (char*)s;
  return 0;
     c0e:	31 c0                	xor    %eax,%eax
}
     c10:	5b                   	pop    %ebx
     c11:	5d                   	pop    %ebp
     c12:	c3                   	ret    
     c13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c20 <gets>:

char*
gets(char *buf, int max)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	57                   	push   %edi
     c24:	56                   	push   %esi
     c25:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c26:	31 f6                	xor    %esi,%esi
     c28:	89 f3                	mov    %esi,%ebx
{
     c2a:	83 ec 1c             	sub    $0x1c,%esp
     c2d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     c30:	eb 2f                	jmp    c61 <gets+0x41>
     c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     c38:	8d 45 e7             	lea    -0x19(%ebp),%eax
     c3b:	83 ec 04             	sub    $0x4,%esp
     c3e:	6a 01                	push   $0x1
     c40:	50                   	push   %eax
     c41:	6a 00                	push   $0x0
     c43:	e8 32 01 00 00       	call   d7a <read>
    if(cc < 1)
     c48:	83 c4 10             	add    $0x10,%esp
     c4b:	85 c0                	test   %eax,%eax
     c4d:	7e 1c                	jle    c6b <gets+0x4b>
      break;
    buf[i++] = c;
     c4f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c53:	83 c7 01             	add    $0x1,%edi
     c56:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     c59:	3c 0a                	cmp    $0xa,%al
     c5b:	74 23                	je     c80 <gets+0x60>
     c5d:	3c 0d                	cmp    $0xd,%al
     c5f:	74 1f                	je     c80 <gets+0x60>
  for(i=0; i+1 < max; ){
     c61:	83 c3 01             	add    $0x1,%ebx
     c64:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c67:	89 fe                	mov    %edi,%esi
     c69:	7c cd                	jl     c38 <gets+0x18>
     c6b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     c70:	c6 03 00             	movb   $0x0,(%ebx)
}
     c73:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c76:	5b                   	pop    %ebx
     c77:	5e                   	pop    %esi
     c78:	5f                   	pop    %edi
     c79:	5d                   	pop    %ebp
     c7a:	c3                   	ret    
     c7b:	90                   	nop
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c80:	8b 75 08             	mov    0x8(%ebp),%esi
     c83:	8b 45 08             	mov    0x8(%ebp),%eax
     c86:	01 de                	add    %ebx,%esi
     c88:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     c8a:	c6 03 00             	movb   $0x0,(%ebx)
}
     c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c90:	5b                   	pop    %ebx
     c91:	5e                   	pop    %esi
     c92:	5f                   	pop    %edi
     c93:	5d                   	pop    %ebp
     c94:	c3                   	ret    
     c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <stat>:

int
stat(const char *n, struct stat *st)
{
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	56                   	push   %esi
     ca4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ca5:	83 ec 08             	sub    $0x8,%esp
     ca8:	6a 00                	push   $0x0
     caa:	ff 75 08             	pushl  0x8(%ebp)
     cad:	e8 f0 00 00 00       	call   da2 <open>
  if(fd < 0)
     cb2:	83 c4 10             	add    $0x10,%esp
     cb5:	85 c0                	test   %eax,%eax
     cb7:	78 27                	js     ce0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     cb9:	83 ec 08             	sub    $0x8,%esp
     cbc:	ff 75 0c             	pushl  0xc(%ebp)
     cbf:	89 c3                	mov    %eax,%ebx
     cc1:	50                   	push   %eax
     cc2:	e8 f3 00 00 00       	call   dba <fstat>
  close(fd);
     cc7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     cca:	89 c6                	mov    %eax,%esi
  close(fd);
     ccc:	e8 b9 00 00 00       	call   d8a <close>
  return r;
     cd1:	83 c4 10             	add    $0x10,%esp
}
     cd4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cd7:	89 f0                	mov    %esi,%eax
     cd9:	5b                   	pop    %ebx
     cda:	5e                   	pop    %esi
     cdb:	5d                   	pop    %ebp
     cdc:	c3                   	ret    
     cdd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     ce0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     ce5:	eb ed                	jmp    cd4 <stat+0x34>
     ce7:	89 f6                	mov    %esi,%esi
     ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cf0 <atoi>:

int
atoi(const char *s)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	53                   	push   %ebx
     cf4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cf7:	0f be 11             	movsbl (%ecx),%edx
     cfa:	8d 42 d0             	lea    -0x30(%edx),%eax
     cfd:	3c 09                	cmp    $0x9,%al
  n = 0;
     cff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     d04:	77 1f                	ja     d25 <atoi+0x35>
     d06:	8d 76 00             	lea    0x0(%esi),%esi
     d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     d10:	8d 04 80             	lea    (%eax,%eax,4),%eax
     d13:	83 c1 01             	add    $0x1,%ecx
     d16:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     d1a:	0f be 11             	movsbl (%ecx),%edx
     d1d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d20:	80 fb 09             	cmp    $0x9,%bl
     d23:	76 eb                	jbe    d10 <atoi+0x20>
  return n;
}
     d25:	5b                   	pop    %ebx
     d26:	5d                   	pop    %ebp
     d27:	c3                   	ret    
     d28:	90                   	nop
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d30 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	56                   	push   %esi
     d34:	53                   	push   %ebx
     d35:	8b 5d 10             	mov    0x10(%ebp),%ebx
     d38:	8b 45 08             	mov    0x8(%ebp),%eax
     d3b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d3e:	85 db                	test   %ebx,%ebx
     d40:	7e 14                	jle    d56 <memmove+0x26>
     d42:	31 d2                	xor    %edx,%edx
     d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     d48:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     d4c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     d4f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     d52:	39 d3                	cmp    %edx,%ebx
     d54:	75 f2                	jne    d48 <memmove+0x18>
  return vdst;
}
     d56:	5b                   	pop    %ebx
     d57:	5e                   	pop    %esi
     d58:	5d                   	pop    %ebp
     d59:	c3                   	ret    

00000d5a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d5a:	b8 01 00 00 00       	mov    $0x1,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <exit>:
SYSCALL(exit)
     d62:	b8 02 00 00 00       	mov    $0x2,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <wait>:
SYSCALL(wait)
     d6a:	b8 03 00 00 00       	mov    $0x3,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <pipe>:
SYSCALL(pipe)
     d72:	b8 04 00 00 00       	mov    $0x4,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <read>:
SYSCALL(read)
     d7a:	b8 05 00 00 00       	mov    $0x5,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <write>:
SYSCALL(write)
     d82:	b8 10 00 00 00       	mov    $0x10,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <close>:
SYSCALL(close)
     d8a:	b8 15 00 00 00       	mov    $0x15,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <kill>:
SYSCALL(kill)
     d92:	b8 06 00 00 00       	mov    $0x6,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <exec>:
SYSCALL(exec)
     d9a:	b8 07 00 00 00       	mov    $0x7,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <open>:
SYSCALL(open)
     da2:	b8 0f 00 00 00       	mov    $0xf,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <mknod>:
SYSCALL(mknod)
     daa:	b8 11 00 00 00       	mov    $0x11,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <unlink>:
SYSCALL(unlink)
     db2:	b8 12 00 00 00       	mov    $0x12,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <fstat>:
SYSCALL(fstat)
     dba:	b8 08 00 00 00       	mov    $0x8,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    

00000dc2 <link>:
SYSCALL(link)
     dc2:	b8 13 00 00 00       	mov    $0x13,%eax
     dc7:	cd 40                	int    $0x40
     dc9:	c3                   	ret    

00000dca <mkdir>:
SYSCALL(mkdir)
     dca:	b8 14 00 00 00       	mov    $0x14,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    

00000dd2 <chdir>:
SYSCALL(chdir)
     dd2:	b8 09 00 00 00       	mov    $0x9,%eax
     dd7:	cd 40                	int    $0x40
     dd9:	c3                   	ret    

00000dda <dup>:
SYSCALL(dup)
     dda:	b8 0a 00 00 00       	mov    $0xa,%eax
     ddf:	cd 40                	int    $0x40
     de1:	c3                   	ret    

00000de2 <getpid>:
SYSCALL(getpid)
     de2:	b8 0b 00 00 00       	mov    $0xb,%eax
     de7:	cd 40                	int    $0x40
     de9:	c3                   	ret    

00000dea <sbrk>:
SYSCALL(sbrk)
     dea:	b8 0c 00 00 00       	mov    $0xc,%eax
     def:	cd 40                	int    $0x40
     df1:	c3                   	ret    

00000df2 <sleep>:
SYSCALL(sleep)
     df2:	b8 0d 00 00 00       	mov    $0xd,%eax
     df7:	cd 40                	int    $0x40
     df9:	c3                   	ret    

00000dfa <uptime>:
SYSCALL(uptime)
     dfa:	b8 0e 00 00 00       	mov    $0xe,%eax
     dff:	cd 40                	int    $0x40
     e01:	c3                   	ret    

00000e02 <memsize>:
SYSCALL(memsize)
     e02:	b8 16 00 00 00       	mov    $0x16,%eax
     e07:	cd 40                	int    $0x40
     e09:	c3                   	ret    

00000e0a <set_ps_priority>:
SYSCALL(set_ps_priority)
     e0a:	b8 17 00 00 00       	mov    $0x17,%eax
     e0f:	cd 40                	int    $0x40
     e11:	c3                   	ret    

00000e12 <set_cfs_priority>:
SYSCALL(set_cfs_priority)
     e12:	b8 18 00 00 00       	mov    $0x18,%eax
     e17:	cd 40                	int    $0x40
     e19:	c3                   	ret    

00000e1a <policy>:
SYSCALL(policy)
     e1a:	b8 19 00 00 00       	mov    $0x19,%eax
     e1f:	cd 40                	int    $0x40
     e21:	c3                   	ret    

00000e22 <proc_info>:
     e22:	b8 1a 00 00 00       	mov    $0x1a,%eax
     e27:	cd 40                	int    $0x40
     e29:	c3                   	ret    
     e2a:	66 90                	xchg   %ax,%ax
     e2c:	66 90                	xchg   %ax,%ax
     e2e:	66 90                	xchg   %ax,%ax

00000e30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	57                   	push   %edi
     e34:	56                   	push   %esi
     e35:	53                   	push   %ebx
     e36:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     e39:	85 d2                	test   %edx,%edx
{
     e3b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
     e3e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
     e40:	79 76                	jns    eb8 <printint+0x88>
     e42:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e46:	74 70                	je     eb8 <printint+0x88>
    x = -xx;
     e48:	f7 d8                	neg    %eax
    neg = 1;
     e4a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     e51:	31 f6                	xor    %esi,%esi
     e53:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     e56:	eb 0a                	jmp    e62 <printint+0x32>
     e58:	90                   	nop
     e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
     e60:	89 fe                	mov    %edi,%esi
     e62:	31 d2                	xor    %edx,%edx
     e64:	8d 7e 01             	lea    0x1(%esi),%edi
     e67:	f7 f1                	div    %ecx
     e69:	0f b6 92 18 13 00 00 	movzbl 0x1318(%edx),%edx
  }while((x /= base) != 0);
     e70:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     e72:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
     e75:	75 e9                	jne    e60 <printint+0x30>
  if(neg)
     e77:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e7a:	85 c0                	test   %eax,%eax
     e7c:	74 08                	je     e86 <printint+0x56>
    buf[i++] = '-';
     e7e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
     e83:	8d 7e 02             	lea    0x2(%esi),%edi
     e86:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
     e8a:	8b 7d c0             	mov    -0x40(%ebp),%edi
     e8d:	8d 76 00             	lea    0x0(%esi),%esi
     e90:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
     e93:	83 ec 04             	sub    $0x4,%esp
     e96:	83 ee 01             	sub    $0x1,%esi
     e99:	6a 01                	push   $0x1
     e9b:	53                   	push   %ebx
     e9c:	57                   	push   %edi
     e9d:	88 45 d7             	mov    %al,-0x29(%ebp)
     ea0:	e8 dd fe ff ff       	call   d82 <write>

  while(--i >= 0)
     ea5:	83 c4 10             	add    $0x10,%esp
     ea8:	39 de                	cmp    %ebx,%esi
     eaa:	75 e4                	jne    e90 <printint+0x60>
    putc(fd, buf[i]);
}
     eac:	8d 65 f4             	lea    -0xc(%ebp),%esp
     eaf:	5b                   	pop    %ebx
     eb0:	5e                   	pop    %esi
     eb1:	5f                   	pop    %edi
     eb2:	5d                   	pop    %ebp
     eb3:	c3                   	ret    
     eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     eb8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     ebf:	eb 90                	jmp    e51 <printint+0x21>
     ec1:	eb 0d                	jmp    ed0 <printf>
     ec3:	90                   	nop
     ec4:	90                   	nop
     ec5:	90                   	nop
     ec6:	90                   	nop
     ec7:	90                   	nop
     ec8:	90                   	nop
     ec9:	90                   	nop
     eca:	90                   	nop
     ecb:	90                   	nop
     ecc:	90                   	nop
     ecd:	90                   	nop
     ece:	90                   	nop
     ecf:	90                   	nop

00000ed0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	57                   	push   %edi
     ed4:	56                   	push   %esi
     ed5:	53                   	push   %ebx
     ed6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ed9:	8b 75 0c             	mov    0xc(%ebp),%esi
     edc:	0f b6 1e             	movzbl (%esi),%ebx
     edf:	84 db                	test   %bl,%bl
     ee1:	0f 84 b3 00 00 00    	je     f9a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
     ee7:	8d 45 10             	lea    0x10(%ebp),%eax
     eea:	83 c6 01             	add    $0x1,%esi
  state = 0;
     eed:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
     eef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     ef2:	eb 2f                	jmp    f23 <printf+0x53>
     ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ef8:	83 f8 25             	cmp    $0x25,%eax
     efb:	0f 84 a7 00 00 00    	je     fa8 <printf+0xd8>
  write(fd, &c, 1);
     f01:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     f04:	83 ec 04             	sub    $0x4,%esp
     f07:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     f0a:	6a 01                	push   $0x1
     f0c:	50                   	push   %eax
     f0d:	ff 75 08             	pushl  0x8(%ebp)
     f10:	e8 6d fe ff ff       	call   d82 <write>
     f15:	83 c4 10             	add    $0x10,%esp
     f18:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
     f1b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     f1f:	84 db                	test   %bl,%bl
     f21:	74 77                	je     f9a <printf+0xca>
    if(state == 0){
     f23:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
     f25:	0f be cb             	movsbl %bl,%ecx
     f28:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     f2b:	74 cb                	je     ef8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     f2d:	83 ff 25             	cmp    $0x25,%edi
     f30:	75 e6                	jne    f18 <printf+0x48>
      if(c == 'd'){
     f32:	83 f8 64             	cmp    $0x64,%eax
     f35:	0f 84 05 01 00 00    	je     1040 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     f3b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f41:	83 f9 70             	cmp    $0x70,%ecx
     f44:	74 72                	je     fb8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     f46:	83 f8 73             	cmp    $0x73,%eax
     f49:	0f 84 99 00 00 00    	je     fe8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f4f:	83 f8 63             	cmp    $0x63,%eax
     f52:	0f 84 08 01 00 00    	je     1060 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     f58:	83 f8 25             	cmp    $0x25,%eax
     f5b:	0f 84 ef 00 00 00    	je     1050 <printf+0x180>
  write(fd, &c, 1);
     f61:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f64:	83 ec 04             	sub    $0x4,%esp
     f67:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f6b:	6a 01                	push   $0x1
     f6d:	50                   	push   %eax
     f6e:	ff 75 08             	pushl  0x8(%ebp)
     f71:	e8 0c fe ff ff       	call   d82 <write>
     f76:	83 c4 0c             	add    $0xc,%esp
     f79:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     f7c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     f7f:	6a 01                	push   $0x1
     f81:	50                   	push   %eax
     f82:	ff 75 08             	pushl  0x8(%ebp)
     f85:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f88:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
     f8a:	e8 f3 fd ff ff       	call   d82 <write>
  for(i = 0; fmt[i]; i++){
     f8f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
     f93:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     f96:	84 db                	test   %bl,%bl
     f98:	75 89                	jne    f23 <printf+0x53>
    }
  }
}
     f9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f9d:	5b                   	pop    %ebx
     f9e:	5e                   	pop    %esi
     f9f:	5f                   	pop    %edi
     fa0:	5d                   	pop    %ebp
     fa1:	c3                   	ret    
     fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
     fa8:	bf 25 00 00 00       	mov    $0x25,%edi
     fad:	e9 66 ff ff ff       	jmp    f18 <printf+0x48>
     fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     fb8:	83 ec 0c             	sub    $0xc,%esp
     fbb:	b9 10 00 00 00       	mov    $0x10,%ecx
     fc0:	6a 00                	push   $0x0
     fc2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     fc5:	8b 45 08             	mov    0x8(%ebp),%eax
     fc8:	8b 17                	mov    (%edi),%edx
     fca:	e8 61 fe ff ff       	call   e30 <printint>
        ap++;
     fcf:	89 f8                	mov    %edi,%eax
     fd1:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fd4:	31 ff                	xor    %edi,%edi
        ap++;
     fd6:	83 c0 04             	add    $0x4,%eax
     fd9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     fdc:	e9 37 ff ff ff       	jmp    f18 <printf+0x48>
     fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     fe8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     feb:	8b 08                	mov    (%eax),%ecx
        ap++;
     fed:	83 c0 04             	add    $0x4,%eax
     ff0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
     ff3:	85 c9                	test   %ecx,%ecx
     ff5:	0f 84 8e 00 00 00    	je     1089 <printf+0x1b9>
        while(*s != 0){
     ffb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
     ffe:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    1000:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1002:	84 c0                	test   %al,%al
    1004:	0f 84 0e ff ff ff    	je     f18 <printf+0x48>
    100a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    100d:	89 de                	mov    %ebx,%esi
    100f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1012:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    1015:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1018:	83 ec 04             	sub    $0x4,%esp
          s++;
    101b:	83 c6 01             	add    $0x1,%esi
    101e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1021:	6a 01                	push   $0x1
    1023:	57                   	push   %edi
    1024:	53                   	push   %ebx
    1025:	e8 58 fd ff ff       	call   d82 <write>
        while(*s != 0){
    102a:	0f b6 06             	movzbl (%esi),%eax
    102d:	83 c4 10             	add    $0x10,%esp
    1030:	84 c0                	test   %al,%al
    1032:	75 e4                	jne    1018 <printf+0x148>
    1034:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    1037:	31 ff                	xor    %edi,%edi
    1039:	e9 da fe ff ff       	jmp    f18 <printf+0x48>
    103e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    1040:	83 ec 0c             	sub    $0xc,%esp
    1043:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1048:	6a 01                	push   $0x1
    104a:	e9 73 ff ff ff       	jmp    fc2 <printf+0xf2>
    104f:	90                   	nop
  write(fd, &c, 1);
    1050:	83 ec 04             	sub    $0x4,%esp
    1053:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1056:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1059:	6a 01                	push   $0x1
    105b:	e9 21 ff ff ff       	jmp    f81 <printf+0xb1>
        putc(fd, *ap);
    1060:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    1063:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1066:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1068:	6a 01                	push   $0x1
        ap++;
    106a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    106d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1070:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1073:	50                   	push   %eax
    1074:	ff 75 08             	pushl  0x8(%ebp)
    1077:	e8 06 fd ff ff       	call   d82 <write>
        ap++;
    107c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    107f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1082:	31 ff                	xor    %edi,%edi
    1084:	e9 8f fe ff ff       	jmp    f18 <printf+0x48>
          s = "(null)";
    1089:	bb 10 13 00 00       	mov    $0x1310,%ebx
        while(*s != 0){
    108e:	b8 28 00 00 00       	mov    $0x28,%eax
    1093:	e9 72 ff ff ff       	jmp    100a <printf+0x13a>
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10a1:	a1 64 19 00 00       	mov    0x1964,%eax
{
    10a6:	89 e5                	mov    %esp,%ebp
    10a8:	57                   	push   %edi
    10a9:	56                   	push   %esi
    10aa:	53                   	push   %ebx
    10ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    10ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    10b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10b8:	39 c8                	cmp    %ecx,%eax
    10ba:	8b 10                	mov    (%eax),%edx
    10bc:	73 32                	jae    10f0 <free+0x50>
    10be:	39 d1                	cmp    %edx,%ecx
    10c0:	72 04                	jb     10c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10c2:	39 d0                	cmp    %edx,%eax
    10c4:	72 32                	jb     10f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    10c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    10c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10cc:	39 fa                	cmp    %edi,%edx
    10ce:	74 30                	je     1100 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    10d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    10d3:	8b 50 04             	mov    0x4(%eax),%edx
    10d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10d9:	39 f1                	cmp    %esi,%ecx
    10db:	74 3a                	je     1117 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    10dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    10df:	a3 64 19 00 00       	mov    %eax,0x1964
}
    10e4:	5b                   	pop    %ebx
    10e5:	5e                   	pop    %esi
    10e6:	5f                   	pop    %edi
    10e7:	5d                   	pop    %ebp
    10e8:	c3                   	ret    
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10f0:	39 d0                	cmp    %edx,%eax
    10f2:	72 04                	jb     10f8 <free+0x58>
    10f4:	39 d1                	cmp    %edx,%ecx
    10f6:	72 ce                	jb     10c6 <free+0x26>
{
    10f8:	89 d0                	mov    %edx,%eax
    10fa:	eb bc                	jmp    10b8 <free+0x18>
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1100:	03 72 04             	add    0x4(%edx),%esi
    1103:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1106:	8b 10                	mov    (%eax),%edx
    1108:	8b 12                	mov    (%edx),%edx
    110a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    110d:	8b 50 04             	mov    0x4(%eax),%edx
    1110:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1113:	39 f1                	cmp    %esi,%ecx
    1115:	75 c6                	jne    10dd <free+0x3d>
    p->s.size += bp->s.size;
    1117:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    111a:	a3 64 19 00 00       	mov    %eax,0x1964
    p->s.size += bp->s.size;
    111f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1122:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1125:	89 10                	mov    %edx,(%eax)
}
    1127:	5b                   	pop    %ebx
    1128:	5e                   	pop    %esi
    1129:	5f                   	pop    %edi
    112a:	5d                   	pop    %ebp
    112b:	c3                   	ret    
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001130 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	53                   	push   %ebx
    1136:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1139:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    113c:	8b 15 64 19 00 00    	mov    0x1964,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1142:	8d 78 07             	lea    0x7(%eax),%edi
    1145:	c1 ef 03             	shr    $0x3,%edi
    1148:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    114b:	85 d2                	test   %edx,%edx
    114d:	0f 84 9d 00 00 00    	je     11f0 <malloc+0xc0>
    1153:	8b 02                	mov    (%edx),%eax
    1155:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1158:	39 cf                	cmp    %ecx,%edi
    115a:	76 6c                	jbe    11c8 <malloc+0x98>
    115c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1162:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1167:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    116a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1171:	eb 0e                	jmp    1181 <malloc+0x51>
    1173:	90                   	nop
    1174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1178:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    117a:	8b 48 04             	mov    0x4(%eax),%ecx
    117d:	39 f9                	cmp    %edi,%ecx
    117f:	73 47                	jae    11c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1181:	39 05 64 19 00 00    	cmp    %eax,0x1964
    1187:	89 c2                	mov    %eax,%edx
    1189:	75 ed                	jne    1178 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    118b:	83 ec 0c             	sub    $0xc,%esp
    118e:	56                   	push   %esi
    118f:	e8 56 fc ff ff       	call   dea <sbrk>
  if(p == (char*)-1)
    1194:	83 c4 10             	add    $0x10,%esp
    1197:	83 f8 ff             	cmp    $0xffffffff,%eax
    119a:	74 1c                	je     11b8 <malloc+0x88>
  hp->s.size = nu;
    119c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    119f:	83 ec 0c             	sub    $0xc,%esp
    11a2:	83 c0 08             	add    $0x8,%eax
    11a5:	50                   	push   %eax
    11a6:	e8 f5 fe ff ff       	call   10a0 <free>
  return freep;
    11ab:	8b 15 64 19 00 00    	mov    0x1964,%edx
      if((p = morecore(nunits)) == 0)
    11b1:	83 c4 10             	add    $0x10,%esp
    11b4:	85 d2                	test   %edx,%edx
    11b6:	75 c0                	jne    1178 <malloc+0x48>
        return 0;
  }
}
    11b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    11bb:	31 c0                	xor    %eax,%eax
}
    11bd:	5b                   	pop    %ebx
    11be:	5e                   	pop    %esi
    11bf:	5f                   	pop    %edi
    11c0:	5d                   	pop    %ebp
    11c1:	c3                   	ret    
    11c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    11c8:	39 cf                	cmp    %ecx,%edi
    11ca:	74 54                	je     1220 <malloc+0xf0>
        p->s.size -= nunits;
    11cc:	29 f9                	sub    %edi,%ecx
    11ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    11d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    11d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    11d7:	89 15 64 19 00 00    	mov    %edx,0x1964
}
    11dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    11e0:	83 c0 08             	add    $0x8,%eax
}
    11e3:	5b                   	pop    %ebx
    11e4:	5e                   	pop    %esi
    11e5:	5f                   	pop    %edi
    11e6:	5d                   	pop    %ebp
    11e7:	c3                   	ret    
    11e8:	90                   	nop
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    11f0:	c7 05 64 19 00 00 68 	movl   $0x1968,0x1964
    11f7:	19 00 00 
    11fa:	c7 05 68 19 00 00 68 	movl   $0x1968,0x1968
    1201:	19 00 00 
    base.s.size = 0;
    1204:	b8 68 19 00 00       	mov    $0x1968,%eax
    1209:	c7 05 6c 19 00 00 00 	movl   $0x0,0x196c
    1210:	00 00 00 
    1213:	e9 44 ff ff ff       	jmp    115c <malloc+0x2c>
    1218:	90                   	nop
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1220:	8b 08                	mov    (%eax),%ecx
    1222:	89 0a                	mov    %ecx,(%edx)
    1224:	eb b1                	jmp    11d7 <malloc+0xa7>

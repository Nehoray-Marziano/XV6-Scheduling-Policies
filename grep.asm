
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  19:	83 ff 01             	cmp    $0x1,%edi
  1c:	0f 8e 8b 00 00 00    	jle    ad <main+0xad>
    printf(2, "usage: grep pattern [file ...]\n");
    exit(0);
  }
  pattern = argv[1];
  22:	8b 43 04             	mov    0x4(%ebx),%eax
  25:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  28:	83 ff 02             	cmp    $0x2,%edi
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	74 47                	je     7c <main+0x7c>
  35:	8d 76 00             	lea    0x0(%esi),%esi
    if((fd = open(argv[i], 0)) < 0){
  38:	83 ec 08             	sub    $0x8,%esp
  3b:	6a 00                	push   $0x0
  3d:	ff 33                	pushl  (%ebx)
  3f:	e8 9e 05 00 00       	call   5e2 <open>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	78 47                	js     92 <main+0x92>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(0);
    }
    grep(pattern, fd);
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(i = 2; i < argc; i++){
  51:	83 c6 01             	add    $0x1,%esi
    grep(pattern, fd);
  54:	50                   	push   %eax
  55:	ff 75 e0             	pushl  -0x20(%ebp)
  58:	83 c3 04             	add    $0x4,%ebx
  5b:	e8 f0 01 00 00       	call   250 <grep>
    close(fd);
  60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  63:	89 04 24             	mov    %eax,(%esp)
  66:	e8 5f 05 00 00       	call   5ca <close>
  for(i = 2; i < argc; i++){
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	39 f7                	cmp    %esi,%edi
  70:	7f c6                	jg     38 <main+0x38>
  }
  exit(0);
  72:	83 ec 0c             	sub    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	e8 26 05 00 00       	call   5a2 <exit>
    grep(pattern, 0);
  7c:	52                   	push   %edx
  7d:	52                   	push   %edx
  7e:	6a 00                	push   $0x0
  80:	50                   	push   %eax
  81:	e8 ca 01 00 00       	call   250 <grep>
    exit(0);
  86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8d:	e8 10 05 00 00       	call   5a2 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  92:	50                   	push   %eax
  93:	ff 33                	pushl  (%ebx)
  95:	68 88 0a 00 00       	push   $0xa88
  9a:	6a 01                	push   $0x1
  9c:	e8 6f 06 00 00       	call   710 <printf>
      exit(0);
  a1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a8:	e8 f5 04 00 00       	call   5a2 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  ad:	51                   	push   %ecx
  ae:	51                   	push   %ecx
  af:	68 68 0a 00 00       	push   $0xa68
  b4:	6a 02                	push   $0x2
  b6:	e8 55 06 00 00       	call   710 <printf>
    exit(0);
  bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  c2:	e8 db 04 00 00       	call   5a2 <exit>
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	56                   	push   %esi
  d5:	53                   	push   %ebx
  d6:	83 ec 0c             	sub    $0xc,%esp
  d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  df:	8b 7d 10             	mov    0x10(%ebp),%edi
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  e8:	83 ec 08             	sub    $0x8,%esp
  eb:	57                   	push   %edi
  ec:	56                   	push   %esi
  ed:	e8 3e 00 00 00       	call   130 <matchhere>
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	85 c0                	test   %eax,%eax
  f7:	75 1f                	jne    118 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  f9:	0f be 17             	movsbl (%edi),%edx
  fc:	84 d2                	test   %dl,%dl
  fe:	74 0c                	je     10c <matchstar+0x3c>
 100:	83 c7 01             	add    $0x1,%edi
 103:	39 da                	cmp    %ebx,%edx
 105:	74 e1                	je     e8 <matchstar+0x18>
 107:	83 fb 2e             	cmp    $0x2e,%ebx
 10a:	74 dc                	je     e8 <matchstar+0x18>
  return 0;
}
 10c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 10f:	5b                   	pop    %ebx
 110:	5e                   	pop    %esi
 111:	5f                   	pop    %edi
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 118:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 11b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    
 125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <matchhere>:
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	53                   	push   %ebx
 136:	83 ec 0c             	sub    $0xc,%esp
  if(re[0] == '\0')
 139:	8b 45 08             	mov    0x8(%ebp),%eax
{
 13c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 13f:	0f b6 08             	movzbl (%eax),%ecx
 142:	84 c9                	test   %cl,%cl
 144:	74 67                	je     1ad <matchhere+0x7d>
  if(re[1] == '*')
 146:	0f be 40 01          	movsbl 0x1(%eax),%eax
 14a:	3c 2a                	cmp    $0x2a,%al
 14c:	74 6c                	je     1ba <matchhere+0x8a>
  if(re[0] == '$' && re[1] == '\0')
 14e:	80 f9 24             	cmp    $0x24,%cl
 151:	0f b6 1f             	movzbl (%edi),%ebx
 154:	75 08                	jne    15e <matchhere+0x2e>
 156:	84 c0                	test   %al,%al
 158:	0f 84 81 00 00 00    	je     1df <matchhere+0xaf>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 15e:	84 db                	test   %bl,%bl
 160:	74 09                	je     16b <matchhere+0x3b>
 162:	38 d9                	cmp    %bl,%cl
 164:	74 3c                	je     1a2 <matchhere+0x72>
 166:	80 f9 2e             	cmp    $0x2e,%cl
 169:	74 37                	je     1a2 <matchhere+0x72>
}
 16b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5e                   	pop    %esi
 172:	5f                   	pop    %edi
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi
  if(re[1] == '*')
 178:	8b 75 08             	mov    0x8(%ebp),%esi
 17b:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
 17f:	80 f9 2a             	cmp    $0x2a,%cl
 182:	74 3b                	je     1bf <matchhere+0x8f>
  if(re[0] == '$' && re[1] == '\0')
 184:	3c 24                	cmp    $0x24,%al
 186:	75 04                	jne    18c <matchhere+0x5c>
 188:	84 c9                	test   %cl,%cl
 18a:	74 4f                	je     1db <matchhere+0xab>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 18c:	0f b6 33             	movzbl (%ebx),%esi
 18f:	89 f2                	mov    %esi,%edx
 191:	84 d2                	test   %dl,%dl
 193:	74 d6                	je     16b <matchhere+0x3b>
 195:	3c 2e                	cmp    $0x2e,%al
 197:	89 df                	mov    %ebx,%edi
 199:	74 04                	je     19f <matchhere+0x6f>
 19b:	38 c2                	cmp    %al,%dl
 19d:	75 cc                	jne    16b <matchhere+0x3b>
 19f:	0f be c1             	movsbl %cl,%eax
    return matchhere(re+1, text+1);
 1a2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  if(re[0] == '\0')
 1a6:	84 c0                	test   %al,%al
    return matchhere(re+1, text+1);
 1a8:	8d 5f 01             	lea    0x1(%edi),%ebx
  if(re[0] == '\0')
 1ab:	75 cb                	jne    178 <matchhere+0x48>
    return 1;
 1ad:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b5:	5b                   	pop    %ebx
 1b6:	5e                   	pop    %esi
 1b7:	5f                   	pop    %edi
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
  if(re[1] == '*')
 1ba:	89 fb                	mov    %edi,%ebx
 1bc:	0f be c1             	movsbl %cl,%eax
    return matchstar(re[0], re+2, text);
 1bf:	8b 7d 08             	mov    0x8(%ebp),%edi
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	53                   	push   %ebx
 1c6:	8d 57 02             	lea    0x2(%edi),%edx
 1c9:	52                   	push   %edx
 1ca:	50                   	push   %eax
 1cb:	e8 00 ff ff ff       	call   d0 <matchstar>
 1d0:	83 c4 10             	add    $0x10,%esp
}
 1d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d6:	5b                   	pop    %ebx
 1d7:	5e                   	pop    %esi
 1d8:	5f                   	pop    %edi
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    
 1db:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1df:	31 c0                	xor    %eax,%eax
 1e1:	84 db                	test   %bl,%bl
 1e3:	0f 94 c0             	sete   %al
 1e6:	eb ca                	jmp    1b2 <matchhere+0x82>
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <match>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
 1f5:	8b 75 08             	mov    0x8(%ebp),%esi
 1f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1fb:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1fe:	75 11                	jne    211 <match+0x21>
 200:	eb 2e                	jmp    230 <match+0x40>
 202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 208:	83 c3 01             	add    $0x1,%ebx
 20b:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 20f:	74 16                	je     227 <match+0x37>
    if(matchhere(re, text))
 211:	83 ec 08             	sub    $0x8,%esp
 214:	53                   	push   %ebx
 215:	56                   	push   %esi
 216:	e8 15 ff ff ff       	call   130 <matchhere>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	85 c0                	test   %eax,%eax
 220:	74 e6                	je     208 <match+0x18>
      return 1;
 222:	b8 01 00 00 00       	mov    $0x1,%eax
}
 227:	8d 65 f8             	lea    -0x8(%ebp),%esp
 22a:	5b                   	pop    %ebx
 22b:	5e                   	pop    %esi
 22c:	5d                   	pop    %ebp
 22d:	c3                   	ret    
 22e:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 230:	83 c6 01             	add    $0x1,%esi
 233:	89 75 08             	mov    %esi,0x8(%ebp)
}
 236:	8d 65 f8             	lea    -0x8(%ebp),%esp
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 23c:	e9 ef fe ff ff       	jmp    130 <matchhere>
 241:	eb 0d                	jmp    250 <grep>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <grep>:
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	53                   	push   %ebx
  m = 0;
 256:	31 f6                	xor    %esi,%esi
{
 258:	83 ec 1c             	sub    $0x1c,%esp
 25b:	90                   	nop
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 260:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 265:	83 ec 04             	sub    $0x4,%esp
 268:	29 f0                	sub    %esi,%eax
 26a:	50                   	push   %eax
 26b:	8d 86 60 0e 00 00    	lea    0xe60(%esi),%eax
 271:	50                   	push   %eax
 272:	ff 75 0c             	pushl  0xc(%ebp)
 275:	e8 40 03 00 00       	call   5ba <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	85 c0                	test   %eax,%eax
 27f:	0f 8e bb 00 00 00    	jle    340 <grep+0xf0>
    m += n;
 285:	01 c6                	add    %eax,%esi
    p = buf;
 287:	bb 60 0e 00 00       	mov    $0xe60,%ebx
    buf[m] = '\0';
 28c:	c6 86 60 0e 00 00 00 	movb   $0x0,0xe60(%esi)
 293:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while((q = strchr(p, '\n')) != 0){
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	6a 0a                	push   $0xa
 2a5:	53                   	push   %ebx
 2a6:	e8 75 01 00 00       	call   420 <strchr>
 2ab:	83 c4 10             	add    $0x10,%esp
 2ae:	85 c0                	test   %eax,%eax
 2b0:	89 c6                	mov    %eax,%esi
 2b2:	74 44                	je     2f8 <grep+0xa8>
      if(match(pattern, p)){
 2b4:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 2b7:	c6 06 00             	movb   $0x0,(%esi)
 2ba:	8d 7e 01             	lea    0x1(%esi),%edi
      if(match(pattern, p)){
 2bd:	53                   	push   %ebx
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 2a ff ff ff       	call   1f0 <match>
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	75 0b                	jne    2d8 <grep+0x88>
      p = q+1;
 2cd:	89 fb                	mov    %edi,%ebx
 2cf:	eb cf                	jmp    2a0 <grep+0x50>
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
 2d8:	89 f8                	mov    %edi,%eax
 2da:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2dd:	c6 06 0a             	movb   $0xa,(%esi)
        write(1, p, q+1 - p);
 2e0:	29 d8                	sub    %ebx,%eax
 2e2:	50                   	push   %eax
 2e3:	53                   	push   %ebx
      p = q+1;
 2e4:	89 fb                	mov    %edi,%ebx
        write(1, p, q+1 - p);
 2e6:	6a 01                	push   $0x1
 2e8:	e8 d5 02 00 00       	call   5c2 <write>
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	eb ae                	jmp    2a0 <grep+0x50>
 2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
 2f8:	81 fb 60 0e 00 00    	cmp    $0xe60,%ebx
 2fe:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 301:	74 2d                	je     330 <grep+0xe0>
    if(m > 0){
 303:	85 f6                	test   %esi,%esi
 305:	0f 8e 55 ff ff ff    	jle    260 <grep+0x10>
      m -= p - buf;
 30b:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 30d:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 310:	2d 60 0e 00 00       	sub    $0xe60,%eax
 315:	29 c6                	sub    %eax,%esi
      memmove(buf, p, m);
 317:	56                   	push   %esi
 318:	53                   	push   %ebx
 319:	68 60 0e 00 00       	push   $0xe60
 31e:	e8 4d 02 00 00       	call   570 <memmove>
 323:	83 c4 10             	add    $0x10,%esp
 326:	e9 35 ff ff ff       	jmp    260 <grep+0x10>
 32b:	90                   	nop
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
 330:	31 f6                	xor    %esi,%esi
 332:	e9 29 ff ff ff       	jmp    260 <grep+0x10>
 337:	89 f6                	mov    %esi,%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
 340:	8d 65 f4             	lea    -0xc(%ebp),%esp
 343:	5b                   	pop    %ebx
 344:	5e                   	pop    %esi
 345:	5f                   	pop    %edi
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 35a:	89 c2                	mov    %eax,%edx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 360:	83 c1 01             	add    $0x1,%ecx
 363:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 367:	83 c2 01             	add    $0x1,%edx
 36a:	84 db                	test   %bl,%bl
 36c:	88 5a ff             	mov    %bl,-0x1(%edx)
 36f:	75 ef                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 371:	5b                   	pop    %ebx
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    
 374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 37a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
 387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38a:	0f b6 02             	movzbl (%edx),%eax
 38d:	0f b6 19             	movzbl (%ecx),%ebx
 390:	84 c0                	test   %al,%al
 392:	75 1c                	jne    3b0 <strcmp+0x30>
 394:	eb 2a                	jmp    3c0 <strcmp+0x40>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3a6:	83 c1 01             	add    $0x1,%ecx
 3a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 3ac:	84 c0                	test   %al,%al
 3ae:	74 10                	je     3c0 <strcmp+0x40>
 3b0:	38 d8                	cmp    %bl,%al
 3b2:	74 ec                	je     3a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3b4:	29 d8                	sub    %ebx,%eax
}
 3b6:	5b                   	pop    %ebx
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3c2:	29 d8                	sub    %ebx,%eax
}
 3c4:	5b                   	pop    %ebx
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 39 00             	cmpb   $0x0,(%ecx)
 3d9:	74 15                	je     3f0 <strlen+0x20>
 3db:	31 d2                	xor    %edx,%edx
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3e7:	89 d0                	mov    %edx,%eax
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3f0:	31 c0                	xor    %eax,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	89 d0                	mov    %edx,%eax
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 45 08             	mov    0x8(%ebp),%eax
 427:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	74 1d                	je     44e <strchr+0x2e>
    if(*s == c)
 431:	38 d3                	cmp    %dl,%bl
 433:	89 d9                	mov    %ebx,%ecx
 435:	75 0d                	jne    444 <strchr+0x24>
 437:	eb 17                	jmp    450 <strchr+0x30>
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 440:	38 ca                	cmp    %cl,%dl
 442:	74 0c                	je     450 <strchr+0x30>
  for(; *s; s++)
 444:	83 c0 01             	add    $0x1,%eax
 447:	0f b6 10             	movzbl (%eax),%edx
 44a:	84 d2                	test   %dl,%dl
 44c:	75 f2                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
 44e:	31 c0                	xor    %eax,%eax
}
 450:	5b                   	pop    %ebx
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    
 453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 466:	31 f6                	xor    %esi,%esi
 468:	89 f3                	mov    %esi,%ebx
{
 46a:	83 ec 1c             	sub    $0x1c,%esp
 46d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 470:	eb 2f                	jmp    4a1 <gets+0x41>
 472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 478:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	6a 01                	push   $0x1
 480:	50                   	push   %eax
 481:	6a 00                	push   $0x0
 483:	e8 32 01 00 00       	call   5ba <read>
    if(cc < 1)
 488:	83 c4 10             	add    $0x10,%esp
 48b:	85 c0                	test   %eax,%eax
 48d:	7e 1c                	jle    4ab <gets+0x4b>
      break;
    buf[i++] = c;
 48f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 493:	83 c7 01             	add    $0x1,%edi
 496:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 499:	3c 0a                	cmp    $0xa,%al
 49b:	74 23                	je     4c0 <gets+0x60>
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	74 1f                	je     4c0 <gets+0x60>
  for(i=0; i+1 < max; ){
 4a1:	83 c3 01             	add    $0x1,%ebx
 4a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a7:	89 fe                	mov    %edi,%esi
 4a9:	7c cd                	jl     478 <gets+0x18>
 4ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    
 4bb:	90                   	nop
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c0:	8b 75 08             	mov    0x8(%ebp),%esi
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	01 de                	add    %ebx,%esi
 4c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4ca:	c6 03 00             	movb   $0x0,(%ebx)
}
 4cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5f                   	pop    %edi
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    
 4d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 00                	push   $0x0
 4ea:	ff 75 08             	pushl  0x8(%ebp)
 4ed:	e8 f0 00 00 00       	call   5e2 <open>
  if(fd < 0)
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	78 27                	js     520 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4f9:	83 ec 08             	sub    $0x8,%esp
 4fc:	ff 75 0c             	pushl  0xc(%ebp)
 4ff:	89 c3                	mov    %eax,%ebx
 501:	50                   	push   %eax
 502:	e8 f3 00 00 00       	call   5fa <fstat>
  close(fd);
 507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50a:	89 c6                	mov    %eax,%esi
  close(fd);
 50c:	e8 b9 00 00 00       	call   5ca <close>
  return r;
 511:	83 c4 10             	add    $0x10,%esp
}
 514:	8d 65 f8             	lea    -0x8(%ebp),%esp
 517:	89 f0                	mov    %esi,%eax
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 520:	be ff ff ff ff       	mov    $0xffffffff,%esi
 525:	eb ed                	jmp    514 <stat+0x34>
 527:	89 f6                	mov    %esi,%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 537:	0f be 11             	movsbl (%ecx),%edx
 53a:	8d 42 d0             	lea    -0x30(%edx),%eax
 53d:	3c 09                	cmp    $0x9,%al
  n = 0;
 53f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 544:	77 1f                	ja     565 <atoi+0x35>
 546:	8d 76 00             	lea    0x0(%esi),%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 550:	8d 04 80             	lea    (%eax,%eax,4),%eax
 553:	83 c1 01             	add    $0x1,%ecx
 556:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 55a:	0f be 11             	movsbl (%ecx),%edx
 55d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	5b                   	pop    %ebx
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
 568:	90                   	nop
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
 575:	8b 5d 10             	mov    0x10(%ebp),%ebx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 57e:	85 db                	test   %ebx,%ebx
 580:	7e 14                	jle    596 <memmove+0x26>
 582:	31 d2                	xor    %edx,%edx
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 588:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 58c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 58f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 592:	39 d3                	cmp    %edx,%ebx
 594:	75 f2                	jne    588 <memmove+0x18>
  return vdst;
}
 596:	5b                   	pop    %ebx
 597:	5e                   	pop    %esi
 598:	5d                   	pop    %ebp
 599:	c3                   	ret    

0000059a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 59a:	b8 01 00 00 00       	mov    $0x1,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <exit>:
SYSCALL(exit)
 5a2:	b8 02 00 00 00       	mov    $0x2,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <wait>:
SYSCALL(wait)
 5aa:	b8 03 00 00 00       	mov    $0x3,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <pipe>:
SYSCALL(pipe)
 5b2:	b8 04 00 00 00       	mov    $0x4,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <read>:
SYSCALL(read)
 5ba:	b8 05 00 00 00       	mov    $0x5,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <write>:
SYSCALL(write)
 5c2:	b8 10 00 00 00       	mov    $0x10,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <close>:
SYSCALL(close)
 5ca:	b8 15 00 00 00       	mov    $0x15,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <kill>:
SYSCALL(kill)
 5d2:	b8 06 00 00 00       	mov    $0x6,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <exec>:
SYSCALL(exec)
 5da:	b8 07 00 00 00       	mov    $0x7,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <open>:
SYSCALL(open)
 5e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <mknod>:
SYSCALL(mknod)
 5ea:	b8 11 00 00 00       	mov    $0x11,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <unlink>:
SYSCALL(unlink)
 5f2:	b8 12 00 00 00       	mov    $0x12,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <fstat>:
SYSCALL(fstat)
 5fa:	b8 08 00 00 00       	mov    $0x8,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <link>:
SYSCALL(link)
 602:	b8 13 00 00 00       	mov    $0x13,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <mkdir>:
SYSCALL(mkdir)
 60a:	b8 14 00 00 00       	mov    $0x14,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <chdir>:
SYSCALL(chdir)
 612:	b8 09 00 00 00       	mov    $0x9,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <dup>:
SYSCALL(dup)
 61a:	b8 0a 00 00 00       	mov    $0xa,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <getpid>:
SYSCALL(getpid)
 622:	b8 0b 00 00 00       	mov    $0xb,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <sbrk>:
SYSCALL(sbrk)
 62a:	b8 0c 00 00 00       	mov    $0xc,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <sleep>:
SYSCALL(sleep)
 632:	b8 0d 00 00 00       	mov    $0xd,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <uptime>:
SYSCALL(uptime)
 63a:	b8 0e 00 00 00       	mov    $0xe,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <memsize>:
SYSCALL(memsize)
 642:	b8 16 00 00 00       	mov    $0x16,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <set_ps_priority>:
SYSCALL(set_ps_priority)
 64a:	b8 17 00 00 00       	mov    $0x17,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <set_cfs_priority>:
SYSCALL(set_cfs_priority)
 652:	b8 18 00 00 00       	mov    $0x18,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <policy>:
SYSCALL(policy)
 65a:	b8 19 00 00 00       	mov    $0x19,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <proc_info>:
 662:	b8 1a 00 00 00       	mov    $0x1a,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 679:	85 d2                	test   %edx,%edx
{
 67b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 67e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 680:	79 76                	jns    6f8 <printint+0x88>
 682:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 686:	74 70                	je     6f8 <printint+0x88>
    x = -xx;
 688:	f7 d8                	neg    %eax
    neg = 1;
 68a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 691:	31 f6                	xor    %esi,%esi
 693:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 696:	eb 0a                	jmp    6a2 <printint+0x32>
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 6a0:	89 fe                	mov    %edi,%esi
 6a2:	31 d2                	xor    %edx,%edx
 6a4:	8d 7e 01             	lea    0x1(%esi),%edi
 6a7:	f7 f1                	div    %ecx
 6a9:	0f b6 92 a8 0a 00 00 	movzbl 0xaa8(%edx),%edx
  }while((x /= base) != 0);
 6b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6b5:	75 e9                	jne    6a0 <printint+0x30>
  if(neg)
 6b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6ba:	85 c0                	test   %eax,%eax
 6bc:	74 08                	je     6c6 <printint+0x56>
    buf[i++] = '-';
 6be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6c3:	8d 7e 02             	lea    0x2(%esi),%edi
 6c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
 6d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
 6d6:	83 ee 01             	sub    $0x1,%esi
 6d9:	6a 01                	push   $0x1
 6db:	53                   	push   %ebx
 6dc:	57                   	push   %edi
 6dd:	88 45 d7             	mov    %al,-0x29(%ebp)
 6e0:	e8 dd fe ff ff       	call   5c2 <write>

  while(--i >= 0)
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	39 de                	cmp    %ebx,%esi
 6ea:	75 e4                	jne    6d0 <printint+0x60>
    putc(fd, buf[i]);
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6ff:	eb 90                	jmp    691 <printint+0x21>
 701:	eb 0d                	jmp    710 <printf>
 703:	90                   	nop
 704:	90                   	nop
 705:	90                   	nop
 706:	90                   	nop
 707:	90                   	nop
 708:	90                   	nop
 709:	90                   	nop
 70a:	90                   	nop
 70b:	90                   	nop
 70c:	90                   	nop
 70d:	90                   	nop
 70e:	90                   	nop
 70f:	90                   	nop

00000710 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 719:	8b 75 0c             	mov    0xc(%ebp),%esi
 71c:	0f b6 1e             	movzbl (%esi),%ebx
 71f:	84 db                	test   %bl,%bl
 721:	0f 84 b3 00 00 00    	je     7da <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 727:	8d 45 10             	lea    0x10(%ebp),%eax
 72a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 72d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 72f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 732:	eb 2f                	jmp    763 <printf+0x53>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 738:	83 f8 25             	cmp    $0x25,%eax
 73b:	0f 84 a7 00 00 00    	je     7e8 <printf+0xd8>
  write(fd, &c, 1);
 741:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 744:	83 ec 04             	sub    $0x4,%esp
 747:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 74a:	6a 01                	push   $0x1
 74c:	50                   	push   %eax
 74d:	ff 75 08             	pushl  0x8(%ebp)
 750:	e8 6d fe ff ff       	call   5c2 <write>
 755:	83 c4 10             	add    $0x10,%esp
 758:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 75b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 75f:	84 db                	test   %bl,%bl
 761:	74 77                	je     7da <printf+0xca>
    if(state == 0){
 763:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 765:	0f be cb             	movsbl %bl,%ecx
 768:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 76b:	74 cb                	je     738 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 76d:	83 ff 25             	cmp    $0x25,%edi
 770:	75 e6                	jne    758 <printf+0x48>
      if(c == 'd'){
 772:	83 f8 64             	cmp    $0x64,%eax
 775:	0f 84 05 01 00 00    	je     880 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 77b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 781:	83 f9 70             	cmp    $0x70,%ecx
 784:	74 72                	je     7f8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 786:	83 f8 73             	cmp    $0x73,%eax
 789:	0f 84 99 00 00 00    	je     828 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 78f:	83 f8 63             	cmp    $0x63,%eax
 792:	0f 84 08 01 00 00    	je     8a0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 798:	83 f8 25             	cmp    $0x25,%eax
 79b:	0f 84 ef 00 00 00    	je     890 <printf+0x180>
  write(fd, &c, 1);
 7a1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7a4:	83 ec 04             	sub    $0x4,%esp
 7a7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7ab:	6a 01                	push   $0x1
 7ad:	50                   	push   %eax
 7ae:	ff 75 08             	pushl  0x8(%ebp)
 7b1:	e8 0c fe ff ff       	call   5c2 <write>
 7b6:	83 c4 0c             	add    $0xc,%esp
 7b9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7bc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7bf:	6a 01                	push   $0x1
 7c1:	50                   	push   %eax
 7c2:	ff 75 08             	pushl  0x8(%ebp)
 7c5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7c8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7ca:	e8 f3 fd ff ff       	call   5c2 <write>
  for(i = 0; fmt[i]; i++){
 7cf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7d3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7d6:	84 db                	test   %bl,%bl
 7d8:	75 89                	jne    763 <printf+0x53>
    }
  }
}
 7da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7dd:	5b                   	pop    %ebx
 7de:	5e                   	pop    %esi
 7df:	5f                   	pop    %edi
 7e0:	5d                   	pop    %ebp
 7e1:	c3                   	ret    
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 7e8:	bf 25 00 00 00       	mov    $0x25,%edi
 7ed:	e9 66 ff ff ff       	jmp    758 <printf+0x48>
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 800:	6a 00                	push   $0x0
 802:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 805:	8b 45 08             	mov    0x8(%ebp),%eax
 808:	8b 17                	mov    (%edi),%edx
 80a:	e8 61 fe ff ff       	call   670 <printint>
        ap++;
 80f:	89 f8                	mov    %edi,%eax
 811:	83 c4 10             	add    $0x10,%esp
      state = 0;
 814:	31 ff                	xor    %edi,%edi
        ap++;
 816:	83 c0 04             	add    $0x4,%eax
 819:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 81c:	e9 37 ff ff ff       	jmp    758 <printf+0x48>
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 828:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 82b:	8b 08                	mov    (%eax),%ecx
        ap++;
 82d:	83 c0 04             	add    $0x4,%eax
 830:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 833:	85 c9                	test   %ecx,%ecx
 835:	0f 84 8e 00 00 00    	je     8c9 <printf+0x1b9>
        while(*s != 0){
 83b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 83e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 840:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 842:	84 c0                	test   %al,%al
 844:	0f 84 0e ff ff ff    	je     758 <printf+0x48>
 84a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 84d:	89 de                	mov    %ebx,%esi
 84f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 852:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 855:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 858:	83 ec 04             	sub    $0x4,%esp
          s++;
 85b:	83 c6 01             	add    $0x1,%esi
 85e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 861:	6a 01                	push   $0x1
 863:	57                   	push   %edi
 864:	53                   	push   %ebx
 865:	e8 58 fd ff ff       	call   5c2 <write>
        while(*s != 0){
 86a:	0f b6 06             	movzbl (%esi),%eax
 86d:	83 c4 10             	add    $0x10,%esp
 870:	84 c0                	test   %al,%al
 872:	75 e4                	jne    858 <printf+0x148>
 874:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 877:	31 ff                	xor    %edi,%edi
 879:	e9 da fe ff ff       	jmp    758 <printf+0x48>
 87e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 0a 00 00 00       	mov    $0xa,%ecx
 888:	6a 01                	push   $0x1
 88a:	e9 73 ff ff ff       	jmp    802 <printf+0xf2>
 88f:	90                   	nop
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
 893:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 896:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 899:	6a 01                	push   $0x1
 89b:	e9 21 ff ff ff       	jmp    7c1 <printf+0xb1>
        putc(fd, *ap);
 8a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 8a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8a6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 8a8:	6a 01                	push   $0x1
        ap++;
 8aa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 8ad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8b3:	50                   	push   %eax
 8b4:	ff 75 08             	pushl  0x8(%ebp)
 8b7:	e8 06 fd ff ff       	call   5c2 <write>
        ap++;
 8bc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8c2:	31 ff                	xor    %edi,%edi
 8c4:	e9 8f fe ff ff       	jmp    758 <printf+0x48>
          s = "(null)";
 8c9:	bb 9e 0a 00 00       	mov    $0xa9e,%ebx
        while(*s != 0){
 8ce:	b8 28 00 00 00       	mov    $0x28,%eax
 8d3:	e9 72 ff ff ff       	jmp    84a <printf+0x13a>
 8d8:	66 90                	xchg   %ax,%ax
 8da:	66 90                	xchg   %ax,%ax
 8dc:	66 90                	xchg   %ax,%ax
 8de:	66 90                	xchg   %ax,%ax

000008e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e1:	a1 40 0e 00 00       	mov    0xe40,%eax
{
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	57                   	push   %edi
 8e9:	56                   	push   %esi
 8ea:	53                   	push   %ebx
 8eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f8:	39 c8                	cmp    %ecx,%eax
 8fa:	8b 10                	mov    (%eax),%edx
 8fc:	73 32                	jae    930 <free+0x50>
 8fe:	39 d1                	cmp    %edx,%ecx
 900:	72 04                	jb     906 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 902:	39 d0                	cmp    %edx,%eax
 904:	72 32                	jb     938 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 906:	8b 73 fc             	mov    -0x4(%ebx),%esi
 909:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 90c:	39 fa                	cmp    %edi,%edx
 90e:	74 30                	je     940 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 910:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 913:	8b 50 04             	mov    0x4(%eax),%edx
 916:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 919:	39 f1                	cmp    %esi,%ecx
 91b:	74 3a                	je     957 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 91d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 91f:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 924:	5b                   	pop    %ebx
 925:	5e                   	pop    %esi
 926:	5f                   	pop    %edi
 927:	5d                   	pop    %ebp
 928:	c3                   	ret    
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 930:	39 d0                	cmp    %edx,%eax
 932:	72 04                	jb     938 <free+0x58>
 934:	39 d1                	cmp    %edx,%ecx
 936:	72 ce                	jb     906 <free+0x26>
{
 938:	89 d0                	mov    %edx,%eax
 93a:	eb bc                	jmp    8f8 <free+0x18>
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 940:	03 72 04             	add    0x4(%edx),%esi
 943:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 946:	8b 10                	mov    (%eax),%edx
 948:	8b 12                	mov    (%edx),%edx
 94a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 94d:	8b 50 04             	mov    0x4(%eax),%edx
 950:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 953:	39 f1                	cmp    %esi,%ecx
 955:	75 c6                	jne    91d <free+0x3d>
    p->s.size += bp->s.size;
 957:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 95a:	a3 40 0e 00 00       	mov    %eax,0xe40
    p->s.size += bp->s.size;
 95f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 962:	8b 53 f8             	mov    -0x8(%ebx),%edx
 965:	89 10                	mov    %edx,(%eax)
}
 967:	5b                   	pop    %ebx
 968:	5e                   	pop    %esi
 969:	5f                   	pop    %edi
 96a:	5d                   	pop    %ebp
 96b:	c3                   	ret    
 96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000970 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	57                   	push   %edi
 974:	56                   	push   %esi
 975:	53                   	push   %ebx
 976:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 979:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 97c:	8b 15 40 0e 00 00    	mov    0xe40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 982:	8d 78 07             	lea    0x7(%eax),%edi
 985:	c1 ef 03             	shr    $0x3,%edi
 988:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 98b:	85 d2                	test   %edx,%edx
 98d:	0f 84 9d 00 00 00    	je     a30 <malloc+0xc0>
 993:	8b 02                	mov    (%edx),%eax
 995:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 998:	39 cf                	cmp    %ecx,%edi
 99a:	76 6c                	jbe    a08 <malloc+0x98>
 99c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9b1:	eb 0e                	jmp    9c1 <malloc+0x51>
 9b3:	90                   	nop
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9ba:	8b 48 04             	mov    0x4(%eax),%ecx
 9bd:	39 f9                	cmp    %edi,%ecx
 9bf:	73 47                	jae    a08 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9c1:	39 05 40 0e 00 00    	cmp    %eax,0xe40
 9c7:	89 c2                	mov    %eax,%edx
 9c9:	75 ed                	jne    9b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9cb:	83 ec 0c             	sub    $0xc,%esp
 9ce:	56                   	push   %esi
 9cf:	e8 56 fc ff ff       	call   62a <sbrk>
  if(p == (char*)-1)
 9d4:	83 c4 10             	add    $0x10,%esp
 9d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9da:	74 1c                	je     9f8 <malloc+0x88>
  hp->s.size = nu;
 9dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9df:	83 ec 0c             	sub    $0xc,%esp
 9e2:	83 c0 08             	add    $0x8,%eax
 9e5:	50                   	push   %eax
 9e6:	e8 f5 fe ff ff       	call   8e0 <free>
  return freep;
 9eb:	8b 15 40 0e 00 00    	mov    0xe40,%edx
      if((p = morecore(nunits)) == 0)
 9f1:	83 c4 10             	add    $0x10,%esp
 9f4:	85 d2                	test   %edx,%edx
 9f6:	75 c0                	jne    9b8 <malloc+0x48>
        return 0;
  }
}
 9f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9fb:	31 c0                	xor    %eax,%eax
}
 9fd:	5b                   	pop    %ebx
 9fe:	5e                   	pop    %esi
 9ff:	5f                   	pop    %edi
 a00:	5d                   	pop    %ebp
 a01:	c3                   	ret    
 a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a08:	39 cf                	cmp    %ecx,%edi
 a0a:	74 54                	je     a60 <malloc+0xf0>
        p->s.size -= nunits;
 a0c:	29 f9                	sub    %edi,%ecx
 a0e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a11:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a14:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a17:	89 15 40 0e 00 00    	mov    %edx,0xe40
}
 a1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a20:	83 c0 08             	add    $0x8,%eax
}
 a23:	5b                   	pop    %ebx
 a24:	5e                   	pop    %esi
 a25:	5f                   	pop    %edi
 a26:	5d                   	pop    %ebp
 a27:	c3                   	ret    
 a28:	90                   	nop
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a30:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 a37:	0e 00 00 
 a3a:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 a41:	0e 00 00 
    base.s.size = 0;
 a44:	b8 44 0e 00 00       	mov    $0xe44,%eax
 a49:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 a50:	00 00 00 
 a53:	e9 44 ff ff ff       	jmp    99c <malloc+0x2c>
 a58:	90                   	nop
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a60:	8b 08                	mov    (%eax),%ecx
 a62:	89 0a                	mov    %ecx,(%edx)
 a64:	eb b1                	jmp    a17 <malloc+0xa7>

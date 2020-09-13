
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 c5 10 80       	mov    $0x8010c5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 b0 2e 10 80       	mov    $0x80102eb0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 c6 10 80       	mov    $0x8010c614,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 a0 76 10 80       	push   $0x801076a0
80100051:	68 e0 c5 10 80       	push   $0x8010c5e0
80100056:	e8 f5 47 00 00       	call   80104850 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c 0d 11 80 dc 	movl   $0x80110cdc,0x80110d2c
80100062:	0c 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 0d 11 80 dc 	movl   $0x80110cdc,0x80110d30
8010006c:	0c 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc 0c 11 80       	mov    $0x80110cdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 a7 76 10 80       	push   $0x801076a7
80100097:	50                   	push   %eax
80100098:	e8 83 46 00 00       	call   80104720 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 0d 11 80       	mov    0x80110d30,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc 0c 11 80       	cmp    $0x80110cdc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 e0 c5 10 80       	push   $0x8010c5e0
801000e4:	e8 a7 48 00 00       	call   80104990 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 0d 11 80    	mov    0x80110d30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c 0d 11 80    	mov    0x80110d2c,%ebx
80100126:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 c5 10 80       	push   $0x8010c5e0
80100162:	e8 e9 48 00 00       	call   80104a50 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ee 45 00 00       	call   80104760 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ae 76 10 80       	push   $0x801076ae
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 4d 46 00 00       	call   80104800 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
  iderw(b);
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 bf 76 10 80       	push   $0x801076bf
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 0c 46 00 00       	call   80104800 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 bc 45 00 00       	call   801047c0 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
8010020b:	e8 80 47 00 00       	call   80104990 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 0d 11 80       	mov    0x80110d30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 30 0d 11 80       	mov    0x80110d30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 c5 10 80 	movl   $0x8010c5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 ef 47 00 00       	jmp    80104a50 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 c6 76 10 80       	push   $0x801076c6
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 db 14 00 00       	call   80101760 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 ff 46 00 00       	call   80104990 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
    while(input.r == input.w){
801002a1:	8b 15 c0 0f 11 80    	mov    0x80110fc0,%edx
801002a7:	39 15 c4 0f 11 80    	cmp    %edx,0x80110fc4
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 b5 10 80       	push   $0x8010b520
801002c0:	68 c0 0f 11 80       	push   $0x80110fc0
801002c5:	e8 26 3f 00 00       	call   801041f0 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 c0 0f 11 80    	mov    0x80110fc0,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 c4 0f 11 80    	cmp    0x80110fc4,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 40 34 00 00       	call   80103720 <myproc>
801002e0:	8b 40 44             	mov    0x44(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 b5 10 80       	push   $0x8010b520
801002ef:	e8 5c 47 00 00       	call   80104a50 <release>
        ilock(ip);
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 84 13 00 00       	call   80101680 <ilock>
        return -1;
801002fc:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 c0 0f 11 80       	mov    %eax,0x80110fc0
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 40 0f 11 80 	movsbl -0x7feef0c0(%eax),%eax
    if(c == C('D')){  // EOF
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
    *dst++ = c;
80100329:	83 c6 01             	add    $0x1,%esi
    --n;
8010032c:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
8010032f:	83 f8 0a             	cmp    $0xa,%eax
    *dst++ = c;
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
    if(c == '\n')
80100335:	74 43                	je     8010037a <consoleread+0x10a>
  while(n > 0){
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 b5 10 80       	push   $0x8010b520
8010034d:	e8 fe 46 00 00       	call   80104a50 <release>
  ilock(ip);
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 26 13 00 00       	call   80101680 <ilock>
  return target - n;
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
}
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
      if(n < target){
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
        input.r--;
80100372:	89 15 c0 0f 11 80    	mov    %edx,0x80110fc0
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
{
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100398:	fa                   	cli    
  cons.locking = 0;
80100399:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
801003a0:	00 00 00 
  getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 92 23 00 00       	call   80102740 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 cd 76 10 80       	push   $0x801076cd
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 0b 81 10 80 	movl   $0x8010810b,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 93 44 00 00       	call   80104870 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 e1 76 10 80       	push   $0x801076e1
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003f9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
  if(panicked){
80100410:	8b 0d 58 b5 10 80    	mov    0x8010b558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
{
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
    uartputc(c);
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 61 5e 00 00       	call   801062a0 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100457:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
  pos |= inb(CRTPORT+1);
8010046d:	09 fb                	or     %edi,%ebx
  if(c == '\n')
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
  else if(c == BACKSPACE){
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
  if(pos < 0 || pos > 25*80)
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
  if((pos/80) >= 24){  // Scroll up.
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  outb(CRTPORT+1, pos>>8);
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
}
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 af 5d 00 00       	call   801062a0 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 a3 5d 00 00       	call   801062a0 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 97 5d 00 00       	call   801062a0 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
    pos -= 80;
80100517:	83 eb 50             	sub    $0x50,%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 27 46 00 00       	call   80104b50 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 5a 45 00 00       	call   80104aa0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 e5 76 10 80       	push   $0x801076e5
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
    if(pos > 0) --pos;
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
    pos += 80 - pos%80;
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
    x = xx;
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  i = 0;
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 10 77 10 80 	movzbl -0x7fef88f0(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    consputc(buf[i]);
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
  while(--i >= 0)
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
    x = -xx;
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 4c 11 00 00       	call   80101760 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 70 43 00 00       	call   80104990 <acquire>
  for(i = 0; i < n; i++)
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 04 44 00 00       	call   80104a50 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 2b 10 00 00       	call   80101680 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(locking)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
  argp = (uint*)(void*)(&fmt + 1);
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010068c:	31 db                	xor    %ebx,%ebx
  argp = (uint*)(void*)(&fmt + 1);
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[++i] & 0xff;
801006a0:	0f b6 16             	movzbl (%esi),%edx
    if(c == 0)
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
    switch(c){
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 10, 1);
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
    if(c != '%'){
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
      consputc(c);
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fe:	0f b6 06             	movzbl (%esi),%eax
      continue;
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(locking)
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
    release(&cons.lock);
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 b5 10 80       	push   $0x8010b520
8010071f:	e8 2c 43 00 00       	call   80104a50 <release>
80100724:	83 c4 10             	add    $0x10,%esp
}
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
    switch(c){
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 16, 0);
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
      break;
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
      consputc(c);
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
      break;
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if((s = (char*)*argp++) == 0)
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
      for(; *s; s++)
80100787:	0f be 02             	movsbl (%edx),%eax
      if((s = (char*)*argp++) == 0)
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      for(; *s; s++)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
      for(; *s; s++)
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
      if((s = (char*)*argp++) == 0)
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
      consputc('%');
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
      break;
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
        s = "(null)";
801007d0:	ba f8 76 10 80       	mov    $0x801076f8,%edx
      for(; *s; s++)
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 b5 10 80       	push   $0x8010b520
801007f0:	e8 9b 41 00 00       	call   80104990 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 ff 76 10 80       	push   $0x801076ff
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
{
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
  int c, doprocdump = 0;
80100816:	31 f6                	xor    %esi,%esi
{
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
8010081e:	68 20 b5 10 80       	push   $0x8010b520
80100823:	e8 68 41 00 00       	call   80104990 <acquire>
  while((c = getc()) >= 0){
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
    switch(c){
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
      if(input.e != input.w){
80100851:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100856:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
        input.e--;
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
  while((c = getc()) >= 0){
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 b5 10 80       	push   $0x8010b520
80100888:	e8 c3 41 00 00       	call   80104a50 <release>
  if(doprocdump) {
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
}
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
    switch(c){
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 c0 0f 11 80    	sub    0x80110fc0,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
801008c5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008c8:	89 15 c8 0f 11 80    	mov    %edx,0x80110fc8
        c = (c == '\r') ? '\n' : c;
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
        input.buf[input.e++ % INPUT_BUF] = c;
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 40 0f 11 80    	mov    %cl,-0x7feef0c0(%eax)
        consputc(c);
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 c0 0f 11 80       	mov    0x80110fc0,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 c8 0f 11 80    	cmp    %eax,0x80110fc8
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
          wakeup(&input.r);
80100909:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
8010090c:	a3 c4 0f 11 80       	mov    %eax,0x80110fc4
          wakeup(&input.r);
80100911:	68 c0 0f 11 80       	push   $0x80110fc0
80100916:	e8 c5 3a 00 00       	call   801043e0 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      doprocdump = 1;
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100938:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
8010093d:	39 05 c4 0f 11 80    	cmp    %eax,0x80110fc4
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100950:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
      while(input.e != input.w &&
8010095f:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100964:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100978:	80 ba 40 0f 11 80 0a 	cmpb   $0xa,-0x7feef0c0(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100997:	e9 f4 3a 00 00       	jmp    80104490 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        input.buf[input.e++ % INPUT_BUF] = c;
801009a0:	c6 80 40 0f 11 80 0a 	movb   $0xa,-0x7feef0c0(%eax)
        consputc(c);
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:

void
consoleinit(void)
{
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009c6:	68 08 77 10 80       	push   $0x80107708
801009cb:	68 20 b5 10 80       	push   $0x8010b520
801009d0:	e8 7b 3e 00 00       	call   80104850 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
801009db:	c7 05 8c 19 11 80 00 	movl   $0x80100600,0x8011198c
801009e2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009e5:	c7 05 88 19 11 80 70 	movl   $0x80100270,0x80111988
801009ec:	02 10 80 
  cons.locking = 1;
801009ef:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
801009f6:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801009f9:	e8 e2 18 00 00       	call   801022e0 <ioapicenable>
}
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a1c:	e8 ff 2c 00 00       	call   80103720 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a27:	e8 84 21 00 00       	call   80102bb0 <begin_op>

  if((ip = namei(path)) == 0){
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 33 0c 00 00       	call   80101680 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 02 0f 00 00       	call   80101960 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 a1 0e 00 00       	call   80101910 <iunlockput>
    end_op();
80100a6f:	e8 ac 21 00 00       	call   80102c20 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100a94:	e8 57 69 00 00       	call   801073f0 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
  sz = 0;
80100aa3:	31 ff                	xor    %edi,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 8f 02 00 00    	je     80100d4e <exec+0x33e>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
    if(ph.memsz < ph.filesz)
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 15 67 00 00       	call   80107210 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
    if(ph.vaddr % PGSIZE != 0)
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 23 66 00 00       	call   80107150 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 03 0e 00 00       	call   80101960 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
    freevm(pgdir);
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 f9 67 00 00       	call   80107370 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 76 0d 00 00       	call   80101910 <iunlockput>
  end_op();
80100b9a:	e8 81 20 00 00       	call   80102c20 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 61 66 00 00       	call   80107210 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
    freevm(pgdir);
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 aa 67 00 00       	call   80107370 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
  return -1;
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
    end_op();
80100bd3:	e8 48 20 00 00       	call   80102c20 <end_op>
    cprintf("exec: fail\n");
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 21 77 10 80       	push   $0x80107721
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
    return -1;
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 85 68 00 00       	call   80107490 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(argc >= MAXARG)
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 82 40 00 00       	call   80104cc0 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 6f 40 00 00       	call   80104cc0 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 8e 69 00 00       	call   801075f0 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
  for(argc = 0; argv[argc]; argc++) {
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c77:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
  ustack[1] = argc;
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb1:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cc7:	e8 24 69 00 00       	call   801075f0 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
  for(last=s=path; *s; s++)
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	05 8c 00 00 00       	add    $0x8c,%eax
80100d0b:	50                   	push   %eax
80100d0c:	e8 6f 3f 00 00       	call   80104c80 <safestrcpy>
  curproc->pgdir = pgdir;
80100d11:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d17:	89 f9                	mov    %edi,%ecx
80100d19:	8b 7f 24             	mov    0x24(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d1c:	8b 41 38             	mov    0x38(%ecx),%eax
  curproc->sz = sz;
80100d1f:	89 71 20             	mov    %esi,0x20(%ecx)
  curproc->pgdir = pgdir;
80100d22:	89 51 24             	mov    %edx,0x24(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d25:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d2b:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d2e:	8b 41 38             	mov    0x38(%ecx),%eax
80100d31:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d34:	89 0c 24             	mov    %ecx,(%esp)
80100d37:	e8 84 62 00 00       	call   80106fc0 <switchuvm>
  freevm(oldpgdir);
80100d3c:	89 3c 24             	mov    %edi,(%esp)
80100d3f:	e8 2c 66 00 00       	call   80107370 <freevm>
  return 0;
80100d44:	83 c4 10             	add    $0x10,%esp
80100d47:	31 c0                	xor    %eax,%eax
80100d49:	e9 2e fd ff ff       	jmp    80100a7c <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d4e:	be 00 20 00 00       	mov    $0x2000,%esi
80100d53:	e9 39 fe ff ff       	jmp    80100b91 <exec+0x181>
80100d58:	66 90                	xchg   %ax,%ax
80100d5a:	66 90                	xchg   %ax,%ax
80100d5c:	66 90                	xchg   %ax,%ax
80100d5e:	66 90                	xchg   %ax,%ax

80100d60 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d66:	68 2d 77 10 80       	push   $0x8010772d
80100d6b:	68 e0 0f 11 80       	push   $0x80110fe0
80100d70:	e8 db 3a 00 00       	call   80104850 <initlock>
}
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d84:	bb 14 10 11 80       	mov    $0x80111014,%ebx
{
80100d89:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100d8c:	68 e0 0f 11 80       	push   $0x80110fe0
80100d91:	e8 fa 3b 00 00       	call   80104990 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 74 19 11 80    	cmp    $0x80111974,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
    if(f->ref == 0){
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100db2:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dbc:	68 e0 0f 11 80       	push   $0x80110fe0
80100dc1:	e8 8a 3c 00 00       	call   80104a50 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dc6:	89 d8                	mov    %ebx,%eax
      return f;
80100dc8:	83 c4 10             	add    $0x10,%esp
}
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
  release(&ftable.lock);
80100dd0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100dd3:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100dd5:	68 e0 0f 11 80       	push   $0x80110fe0
80100dda:	e8 71 3c 00 00       	call   80104a50 <release>
}
80100ddf:	89 d8                	mov    %ebx,%eax
  return 0;
80100de1:	83 c4 10             	add    $0x10,%esp
}
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dfa:	68 e0 0f 11 80       	push   $0x80110fe0
80100dff:	e8 8c 3b 00 00       	call   80104990 <acquire>
  if(f->ref < 1)
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e0e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e11:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e17:	68 e0 0f 11 80       	push   $0x80110fe0
80100e1c:	e8 2f 3c 00 00       	call   80104a50 <release>
  return f;
}
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
    panic("filedup");
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 34 77 10 80       	push   $0x80107734
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100e4c:	68 e0 0f 11 80       	push   $0x80110fe0
80100e51:	e8 3a 3b 00 00       	call   80104990 <acquire>
  if(f->ref < 1)
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
    release(&ftable.lock);
80100e6e:	c7 45 08 e0 0f 11 80 	movl   $0x80110fe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e7c:	e9 cf 3b 00 00       	jmp    80104a50 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
  release(&ftable.lock);
80100e8e:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
  f->type = FD_NONE;
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100ea0:	68 e0 0f 11 80       	push   $0x80110fe0
  ff = *f;
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ea8:	e8 a3 3b 00 00       	call   80104a50 <release>
  if(ff.type == FD_PIPE)
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
}
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 8a 24 00 00       	call   80103360 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100ee0:	e8 cb 1c 00 00       	call   80102bb0 <begin_op>
    iput(ff.ip);
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 c0 08 00 00       	call   801017b0 <iput>
    end_op();
80100ef0:	83 c4 10             	add    $0x10,%esp
}
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
    end_op();
80100efa:	e9 21 1d 00 00       	jmp    80102c20 <end_op>
    panic("fileclose");
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 3c 77 10 80       	push   $0x8010773c
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
    ilock(f->ip);
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 56 07 00 00       	call   80101680 <ilock>
    stati(f->ip, st);
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 f9 09 00 00       	call   80101930 <stati>
    iunlock(f->ip);
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 20 08 00 00       	call   80101760 <iunlock>
    return 0;
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
    ilock(f->ip);
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 f1 06 00 00       	call   80101680 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 c4 09 00 00       	call   80101960 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
      f->off += r;
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 ad 07 00 00       	call   80101760 <iunlock>
    return r;
80100fb3:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fcd:	e9 3e 25 00 00       	jmp    80103510 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
  panic("fileread");
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 46 77 10 80       	push   $0x80107746
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101029:	31 ff                	xor    %edi,%edi
    while(i < n){
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101038:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101044:	e8 17 07 00 00       	call   80101760 <iunlock>
      end_op();
80101049:	e8 d2 1b 00 00       	call   80102c20 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
        panic("short filewrite");
      i += r;
8010105c:	01 df                	add    %ebx,%edi
    while(i < n){
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
      int n1 = n - i;
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 06 00 00       	mov    $0x600,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
80101076:	e8 35 1b 00 00       	call   80102bb0 <begin_op>
      ilock(f->ip);
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 fa 05 00 00       	call   80101680 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 c8 09 00 00       	call   80101a60 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
      iunlock(f->ip);
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 b3 06 00 00       	call   80101760 <iunlock>
      end_op();
801010ad:	e8 6e 1b 00 00       	call   80102c20 <end_op>
      if(r < 0)
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
}
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
}
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
    return pipewrite(f->pipe, addr, n);
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010ed:	e9 0e 23 00 00       	jmp    80103400 <pipewrite>
        panic("short filewrite");
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 4f 77 10 80       	push   $0x8010774f
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 55 77 10 80       	push   $0x80107755
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	56                   	push   %esi
80101114:	53                   	push   %ebx
80101115:	89 d3                	mov    %edx,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101117:	c1 ea 0c             	shr    $0xc,%edx
8010111a:	03 15 f8 19 11 80    	add    0x801119f8,%edx
80101120:	83 ec 08             	sub    $0x8,%esp
80101123:	52                   	push   %edx
80101124:	50                   	push   %eax
80101125:	e8 a6 ef ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010112a:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010112c:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
8010112f:	ba 01 00 00 00       	mov    $0x1,%edx
80101134:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101137:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010113d:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101140:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101142:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101147:	85 d1                	test   %edx,%ecx
80101149:	74 25                	je     80101170 <bfree+0x60>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010114b:	f7 d2                	not    %edx
8010114d:	89 c6                	mov    %eax,%esi
  log_write(bp);
8010114f:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101152:	21 ca                	and    %ecx,%edx
80101154:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101158:	56                   	push   %esi
80101159:	e8 22 1c 00 00       	call   80102d80 <log_write>
  brelse(bp);
8010115e:	89 34 24             	mov    %esi,(%esp)
80101161:	e8 7a f0 ff ff       	call   801001e0 <brelse>
}
80101166:	83 c4 10             	add    $0x10,%esp
80101169:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010116c:	5b                   	pop    %ebx
8010116d:	5e                   	pop    %esi
8010116e:	5d                   	pop    %ebp
8010116f:	c3                   	ret    
    panic("freeing free block");
80101170:	83 ec 0c             	sub    $0xc,%esp
80101173:	68 5f 77 10 80       	push   $0x8010775f
80101178:	e8 13 f2 ff ff       	call   80100390 <panic>
8010117d:	8d 76 00             	lea    0x0(%esi),%esi

80101180 <balloc>:
{
80101180:	55                   	push   %ebp
80101181:	89 e5                	mov    %esp,%ebp
80101183:	57                   	push   %edi
80101184:	56                   	push   %esi
80101185:	53                   	push   %ebx
80101186:	83 ec 1c             	sub    $0x1c,%esp
  for(b = 0; b < sb.size; b += BPB){
80101189:	8b 0d e0 19 11 80    	mov    0x801119e0,%ecx
{
8010118f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101192:	85 c9                	test   %ecx,%ecx
80101194:	0f 84 87 00 00 00    	je     80101221 <balloc+0xa1>
8010119a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801011a1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011a4:	83 ec 08             	sub    $0x8,%esp
801011a7:	89 f0                	mov    %esi,%eax
801011a9:	c1 f8 0c             	sar    $0xc,%eax
801011ac:	03 05 f8 19 11 80    	add    0x801119f8,%eax
801011b2:	50                   	push   %eax
801011b3:	ff 75 d8             	pushl  -0x28(%ebp)
801011b6:	e8 15 ef ff ff       	call   801000d0 <bread>
801011bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011be:	a1 e0 19 11 80       	mov    0x801119e0,%eax
801011c3:	83 c4 10             	add    $0x10,%esp
801011c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801011c9:	31 c0                	xor    %eax,%eax
801011cb:	eb 2f                	jmp    801011fc <balloc+0x7c>
801011cd:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
801011d0:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011d2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
801011d5:	bb 01 00 00 00       	mov    $0x1,%ebx
801011da:	83 e1 07             	and    $0x7,%ecx
801011dd:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011df:	89 c1                	mov    %eax,%ecx
801011e1:	c1 f9 03             	sar    $0x3,%ecx
801011e4:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
801011e9:	85 df                	test   %ebx,%edi
801011eb:	89 fa                	mov    %edi,%edx
801011ed:	74 41                	je     80101230 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011ef:	83 c0 01             	add    $0x1,%eax
801011f2:	83 c6 01             	add    $0x1,%esi
801011f5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011fa:	74 05                	je     80101201 <balloc+0x81>
801011fc:	39 75 e0             	cmp    %esi,-0x20(%ebp)
801011ff:	77 cf                	ja     801011d0 <balloc+0x50>
    brelse(bp);
80101201:	83 ec 0c             	sub    $0xc,%esp
80101204:	ff 75 e4             	pushl  -0x1c(%ebp)
80101207:	e8 d4 ef ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010120c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101213:	83 c4 10             	add    $0x10,%esp
80101216:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101219:	39 05 e0 19 11 80    	cmp    %eax,0x801119e0
8010121f:	77 80                	ja     801011a1 <balloc+0x21>
  panic("balloc: out of blocks");
80101221:	83 ec 0c             	sub    $0xc,%esp
80101224:	68 72 77 10 80       	push   $0x80107772
80101229:	e8 62 f1 ff ff       	call   80100390 <panic>
8010122e:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
80101230:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101233:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
80101236:	09 da                	or     %ebx,%edx
80101238:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010123c:	57                   	push   %edi
8010123d:	e8 3e 1b 00 00       	call   80102d80 <log_write>
        brelse(bp);
80101242:	89 3c 24             	mov    %edi,(%esp)
80101245:	e8 96 ef ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
8010124a:	58                   	pop    %eax
8010124b:	5a                   	pop    %edx
8010124c:	56                   	push   %esi
8010124d:	ff 75 d8             	pushl  -0x28(%ebp)
80101250:	e8 7b ee ff ff       	call   801000d0 <bread>
80101255:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101257:	8d 40 5c             	lea    0x5c(%eax),%eax
8010125a:	83 c4 0c             	add    $0xc,%esp
8010125d:	68 00 02 00 00       	push   $0x200
80101262:	6a 00                	push   $0x0
80101264:	50                   	push   %eax
80101265:	e8 36 38 00 00       	call   80104aa0 <memset>
  log_write(bp);
8010126a:	89 1c 24             	mov    %ebx,(%esp)
8010126d:	e8 0e 1b 00 00       	call   80102d80 <log_write>
  brelse(bp);
80101272:	89 1c 24             	mov    %ebx,(%esp)
80101275:	e8 66 ef ff ff       	call   801001e0 <brelse>
}
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010128a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101290 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101290:	55                   	push   %ebp
80101291:	89 e5                	mov    %esp,%ebp
80101293:	57                   	push   %edi
80101294:	56                   	push   %esi
80101295:	53                   	push   %ebx
80101296:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101298:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010129a:	bb 34 1a 11 80       	mov    $0x80111a34,%ebx
{
8010129f:	83 ec 28             	sub    $0x28,%esp
801012a2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
801012a5:	68 00 1a 11 80       	push   $0x80111a00
801012aa:	e8 e1 36 00 00       	call   80104990 <acquire>
801012af:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012b5:	eb 17                	jmp    801012ce <iget+0x3e>
801012b7:	89 f6                	mov    %esi,%esi
801012b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801012c0:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012c6:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
801012cc:	73 22                	jae    801012f0 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012ce:	8b 4b 08             	mov    0x8(%ebx),%ecx
801012d1:	85 c9                	test   %ecx,%ecx
801012d3:	7e 04                	jle    801012d9 <iget+0x49>
801012d5:	39 3b                	cmp    %edi,(%ebx)
801012d7:	74 4f                	je     80101328 <iget+0x98>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012d9:	85 f6                	test   %esi,%esi
801012db:	75 e3                	jne    801012c0 <iget+0x30>
801012dd:	85 c9                	test   %ecx,%ecx
801012df:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012e2:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012e8:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
801012ee:	72 de                	jb     801012ce <iget+0x3e>
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012f0:	85 f6                	test   %esi,%esi
801012f2:	74 5b                	je     8010134f <iget+0xbf>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801012f4:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
801012f7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012f9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012fc:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101303:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010130a:	68 00 1a 11 80       	push   $0x80111a00
8010130f:	e8 3c 37 00 00       	call   80104a50 <release>

  return ip;
80101314:	83 c4 10             	add    $0x10,%esp
}
80101317:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010131a:	89 f0                	mov    %esi,%eax
8010131c:	5b                   	pop    %ebx
8010131d:	5e                   	pop    %esi
8010131e:	5f                   	pop    %edi
8010131f:	5d                   	pop    %ebp
80101320:	c3                   	ret    
80101321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101328:	39 53 04             	cmp    %edx,0x4(%ebx)
8010132b:	75 ac                	jne    801012d9 <iget+0x49>
      release(&icache.lock);
8010132d:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
80101330:	83 c1 01             	add    $0x1,%ecx
      return ip;
80101333:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
80101335:	68 00 1a 11 80       	push   $0x80111a00
      ip->ref++;
8010133a:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
8010133d:	e8 0e 37 00 00       	call   80104a50 <release>
      return ip;
80101342:	83 c4 10             	add    $0x10,%esp
}
80101345:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101348:	89 f0                	mov    %esi,%eax
8010134a:	5b                   	pop    %ebx
8010134b:	5e                   	pop    %esi
8010134c:	5f                   	pop    %edi
8010134d:	5d                   	pop    %ebp
8010134e:	c3                   	ret    
    panic("iget: no inodes");
8010134f:	83 ec 0c             	sub    $0xc,%esp
80101352:	68 88 77 10 80       	push   $0x80107788
80101357:	e8 34 f0 ff ff       	call   80100390 <panic>
8010135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101360 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101360:	55                   	push   %ebp
80101361:	89 e5                	mov    %esp,%ebp
80101363:	57                   	push   %edi
80101364:	56                   	push   %esi
80101365:	53                   	push   %ebx
80101366:	89 c6                	mov    %eax,%esi
80101368:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010136b:	83 fa 0b             	cmp    $0xb,%edx
8010136e:	77 18                	ja     80101388 <bmap+0x28>
80101370:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
80101373:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101376:	85 db                	test   %ebx,%ebx
80101378:	74 76                	je     801013f0 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010137d:	89 d8                	mov    %ebx,%eax
8010137f:	5b                   	pop    %ebx
80101380:	5e                   	pop    %esi
80101381:	5f                   	pop    %edi
80101382:	5d                   	pop    %ebp
80101383:	c3                   	ret    
80101384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
80101388:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
8010138b:	83 fb 7f             	cmp    $0x7f,%ebx
8010138e:	0f 87 90 00 00 00    	ja     80101424 <bmap+0xc4>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101394:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010139a:	8b 00                	mov    (%eax),%eax
8010139c:	85 d2                	test   %edx,%edx
8010139e:	74 70                	je     80101410 <bmap+0xb0>
    bp = bread(ip->dev, addr);
801013a0:	83 ec 08             	sub    $0x8,%esp
801013a3:	52                   	push   %edx
801013a4:	50                   	push   %eax
801013a5:	e8 26 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
801013aa:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013ae:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
801013b1:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
801013b3:	8b 1a                	mov    (%edx),%ebx
801013b5:	85 db                	test   %ebx,%ebx
801013b7:	75 1d                	jne    801013d6 <bmap+0x76>
      a[bn] = addr = balloc(ip->dev);
801013b9:	8b 06                	mov    (%esi),%eax
801013bb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013be:	e8 bd fd ff ff       	call   80101180 <balloc>
801013c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
801013c6:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
801013c9:	89 c3                	mov    %eax,%ebx
801013cb:	89 02                	mov    %eax,(%edx)
      log_write(bp);
801013cd:	57                   	push   %edi
801013ce:	e8 ad 19 00 00       	call   80102d80 <log_write>
801013d3:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
801013d6:	83 ec 0c             	sub    $0xc,%esp
801013d9:	57                   	push   %edi
801013da:	e8 01 ee ff ff       	call   801001e0 <brelse>
801013df:	83 c4 10             	add    $0x10,%esp
}
801013e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013e5:	89 d8                	mov    %ebx,%eax
801013e7:	5b                   	pop    %ebx
801013e8:	5e                   	pop    %esi
801013e9:	5f                   	pop    %edi
801013ea:	5d                   	pop    %ebp
801013eb:	c3                   	ret    
801013ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
801013f0:	8b 00                	mov    (%eax),%eax
801013f2:	e8 89 fd ff ff       	call   80101180 <balloc>
801013f7:	89 47 5c             	mov    %eax,0x5c(%edi)
}
801013fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
801013fd:	89 c3                	mov    %eax,%ebx
}
801013ff:	89 d8                	mov    %ebx,%eax
80101401:	5b                   	pop    %ebx
80101402:	5e                   	pop    %esi
80101403:	5f                   	pop    %edi
80101404:	5d                   	pop    %ebp
80101405:	c3                   	ret    
80101406:	8d 76 00             	lea    0x0(%esi),%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101410:	e8 6b fd ff ff       	call   80101180 <balloc>
80101415:	89 c2                	mov    %eax,%edx
80101417:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010141d:	8b 06                	mov    (%esi),%eax
8010141f:	e9 7c ff ff ff       	jmp    801013a0 <bmap+0x40>
  panic("bmap: out of range");
80101424:	83 ec 0c             	sub    $0xc,%esp
80101427:	68 98 77 10 80       	push   $0x80107798
8010142c:	e8 5f ef ff ff       	call   80100390 <panic>
80101431:	eb 0d                	jmp    80101440 <readsb>
80101433:	90                   	nop
80101434:	90                   	nop
80101435:	90                   	nop
80101436:	90                   	nop
80101437:	90                   	nop
80101438:	90                   	nop
80101439:	90                   	nop
8010143a:	90                   	nop
8010143b:	90                   	nop
8010143c:	90                   	nop
8010143d:	90                   	nop
8010143e:	90                   	nop
8010143f:	90                   	nop

80101440 <readsb>:
{
80101440:	55                   	push   %ebp
80101441:	89 e5                	mov    %esp,%ebp
80101443:	56                   	push   %esi
80101444:	53                   	push   %ebx
80101445:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101448:	83 ec 08             	sub    $0x8,%esp
8010144b:	6a 01                	push   $0x1
8010144d:	ff 75 08             	pushl  0x8(%ebp)
80101450:	e8 7b ec ff ff       	call   801000d0 <bread>
80101455:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101457:	8d 40 5c             	lea    0x5c(%eax),%eax
8010145a:	83 c4 0c             	add    $0xc,%esp
8010145d:	6a 1c                	push   $0x1c
8010145f:	50                   	push   %eax
80101460:	56                   	push   %esi
80101461:	e8 ea 36 00 00       	call   80104b50 <memmove>
  brelse(bp);
80101466:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101469:	83 c4 10             	add    $0x10,%esp
}
8010146c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010146f:	5b                   	pop    %ebx
80101470:	5e                   	pop    %esi
80101471:	5d                   	pop    %ebp
  brelse(bp);
80101472:	e9 69 ed ff ff       	jmp    801001e0 <brelse>
80101477:	89 f6                	mov    %esi,%esi
80101479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101480 <iinit>:
{
80101480:	55                   	push   %ebp
80101481:	89 e5                	mov    %esp,%ebp
80101483:	53                   	push   %ebx
80101484:	bb 40 1a 11 80       	mov    $0x80111a40,%ebx
80101489:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010148c:	68 ab 77 10 80       	push   $0x801077ab
80101491:	68 00 1a 11 80       	push   $0x80111a00
80101496:	e8 b5 33 00 00       	call   80104850 <initlock>
8010149b:	83 c4 10             	add    $0x10,%esp
8010149e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014a0:	83 ec 08             	sub    $0x8,%esp
801014a3:	68 b2 77 10 80       	push   $0x801077b2
801014a8:	53                   	push   %ebx
801014a9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014af:	e8 6c 32 00 00       	call   80104720 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014b4:	83 c4 10             	add    $0x10,%esp
801014b7:	81 fb 60 36 11 80    	cmp    $0x80113660,%ebx
801014bd:	75 e1                	jne    801014a0 <iinit+0x20>
  readsb(dev, &sb);
801014bf:	83 ec 08             	sub    $0x8,%esp
801014c2:	68 e0 19 11 80       	push   $0x801119e0
801014c7:	ff 75 08             	pushl  0x8(%ebp)
801014ca:	e8 71 ff ff ff       	call   80101440 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014cf:	ff 35 f8 19 11 80    	pushl  0x801119f8
801014d5:	ff 35 f4 19 11 80    	pushl  0x801119f4
801014db:	ff 35 f0 19 11 80    	pushl  0x801119f0
801014e1:	ff 35 ec 19 11 80    	pushl  0x801119ec
801014e7:	ff 35 e8 19 11 80    	pushl  0x801119e8
801014ed:	ff 35 e4 19 11 80    	pushl  0x801119e4
801014f3:	ff 35 e0 19 11 80    	pushl  0x801119e0
801014f9:	68 18 78 10 80       	push   $0x80107818
801014fe:	e8 5d f1 ff ff       	call   80100660 <cprintf>
}
80101503:	83 c4 30             	add    $0x30,%esp
80101506:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101509:	c9                   	leave  
8010150a:	c3                   	ret    
8010150b:	90                   	nop
8010150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101510 <ialloc>:
{
80101510:	55                   	push   %ebp
80101511:	89 e5                	mov    %esp,%ebp
80101513:	57                   	push   %edi
80101514:	56                   	push   %esi
80101515:	53                   	push   %ebx
80101516:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101519:	83 3d e8 19 11 80 01 	cmpl   $0x1,0x801119e8
{
80101520:	8b 45 0c             	mov    0xc(%ebp),%eax
80101523:	8b 75 08             	mov    0x8(%ebp),%esi
80101526:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101529:	0f 86 91 00 00 00    	jbe    801015c0 <ialloc+0xb0>
8010152f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101534:	eb 21                	jmp    80101557 <ialloc+0x47>
80101536:	8d 76 00             	lea    0x0(%esi),%esi
80101539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101540:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101543:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101546:	57                   	push   %edi
80101547:	e8 94 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010154c:	83 c4 10             	add    $0x10,%esp
8010154f:	39 1d e8 19 11 80    	cmp    %ebx,0x801119e8
80101555:	76 69                	jbe    801015c0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101557:	89 d8                	mov    %ebx,%eax
80101559:	83 ec 08             	sub    $0x8,%esp
8010155c:	c1 e8 03             	shr    $0x3,%eax
8010155f:	03 05 f4 19 11 80    	add    0x801119f4,%eax
80101565:	50                   	push   %eax
80101566:	56                   	push   %esi
80101567:	e8 64 eb ff ff       	call   801000d0 <bread>
8010156c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010156e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101570:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
80101573:	83 e0 07             	and    $0x7,%eax
80101576:	c1 e0 06             	shl    $0x6,%eax
80101579:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010157d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101581:	75 bd                	jne    80101540 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101583:	83 ec 04             	sub    $0x4,%esp
80101586:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101589:	6a 40                	push   $0x40
8010158b:	6a 00                	push   $0x0
8010158d:	51                   	push   %ecx
8010158e:	e8 0d 35 00 00       	call   80104aa0 <memset>
      dip->type = type;
80101593:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101597:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010159a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010159d:	89 3c 24             	mov    %edi,(%esp)
801015a0:	e8 db 17 00 00       	call   80102d80 <log_write>
      brelse(bp);
801015a5:	89 3c 24             	mov    %edi,(%esp)
801015a8:	e8 33 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015ad:	83 c4 10             	add    $0x10,%esp
}
801015b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801015b3:	89 da                	mov    %ebx,%edx
801015b5:	89 f0                	mov    %esi,%eax
}
801015b7:	5b                   	pop    %ebx
801015b8:	5e                   	pop    %esi
801015b9:	5f                   	pop    %edi
801015ba:	5d                   	pop    %ebp
      return iget(dev, inum);
801015bb:	e9 d0 fc ff ff       	jmp    80101290 <iget>
  panic("ialloc: no inodes");
801015c0:	83 ec 0c             	sub    $0xc,%esp
801015c3:	68 b8 77 10 80       	push   $0x801077b8
801015c8:	e8 c3 ed ff ff       	call   80100390 <panic>
801015cd:	8d 76 00             	lea    0x0(%esi),%esi

801015d0 <iupdate>:
{
801015d0:	55                   	push   %ebp
801015d1:	89 e5                	mov    %esp,%ebp
801015d3:	56                   	push   %esi
801015d4:	53                   	push   %ebx
801015d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015d8:	83 ec 08             	sub    $0x8,%esp
801015db:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015de:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015e1:	c1 e8 03             	shr    $0x3,%eax
801015e4:	03 05 f4 19 11 80    	add    0x801119f4,%eax
801015ea:	50                   	push   %eax
801015eb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ee:	e8 dd ea ff ff       	call   801000d0 <bread>
801015f3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015f5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015f8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fc:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ff:	83 e0 07             	and    $0x7,%eax
80101602:	c1 e0 06             	shl    $0x6,%eax
80101605:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101609:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010160c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101610:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101613:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101617:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010161b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010161f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101623:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101627:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010162a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010162d:	6a 34                	push   $0x34
8010162f:	53                   	push   %ebx
80101630:	50                   	push   %eax
80101631:	e8 1a 35 00 00       	call   80104b50 <memmove>
  log_write(bp);
80101636:	89 34 24             	mov    %esi,(%esp)
80101639:	e8 42 17 00 00       	call   80102d80 <log_write>
  brelse(bp);
8010163e:	89 75 08             	mov    %esi,0x8(%ebp)
80101641:	83 c4 10             	add    $0x10,%esp
}
80101644:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101647:	5b                   	pop    %ebx
80101648:	5e                   	pop    %esi
80101649:	5d                   	pop    %ebp
  brelse(bp);
8010164a:	e9 91 eb ff ff       	jmp    801001e0 <brelse>
8010164f:	90                   	nop

80101650 <idup>:
{
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	53                   	push   %ebx
80101654:	83 ec 10             	sub    $0x10,%esp
80101657:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010165a:	68 00 1a 11 80       	push   $0x80111a00
8010165f:	e8 2c 33 00 00       	call   80104990 <acquire>
  ip->ref++;
80101664:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101668:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
8010166f:	e8 dc 33 00 00       	call   80104a50 <release>
}
80101674:	89 d8                	mov    %ebx,%eax
80101676:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101679:	c9                   	leave  
8010167a:	c3                   	ret    
8010167b:	90                   	nop
8010167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101680 <ilock>:
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	56                   	push   %esi
80101684:	53                   	push   %ebx
80101685:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101688:	85 db                	test   %ebx,%ebx
8010168a:	0f 84 b7 00 00 00    	je     80101747 <ilock+0xc7>
80101690:	8b 53 08             	mov    0x8(%ebx),%edx
80101693:	85 d2                	test   %edx,%edx
80101695:	0f 8e ac 00 00 00    	jle    80101747 <ilock+0xc7>
  acquiresleep(&ip->lock);
8010169b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010169e:	83 ec 0c             	sub    $0xc,%esp
801016a1:	50                   	push   %eax
801016a2:	e8 b9 30 00 00       	call   80104760 <acquiresleep>
  if(ip->valid == 0){
801016a7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016aa:	83 c4 10             	add    $0x10,%esp
801016ad:	85 c0                	test   %eax,%eax
801016af:	74 0f                	je     801016c0 <ilock+0x40>
}
801016b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016b4:	5b                   	pop    %ebx
801016b5:	5e                   	pop    %esi
801016b6:	5d                   	pop    %ebp
801016b7:	c3                   	ret    
801016b8:	90                   	nop
801016b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016c0:	8b 43 04             	mov    0x4(%ebx),%eax
801016c3:	83 ec 08             	sub    $0x8,%esp
801016c6:	c1 e8 03             	shr    $0x3,%eax
801016c9:	03 05 f4 19 11 80    	add    0x801119f4,%eax
801016cf:	50                   	push   %eax
801016d0:	ff 33                	pushl  (%ebx)
801016d2:	e8 f9 e9 ff ff       	call   801000d0 <bread>
801016d7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016d9:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016dc:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016df:	83 e0 07             	and    $0x7,%eax
801016e2:	c1 e0 06             	shl    $0x6,%eax
801016e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016e9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ec:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801016ef:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016f3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016f7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016fb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ff:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101703:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101707:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010170b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010170e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101711:	6a 34                	push   $0x34
80101713:	50                   	push   %eax
80101714:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101717:	50                   	push   %eax
80101718:	e8 33 34 00 00       	call   80104b50 <memmove>
    brelse(bp);
8010171d:	89 34 24             	mov    %esi,(%esp)
80101720:	e8 bb ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101725:	83 c4 10             	add    $0x10,%esp
80101728:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010172d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101734:	0f 85 77 ff ff ff    	jne    801016b1 <ilock+0x31>
      panic("ilock: no type");
8010173a:	83 ec 0c             	sub    $0xc,%esp
8010173d:	68 d0 77 10 80       	push   $0x801077d0
80101742:	e8 49 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101747:	83 ec 0c             	sub    $0xc,%esp
8010174a:	68 ca 77 10 80       	push   $0x801077ca
8010174f:	e8 3c ec ff ff       	call   80100390 <panic>
80101754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010175a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101760 <iunlock>:
{
80101760:	55                   	push   %ebp
80101761:	89 e5                	mov    %esp,%ebp
80101763:	56                   	push   %esi
80101764:	53                   	push   %ebx
80101765:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101768:	85 db                	test   %ebx,%ebx
8010176a:	74 28                	je     80101794 <iunlock+0x34>
8010176c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010176f:	83 ec 0c             	sub    $0xc,%esp
80101772:	56                   	push   %esi
80101773:	e8 88 30 00 00       	call   80104800 <holdingsleep>
80101778:	83 c4 10             	add    $0x10,%esp
8010177b:	85 c0                	test   %eax,%eax
8010177d:	74 15                	je     80101794 <iunlock+0x34>
8010177f:	8b 43 08             	mov    0x8(%ebx),%eax
80101782:	85 c0                	test   %eax,%eax
80101784:	7e 0e                	jle    80101794 <iunlock+0x34>
  releasesleep(&ip->lock);
80101786:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101789:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010178c:	5b                   	pop    %ebx
8010178d:	5e                   	pop    %esi
8010178e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010178f:	e9 2c 30 00 00       	jmp    801047c0 <releasesleep>
    panic("iunlock");
80101794:	83 ec 0c             	sub    $0xc,%esp
80101797:	68 df 77 10 80       	push   $0x801077df
8010179c:	e8 ef eb ff ff       	call   80100390 <panic>
801017a1:	eb 0d                	jmp    801017b0 <iput>
801017a3:	90                   	nop
801017a4:	90                   	nop
801017a5:	90                   	nop
801017a6:	90                   	nop
801017a7:	90                   	nop
801017a8:	90                   	nop
801017a9:	90                   	nop
801017aa:	90                   	nop
801017ab:	90                   	nop
801017ac:	90                   	nop
801017ad:	90                   	nop
801017ae:	90                   	nop
801017af:	90                   	nop

801017b0 <iput>:
{
801017b0:	55                   	push   %ebp
801017b1:	89 e5                	mov    %esp,%ebp
801017b3:	57                   	push   %edi
801017b4:	56                   	push   %esi
801017b5:	53                   	push   %ebx
801017b6:	83 ec 28             	sub    $0x28,%esp
801017b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801017bc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017bf:	57                   	push   %edi
801017c0:	e8 9b 2f 00 00       	call   80104760 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017c5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017c8:	83 c4 10             	add    $0x10,%esp
801017cb:	85 d2                	test   %edx,%edx
801017cd:	74 07                	je     801017d6 <iput+0x26>
801017cf:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017d4:	74 32                	je     80101808 <iput+0x58>
  releasesleep(&ip->lock);
801017d6:	83 ec 0c             	sub    $0xc,%esp
801017d9:	57                   	push   %edi
801017da:	e8 e1 2f 00 00       	call   801047c0 <releasesleep>
  acquire(&icache.lock);
801017df:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
801017e6:	e8 a5 31 00 00       	call   80104990 <acquire>
  ip->ref--;
801017eb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
801017ef:	83 c4 10             	add    $0x10,%esp
801017f2:	c7 45 08 00 1a 11 80 	movl   $0x80111a00,0x8(%ebp)
}
801017f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017fc:	5b                   	pop    %ebx
801017fd:	5e                   	pop    %esi
801017fe:	5f                   	pop    %edi
801017ff:	5d                   	pop    %ebp
  release(&icache.lock);
80101800:	e9 4b 32 00 00       	jmp    80104a50 <release>
80101805:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101808:	83 ec 0c             	sub    $0xc,%esp
8010180b:	68 00 1a 11 80       	push   $0x80111a00
80101810:	e8 7b 31 00 00       	call   80104990 <acquire>
    int r = ip->ref;
80101815:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101818:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
8010181f:	e8 2c 32 00 00       	call   80104a50 <release>
    if(r == 1){
80101824:	83 c4 10             	add    $0x10,%esp
80101827:	83 fe 01             	cmp    $0x1,%esi
8010182a:	75 aa                	jne    801017d6 <iput+0x26>
8010182c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101832:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101835:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101838:	89 cf                	mov    %ecx,%edi
8010183a:	eb 0b                	jmp    80101847 <iput+0x97>
8010183c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101840:	83 c6 04             	add    $0x4,%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101843:	39 fe                	cmp    %edi,%esi
80101845:	74 19                	je     80101860 <iput+0xb0>
    if(ip->addrs[i]){
80101847:	8b 16                	mov    (%esi),%edx
80101849:	85 d2                	test   %edx,%edx
8010184b:	74 f3                	je     80101840 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010184d:	8b 03                	mov    (%ebx),%eax
8010184f:	e8 bc f8 ff ff       	call   80101110 <bfree>
      ip->addrs[i] = 0;
80101854:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010185a:	eb e4                	jmp    80101840 <iput+0x90>
8010185c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101860:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101866:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101869:	85 c0                	test   %eax,%eax
8010186b:	75 33                	jne    801018a0 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010186d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101870:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101877:	53                   	push   %ebx
80101878:	e8 53 fd ff ff       	call   801015d0 <iupdate>
      ip->type = 0;
8010187d:	31 c0                	xor    %eax,%eax
8010187f:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101883:	89 1c 24             	mov    %ebx,(%esp)
80101886:	e8 45 fd ff ff       	call   801015d0 <iupdate>
      ip->valid = 0;
8010188b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101892:	83 c4 10             	add    $0x10,%esp
80101895:	e9 3c ff ff ff       	jmp    801017d6 <iput+0x26>
8010189a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018a0:	83 ec 08             	sub    $0x8,%esp
801018a3:	50                   	push   %eax
801018a4:	ff 33                	pushl  (%ebx)
801018a6:	e8 25 e8 ff ff       	call   801000d0 <bread>
801018ab:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018b1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018b7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ba:	83 c4 10             	add    $0x10,%esp
801018bd:	89 cf                	mov    %ecx,%edi
801018bf:	eb 0e                	jmp    801018cf <iput+0x11f>
801018c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018c8:	83 c6 04             	add    $0x4,%esi
    for(j = 0; j < NINDIRECT; j++){
801018cb:	39 fe                	cmp    %edi,%esi
801018cd:	74 0f                	je     801018de <iput+0x12e>
      if(a[j])
801018cf:	8b 16                	mov    (%esi),%edx
801018d1:	85 d2                	test   %edx,%edx
801018d3:	74 f3                	je     801018c8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018d5:	8b 03                	mov    (%ebx),%eax
801018d7:	e8 34 f8 ff ff       	call   80101110 <bfree>
801018dc:	eb ea                	jmp    801018c8 <iput+0x118>
    brelse(bp);
801018de:	83 ec 0c             	sub    $0xc,%esp
801018e1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018e4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018e7:	e8 f4 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018ec:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801018f2:	8b 03                	mov    (%ebx),%eax
801018f4:	e8 17 f8 ff ff       	call   80101110 <bfree>
    ip->addrs[NDIRECT] = 0;
801018f9:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101900:	00 00 00 
80101903:	83 c4 10             	add    $0x10,%esp
80101906:	e9 62 ff ff ff       	jmp    8010186d <iput+0xbd>
8010190b:	90                   	nop
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101910 <iunlockput>:
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	53                   	push   %ebx
80101914:	83 ec 10             	sub    $0x10,%esp
80101917:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010191a:	53                   	push   %ebx
8010191b:	e8 40 fe ff ff       	call   80101760 <iunlock>
  iput(ip);
80101920:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101923:	83 c4 10             	add    $0x10,%esp
}
80101926:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101929:	c9                   	leave  
  iput(ip);
8010192a:	e9 81 fe ff ff       	jmp    801017b0 <iput>
8010192f:	90                   	nop

80101930 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101930:	55                   	push   %ebp
80101931:	89 e5                	mov    %esp,%ebp
80101933:	8b 55 08             	mov    0x8(%ebp),%edx
80101936:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101939:	8b 0a                	mov    (%edx),%ecx
8010193b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010193e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101941:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101944:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101948:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010194b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010194f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101953:	8b 52 58             	mov    0x58(%edx),%edx
80101956:	89 50 10             	mov    %edx,0x10(%eax)
}
80101959:	5d                   	pop    %ebp
8010195a:	c3                   	ret    
8010195b:	90                   	nop
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101960 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101960:	55                   	push   %ebp
80101961:	89 e5                	mov    %esp,%ebp
80101963:	57                   	push   %edi
80101964:	56                   	push   %esi
80101965:	53                   	push   %ebx
80101966:	83 ec 1c             	sub    $0x1c,%esp
80101969:	8b 45 08             	mov    0x8(%ebp),%eax
8010196c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010196f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101972:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101977:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010197a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010197d:	8b 75 10             	mov    0x10(%ebp),%esi
80101980:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101983:	0f 84 a7 00 00 00    	je     80101a30 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101989:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010198c:	8b 40 58             	mov    0x58(%eax),%eax
8010198f:	39 c6                	cmp    %eax,%esi
80101991:	0f 87 ba 00 00 00    	ja     80101a51 <readi+0xf1>
80101997:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010199a:	89 f9                	mov    %edi,%ecx
8010199c:	01 f1                	add    %esi,%ecx
8010199e:	0f 82 ad 00 00 00    	jb     80101a51 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019a4:	89 c2                	mov    %eax,%edx
801019a6:	29 f2                	sub    %esi,%edx
801019a8:	39 c8                	cmp    %ecx,%eax
801019aa:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ad:	31 ff                	xor    %edi,%edi
801019af:	85 d2                	test   %edx,%edx
    n = ip->size - off;
801019b1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019b4:	74 6c                	je     80101a22 <readi+0xc2>
801019b6:	8d 76 00             	lea    0x0(%esi),%esi
801019b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019c0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019c3:	89 f2                	mov    %esi,%edx
801019c5:	c1 ea 09             	shr    $0x9,%edx
801019c8:	89 d8                	mov    %ebx,%eax
801019ca:	e8 91 f9 ff ff       	call   80101360 <bmap>
801019cf:	83 ec 08             	sub    $0x8,%esp
801019d2:	50                   	push   %eax
801019d3:	ff 33                	pushl  (%ebx)
801019d5:	e8 f6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019da:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019dd:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019df:	89 f0                	mov    %esi,%eax
801019e1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019e6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019eb:	83 c4 0c             	add    $0xc,%esp
801019ee:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
801019f0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019f4:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
801019f7:	29 fb                	sub    %edi,%ebx
801019f9:	39 d9                	cmp    %ebx,%ecx
801019fb:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019fe:	53                   	push   %ebx
801019ff:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a00:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a02:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a05:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a07:	e8 44 31 00 00       	call   80104b50 <memmove>
    brelse(bp);
80101a0c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a0f:	89 14 24             	mov    %edx,(%esp)
80101a12:	e8 c9 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a17:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a1a:	83 c4 10             	add    $0x10,%esp
80101a1d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a20:	77 9e                	ja     801019c0 <readi+0x60>
  }
  return n;
80101a22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a28:	5b                   	pop    %ebx
80101a29:	5e                   	pop    %esi
80101a2a:	5f                   	pop    %edi
80101a2b:	5d                   	pop    %ebp
80101a2c:	c3                   	ret    
80101a2d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a34:	66 83 f8 09          	cmp    $0x9,%ax
80101a38:	77 17                	ja     80101a51 <readi+0xf1>
80101a3a:	8b 04 c5 80 19 11 80 	mov    -0x7feee680(,%eax,8),%eax
80101a41:	85 c0                	test   %eax,%eax
80101a43:	74 0c                	je     80101a51 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101a45:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101a48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a4b:	5b                   	pop    %ebx
80101a4c:	5e                   	pop    %esi
80101a4d:	5f                   	pop    %edi
80101a4e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a4f:	ff e0                	jmp    *%eax
      return -1;
80101a51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a56:	eb cd                	jmp    80101a25 <readi+0xc5>
80101a58:	90                   	nop
80101a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a60 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	57                   	push   %edi
80101a64:	56                   	push   %esi
80101a65:	53                   	push   %ebx
80101a66:	83 ec 1c             	sub    $0x1c,%esp
80101a69:	8b 45 08             	mov    0x8(%ebp),%eax
80101a6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a6f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a72:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a77:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a7a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a7d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a80:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a83:	0f 84 b7 00 00 00    	je     80101b40 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a89:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a8c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a8f:	0f 82 eb 00 00 00    	jb     80101b80 <writei+0x120>
80101a95:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a98:	31 d2                	xor    %edx,%edx
80101a9a:	89 f8                	mov    %edi,%eax
80101a9c:	01 f0                	add    %esi,%eax
80101a9e:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101aa1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101aa6:	0f 87 d4 00 00 00    	ja     80101b80 <writei+0x120>
80101aac:	85 d2                	test   %edx,%edx
80101aae:	0f 85 cc 00 00 00    	jne    80101b80 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ab4:	85 ff                	test   %edi,%edi
80101ab6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101abd:	74 72                	je     80101b31 <writei+0xd1>
80101abf:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ac3:	89 f2                	mov    %esi,%edx
80101ac5:	c1 ea 09             	shr    $0x9,%edx
80101ac8:	89 f8                	mov    %edi,%eax
80101aca:	e8 91 f8 ff ff       	call   80101360 <bmap>
80101acf:	83 ec 08             	sub    $0x8,%esp
80101ad2:	50                   	push   %eax
80101ad3:	ff 37                	pushl  (%edi)
80101ad5:	e8 f6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101ada:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101add:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ae0:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae2:	89 f0                	mov    %esi,%eax
80101ae4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ae9:	83 c4 0c             	add    $0xc,%esp
80101aec:	25 ff 01 00 00       	and    $0x1ff,%eax
80101af1:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101af3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101af7:	39 d9                	cmp    %ebx,%ecx
80101af9:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101afc:	53                   	push   %ebx
80101afd:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b00:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b02:	50                   	push   %eax
80101b03:	e8 48 30 00 00       	call   80104b50 <memmove>
    log_write(bp);
80101b08:	89 3c 24             	mov    %edi,(%esp)
80101b0b:	e8 70 12 00 00       	call   80102d80 <log_write>
    brelse(bp);
80101b10:	89 3c 24             	mov    %edi,(%esp)
80101b13:	e8 c8 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b18:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b1b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b1e:	83 c4 10             	add    $0x10,%esp
80101b21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b24:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b27:	77 97                	ja     80101ac0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b29:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b2c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b2f:	77 37                	ja     80101b68 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b31:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b37:	5b                   	pop    %ebx
80101b38:	5e                   	pop    %esi
80101b39:	5f                   	pop    %edi
80101b3a:	5d                   	pop    %ebp
80101b3b:	c3                   	ret    
80101b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b44:	66 83 f8 09          	cmp    $0x9,%ax
80101b48:	77 36                	ja     80101b80 <writei+0x120>
80101b4a:	8b 04 c5 84 19 11 80 	mov    -0x7feee67c(,%eax,8),%eax
80101b51:	85 c0                	test   %eax,%eax
80101b53:	74 2b                	je     80101b80 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b55:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b5b:	5b                   	pop    %ebx
80101b5c:	5e                   	pop    %esi
80101b5d:	5f                   	pop    %edi
80101b5e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b5f:	ff e0                	jmp    *%eax
80101b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b68:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b6b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101b6e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b71:	50                   	push   %eax
80101b72:	e8 59 fa ff ff       	call   801015d0 <iupdate>
80101b77:	83 c4 10             	add    $0x10,%esp
80101b7a:	eb b5                	jmp    80101b31 <writei+0xd1>
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101b80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b85:	eb ad                	jmp    80101b34 <writei+0xd4>
80101b87:	89 f6                	mov    %esi,%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b96:	6a 0e                	push   $0xe
80101b98:	ff 75 0c             	pushl  0xc(%ebp)
80101b9b:	ff 75 08             	pushl  0x8(%ebp)
80101b9e:	e8 1d 30 00 00       	call   80104bc0 <strncmp>
}
80101ba3:	c9                   	leave  
80101ba4:	c3                   	ret    
80101ba5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bb0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bb0:	55                   	push   %ebp
80101bb1:	89 e5                	mov    %esp,%ebp
80101bb3:	57                   	push   %edi
80101bb4:	56                   	push   %esi
80101bb5:	53                   	push   %ebx
80101bb6:	83 ec 1c             	sub    $0x1c,%esp
80101bb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bbc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bc1:	0f 85 85 00 00 00    	jne    80101c4c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bc7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bca:	31 ff                	xor    %edi,%edi
80101bcc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bcf:	85 d2                	test   %edx,%edx
80101bd1:	74 3e                	je     80101c11 <dirlookup+0x61>
80101bd3:	90                   	nop
80101bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd8:	6a 10                	push   $0x10
80101bda:	57                   	push   %edi
80101bdb:	56                   	push   %esi
80101bdc:	53                   	push   %ebx
80101bdd:	e8 7e fd ff ff       	call   80101960 <readi>
80101be2:	83 c4 10             	add    $0x10,%esp
80101be5:	83 f8 10             	cmp    $0x10,%eax
80101be8:	75 55                	jne    80101c3f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101bea:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bef:	74 18                	je     80101c09 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101bf1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bf4:	83 ec 04             	sub    $0x4,%esp
80101bf7:	6a 0e                	push   $0xe
80101bf9:	50                   	push   %eax
80101bfa:	ff 75 0c             	pushl  0xc(%ebp)
80101bfd:	e8 be 2f 00 00       	call   80104bc0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c02:	83 c4 10             	add    $0x10,%esp
80101c05:	85 c0                	test   %eax,%eax
80101c07:	74 17                	je     80101c20 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c09:	83 c7 10             	add    $0x10,%edi
80101c0c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c0f:	72 c7                	jb     80101bd8 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101c11:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c14:	31 c0                	xor    %eax,%eax
}
80101c16:	5b                   	pop    %ebx
80101c17:	5e                   	pop    %esi
80101c18:	5f                   	pop    %edi
80101c19:	5d                   	pop    %ebp
80101c1a:	c3                   	ret    
80101c1b:	90                   	nop
80101c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101c20:	8b 45 10             	mov    0x10(%ebp),%eax
80101c23:	85 c0                	test   %eax,%eax
80101c25:	74 05                	je     80101c2c <dirlookup+0x7c>
        *poff = off;
80101c27:	8b 45 10             	mov    0x10(%ebp),%eax
80101c2a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c2c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c30:	8b 03                	mov    (%ebx),%eax
80101c32:	e8 59 f6 ff ff       	call   80101290 <iget>
}
80101c37:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c3a:	5b                   	pop    %ebx
80101c3b:	5e                   	pop    %esi
80101c3c:	5f                   	pop    %edi
80101c3d:	5d                   	pop    %ebp
80101c3e:	c3                   	ret    
      panic("dirlookup read");
80101c3f:	83 ec 0c             	sub    $0xc,%esp
80101c42:	68 f9 77 10 80       	push   $0x801077f9
80101c47:	e8 44 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c4c:	83 ec 0c             	sub    $0xc,%esp
80101c4f:	68 e7 77 10 80       	push   $0x801077e7
80101c54:	e8 37 e7 ff ff       	call   80100390 <panic>
80101c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c60 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	56                   	push   %esi
80101c65:	53                   	push   %ebx
80101c66:	89 cf                	mov    %ecx,%edi
80101c68:	89 c3                	mov    %eax,%ebx
80101c6a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c6d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c70:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c73:	0f 84 77 01 00 00    	je     80101df0 <namex+0x190>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c79:	e8 a2 1a 00 00       	call   80103720 <myproc>
  acquire(&icache.lock);
80101c7e:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101c81:	8b b0 88 00 00 00    	mov    0x88(%eax),%esi
  acquire(&icache.lock);
80101c87:	68 00 1a 11 80       	push   $0x80111a00
80101c8c:	e8 ff 2c 00 00       	call   80104990 <acquire>
  ip->ref++;
80101c91:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c95:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101c9c:	e8 af 2d 00 00       	call   80104a50 <release>
80101ca1:	83 c4 10             	add    $0x10,%esp
80101ca4:	eb 0d                	jmp    80101cb3 <namex+0x53>
80101ca6:	8d 76 00             	lea    0x0(%esi),%esi
80101ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101cb0:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cb3:	0f b6 03             	movzbl (%ebx),%eax
80101cb6:	3c 2f                	cmp    $0x2f,%al
80101cb8:	74 f6                	je     80101cb0 <namex+0x50>
  if(*path == 0)
80101cba:	84 c0                	test   %al,%al
80101cbc:	0f 84 f6 00 00 00    	je     80101db8 <namex+0x158>
  while(*path != '/' && *path != 0)
80101cc2:	0f b6 03             	movzbl (%ebx),%eax
80101cc5:	3c 2f                	cmp    $0x2f,%al
80101cc7:	0f 84 bb 00 00 00    	je     80101d88 <namex+0x128>
80101ccd:	84 c0                	test   %al,%al
80101ccf:	89 da                	mov    %ebx,%edx
80101cd1:	75 11                	jne    80101ce4 <namex+0x84>
80101cd3:	e9 b0 00 00 00       	jmp    80101d88 <namex+0x128>
80101cd8:	90                   	nop
80101cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x8e>
    path++;
80101ce4:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x80>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x12c>
    memmove(name, s, DIRSIZ);
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 46 2e 00 00       	call   80104b50 <memmove>
    path++;
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101d0d:	83 c4 10             	add    $0x10,%esp
    path++;
80101d10:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xc8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xc0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 4f f9 ff ff       	call   80101680 <ilock>
    if(ip->type != T_DIR){
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x170>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xef>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x1a6>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 55 fe ff ff       	call   80101bb0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x170>
  iunlock(ip);
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 f2 f9 ff ff       	call   80101760 <iunlock>
  iput(ip);
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 3a fa ff ff       	call   801017b0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 30 ff ff ff       	jmp    80101cb3 <namex+0x53>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
    memmove(name, s, len);
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 b3 2d 00 00       	call   80104b50 <memmove>
    name[len] = 0;
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xb2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1bc>
    iput(ip);
    return 0;
  }
  return ip;
}
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 87 f9 ff ff       	call   80101760 <iunlock>
  iput(ip);
80101dd9:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101ddc:	31 f6                	xor    %esi,%esi
  iput(ip);
80101dde:	e8 cd f9 ff ff       	call   801017b0 <iput>
      return 0;
80101de3:	83 c4 10             	add    $0x10,%esp
}
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 91 f4 ff ff       	call   80101290 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 ad fe ff ff       	jmp    80101cb3 <namex+0x53>
      iunlock(ip);
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 51 f9 ff ff       	call   80101760 <iunlock>
      return ip;
80101e0f:	83 c4 10             	add    $0x10,%esp
}
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
    iput(ip);
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
    return 0;
80101e20:	31 f6                	xor    %esi,%esi
    iput(ip);
80101e22:	e8 89 f9 ff ff       	call   801017b0 <iput>
    return 0;
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x15f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
{
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 69 fd ff ff       	call   80101bb0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 ee fa ff ff       	call   80101960 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
    if(de.inum == 0)
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 8e 2d 00 00       	call   80104c20 <strncpy>
  de.inum = inum;
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
  de.inum = inum;
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e9e:	e8 bd fb ff ff       	call   80101a60 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
  return 0;
80101eab:	31 c0                	xor    %eax,%eax
}
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
    iput(ip);
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 f2 f8 ff ff       	call   801017b0 <iput>
    return -1;
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
      panic("dirlink read");
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 08 78 10 80       	push   $0x80107808
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 f2 7e 10 80       	push   $0x80107ef2
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:

struct inode*
namei(char *path)
{
80101ef0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ef1:	31 d2                	xor    %edx,%edx
{
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 5d fd ff ff       	call   80101c60 <namex>
}
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f10:	55                   	push   %ebp
  return namex(path, 1, name);
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f16:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f1e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f1f:	e9 3c fd ff ff       	jmp    80101c60 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101f39:	85 c0                	test   %eax,%eax
80101f3b:	0f 84 b4 00 00 00    	je     80101ff5 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f41:	8b 58 08             	mov    0x8(%eax),%ebx
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f4c:	0f 87 96 00 00 00    	ja     80101fe8 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f52:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f57:	89 f6                	mov    %esi,%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	89 ca                	mov    %ecx,%edx
80101f62:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f63:	83 e0 c0             	and    $0xffffffc0,%eax
80101f66:	3c 40                	cmp    $0x40,%al
80101f68:	75 f6                	jne    80101f60 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f6a:	31 ff                	xor    %edi,%edi
80101f6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f71:	89 f8                	mov    %edi,%eax
80101f73:	ee                   	out    %al,(%dx)
80101f74:	b8 01 00 00 00       	mov    $0x1,%eax
80101f79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7e:	ee                   	out    %al,(%dx)
80101f7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f84:	89 d8                	mov    %ebx,%eax
80101f86:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f87:	89 d8                	mov    %ebx,%eax
80101f89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f8e:	c1 f8 08             	sar    $0x8,%eax
80101f91:	ee                   	out    %al,(%dx)
80101f92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f97:	89 f8                	mov    %edi,%eax
80101f99:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f9a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa3:	c1 e0 04             	shl    $0x4,%eax
80101fa6:	83 e0 10             	and    $0x10,%eax
80101fa9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fac:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fad:	f6 06 04             	testb  $0x4,(%esi)
80101fb0:	75 16                	jne    80101fc8 <idestart+0x98>
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	89 ca                	mov    %ecx,%edx
80101fb9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	5b                   	pop    %ebx
80101fbe:	5e                   	pop    %esi
80101fbf:	5f                   	pop    %edi
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret    
80101fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
80101fcd:	89 ca                	mov    %ecx,%edx
80101fcf:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101fd0:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80101fd5:	83 c6 5c             	add    $0x5c,%esi
80101fd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdd:	fc                   	cld    
80101fde:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101fe0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe3:	5b                   	pop    %ebx
80101fe4:	5e                   	pop    %esi
80101fe5:	5f                   	pop    %edi
80101fe6:	5d                   	pop    %ebp
80101fe7:	c3                   	ret    
    panic("incorrect blockno");
80101fe8:	83 ec 0c             	sub    $0xc,%esp
80101feb:	68 74 78 10 80       	push   $0x80107874
80101ff0:	e8 9b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80101ff5:	83 ec 0c             	sub    $0xc,%esp
80101ff8:	68 6b 78 10 80       	push   $0x8010786b
80101ffd:	e8 8e e3 ff ff       	call   80100390 <panic>
80102002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
{
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102016:	68 86 78 10 80       	push   $0x80107886
8010201b:	68 80 b5 10 80       	push   $0x8010b580
80102020:	e8 2b 28 00 00       	call   80104850 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102025:	58                   	pop    %eax
80102026:	a1 20 3d 11 80       	mov    0x80113d20,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102048:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
  for(i=0; i<1000; i++){
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
      havedisk1 = 1;
8010206a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
80102071:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102074:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102079:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010207e:	ee                   	out    %al,(%dx)
}
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102099:	68 80 b5 10 80       	push   $0x8010b580
8010209e:	e8 ed 28 00 00       	call   80104990 <acquire>

  if((b = idequeue) == 0){
801020a3:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 67                	je     80102117 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 b5 10 80       	mov    %eax,0x8010b564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020b8:	8b 3b                	mov    (%ebx),%edi
801020ba:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020c0:	75 31                	jne    801020f3 <ideintr+0x63>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c7:	89 f6                	mov    %esi,%esi
801020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801020d0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020d1:	89 c6                	mov    %eax,%esi
801020d3:	83 e6 c0             	and    $0xffffffc0,%esi
801020d6:	89 f1                	mov    %esi,%ecx
801020d8:	80 f9 40             	cmp    $0x40,%cl
801020db:	75 f3                	jne    801020d0 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020dd:	a8 21                	test   $0x21,%al
801020df:	75 12                	jne    801020f3 <ideintr+0x63>
    insl(0x1f0, b->data, BSIZE/4);
801020e1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
801020e4:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ee:	fc                   	cld    
801020ef:	f3 6d                	rep insl (%dx),%es:(%edi)
801020f1:	8b 3b                	mov    (%ebx),%edi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020f3:	83 e7 fb             	and    $0xfffffffb,%edi
  wakeup(b);
801020f6:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
801020f9:	89 f9                	mov    %edi,%ecx
801020fb:	83 c9 02             	or     $0x2,%ecx
801020fe:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102100:	53                   	push   %ebx
80102101:	e8 da 22 00 00       	call   801043e0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102106:	a1 64 b5 10 80       	mov    0x8010b564,%eax
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	85 c0                	test   %eax,%eax
80102110:	74 05                	je     80102117 <ideintr+0x87>
    idestart(idequeue);
80102112:	e8 19 fe ff ff       	call   80101f30 <idestart>
    release(&idelock);
80102117:	83 ec 0c             	sub    $0xc,%esp
8010211a:	68 80 b5 10 80       	push   $0x8010b580
8010211f:	e8 2c 29 00 00       	call   80104a50 <release>

  release(&idelock);
}
80102124:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102127:	5b                   	pop    %ebx
80102128:	5e                   	pop    %esi
80102129:	5f                   	pop    %edi
8010212a:	5d                   	pop    %ebp
8010212b:	c3                   	ret    
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 bd 26 00 00       	call   80104800 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 c6 00 00 00    	je     80102214 <iderw+0xe4>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 ab 00 00 00    	je     80102207 <iderw+0xd7>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 b1 00 00 00    	je     80102221 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 b5 10 80       	push   $0x8010b580
80102178:	e8 13 28 00 00       	call   80104990 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217d:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 6d                	jmp    80102200 <iderw+0xd0>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
801021a4:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801021a6:	39 1d 64 b5 10 80    	cmp    %ebx,0x8010b564
801021ac:	74 42                	je     801021f0 <iderw+0xc0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 b5 10 80       	push   $0x8010b580
801021c8:	53                   	push   %ebx
801021c9:	e8 22 20 00 00       	call   801041f0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
  }


  release(&idelock);
801021db:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
}
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
  release(&idelock);
801021e6:	e9 65 28 00 00       	jmp    80104a50 <release>
801021eb:	90                   	nop
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
801021f0:	89 d8                	mov    %ebx,%eax
801021f2:	e8 39 fd ff ff       	call   80101f30 <idestart>
801021f7:	eb b5                	jmp    801021ae <iderw+0x7e>
801021f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102200:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
80102205:	eb 9d                	jmp    801021a4 <iderw+0x74>
    panic("iderw: nothing to do");
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 a0 78 10 80       	push   $0x801078a0
8010220f:	e8 7c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 8a 78 10 80       	push   $0x8010788a
8010221c:	e8 6f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102221:	83 ec 0c             	sub    $0xc,%esp
80102224:	68 b5 78 10 80       	push   $0x801078b5
80102229:	e8 62 e1 ff ff       	call   80100390 <panic>
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102230:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102231:	c7 05 54 36 11 80 00 	movl   $0xfec00000,0x80113654
80102238:	00 c0 fe 
{
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
  ioapic->reg = reg;
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
  return ioapic->data;
80102249:	a1 54 36 11 80       	mov    0x80113654,%eax
8010224e:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
80102251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
80102257:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010225d:	0f b6 15 80 37 11 80 	movzbl 0x80113780,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102264:	c1 eb 10             	shr    $0x10,%ebx
  return ioapic->data;
80102267:	8b 41 10             	mov    0x10(%ecx),%eax
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
8010226a:	0f b6 db             	movzbl %bl,%ebx
  id = ioapicread(REG_ID) >> 24;
8010226d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102270:	39 c2                	cmp    %eax,%edx
80102272:	74 16                	je     8010228a <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 d4 78 10 80       	push   $0x801078d4
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c3 21             	add    $0x21,%ebx
{
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
801022a0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801022a2:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022a8:	89 c6                	mov    %eax,%esi
801022aa:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022b0:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022b3:	89 71 10             	mov    %esi,0x10(%ecx)
801022b6:	8d 72 01             	lea    0x1(%edx),%esi
801022b9:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
801022bc:	39 d8                	cmp    %ebx,%eax
  ioapic->reg = reg;
801022be:	89 31                	mov    %esi,(%ecx)
  ioapic->data = data;
801022c0:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022e0:	55                   	push   %ebp
  ioapic->reg = reg;
801022e1:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
{
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
801022f3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022f5:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022fb:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102304:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102306:	a1 54 36 11 80       	mov    0x80113654,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010230b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
}
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb c8 6c 11 80    	cmp    $0x80116cc8,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 49 27 00 00       	call   80104aa0 <memset>

  if(kmem.use_lock)
80102357:	8b 15 94 36 11 80    	mov    0x80113694,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102364:	a1 98 36 11 80       	mov    0x80113698,%eax
80102369:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010236b:	a1 94 36 11 80       	mov    0x80113694,%eax
  kmem.freelist = r;
80102370:	89 1d 98 36 11 80    	mov    %ebx,0x80113698
  if(kmem.use_lock)
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
    release(&kmem.lock);
}
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
    release(&kmem.lock);
80102380:	c7 45 08 60 36 11 80 	movl   $0x80113660,0x8(%ebp)
}
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
    release(&kmem.lock);
8010238b:	e9 c0 26 00 00       	jmp    80104a50 <release>
    acquire(&kmem.lock);
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 60 36 11 80       	push   $0x80113660
80102398:	e8 f3 25 00 00       	call   80104990 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
    panic("kfree");
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 06 79 10 80       	push   $0x80107906
801023aa:	e8 e1 df ff ff       	call   80100390 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
{
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
}
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
{
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 0c 79 10 80       	push   $0x8010790c
80102410:	68 60 36 11 80       	push   $0x80113660
80102415:	e8 36 24 00 00       	call   80104850 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010241d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102420:	c7 05 94 36 11 80 00 	movl   $0x0,0x80113694
80102427:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
    kfree(p);
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
}
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
{
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
  kmem.use_lock = 1;
801024b4:	c7 05 94 36 11 80 01 	movl   $0x1,0x80113694
801024bb:	00 00 00 
}
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
801024d0:	a1 94 36 11 80       	mov    0x80113694,%eax
801024d5:	85 c0                	test   %eax,%eax
801024d7:	75 1f                	jne    801024f8 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024d9:	a1 98 36 11 80       	mov    0x80113698,%eax
  if(r)
801024de:	85 c0                	test   %eax,%eax
801024e0:	74 0e                	je     801024f0 <kalloc+0x20>
    kmem.freelist = r->next;
801024e2:	8b 10                	mov    (%eax),%edx
801024e4:	89 15 98 36 11 80    	mov    %edx,0x80113698
801024ea:	c3                   	ret    
801024eb:	90                   	nop
801024ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}
801024f0:	f3 c3                	repz ret 
801024f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
801024f8:	55                   	push   %ebp
801024f9:	89 e5                	mov    %esp,%ebp
801024fb:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
801024fe:	68 60 36 11 80       	push   $0x80113660
80102503:	e8 88 24 00 00       	call   80104990 <acquire>
  r = kmem.freelist;
80102508:	a1 98 36 11 80       	mov    0x80113698,%eax
  if(r)
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	8b 15 94 36 11 80    	mov    0x80113694,%edx
80102516:	85 c0                	test   %eax,%eax
80102518:	74 08                	je     80102522 <kalloc+0x52>
    kmem.freelist = r->next;
8010251a:	8b 08                	mov    (%eax),%ecx
8010251c:	89 0d 98 36 11 80    	mov    %ecx,0x80113698
  if(kmem.use_lock)
80102522:	85 d2                	test   %edx,%edx
80102524:	74 16                	je     8010253c <kalloc+0x6c>
    release(&kmem.lock);
80102526:	83 ec 0c             	sub    $0xc,%esp
80102529:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010252c:	68 60 36 11 80       	push   $0x80113660
80102531:	e8 1a 25 00 00       	call   80104a50 <release>
  return (char*)r;
80102536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
80102539:	83 c4 10             	add    $0x10,%esp
}
8010253c:	c9                   	leave  
8010253d:	c3                   	ret    
8010253e:	66 90                	xchg   %ax,%ax

80102540 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102540:	ba 64 00 00 00       	mov    $0x64,%edx
80102545:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102546:	a8 01                	test   $0x1,%al
80102548:	0f 84 c2 00 00 00    	je     80102610 <kbdgetc+0xd0>
8010254e:	ba 60 00 00 00       	mov    $0x60,%edx
80102553:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102554:	0f b6 d0             	movzbl %al,%edx
80102557:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx

  if(data == 0xE0){
8010255d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102563:	0f 84 7f 00 00 00    	je     801025e8 <kbdgetc+0xa8>
{
80102569:	55                   	push   %ebp
8010256a:	89 e5                	mov    %esp,%ebp
8010256c:	53                   	push   %ebx
8010256d:	89 cb                	mov    %ecx,%ebx
8010256f:	83 e3 40             	and    $0x40,%ebx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102572:	84 c0                	test   %al,%al
80102574:	78 4a                	js     801025c0 <kbdgetc+0x80>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102576:	85 db                	test   %ebx,%ebx
80102578:	74 09                	je     80102583 <kbdgetc+0x43>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010257a:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
8010257d:	83 e1 bf             	and    $0xffffffbf,%ecx
    data |= 0x80;
80102580:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
80102583:	0f b6 82 40 7a 10 80 	movzbl -0x7fef85c0(%edx),%eax
8010258a:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
8010258c:	0f b6 82 40 79 10 80 	movzbl -0x7fef86c0(%edx),%eax
80102593:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102595:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
80102597:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
  c = charcode[shift & (CTL | SHIFT)][data];
8010259d:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801025a0:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025a3:	8b 04 85 20 79 10 80 	mov    -0x7fef86e0(,%eax,4),%eax
801025aa:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801025ae:	74 31                	je     801025e1 <kbdgetc+0xa1>
    if('a' <= c && c <= 'z')
801025b0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025b3:	83 fa 19             	cmp    $0x19,%edx
801025b6:	77 40                	ja     801025f8 <kbdgetc+0xb8>
      c += 'A' - 'a';
801025b8:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025bb:	5b                   	pop    %ebx
801025bc:	5d                   	pop    %ebp
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
801025c0:	83 e0 7f             	and    $0x7f,%eax
801025c3:	85 db                	test   %ebx,%ebx
801025c5:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801025c8:	0f b6 82 40 7a 10 80 	movzbl -0x7fef85c0(%edx),%eax
801025cf:	83 c8 40             	or     $0x40,%eax
801025d2:	0f b6 c0             	movzbl %al,%eax
801025d5:	f7 d0                	not    %eax
801025d7:	21 c1                	and    %eax,%ecx
    return 0;
801025d9:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
801025db:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
}
801025e1:	5b                   	pop    %ebx
801025e2:	5d                   	pop    %ebp
801025e3:	c3                   	ret    
801025e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
801025e8:	83 c9 40             	or     $0x40,%ecx
    return 0;
801025eb:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
801025ed:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
    return 0;
801025f3:	c3                   	ret    
801025f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
801025f8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025fb:	8d 50 20             	lea    0x20(%eax),%edx
}
801025fe:	5b                   	pop    %ebx
      c += 'a' - 'A';
801025ff:	83 f9 1a             	cmp    $0x1a,%ecx
80102602:	0f 42 c2             	cmovb  %edx,%eax
}
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80102610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102615:	c3                   	ret    
80102616:	8d 76 00             	lea    0x0(%esi),%esi
80102619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102620 <kbdintr>:

void
kbdintr(void)
{
80102620:	55                   	push   %ebp
80102621:	89 e5                	mov    %esp,%ebp
80102623:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102626:	68 40 25 10 80       	push   $0x80102540
8010262b:	e8 e0 e1 ff ff       	call   80100810 <consoleintr>
}
80102630:	83 c4 10             	add    $0x10,%esp
80102633:	c9                   	leave  
80102634:	c3                   	ret    
80102635:	66 90                	xchg   %ax,%ax
80102637:	66 90                	xchg   %ax,%ax
80102639:	66 90                	xchg   %ax,%ax
8010263b:	66 90                	xchg   %ax,%ax
8010263d:	66 90                	xchg   %ax,%ax
8010263f:	90                   	nop

80102640 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102640:	a1 9c 36 11 80       	mov    0x8011369c,%eax
{
80102645:	55                   	push   %ebp
80102646:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102648:	85 c0                	test   %eax,%eax
8010264a:	0f 84 c8 00 00 00    	je     80102718 <lapicinit+0xd8>
  lapic[index] = value;
80102650:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102657:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010265a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010265d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102664:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102667:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010266a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102671:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102674:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102677:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010267e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102681:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102684:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010268b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010268e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102691:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102698:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010269b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010269e:	8b 50 30             	mov    0x30(%eax),%edx
801026a1:	c1 ea 10             	shr    $0x10,%edx
801026a4:	80 fa 03             	cmp    $0x3,%dl
801026a7:	77 77                	ja     80102720 <lapicinit+0xe0>
  lapic[index] = value;
801026a9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026b0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b3:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026bd:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026c0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ca:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026cd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026d0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026d7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026da:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026dd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026e4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026ea:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026f1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026f4:	8b 50 20             	mov    0x20(%eax),%edx
801026f7:	89 f6                	mov    %esi,%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102700:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102706:	80 e6 10             	and    $0x10,%dh
80102709:	75 f5                	jne    80102700 <lapicinit+0xc0>
  lapic[index] = value;
8010270b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102712:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102715:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102718:	5d                   	pop    %ebp
80102719:	c3                   	ret    
8010271a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102720:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102727:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010272a:	8b 50 20             	mov    0x20(%eax),%edx
8010272d:	e9 77 ff ff ff       	jmp    801026a9 <lapicinit+0x69>
80102732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102740:	8b 15 9c 36 11 80    	mov    0x8011369c,%edx
{
80102746:	55                   	push   %ebp
80102747:	31 c0                	xor    %eax,%eax
80102749:	89 e5                	mov    %esp,%ebp
  if (!lapic)
8010274b:	85 d2                	test   %edx,%edx
8010274d:	74 06                	je     80102755 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
8010274f:	8b 42 20             	mov    0x20(%edx),%eax
80102752:	c1 e8 18             	shr    $0x18,%eax
}
80102755:	5d                   	pop    %ebp
80102756:	c3                   	ret    
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102760:	a1 9c 36 11 80       	mov    0x8011369c,%eax
{
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102768:	85 c0                	test   %eax,%eax
8010276a:	74 0d                	je     80102779 <lapiceoi+0x19>
  lapic[index] = value;
8010276c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102773:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102776:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
80102779:	5d                   	pop    %ebp
8010277a:	c3                   	ret    
8010277b:	90                   	nop
8010277c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102780 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102780:	55                   	push   %ebp
80102781:	89 e5                	mov    %esp,%ebp
}
80102783:	5d                   	pop    %ebp
80102784:	c3                   	ret    
80102785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102790:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102791:	b8 0f 00 00 00       	mov    $0xf,%eax
80102796:	ba 70 00 00 00       	mov    $0x70,%edx
8010279b:	89 e5                	mov    %esp,%ebp
8010279d:	53                   	push   %ebx
8010279e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027a4:	ee                   	out    %al,(%dx)
801027a5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027aa:	ba 71 00 00 00       	mov    $0x71,%edx
801027af:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027b0:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801027b2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801027b5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027bb:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027bd:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
801027c0:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
801027c3:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
801027c5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801027c8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801027ce:	a1 9c 36 11 80       	mov    0x8011369c,%eax
801027d3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027d9:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027dc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027e3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027e6:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027e9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027f0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027f3:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027f6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027fc:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027ff:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102805:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102808:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010280e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102811:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102817:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
8010281a:	5b                   	pop    %ebx
8010281b:	5d                   	pop    %ebp
8010281c:	c3                   	ret    
8010281d:	8d 76 00             	lea    0x0(%esi),%esi

80102820 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102820:	55                   	push   %ebp
80102821:	b8 0b 00 00 00       	mov    $0xb,%eax
80102826:	ba 70 00 00 00       	mov    $0x70,%edx
8010282b:	89 e5                	mov    %esp,%ebp
8010282d:	57                   	push   %edi
8010282e:	56                   	push   %esi
8010282f:	53                   	push   %ebx
80102830:	83 ec 4c             	sub    $0x4c,%esp
80102833:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102834:	ba 71 00 00 00       	mov    $0x71,%edx
80102839:	ec                   	in     (%dx),%al
8010283a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010283d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102842:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102845:	8d 76 00             	lea    0x0(%esi),%esi
80102848:	31 c0                	xor    %eax,%eax
8010284a:	89 da                	mov    %ebx,%edx
8010284c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010284d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102852:	89 ca                	mov    %ecx,%edx
80102854:	ec                   	in     (%dx),%al
80102855:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102858:	89 da                	mov    %ebx,%edx
8010285a:	b8 02 00 00 00       	mov    $0x2,%eax
8010285f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102866:	89 da                	mov    %ebx,%edx
80102868:	b8 04 00 00 00       	mov    $0x4,%eax
8010286d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
80102871:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102874:	89 da                	mov    %ebx,%edx
80102876:	b8 07 00 00 00       	mov    $0x7,%eax
8010287b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102882:	89 da                	mov    %ebx,%edx
80102884:	b8 08 00 00 00       	mov    $0x8,%eax
80102889:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288a:	89 ca                	mov    %ecx,%edx
8010288c:	ec                   	in     (%dx),%al
8010288d:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010288f:	89 da                	mov    %ebx,%edx
80102891:	b8 09 00 00 00       	mov    $0x9,%eax
80102896:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102897:	89 ca                	mov    %ecx,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010289c:	89 da                	mov    %ebx,%edx
8010289e:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028a4:	89 ca                	mov    %ecx,%edx
801028a6:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028a7:	84 c0                	test   %al,%al
801028a9:	78 9d                	js     80102848 <cmostime+0x28>
  return inb(CMOS_RETURN);
801028ab:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028af:	89 fa                	mov    %edi,%edx
801028b1:	0f b6 fa             	movzbl %dl,%edi
801028b4:	89 f2                	mov    %esi,%edx
801028b6:	0f b6 f2             	movzbl %dl,%esi
801028b9:	89 7d c8             	mov    %edi,-0x38(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028bc:	89 da                	mov    %ebx,%edx
801028be:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028c1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028c4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028c8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028cb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028cf:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028d2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801028d6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028d9:	31 c0                	xor    %eax,%eax
801028db:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028e7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ec:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
801028f0:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f3:	89 da                	mov    %ebx,%edx
801028f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028f8:	b8 04 00 00 00       	mov    $0x4,%eax
801028fd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
80102901:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102904:	89 da                	mov    %ebx,%edx
80102906:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102909:	b8 07 00 00 00       	mov    $0x7,%eax
8010290e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
80102912:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102915:	89 da                	mov    %ebx,%edx
80102917:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010291a:	b8 08 00 00 00       	mov    $0x8,%eax
8010291f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
80102923:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102926:	89 da                	mov    %ebx,%edx
80102928:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010292b:	b8 09 00 00 00       	mov    $0x9,%eax
80102930:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102931:	89 ca                	mov    %ecx,%edx
80102933:	ec                   	in     (%dx),%al
80102934:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102937:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
8010293a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010293d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102940:	6a 18                	push   $0x18
80102942:	50                   	push   %eax
80102943:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102946:	50                   	push   %eax
80102947:	e8 a4 21 00 00       	call   80104af0 <memcmp>
8010294c:	83 c4 10             	add    $0x10,%esp
8010294f:	85 c0                	test   %eax,%eax
80102951:	0f 85 f1 fe ff ff    	jne    80102848 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102957:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010295b:	75 78                	jne    801029d5 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010295d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102960:	89 c2                	mov    %eax,%edx
80102962:	83 e0 0f             	and    $0xf,%eax
80102965:	c1 ea 04             	shr    $0x4,%edx
80102968:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102971:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102974:	89 c2                	mov    %eax,%edx
80102976:	83 e0 0f             	and    $0xf,%eax
80102979:	c1 ea 04             	shr    $0x4,%edx
8010297c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102982:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102985:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102988:	89 c2                	mov    %eax,%edx
8010298a:	83 e0 0f             	and    $0xf,%eax
8010298d:	c1 ea 04             	shr    $0x4,%edx
80102990:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102993:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102996:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102999:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010299c:	89 c2                	mov    %eax,%edx
8010299e:	83 e0 0f             	and    $0xf,%eax
801029a1:	c1 ea 04             	shr    $0x4,%edx
801029a4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029aa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801029ad:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b0:	89 c2                	mov    %eax,%edx
801029b2:	83 e0 0f             	and    $0xf,%eax
801029b5:	c1 ea 04             	shr    $0x4,%edx
801029b8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029bb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029be:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
801029c1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c4:	89 c2                	mov    %eax,%edx
801029c6:	83 e0 0f             	and    $0xf,%eax
801029c9:	c1 ea 04             	shr    $0x4,%edx
801029cc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cf:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029d5:	8b 75 08             	mov    0x8(%ebp),%esi
801029d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029db:	89 06                	mov    %eax,(%esi)
801029dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029e0:	89 46 04             	mov    %eax,0x4(%esi)
801029e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e6:	89 46 08             	mov    %eax,0x8(%esi)
801029e9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ec:	89 46 0c             	mov    %eax,0xc(%esi)
801029ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029f2:	89 46 10             	mov    %eax,0x10(%esi)
801029f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f8:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
801029fb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a05:	5b                   	pop    %ebx
80102a06:	5e                   	pop    %esi
80102a07:	5f                   	pop    %edi
80102a08:	5d                   	pop    %ebp
80102a09:	c3                   	ret    
80102a0a:	66 90                	xchg   %ax,%ax
80102a0c:	66 90                	xchg   %ax,%ax
80102a0e:	66 90                	xchg   %ax,%ax

80102a10 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a10:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
80102a16:	85 c9                	test   %ecx,%ecx
80102a18:	0f 8e 8a 00 00 00    	jle    80102aa8 <install_trans+0x98>
{
80102a1e:	55                   	push   %ebp
80102a1f:	89 e5                	mov    %esp,%ebp
80102a21:	57                   	push   %edi
80102a22:	56                   	push   %esi
80102a23:	53                   	push   %ebx
  for (tail = 0; tail < log.lh.n; tail++) {
80102a24:	31 db                	xor    %ebx,%ebx
{
80102a26:	83 ec 0c             	sub    $0xc,%esp
80102a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a30:	a1 d4 36 11 80       	mov    0x801136d4,%eax
80102a35:	83 ec 08             	sub    $0x8,%esp
80102a38:	01 d8                	add    %ebx,%eax
80102a3a:	83 c0 01             	add    $0x1,%eax
80102a3d:	50                   	push   %eax
80102a3e:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102a44:	e8 87 d6 ff ff       	call   801000d0 <bread>
80102a49:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a4b:	58                   	pop    %eax
80102a4c:	5a                   	pop    %edx
80102a4d:	ff 34 9d ec 36 11 80 	pushl  -0x7feec914(,%ebx,4)
80102a54:	ff 35 e4 36 11 80    	pushl  0x801136e4
  for (tail = 0; tail < log.lh.n; tail++) {
80102a5a:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a5d:	e8 6e d6 ff ff       	call   801000d0 <bread>
80102a62:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a64:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a67:	83 c4 0c             	add    $0xc,%esp
80102a6a:	68 00 02 00 00       	push   $0x200
80102a6f:	50                   	push   %eax
80102a70:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a73:	50                   	push   %eax
80102a74:	e8 d7 20 00 00       	call   80104b50 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a79:	89 34 24             	mov    %esi,(%esp)
80102a7c:	e8 1f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a81:	89 3c 24             	mov    %edi,(%esp)
80102a84:	e8 57 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	e8 4f d7 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102a91:	83 c4 10             	add    $0x10,%esp
80102a94:	39 1d e8 36 11 80    	cmp    %ebx,0x801136e8
80102a9a:	7f 94                	jg     80102a30 <install_trans+0x20>
  }
}
80102a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a9f:	5b                   	pop    %ebx
80102aa0:	5e                   	pop    %esi
80102aa1:	5f                   	pop    %edi
80102aa2:	5d                   	pop    %ebp
80102aa3:	c3                   	ret    
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa8:	f3 c3                	repz ret 
80102aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ab0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	56                   	push   %esi
80102ab4:	53                   	push   %ebx
  struct buf *buf = bread(log.dev, log.start);
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	ff 35 d4 36 11 80    	pushl  0x801136d4
80102abe:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102ac9:	8b 1d e8 36 11 80    	mov    0x801136e8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102acf:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102ad2:	89 c6                	mov    %eax,%esi
  for (i = 0; i < log.lh.n; i++) {
80102ad4:	85 db                	test   %ebx,%ebx
  hb->n = log.lh.n;
80102ad6:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102ad9:	7e 16                	jle    80102af1 <write_head+0x41>
80102adb:	c1 e3 02             	shl    $0x2,%ebx
80102ade:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102ae0:	8b 8a ec 36 11 80    	mov    -0x7feec914(%edx),%ecx
80102ae6:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102aea:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102aed:	39 da                	cmp    %ebx,%edx
80102aef:	75 ef                	jne    80102ae0 <write_head+0x30>
  }
  bwrite(buf);
80102af1:	83 ec 0c             	sub    $0xc,%esp
80102af4:	56                   	push   %esi
80102af5:	e8 a6 d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102afa:	89 34 24             	mov    %esi,(%esp)
80102afd:	e8 de d6 ff ff       	call   801001e0 <brelse>
}
80102b02:	83 c4 10             	add    $0x10,%esp
80102b05:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b08:	5b                   	pop    %ebx
80102b09:	5e                   	pop    %esi
80102b0a:	5d                   	pop    %ebp
80102b0b:	c3                   	ret    
80102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b10 <initlog>:
{
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 2c             	sub    $0x2c,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102b1a:	68 40 7b 10 80       	push   $0x80107b40
80102b1f:	68 a0 36 11 80       	push   $0x801136a0
80102b24:	e8 27 1d 00 00       	call   80104850 <initlock>
  readsb(dev, &sb);
80102b29:	58                   	pop    %eax
80102b2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 0b e9 ff ff       	call   80101440 <readsb>
  log.size = sb.nlog;
80102b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102b3b:	59                   	pop    %ecx
  log.dev = dev;
80102b3c:	89 1d e4 36 11 80    	mov    %ebx,0x801136e4
  log.size = sb.nlog;
80102b42:	89 15 d8 36 11 80    	mov    %edx,0x801136d8
  log.start = sb.logstart;
80102b48:	a3 d4 36 11 80       	mov    %eax,0x801136d4
  struct buf *buf = bread(log.dev, log.start);
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 7b d5 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102b55:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102b5d:	89 1d e8 36 11 80    	mov    %ebx,0x801136e8
  for (i = 0; i < log.lh.n; i++) {
80102b63:	7e 1c                	jle    80102b81 <initlog+0x71>
80102b65:	c1 e3 02             	shl    $0x2,%ebx
80102b68:	31 d2                	xor    %edx,%edx
80102b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102b70:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b74:	83 c2 04             	add    $0x4,%edx
80102b77:	89 8a e8 36 11 80    	mov    %ecx,-0x7feec918(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102b7d:	39 d3                	cmp    %edx,%ebx
80102b7f:	75 ef                	jne    80102b70 <initlog+0x60>
  brelse(buf);
80102b81:	83 ec 0c             	sub    $0xc,%esp
80102b84:	50                   	push   %eax
80102b85:	e8 56 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b8a:	e8 81 fe ff ff       	call   80102a10 <install_trans>
  log.lh.n = 0;
80102b8f:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102b96:	00 00 00 
  write_head(); // clear the log
80102b99:	e8 12 ff ff ff       	call   80102ab0 <write_head>
}
80102b9e:	83 c4 10             	add    $0x10,%esp
80102ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102bb6:	68 a0 36 11 80       	push   $0x801136a0
80102bbb:	e8 d0 1d 00 00       	call   80104990 <acquire>
80102bc0:	83 c4 10             	add    $0x10,%esp
80102bc3:	eb 18                	jmp    80102bdd <begin_op+0x2d>
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102bc8:	83 ec 08             	sub    $0x8,%esp
80102bcb:	68 a0 36 11 80       	push   $0x801136a0
80102bd0:	68 a0 36 11 80       	push   $0x801136a0
80102bd5:	e8 16 16 00 00       	call   801041f0 <sleep>
80102bda:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102bdd:	a1 e0 36 11 80       	mov    0x801136e0,%eax
80102be2:	85 c0                	test   %eax,%eax
80102be4:	75 e2                	jne    80102bc8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102be6:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102beb:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
80102bf1:	83 c0 01             	add    $0x1,%eax
80102bf4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bf7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bfa:	83 fa 1e             	cmp    $0x1e,%edx
80102bfd:	7f c9                	jg     80102bc8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bff:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102c02:	a3 dc 36 11 80       	mov    %eax,0x801136dc
      release(&log.lock);
80102c07:	68 a0 36 11 80       	push   $0x801136a0
80102c0c:	e8 3f 1e 00 00       	call   80104a50 <release>
      break;
    }
  }
}
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	c9                   	leave  
80102c15:	c3                   	ret    
80102c16:	8d 76 00             	lea    0x0(%esi),%esi
80102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c20 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c29:	68 a0 36 11 80       	push   $0x801136a0
80102c2e:	e8 5d 1d 00 00       	call   80104990 <acquire>
  log.outstanding -= 1;
80102c33:	a1 dc 36 11 80       	mov    0x801136dc,%eax
  if(log.committing)
80102c38:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80102c3e:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102c41:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102c44:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102c46:	89 1d dc 36 11 80    	mov    %ebx,0x801136dc
  if(log.committing)
80102c4c:	0f 85 1a 01 00 00    	jne    80102d6c <end_op+0x14c>
    panic("log.committing");
  if(log.outstanding == 0){
80102c52:	85 db                	test   %ebx,%ebx
80102c54:	0f 85 ee 00 00 00    	jne    80102d48 <end_op+0x128>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c5a:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102c5d:	c7 05 e0 36 11 80 01 	movl   $0x1,0x801136e0
80102c64:	00 00 00 
  release(&log.lock);
80102c67:	68 a0 36 11 80       	push   $0x801136a0
80102c6c:	e8 df 1d 00 00       	call   80104a50 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c71:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
80102c77:	83 c4 10             	add    $0x10,%esp
80102c7a:	85 c9                	test   %ecx,%ecx
80102c7c:	0f 8e 85 00 00 00    	jle    80102d07 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c82:	a1 d4 36 11 80       	mov    0x801136d4,%eax
80102c87:	83 ec 08             	sub    $0x8,%esp
80102c8a:	01 d8                	add    %ebx,%eax
80102c8c:	83 c0 01             	add    $0x1,%eax
80102c8f:	50                   	push   %eax
80102c90:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102c96:	e8 35 d4 ff ff       	call   801000d0 <bread>
80102c9b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c9d:	58                   	pop    %eax
80102c9e:	5a                   	pop    %edx
80102c9f:	ff 34 9d ec 36 11 80 	pushl  -0x7feec914(,%ebx,4)
80102ca6:	ff 35 e4 36 11 80    	pushl  0x801136e4
  for (tail = 0; tail < log.lh.n; tail++) {
80102cac:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102caf:	e8 1c d4 ff ff       	call   801000d0 <bread>
80102cb4:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102cb6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cb9:	83 c4 0c             	add    $0xc,%esp
80102cbc:	68 00 02 00 00       	push   $0x200
80102cc1:	50                   	push   %eax
80102cc2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cc5:	50                   	push   %eax
80102cc6:	e8 85 1e 00 00       	call   80104b50 <memmove>
    bwrite(to);  // write the log
80102ccb:	89 34 24             	mov    %esi,(%esp)
80102cce:	e8 cd d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cd3:	89 3c 24             	mov    %edi,(%esp)
80102cd6:	e8 05 d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102cdb:	89 34 24             	mov    %esi,(%esp)
80102cde:	e8 fd d4 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102ce3:	83 c4 10             	add    $0x10,%esp
80102ce6:	3b 1d e8 36 11 80    	cmp    0x801136e8,%ebx
80102cec:	7c 94                	jl     80102c82 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cee:	e8 bd fd ff ff       	call   80102ab0 <write_head>
    install_trans(); // Now install writes to home locations
80102cf3:	e8 18 fd ff ff       	call   80102a10 <install_trans>
    log.lh.n = 0;
80102cf8:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102cff:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d02:	e8 a9 fd ff ff       	call   80102ab0 <write_head>
    acquire(&log.lock);
80102d07:	83 ec 0c             	sub    $0xc,%esp
80102d0a:	68 a0 36 11 80       	push   $0x801136a0
80102d0f:	e8 7c 1c 00 00       	call   80104990 <acquire>
    wakeup(&log);
80102d14:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
    log.committing = 0;
80102d1b:	c7 05 e0 36 11 80 00 	movl   $0x0,0x801136e0
80102d22:	00 00 00 
    wakeup(&log);
80102d25:	e8 b6 16 00 00       	call   801043e0 <wakeup>
    release(&log.lock);
80102d2a:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102d31:	e8 1a 1d 00 00       	call   80104a50 <release>
80102d36:	83 c4 10             	add    $0x10,%esp
}
80102d39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d3c:	5b                   	pop    %ebx
80102d3d:	5e                   	pop    %esi
80102d3e:	5f                   	pop    %edi
80102d3f:	5d                   	pop    %ebp
80102d40:	c3                   	ret    
80102d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&log);
80102d48:	83 ec 0c             	sub    $0xc,%esp
80102d4b:	68 a0 36 11 80       	push   $0x801136a0
80102d50:	e8 8b 16 00 00       	call   801043e0 <wakeup>
  release(&log.lock);
80102d55:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102d5c:	e8 ef 1c 00 00       	call   80104a50 <release>
80102d61:	83 c4 10             	add    $0x10,%esp
}
80102d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d67:	5b                   	pop    %ebx
80102d68:	5e                   	pop    %esi
80102d69:	5f                   	pop    %edi
80102d6a:	5d                   	pop    %ebp
80102d6b:	c3                   	ret    
    panic("log.committing");
80102d6c:	83 ec 0c             	sub    $0xc,%esp
80102d6f:	68 44 7b 10 80       	push   $0x80107b44
80102d74:	e8 17 d6 ff ff       	call   80100390 <panic>
80102d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102d80 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	53                   	push   %ebx
80102d84:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d87:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
{
80102d8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d90:	83 fa 1d             	cmp    $0x1d,%edx
80102d93:	0f 8f 9d 00 00 00    	jg     80102e36 <log_write+0xb6>
80102d99:	a1 d8 36 11 80       	mov    0x801136d8,%eax
80102d9e:	83 e8 01             	sub    $0x1,%eax
80102da1:	39 c2                	cmp    %eax,%edx
80102da3:	0f 8d 8d 00 00 00    	jge    80102e36 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102da9:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102dae:	85 c0                	test   %eax,%eax
80102db0:	0f 8e 8d 00 00 00    	jle    80102e43 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102db6:	83 ec 0c             	sub    $0xc,%esp
80102db9:	68 a0 36 11 80       	push   $0x801136a0
80102dbe:	e8 cd 1b 00 00       	call   80104990 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102dc3:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
80102dc9:	83 c4 10             	add    $0x10,%esp
80102dcc:	83 f9 00             	cmp    $0x0,%ecx
80102dcf:	7e 57                	jle    80102e28 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dd1:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102dd4:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dd6:	3b 15 ec 36 11 80    	cmp    0x801136ec,%edx
80102ddc:	75 0b                	jne    80102de9 <log_write+0x69>
80102dde:	eb 38                	jmp    80102e18 <log_write+0x98>
80102de0:	39 14 85 ec 36 11 80 	cmp    %edx,-0x7feec914(,%eax,4)
80102de7:	74 2f                	je     80102e18 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102de9:	83 c0 01             	add    $0x1,%eax
80102dec:	39 c1                	cmp    %eax,%ecx
80102dee:	75 f0                	jne    80102de0 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102df0:	89 14 85 ec 36 11 80 	mov    %edx,-0x7feec914(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102df7:	83 c0 01             	add    $0x1,%eax
80102dfa:	a3 e8 36 11 80       	mov    %eax,0x801136e8
  b->flags |= B_DIRTY; // prevent eviction
80102dff:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e02:	c7 45 08 a0 36 11 80 	movl   $0x801136a0,0x8(%ebp)
}
80102e09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e0c:	c9                   	leave  
  release(&log.lock);
80102e0d:	e9 3e 1c 00 00       	jmp    80104a50 <release>
80102e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102e18:	89 14 85 ec 36 11 80 	mov    %edx,-0x7feec914(,%eax,4)
80102e1f:	eb de                	jmp    80102dff <log_write+0x7f>
80102e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e28:	8b 43 08             	mov    0x8(%ebx),%eax
80102e2b:	a3 ec 36 11 80       	mov    %eax,0x801136ec
  if (i == log.lh.n)
80102e30:	75 cd                	jne    80102dff <log_write+0x7f>
80102e32:	31 c0                	xor    %eax,%eax
80102e34:	eb c1                	jmp    80102df7 <log_write+0x77>
    panic("too big a transaction");
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 53 7b 10 80       	push   $0x80107b53
80102e3e:	e8 4d d5 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102e43:	83 ec 0c             	sub    $0xc,%esp
80102e46:	68 69 7b 10 80       	push   $0x80107b69
80102e4b:	e8 40 d5 ff ff       	call   80100390 <panic>

80102e50 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e57:	e8 a4 08 00 00       	call   80103700 <cpuid>
80102e5c:	89 c3                	mov    %eax,%ebx
80102e5e:	e8 9d 08 00 00       	call   80103700 <cpuid>
80102e63:	83 ec 04             	sub    $0x4,%esp
80102e66:	53                   	push   %ebx
80102e67:	50                   	push   %eax
80102e68:	68 84 7b 10 80       	push   $0x80107b84
80102e6d:	e8 ee d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e72:	e8 19 30 00 00       	call   80105e90 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e77:	e8 04 08 00 00       	call   80103680 <mycpu>
80102e7c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e7e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e83:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e8a:	e8 d1 0f 00 00       	call   80103e60 <scheduler>
80102e8f:	90                   	nop

80102e90 <mpenter>:
{
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e96:	e8 05 41 00 00       	call   80106fa0 <switchkvm>
  seginit();
80102e9b:	e8 70 40 00 00       	call   80106f10 <seginit>
  lapicinit();
80102ea0:	e8 9b f7 ff ff       	call   80102640 <lapicinit>
  mpmain();
80102ea5:	e8 a6 ff ff ff       	call   80102e50 <mpmain>
80102eaa:	66 90                	xchg   %ax,%ax
80102eac:	66 90                	xchg   %ax,%ax
80102eae:	66 90                	xchg   %ax,%ax

80102eb0 <main>:
{
80102eb0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102eb4:	83 e4 f0             	and    $0xfffffff0,%esp
80102eb7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eba:	55                   	push   %ebp
80102ebb:	89 e5                	mov    %esp,%ebp
80102ebd:	53                   	push   %ebx
80102ebe:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102ebf:	83 ec 08             	sub    $0x8,%esp
80102ec2:	68 00 00 40 80       	push   $0x80400000
80102ec7:	68 c8 6c 11 80       	push   $0x80116cc8
80102ecc:	e8 2f f5 ff ff       	call   80102400 <kinit1>
  kvmalloc();      // kernel page table
80102ed1:	e8 9a 45 00 00       	call   80107470 <kvmalloc>
  mpinit();        // detect other processors
80102ed6:	e8 75 01 00 00       	call   80103050 <mpinit>
  lapicinit();     // interrupt controller
80102edb:	e8 60 f7 ff ff       	call   80102640 <lapicinit>
  seginit();       // segment descriptors
80102ee0:	e8 2b 40 00 00       	call   80106f10 <seginit>
  picinit();       // disable pic
80102ee5:	e8 46 03 00 00       	call   80103230 <picinit>
  ioapicinit();    // another interrupt controller
80102eea:	e8 41 f3 ff ff       	call   80102230 <ioapicinit>
  consoleinit();   // console hardware
80102eef:	e8 cc da ff ff       	call   801009c0 <consoleinit>
  uartinit();      // serial port
80102ef4:	e8 e7 32 00 00       	call   801061e0 <uartinit>
  pinit();         // process table
80102ef9:	e8 62 07 00 00       	call   80103660 <pinit>
  tvinit();        // trap vectors
80102efe:	e8 0d 2f 00 00       	call   80105e10 <tvinit>
  binit();         // buffer cache
80102f03:	e8 38 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f08:	e8 53 de ff ff       	call   80100d60 <fileinit>
  ideinit();       // disk 
80102f0d:	e8 fe f0 ff ff       	call   80102010 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f12:	83 c4 0c             	add    $0xc,%esp
80102f15:	68 8a 00 00 00       	push   $0x8a
80102f1a:	68 8c b4 10 80       	push   $0x8010b48c
80102f1f:	68 00 70 00 80       	push   $0x80007000
80102f24:	e8 27 1c 00 00       	call   80104b50 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f29:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102f30:	00 00 00 
80102f33:	83 c4 10             	add    $0x10,%esp
80102f36:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102f3b:	3d a0 37 11 80       	cmp    $0x801137a0,%eax
80102f40:	76 71                	jbe    80102fb3 <main+0x103>
80102f42:	bb a0 37 11 80       	mov    $0x801137a0,%ebx
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80102f50:	e8 2b 07 00 00       	call   80103680 <mycpu>
80102f55:	39 d8                	cmp    %ebx,%eax
80102f57:	74 41                	je     80102f9a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f59:	e8 72 f5 ff ff       	call   801024d0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f5e:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102f63:	c7 05 f8 6f 00 80 90 	movl   $0x80102e90,0x80006ff8
80102f6a:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f6d:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102f74:	a0 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f77:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102f7c:	0f b6 03             	movzbl (%ebx),%eax
80102f7f:	83 ec 08             	sub    $0x8,%esp
80102f82:	68 00 70 00 00       	push   $0x7000
80102f87:	50                   	push   %eax
80102f88:	e8 03 f8 ff ff       	call   80102790 <lapicstartap>
80102f8d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f90:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f96:	85 c0                	test   %eax,%eax
80102f98:	74 f6                	je     80102f90 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102f9a:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102fa1:	00 00 00 
80102fa4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102faa:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102faf:	39 c3                	cmp    %eax,%ebx
80102fb1:	72 9d                	jb     80102f50 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102fb3:	83 ec 08             	sub    $0x8,%esp
80102fb6:	68 00 00 00 8e       	push   $0x8e000000
80102fbb:	68 00 00 40 80       	push   $0x80400000
80102fc0:	e8 ab f4 ff ff       	call   80102470 <kinit2>
  userinit();      // first user process
80102fc5:	e8 96 09 00 00       	call   80103960 <userinit>
  mpmain();        // finish this processor's setup
80102fca:	e8 81 fe ff ff       	call   80102e50 <mpmain>
80102fcf:	90                   	nop

80102fd0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	57                   	push   %edi
80102fd4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fd5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
80102fdb:	53                   	push   %ebx
  e = addr+len;
80102fdc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
80102fdf:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80102fe2:	39 de                	cmp    %ebx,%esi
80102fe4:	72 10                	jb     80102ff6 <mpsearch1+0x26>
80102fe6:	eb 50                	jmp    80103038 <mpsearch1+0x68>
80102fe8:	90                   	nop
80102fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	76 42                	jbe    80103038 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102ff6:	83 ec 04             	sub    $0x4,%esp
80102ff9:	8d 7e 10             	lea    0x10(%esi),%edi
80102ffc:	6a 04                	push   $0x4
80102ffe:	68 98 7b 10 80       	push   $0x80107b98
80103003:	56                   	push   %esi
80103004:	e8 e7 1a 00 00       	call   80104af0 <memcmp>
80103009:	83 c4 10             	add    $0x10,%esp
8010300c:	85 c0                	test   %eax,%eax
8010300e:	75 e0                	jne    80102ff0 <mpsearch1+0x20>
80103010:	89 f1                	mov    %esi,%ecx
80103012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
80103018:	0f b6 11             	movzbl (%ecx),%edx
8010301b:	83 c1 01             	add    $0x1,%ecx
8010301e:	01 d0                	add    %edx,%eax
  for(i=0; i<len; i++)
80103020:	39 f9                	cmp    %edi,%ecx
80103022:	75 f4                	jne    80103018 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103024:	84 c0                	test   %al,%al
80103026:	75 c8                	jne    80102ff0 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80103028:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010302b:	89 f0                	mov    %esi,%eax
8010302d:	5b                   	pop    %ebx
8010302e:	5e                   	pop    %esi
8010302f:	5f                   	pop    %edi
80103030:	5d                   	pop    %ebp
80103031:	c3                   	ret    
80103032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103038:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010303b:	31 f6                	xor    %esi,%esi
}
8010303d:	89 f0                	mov    %esi,%eax
8010303f:	5b                   	pop    %ebx
80103040:	5e                   	pop    %esi
80103041:	5f                   	pop    %edi
80103042:	5d                   	pop    %ebp
80103043:	c3                   	ret    
80103044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010304a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103050 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	53                   	push   %ebx
80103056:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103059:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103060:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103067:	c1 e0 08             	shl    $0x8,%eax
8010306a:	09 d0                	or     %edx,%eax
8010306c:	c1 e0 04             	shl    $0x4,%eax
8010306f:	85 c0                	test   %eax,%eax
80103071:	75 1b                	jne    8010308e <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103073:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010307a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103081:	c1 e0 08             	shl    $0x8,%eax
80103084:	09 d0                	or     %edx,%eax
80103086:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103089:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010308e:	ba 00 04 00 00       	mov    $0x400,%edx
80103093:	e8 38 ff ff ff       	call   80102fd0 <mpsearch1>
80103098:	85 c0                	test   %eax,%eax
8010309a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010309d:	0f 84 3d 01 00 00    	je     801031e0 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801030a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030a6:	8b 58 04             	mov    0x4(%eax),%ebx
801030a9:	85 db                	test   %ebx,%ebx
801030ab:	0f 84 4f 01 00 00    	je     80103200 <mpinit+0x1b0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030b1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
801030b7:	83 ec 04             	sub    $0x4,%esp
801030ba:	6a 04                	push   $0x4
801030bc:	68 b5 7b 10 80       	push   $0x80107bb5
801030c1:	56                   	push   %esi
801030c2:	e8 29 1a 00 00       	call   80104af0 <memcmp>
801030c7:	83 c4 10             	add    $0x10,%esp
801030ca:	85 c0                	test   %eax,%eax
801030cc:	0f 85 2e 01 00 00    	jne    80103200 <mpinit+0x1b0>
  if(conf->version != 1 && conf->version != 4)
801030d2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030d9:	3c 01                	cmp    $0x1,%al
801030db:	0f 95 c2             	setne  %dl
801030de:	3c 04                	cmp    $0x4,%al
801030e0:	0f 95 c0             	setne  %al
801030e3:	20 c2                	and    %al,%dl
801030e5:	0f 85 15 01 00 00    	jne    80103200 <mpinit+0x1b0>
  if(sum((uchar*)conf, conf->length) != 0)
801030eb:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
801030f2:	66 85 ff             	test   %di,%di
801030f5:	74 1a                	je     80103111 <mpinit+0xc1>
801030f7:	89 f0                	mov    %esi,%eax
801030f9:	01 f7                	add    %esi,%edi
  sum = 0;
801030fb:	31 d2                	xor    %edx,%edx
801030fd:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
80103100:	0f b6 08             	movzbl (%eax),%ecx
80103103:	83 c0 01             	add    $0x1,%eax
80103106:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80103108:	39 c7                	cmp    %eax,%edi
8010310a:	75 f4                	jne    80103100 <mpinit+0xb0>
8010310c:	84 d2                	test   %dl,%dl
8010310e:	0f 95 c2             	setne  %dl
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103111:	85 f6                	test   %esi,%esi
80103113:	0f 84 e7 00 00 00    	je     80103200 <mpinit+0x1b0>
80103119:	84 d2                	test   %dl,%dl
8010311b:	0f 85 df 00 00 00    	jne    80103200 <mpinit+0x1b0>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80103121:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103127:	a3 9c 36 11 80       	mov    %eax,0x8011369c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010312c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103133:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
80103139:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010313e:	01 d6                	add    %edx,%esi
80103140:	39 c6                	cmp    %eax,%esi
80103142:	76 23                	jbe    80103167 <mpinit+0x117>
    switch(*p){
80103144:	0f b6 10             	movzbl (%eax),%edx
80103147:	80 fa 04             	cmp    $0x4,%dl
8010314a:	0f 87 ca 00 00 00    	ja     8010321a <mpinit+0x1ca>
80103150:	ff 24 95 dc 7b 10 80 	jmp    *-0x7fef8424(,%edx,4)
80103157:	89 f6                	mov    %esi,%esi
80103159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103160:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103163:	39 c6                	cmp    %eax,%esi
80103165:	77 dd                	ja     80103144 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103167:	85 db                	test   %ebx,%ebx
80103169:	0f 84 9e 00 00 00    	je     8010320d <mpinit+0x1bd>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010316f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103172:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103176:	74 15                	je     8010318d <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103178:	b8 70 00 00 00       	mov    $0x70,%eax
8010317d:	ba 22 00 00 00       	mov    $0x22,%edx
80103182:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103183:	ba 23 00 00 00       	mov    $0x23,%edx
80103188:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103189:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010318c:	ee                   	out    %al,(%dx)
  }
}
8010318d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103190:	5b                   	pop    %ebx
80103191:	5e                   	pop    %esi
80103192:	5f                   	pop    %edi
80103193:	5d                   	pop    %ebp
80103194:	c3                   	ret    
80103195:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80103198:	8b 0d 20 3d 11 80    	mov    0x80113d20,%ecx
8010319e:	83 f9 07             	cmp    $0x7,%ecx
801031a1:	7f 19                	jg     801031bc <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031a3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031a7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
801031ad:	83 c1 01             	add    $0x1,%ecx
801031b0:	89 0d 20 3d 11 80    	mov    %ecx,0x80113d20
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031b6:	88 97 a0 37 11 80    	mov    %dl,-0x7feec860(%edi)
      p += sizeof(struct mpproc);
801031bc:	83 c0 14             	add    $0x14,%eax
      continue;
801031bf:	e9 7c ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
801031c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801031cc:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
801031cf:	88 15 80 37 11 80    	mov    %dl,0x80113780
      continue;
801031d5:	e9 66 ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return mpsearch1(0xF0000, 0x10000);
801031e0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031e5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ea:	e8 e1 fd ff ff       	call   80102fd0 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031ef:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
801031f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031f4:	0f 85 a9 fe ff ff    	jne    801030a3 <mpinit+0x53>
801031fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
80103200:	83 ec 0c             	sub    $0xc,%esp
80103203:	68 9d 7b 10 80       	push   $0x80107b9d
80103208:	e8 83 d1 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010320d:	83 ec 0c             	sub    $0xc,%esp
80103210:	68 bc 7b 10 80       	push   $0x80107bbc
80103215:	e8 76 d1 ff ff       	call   80100390 <panic>
      ismp = 0;
8010321a:	31 db                	xor    %ebx,%ebx
8010321c:	e9 26 ff ff ff       	jmp    80103147 <mpinit+0xf7>
80103221:	66 90                	xchg   %ax,%ax
80103223:	66 90                	xchg   %ax,%ax
80103225:	66 90                	xchg   %ax,%ax
80103227:	66 90                	xchg   %ax,%ax
80103229:	66 90                	xchg   %ax,%ax
8010322b:	66 90                	xchg   %ax,%ax
8010322d:	66 90                	xchg   %ax,%ax
8010322f:	90                   	nop

80103230 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103230:	55                   	push   %ebp
80103231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103236:	ba 21 00 00 00       	mov    $0x21,%edx
8010323b:	89 e5                	mov    %esp,%ebp
8010323d:	ee                   	out    %al,(%dx)
8010323e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103243:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103244:	5d                   	pop    %ebp
80103245:	c3                   	ret    
80103246:	66 90                	xchg   %ax,%ax
80103248:	66 90                	xchg   %ax,%ax
8010324a:	66 90                	xchg   %ax,%ax
8010324c:	66 90                	xchg   %ax,%ax
8010324e:	66 90                	xchg   %ax,%ax

80103250 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103250:	55                   	push   %ebp
80103251:	89 e5                	mov    %esp,%ebp
80103253:	57                   	push   %edi
80103254:	56                   	push   %esi
80103255:	53                   	push   %ebx
80103256:	83 ec 0c             	sub    $0xc,%esp
80103259:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010325c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010325f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103265:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010326b:	e8 10 db ff ff       	call   80100d80 <filealloc>
80103270:	85 c0                	test   %eax,%eax
80103272:	89 03                	mov    %eax,(%ebx)
80103274:	74 22                	je     80103298 <pipealloc+0x48>
80103276:	e8 05 db ff ff       	call   80100d80 <filealloc>
8010327b:	85 c0                	test   %eax,%eax
8010327d:	89 06                	mov    %eax,(%esi)
8010327f:	74 3f                	je     801032c0 <pipealloc+0x70>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103281:	e8 4a f2 ff ff       	call   801024d0 <kalloc>
80103286:	85 c0                	test   %eax,%eax
80103288:	89 c7                	mov    %eax,%edi
8010328a:	75 54                	jne    801032e0 <pipealloc+0x90>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
8010328c:	8b 03                	mov    (%ebx),%eax
8010328e:	85 c0                	test   %eax,%eax
80103290:	75 34                	jne    801032c6 <pipealloc+0x76>
80103292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    fileclose(*f0);
  if(*f1)
80103298:	8b 06                	mov    (%esi),%eax
8010329a:	85 c0                	test   %eax,%eax
8010329c:	74 0c                	je     801032aa <pipealloc+0x5a>
    fileclose(*f1);
8010329e:	83 ec 0c             	sub    $0xc,%esp
801032a1:	50                   	push   %eax
801032a2:	e8 99 db ff ff       	call   80100e40 <fileclose>
801032a7:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801032ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032b2:	5b                   	pop    %ebx
801032b3:	5e                   	pop    %esi
801032b4:	5f                   	pop    %edi
801032b5:	5d                   	pop    %ebp
801032b6:	c3                   	ret    
801032b7:	89 f6                	mov    %esi,%esi
801032b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(*f0)
801032c0:	8b 03                	mov    (%ebx),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 e4                	je     801032aa <pipealloc+0x5a>
    fileclose(*f0);
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 71 db ff ff       	call   80100e40 <fileclose>
  if(*f1)
801032cf:	8b 06                	mov    (%esi),%eax
    fileclose(*f0);
801032d1:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032d4:	85 c0                	test   %eax,%eax
801032d6:	75 c6                	jne    8010329e <pipealloc+0x4e>
801032d8:	eb d0                	jmp    801032aa <pipealloc+0x5a>
801032da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  initlock(&p->lock, "pipe");
801032e0:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
801032e3:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032ea:	00 00 00 
  p->writeopen = 1;
801032ed:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801032f4:	00 00 00 
  p->nwrite = 0;
801032f7:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801032fe:	00 00 00 
  p->nread = 0;
80103301:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103308:	00 00 00 
  initlock(&p->lock, "pipe");
8010330b:	68 f0 7b 10 80       	push   $0x80107bf0
80103310:	50                   	push   %eax
80103311:	e8 3a 15 00 00       	call   80104850 <initlock>
  (*f0)->type = FD_PIPE;
80103316:	8b 03                	mov    (%ebx),%eax
  return 0;
80103318:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
8010331b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103321:	8b 03                	mov    (%ebx),%eax
80103323:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103327:	8b 03                	mov    (%ebx),%eax
80103329:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
8010332d:	8b 03                	mov    (%ebx),%eax
8010332f:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103332:	8b 06                	mov    (%esi),%eax
80103334:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103340:	8b 06                	mov    (%esi),%eax
80103342:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103346:	8b 06                	mov    (%esi),%eax
80103348:	89 78 0c             	mov    %edi,0xc(%eax)
}
8010334b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010334e:	31 c0                	xor    %eax,%eax
}
80103350:	5b                   	pop    %ebx
80103351:	5e                   	pop    %esi
80103352:	5f                   	pop    %edi
80103353:	5d                   	pop    %ebp
80103354:	c3                   	ret    
80103355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103360 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	56                   	push   %esi
80103364:	53                   	push   %ebx
80103365:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103368:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010336b:	83 ec 0c             	sub    $0xc,%esp
8010336e:	53                   	push   %ebx
8010336f:	e8 1c 16 00 00       	call   80104990 <acquire>
  if(writable){
80103374:	83 c4 10             	add    $0x10,%esp
80103377:	85 f6                	test   %esi,%esi
80103379:	74 45                	je     801033c0 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010337b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103381:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103384:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010338b:	00 00 00 
    wakeup(&p->nread);
8010338e:	50                   	push   %eax
8010338f:	e8 4c 10 00 00       	call   801043e0 <wakeup>
80103394:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103397:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010339d:	85 d2                	test   %edx,%edx
8010339f:	75 0a                	jne    801033ab <pipeclose+0x4b>
801033a1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033a7:	85 c0                	test   %eax,%eax
801033a9:	74 35                	je     801033e0 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801033ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033b1:	5b                   	pop    %ebx
801033b2:	5e                   	pop    %esi
801033b3:	5d                   	pop    %ebp
    release(&p->lock);
801033b4:	e9 97 16 00 00       	jmp    80104a50 <release>
801033b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801033c0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801033c6:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
801033c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033d0:	00 00 00 
    wakeup(&p->nwrite);
801033d3:	50                   	push   %eax
801033d4:	e8 07 10 00 00       	call   801043e0 <wakeup>
801033d9:	83 c4 10             	add    $0x10,%esp
801033dc:	eb b9                	jmp    80103397 <pipeclose+0x37>
801033de:	66 90                	xchg   %ax,%ax
    release(&p->lock);
801033e0:	83 ec 0c             	sub    $0xc,%esp
801033e3:	53                   	push   %ebx
801033e4:	e8 67 16 00 00       	call   80104a50 <release>
    kfree((char*)p);
801033e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ec:	83 c4 10             	add    $0x10,%esp
}
801033ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033f2:	5b                   	pop    %ebx
801033f3:	5e                   	pop    %esi
801033f4:	5d                   	pop    %ebp
    kfree((char*)p);
801033f5:	e9 26 ef ff ff       	jmp    80102320 <kfree>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103400 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	57                   	push   %edi
80103404:	56                   	push   %esi
80103405:	53                   	push   %ebx
80103406:	83 ec 28             	sub    $0x28,%esp
80103409:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010340c:	53                   	push   %ebx
8010340d:	e8 7e 15 00 00       	call   80104990 <acquire>
  for(i = 0; i < n; i++){
80103412:	8b 45 10             	mov    0x10(%ebp),%eax
80103415:	83 c4 10             	add    $0x10,%esp
80103418:	85 c0                	test   %eax,%eax
8010341a:	0f 8e c9 00 00 00    	jle    801034e9 <pipewrite+0xe9>
80103420:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103423:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103429:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010342f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103432:	03 4d 10             	add    0x10(%ebp),%ecx
80103435:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103438:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010343e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103444:	39 d0                	cmp    %edx,%eax
80103446:	75 71                	jne    801034b9 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
80103448:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010344e:	85 c0                	test   %eax,%eax
80103450:	74 4e                	je     801034a0 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103452:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103458:	eb 3a                	jmp    80103494 <pipewrite+0x94>
8010345a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	57                   	push   %edi
80103464:	e8 77 0f 00 00       	call   801043e0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103469:	5a                   	pop    %edx
8010346a:	59                   	pop    %ecx
8010346b:	53                   	push   %ebx
8010346c:	56                   	push   %esi
8010346d:	e8 7e 0d 00 00       	call   801041f0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103472:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103478:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010347e:	83 c4 10             	add    $0x10,%esp
80103481:	05 00 02 00 00       	add    $0x200,%eax
80103486:	39 c2                	cmp    %eax,%edx
80103488:	75 36                	jne    801034c0 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010348a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103490:	85 c0                	test   %eax,%eax
80103492:	74 0c                	je     801034a0 <pipewrite+0xa0>
80103494:	e8 87 02 00 00       	call   80103720 <myproc>
80103499:	8b 40 44             	mov    0x44(%eax),%eax
8010349c:	85 c0                	test   %eax,%eax
8010349e:	74 c0                	je     80103460 <pipewrite+0x60>
        release(&p->lock);
801034a0:	83 ec 0c             	sub    $0xc,%esp
801034a3:	53                   	push   %ebx
801034a4:	e8 a7 15 00 00       	call   80104a50 <release>
        return -1;
801034a9:	83 c4 10             	add    $0x10,%esp
801034ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801034b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034b4:	5b                   	pop    %ebx
801034b5:	5e                   	pop    %esi
801034b6:	5f                   	pop    %edi
801034b7:	5d                   	pop    %ebp
801034b8:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034b9:	89 c2                	mov    %eax,%edx
801034bb:	90                   	nop
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034c0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801034c3:	8d 42 01             	lea    0x1(%edx),%eax
801034c6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801034cc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801034d2:	83 c6 01             	add    $0x1,%esi
801034d5:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
  for(i = 0; i < n; i++){
801034d9:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801034dc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034df:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801034e3:	0f 85 4f ff ff ff    	jne    80103438 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801034e9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034ef:	83 ec 0c             	sub    $0xc,%esp
801034f2:	50                   	push   %eax
801034f3:	e8 e8 0e 00 00       	call   801043e0 <wakeup>
  release(&p->lock);
801034f8:	89 1c 24             	mov    %ebx,(%esp)
801034fb:	e8 50 15 00 00       	call   80104a50 <release>
  return n;
80103500:	83 c4 10             	add    $0x10,%esp
80103503:	8b 45 10             	mov    0x10(%ebp),%eax
80103506:	eb a9                	jmp    801034b1 <pipewrite+0xb1>
80103508:	90                   	nop
80103509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103510 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 18             	sub    $0x18,%esp
80103519:	8b 75 08             	mov    0x8(%ebp),%esi
8010351c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010351f:	56                   	push   %esi
80103520:	e8 6b 14 00 00       	call   80104990 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010352e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103534:	75 6a                	jne    801035a0 <piperead+0x90>
80103536:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010353c:	85 db                	test   %ebx,%ebx
8010353e:	0f 84 c4 00 00 00    	je     80103608 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103544:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010354a:	eb 2d                	jmp    80103579 <piperead+0x69>
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	83 ec 08             	sub    $0x8,%esp
80103553:	56                   	push   %esi
80103554:	53                   	push   %ebx
80103555:	e8 96 0c 00 00       	call   801041f0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010355a:	83 c4 10             	add    $0x10,%esp
8010355d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103563:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103569:	75 35                	jne    801035a0 <piperead+0x90>
8010356b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103571:	85 d2                	test   %edx,%edx
80103573:	0f 84 8f 00 00 00    	je     80103608 <piperead+0xf8>
    if(myproc()->killed){
80103579:	e8 a2 01 00 00       	call   80103720 <myproc>
8010357e:	8b 48 44             	mov    0x44(%eax),%ecx
80103581:	85 c9                	test   %ecx,%ecx
80103583:	74 cb                	je     80103550 <piperead+0x40>
      release(&p->lock);
80103585:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103588:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010358d:	56                   	push   %esi
8010358e:	e8 bd 14 00 00       	call   80104a50 <release>
      return -1;
80103593:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103599:	89 d8                	mov    %ebx,%eax
8010359b:	5b                   	pop    %ebx
8010359c:	5e                   	pop    %esi
8010359d:	5f                   	pop    %edi
8010359e:	5d                   	pop    %ebp
8010359f:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035a0:	8b 45 10             	mov    0x10(%ebp),%eax
801035a3:	85 c0                	test   %eax,%eax
801035a5:	7e 61                	jle    80103608 <piperead+0xf8>
    if(p->nread == p->nwrite)
801035a7:	31 db                	xor    %ebx,%ebx
801035a9:	eb 13                	jmp    801035be <piperead+0xae>
801035ab:	90                   	nop
801035ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035b0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035b6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035bc:	74 1f                	je     801035dd <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
801035be:	8d 41 01             	lea    0x1(%ecx),%eax
801035c1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801035c7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801035cd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801035d2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035d5:	83 c3 01             	add    $0x1,%ebx
801035d8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801035db:	75 d3                	jne    801035b0 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801035dd:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	50                   	push   %eax
801035e7:	e8 f4 0d 00 00       	call   801043e0 <wakeup>
  release(&p->lock);
801035ec:	89 34 24             	mov    %esi,(%esp)
801035ef:	e8 5c 14 00 00       	call   80104a50 <release>
  return i;
801035f4:	83 c4 10             	add    $0x10,%esp
}
801035f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035fa:	89 d8                	mov    %ebx,%eax
801035fc:	5b                   	pop    %ebx
801035fd:	5e                   	pop    %esi
801035fe:	5f                   	pop    %edi
801035ff:	5d                   	pop    %ebp
80103600:	c3                   	ret    
80103601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103608:	31 db                	xor    %ebx,%ebx
8010360a:	eb d1                	jmp    801035dd <piperead+0xcd>
8010360c:	66 90                	xchg   %ax,%ax
8010360e:	66 90                	xchg   %ax,%ax

80103610 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103616:	68 40 3d 11 80       	push   $0x80113d40
8010361b:	e8 30 14 00 00       	call   80104a50 <release>

  if (first) {
80103620:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103625:	83 c4 10             	add    $0x10,%esp
80103628:	85 c0                	test   %eax,%eax
8010362a:	75 04                	jne    80103630 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010362c:	c9                   	leave  
8010362d:	c3                   	ret    
8010362e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103630:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103633:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
8010363a:	00 00 00 
    iinit(ROOTDEV);
8010363d:	6a 01                	push   $0x1
8010363f:	e8 3c de ff ff       	call   80101480 <iinit>
    initlog(ROOTDEV);
80103644:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010364b:	e8 c0 f4 ff ff       	call   80102b10 <initlog>
80103650:	83 c4 10             	add    $0x10,%esp
}
80103653:	c9                   	leave  
80103654:	c3                   	ret    
80103655:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103660 <pinit>:
{
80103660:	55                   	push   %ebp
80103661:	89 e5                	mov    %esp,%ebp
80103663:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103666:	68 f5 7b 10 80       	push   $0x80107bf5
8010366b:	68 40 3d 11 80       	push   $0x80113d40
80103670:	e8 db 11 00 00       	call   80104850 <initlock>
}
80103675:	83 c4 10             	add    $0x10,%esp
80103678:	c9                   	leave  
80103679:	c3                   	ret    
8010367a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103680 <mycpu>:
{
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	56                   	push   %esi
80103684:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103685:	9c                   	pushf  
80103686:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103687:	f6 c4 02             	test   $0x2,%ah
8010368a:	75 5e                	jne    801036ea <mycpu+0x6a>
  apicid = lapicid();
8010368c:	e8 af f0 ff ff       	call   80102740 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103691:	8b 35 20 3d 11 80    	mov    0x80113d20,%esi
80103697:	85 f6                	test   %esi,%esi
80103699:	7e 42                	jle    801036dd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010369b:	0f b6 15 a0 37 11 80 	movzbl 0x801137a0,%edx
801036a2:	39 d0                	cmp    %edx,%eax
801036a4:	74 30                	je     801036d6 <mycpu+0x56>
801036a6:	b9 50 38 11 80       	mov    $0x80113850,%ecx
  for (i = 0; i < ncpu; ++i) {
801036ab:	31 d2                	xor    %edx,%edx
801036ad:	8d 76 00             	lea    0x0(%esi),%esi
801036b0:	83 c2 01             	add    $0x1,%edx
801036b3:	39 f2                	cmp    %esi,%edx
801036b5:	74 26                	je     801036dd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801036b7:	0f b6 19             	movzbl (%ecx),%ebx
801036ba:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801036c0:	39 c3                	cmp    %eax,%ebx
801036c2:	75 ec                	jne    801036b0 <mycpu+0x30>
801036c4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
801036ca:	05 a0 37 11 80       	add    $0x801137a0,%eax
}
801036cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801036d2:	5b                   	pop    %ebx
801036d3:	5e                   	pop    %esi
801036d4:	5d                   	pop    %ebp
801036d5:	c3                   	ret    
    if (cpus[i].apicid == apicid)
801036d6:	b8 a0 37 11 80       	mov    $0x801137a0,%eax
      return &cpus[i];
801036db:	eb f2                	jmp    801036cf <mycpu+0x4f>
  panic("unknown apicid\n");
801036dd:	83 ec 0c             	sub    $0xc,%esp
801036e0:	68 fc 7b 10 80       	push   $0x80107bfc
801036e5:	e8 a6 cc ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
801036ea:	83 ec 0c             	sub    $0xc,%esp
801036ed:	68 dc 7c 10 80       	push   $0x80107cdc
801036f2:	e8 99 cc ff ff       	call   80100390 <panic>
801036f7:	89 f6                	mov    %esi,%esi
801036f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103700 <cpuid>:
cpuid() {
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103706:	e8 75 ff ff ff       	call   80103680 <mycpu>
8010370b:	2d a0 37 11 80       	sub    $0x801137a0,%eax
}
80103710:	c9                   	leave  
  return mycpu()-cpus;
80103711:	c1 f8 04             	sar    $0x4,%eax
80103714:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010371a:	c3                   	ret    
8010371b:	90                   	nop
8010371c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103720 <myproc>:
myproc(void) {
80103720:	55                   	push   %ebp
80103721:	89 e5                	mov    %esp,%ebp
80103723:	53                   	push   %ebx
80103724:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103727:	e8 94 11 00 00       	call   801048c0 <pushcli>
  c = mycpu();
8010372c:	e8 4f ff ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103731:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103737:	e8 c4 11 00 00       	call   80104900 <popcli>
}
8010373c:	83 c4 04             	add    $0x4,%esp
8010373f:	89 d8                	mov    %ebx,%eax
80103741:	5b                   	pop    %ebx
80103742:	5d                   	pop    %ebp
80103743:	c3                   	ret    
80103744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010374a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103750 <set_accu>:
void set_accu(struct proc* proc){
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	57                   	push   %edi
80103754:	56                   	push   %esi
80103755:	53                   	push   %ebx
  long long min_accu=9223372036854775807;
80103756:	be ff ff ff ff       	mov    $0xffffffff,%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010375b:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
void set_accu(struct proc* proc){
80103760:	83 ec 14             	sub    $0x14,%esp
  int only_me=0;
80103763:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
void set_accu(struct proc* proc){
8010376a:	8b 7d 08             	mov    0x8(%ebp),%edi
  long long min_accu=9223372036854775807;
8010376d:	c7 45 e4 ff ff ff 7f 	movl   $0x7fffffff,-0x1c(%ebp)
80103774:	eb 40                	jmp    801037b6 <set_accu+0x66>
80103776:	8d 76 00             	lea    0x0(%esi),%esi
80103779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103780:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103783:	99                   	cltd   
80103784:	89 45 e8             	mov    %eax,-0x18(%ebp)
80103787:	89 55 ec             	mov    %edx,-0x14(%ebp)
      proc->accumulator=min_accu*only_me;
8010378a:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010378d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103790:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
      proc->accumulator=min_accu*only_me;
80103796:	8b 55 ec             	mov    -0x14(%ebp),%edx
80103799:	0f af c8             	imul   %eax,%ecx
8010379c:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010379f:	0f af d6             	imul   %esi,%edx
801037a2:	01 d1                	add    %edx,%ecx
801037a4:	f7 e6                	mul    %esi
801037a6:	01 ca                	add    %ecx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801037a8:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
      proc->accumulator=min_accu*only_me;
801037ae:	89 47 04             	mov    %eax,0x4(%edi)
801037b1:	89 57 08             	mov    %edx,0x8(%edi)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801037b4:	73 4a                	jae    80103800 <set_accu+0xb0>
      if(p->state == RUNNABLE||p->state==RUNNING){
801037b6:	8b 43 2c             	mov    0x2c(%ebx),%eax
801037b9:	83 e8 03             	sub    $0x3,%eax
801037bc:	83 f8 01             	cmp    $0x1,%eax
801037bf:	77 bf                	ja     80103780 <set_accu+0x30>
801037c1:	8b 43 08             	mov    0x8(%ebx),%eax
801037c4:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
801037c7:	8b 53 04             	mov    0x4(%ebx),%edx
801037ca:	7c 0b                	jl     801037d7 <set_accu+0x87>
801037cc:	7f 04                	jg     801037d2 <set_accu+0x82>
801037ce:	39 d6                	cmp    %edx,%esi
801037d0:	76 05                	jbe    801037d7 <set_accu+0x87>
801037d2:	89 d6                	mov    %edx,%esi
801037d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          if(p->pid!=proc->pid)// check if there are other processes
801037d7:	8b 47 30             	mov    0x30(%edi),%eax
801037da:	39 43 30             	cmp    %eax,0x30(%ebx)
801037dd:	74 a1                	je     80103780 <set_accu+0x30>
801037df:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
801037e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
            only_me=1;  
801037ed:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
801037f4:	eb 94                	jmp    8010378a <set_accu+0x3a>
801037f6:	8d 76 00             	lea    0x0(%esi),%esi
801037f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
80103800:	83 c4 14             	add    $0x14,%esp
80103803:	5b                   	pop    %ebx
80103804:	5e                   	pop    %esi
80103805:	5f                   	pop    %edi
80103806:	5d                   	pop    %ebp
80103807:	c3                   	ret    
80103808:	90                   	nop
80103809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103810 <allocproc>:
{
80103810:	55                   	push   %ebp
80103811:	89 e5                	mov    %esp,%ebp
80103813:	53                   	push   %ebx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103814:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
{
80103819:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010381c:	68 40 3d 11 80       	push   $0x80113d40
80103821:	e8 6a 11 00 00       	call   80104990 <acquire>
80103826:	83 c4 10             	add    $0x10,%esp
80103829:	eb 17                	jmp    80103842 <allocproc+0x32>
8010382b:	90                   	nop
8010382c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103830:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103836:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
8010383c:	0f 83 9e 00 00 00    	jae    801038e0 <allocproc+0xd0>
    if(p->state == UNUSED)
80103842:	8b 43 2c             	mov    0x2c(%ebx),%eax
80103845:	85 c0                	test   %eax,%eax
80103847:	75 e7                	jne    80103830 <allocproc+0x20>
  p->pid = nextpid++;
80103849:	a1 04 b0 10 80       	mov    0x8010b004,%eax
  release(&ptable.lock);
8010384e:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
80103851:	c7 43 2c 01 00 00 00 	movl   $0x1,0x2c(%ebx)
  p->pid = nextpid++;
80103858:	8d 50 01             	lea    0x1(%eax),%edx
8010385b:	89 43 30             	mov    %eax,0x30(%ebx)
  release(&ptable.lock);
8010385e:	68 40 3d 11 80       	push   $0x80113d40
  p->pid = nextpid++;
80103863:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
  release(&ptable.lock);
80103869:	e8 e2 11 00 00       	call   80104a50 <release>
  if((p->kstack = kalloc()) == 0){
8010386e:	e8 5d ec ff ff       	call   801024d0 <kalloc>
80103873:	83 c4 10             	add    $0x10,%esp
80103876:	85 c0                	test   %eax,%eax
80103878:	89 43 28             	mov    %eax,0x28(%ebx)
8010387b:	74 7c                	je     801038f9 <allocproc+0xe9>
  sp -= sizeof *p->tf;
8010387d:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  memset(p->context, 0, sizeof *p->context);
80103883:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
80103886:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010388b:	89 53 38             	mov    %edx,0x38(%ebx)
  *(uint*)sp = (uint)trapret;
8010388e:	c7 40 14 ff 5d 10 80 	movl   $0x80105dff,0x14(%eax)
  p->context = (struct context*)sp;
80103895:	89 43 3c             	mov    %eax,0x3c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103898:	6a 14                	push   $0x14
8010389a:	6a 00                	push   $0x0
8010389c:	50                   	push   %eax
8010389d:	e8 fe 11 00 00       	call   80104aa0 <memset>
  p->context->eip = (uint)forkret;
801038a2:	8b 43 3c             	mov    0x3c(%ebx),%eax
801038a5:	c7 40 10 10 36 10 80 	movl   $0x80103610,0x10(%eax)
  p->ps_priority=5;
801038ac:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  p->retime=0;
801038b2:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  p->rtime=0;
801038b9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  p->stime=0;
801038c0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
  set_accu(p);
801038c7:	89 1c 24             	mov    %ebx,(%esp)
801038ca:	e8 81 fe ff ff       	call   80103750 <set_accu>
  return p;
801038cf:	83 c4 10             	add    $0x10,%esp
}
801038d2:	89 d8                	mov    %ebx,%eax
801038d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038d7:	c9                   	leave  
801038d8:	c3                   	ret    
801038d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
801038e0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
801038e3:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
801038e5:	68 40 3d 11 80       	push   $0x80113d40
801038ea:	e8 61 11 00 00       	call   80104a50 <release>
}
801038ef:	89 d8                	mov    %ebx,%eax
  return 0;
801038f1:	83 c4 10             	add    $0x10,%esp
}
801038f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038f7:	c9                   	leave  
801038f8:	c3                   	ret    
    p->state = UNUSED;
801038f9:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
    return 0;
80103900:	31 db                	xor    %ebx,%ebx
80103902:	eb ce                	jmp    801038d2 <allocproc+0xc2>
80103904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010390a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103910 <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	56                   	push   %esi
80103914:	89 c6                	mov    %eax,%esi
80103916:	53                   	push   %ebx
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103917:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
8010391c:	eb 10                	jmp    8010392e <wakeup1+0x1e>
8010391e:	66 90                	xchg   %ax,%ax
80103920:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103926:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
8010392c:	73 2b                	jae    80103959 <wakeup1+0x49>
    if(p->state == SLEEPING && p->chan == chan){
8010392e:	83 7b 2c 02          	cmpl   $0x2,0x2c(%ebx)
80103932:	75 ec                	jne    80103920 <wakeup1+0x10>
80103934:	39 73 40             	cmp    %esi,0x40(%ebx)
80103937:	75 e7                	jne    80103920 <wakeup1+0x10>
      set_accu(p);
80103939:	83 ec 04             	sub    $0x4,%esp
8010393c:	53                   	push   %ebx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010393d:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
      set_accu(p);
80103943:	e8 08 fe ff ff       	call   80103750 <set_accu>
      p->state = RUNNABLE;
80103948:	c7 43 90 03 00 00 00 	movl   $0x3,-0x70(%ebx)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010394f:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
      p->state = RUNNABLE;
80103955:	58                   	pop    %eax
80103956:	5a                   	pop    %edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103957:	72 d5                	jb     8010392e <wakeup1+0x1e>
  }
}
80103959:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010395c:	5b                   	pop    %ebx
8010395d:	5e                   	pop    %esi
8010395e:	5d                   	pop    %ebp
8010395f:	c3                   	ret    

80103960 <userinit>:
{
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	53                   	push   %ebx
80103964:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103967:	e8 a4 fe ff ff       	call   80103810 <allocproc>
8010396c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010396e:	a3 bc b5 10 80       	mov    %eax,0x8010b5bc
  if((p->pgdir = setupkvm()) == 0)
80103973:	e8 78 3a 00 00       	call   801073f0 <setupkvm>
80103978:	85 c0                	test   %eax,%eax
8010397a:	89 43 24             	mov    %eax,0x24(%ebx)
8010397d:	0f 84 c4 00 00 00    	je     80103a47 <userinit+0xe7>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103983:	83 ec 04             	sub    $0x4,%esp
80103986:	68 2c 00 00 00       	push   $0x2c
8010398b:	68 60 b4 10 80       	push   $0x8010b460
80103990:	50                   	push   %eax
80103991:	e8 3a 37 00 00       	call   801070d0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103996:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103999:	c7 43 20 00 10 00 00 	movl   $0x1000,0x20(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801039a0:	6a 4c                	push   $0x4c
801039a2:	6a 00                	push   $0x0
801039a4:	ff 73 38             	pushl  0x38(%ebx)
801039a7:	e8 f4 10 00 00       	call   80104aa0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039ac:	8b 43 38             	mov    0x38(%ebx),%eax
801039af:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039b4:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
801039b9:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039bc:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039c0:	8b 43 38             	mov    0x38(%ebx),%eax
801039c3:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801039c7:	8b 43 38             	mov    0x38(%ebx),%eax
801039ca:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039ce:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801039d2:	8b 43 38             	mov    0x38(%ebx),%eax
801039d5:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039d9:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801039dd:	8b 43 38             	mov    0x38(%ebx),%eax
801039e0:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801039e7:	8b 43 38             	mov    0x38(%ebx),%eax
801039ea:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801039f1:	8b 43 38             	mov    0x38(%ebx),%eax
801039f4:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
801039fb:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
80103a01:	6a 10                	push   $0x10
80103a03:	68 25 7c 10 80       	push   $0x80107c25
80103a08:	50                   	push   %eax
80103a09:	e8 72 12 00 00       	call   80104c80 <safestrcpy>
  p->cwd = namei("/");
80103a0e:	c7 04 24 2e 7c 10 80 	movl   $0x80107c2e,(%esp)
80103a15:	e8 d6 e4 ff ff       	call   80101ef0 <namei>
80103a1a:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
  acquire(&ptable.lock);
80103a20:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103a27:	e8 64 0f 00 00       	call   80104990 <acquire>
  p->state = RUNNABLE;
80103a2c:	c7 43 2c 03 00 00 00 	movl   $0x3,0x2c(%ebx)
  release(&ptable.lock);
80103a33:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103a3a:	e8 11 10 00 00       	call   80104a50 <release>
}
80103a3f:	83 c4 10             	add    $0x10,%esp
80103a42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a45:	c9                   	leave  
80103a46:	c3                   	ret    
    panic("userinit: out of memory?");
80103a47:	83 ec 0c             	sub    $0xc,%esp
80103a4a:	68 0c 7c 10 80       	push   $0x80107c0c
80103a4f:	e8 3c c9 ff ff       	call   80100390 <panic>
80103a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103a60 <growproc>:
{
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	56                   	push   %esi
80103a64:	53                   	push   %ebx
80103a65:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103a68:	e8 53 0e 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80103a6d:	e8 0e fc ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103a72:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a78:	e8 83 0e 00 00       	call   80104900 <popcli>
  if(n > 0){
80103a7d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103a80:	8b 43 20             	mov    0x20(%ebx),%eax
  if(n > 0){
80103a83:	7f 1b                	jg     80103aa0 <growproc+0x40>
  } else if(n < 0){
80103a85:	75 39                	jne    80103ac0 <growproc+0x60>
  switchuvm(curproc);
80103a87:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103a8a:	89 43 20             	mov    %eax,0x20(%ebx)
  switchuvm(curproc);
80103a8d:	53                   	push   %ebx
80103a8e:	e8 2d 35 00 00       	call   80106fc0 <switchuvm>
  return 0;
80103a93:	83 c4 10             	add    $0x10,%esp
80103a96:	31 c0                	xor    %eax,%eax
}
80103a98:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a9b:	5b                   	pop    %ebx
80103a9c:	5e                   	pop    %esi
80103a9d:	5d                   	pop    %ebp
80103a9e:	c3                   	ret    
80103a9f:	90                   	nop
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103aa0:	83 ec 04             	sub    $0x4,%esp
80103aa3:	01 c6                	add    %eax,%esi
80103aa5:	56                   	push   %esi
80103aa6:	50                   	push   %eax
80103aa7:	ff 73 24             	pushl  0x24(%ebx)
80103aaa:	e8 61 37 00 00       	call   80107210 <allocuvm>
80103aaf:	83 c4 10             	add    $0x10,%esp
80103ab2:	85 c0                	test   %eax,%eax
80103ab4:	75 d1                	jne    80103a87 <growproc+0x27>
      return -1;
80103ab6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103abb:	eb db                	jmp    80103a98 <growproc+0x38>
80103abd:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ac0:	83 ec 04             	sub    $0x4,%esp
80103ac3:	01 c6                	add    %eax,%esi
80103ac5:	56                   	push   %esi
80103ac6:	50                   	push   %eax
80103ac7:	ff 73 24             	pushl  0x24(%ebx)
80103aca:	e8 71 38 00 00       	call   80107340 <deallocuvm>
80103acf:	83 c4 10             	add    $0x10,%esp
80103ad2:	85 c0                	test   %eax,%eax
80103ad4:	75 b1                	jne    80103a87 <growproc+0x27>
80103ad6:	eb de                	jmp    80103ab6 <growproc+0x56>
80103ad8:	90                   	nop
80103ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ae0 <fork>:
{
80103ae0:	55                   	push   %ebp
80103ae1:	89 e5                	mov    %esp,%ebp
80103ae3:	57                   	push   %edi
80103ae4:	56                   	push   %esi
80103ae5:	53                   	push   %ebx
80103ae6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103ae9:	e8 d2 0d 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80103aee:	e8 8d fb ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103af3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103af9:	e8 02 0e 00 00       	call   80104900 <popcli>
  if((np = allocproc()) == 0){
80103afe:	e8 0d fd ff ff       	call   80103810 <allocproc>
80103b03:	85 c0                	test   %eax,%eax
80103b05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103b08:	0f 84 cb 00 00 00    	je     80103bd9 <fork+0xf9>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103b0e:	83 ec 08             	sub    $0x8,%esp
80103b11:	ff 73 20             	pushl  0x20(%ebx)
80103b14:	ff 73 24             	pushl  0x24(%ebx)
80103b17:	89 c7                	mov    %eax,%edi
80103b19:	e8 a2 39 00 00       	call   801074c0 <copyuvm>
80103b1e:	83 c4 10             	add    $0x10,%esp
80103b21:	85 c0                	test   %eax,%eax
80103b23:	89 47 24             	mov    %eax,0x24(%edi)
80103b26:	0f 84 b4 00 00 00    	je     80103be0 <fork+0x100>
  np->sz = curproc->sz;
80103b2c:	8b 43 20             	mov    0x20(%ebx),%eax
80103b2f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103b32:	89 41 20             	mov    %eax,0x20(%ecx)
  np->parent = curproc;
80103b35:	89 59 34             	mov    %ebx,0x34(%ecx)
80103b38:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103b3a:	8b 79 38             	mov    0x38(%ecx),%edi
80103b3d:	8b 73 38             	mov    0x38(%ebx),%esi
80103b40:	b9 13 00 00 00       	mov    $0x13,%ecx
80103b45:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103b47:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103b49:	8b 40 38             	mov    0x38(%eax),%eax
80103b4c:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b53:	90                   	nop
80103b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[i])
80103b58:	8b 44 b3 48          	mov    0x48(%ebx,%esi,4),%eax
80103b5c:	85 c0                	test   %eax,%eax
80103b5e:	74 13                	je     80103b73 <fork+0x93>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b60:	83 ec 0c             	sub    $0xc,%esp
80103b63:	50                   	push   %eax
80103b64:	e8 87 d2 ff ff       	call   80100df0 <filedup>
80103b69:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b6c:	83 c4 10             	add    $0x10,%esp
80103b6f:	89 44 b2 48          	mov    %eax,0x48(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103b73:	83 c6 01             	add    $0x1,%esi
80103b76:	83 fe 10             	cmp    $0x10,%esi
80103b79:	75 dd                	jne    80103b58 <fork+0x78>
  np->cwd = idup(curproc->cwd);
80103b7b:	83 ec 0c             	sub    $0xc,%esp
80103b7e:	ff b3 88 00 00 00    	pushl  0x88(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b84:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  np->cwd = idup(curproc->cwd);
80103b8a:	e8 c1 da ff ff       	call   80101650 <idup>
80103b8f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b92:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103b95:	89 87 88 00 00 00    	mov    %eax,0x88(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b9b:	8d 87 8c 00 00 00    	lea    0x8c(%edi),%eax
80103ba1:	6a 10                	push   $0x10
80103ba3:	53                   	push   %ebx
80103ba4:	50                   	push   %eax
80103ba5:	e8 d6 10 00 00       	call   80104c80 <safestrcpy>
  pid = np->pid;
80103baa:	8b 5f 30             	mov    0x30(%edi),%ebx
  acquire(&ptable.lock);
80103bad:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103bb4:	e8 d7 0d 00 00       	call   80104990 <acquire>
  np->state = RUNNABLE;
80103bb9:	c7 47 2c 03 00 00 00 	movl   $0x3,0x2c(%edi)
  release(&ptable.lock);
80103bc0:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103bc7:	e8 84 0e 00 00       	call   80104a50 <release>
  return pid;
80103bcc:	83 c4 10             	add    $0x10,%esp
}
80103bcf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bd2:	89 d8                	mov    %ebx,%eax
80103bd4:	5b                   	pop    %ebx
80103bd5:	5e                   	pop    %esi
80103bd6:	5f                   	pop    %edi
80103bd7:	5d                   	pop    %ebp
80103bd8:	c3                   	ret    
    return -1;
80103bd9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103bde:	eb ef                	jmp    80103bcf <fork+0xef>
    kfree(np->kstack);
80103be0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103be3:	83 ec 0c             	sub    $0xc,%esp
80103be6:	ff 73 28             	pushl  0x28(%ebx)
80103be9:	e8 32 e7 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103bee:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
    np->state = UNUSED;
80103bf5:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
    return -1;
80103bfc:	83 c4 10             	add    $0x10,%esp
80103bff:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103c04:	eb c9                	jmp    80103bcf <fork+0xef>
80103c06:	8d 76 00             	lea    0x0(%esi),%esi
80103c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c10 <set_ps_priority>:
int set_ps_priority(int priority){
80103c10:	55                   	push   %ebp
80103c11:	89 e5                	mov    %esp,%ebp
80103c13:	56                   	push   %esi
80103c14:	53                   	push   %ebx
80103c15:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(priority<1||priority>10)
80103c18:	8d 43 ff             	lea    -0x1(%ebx),%eax
80103c1b:	83 f8 09             	cmp    $0x9,%eax
80103c1e:	77 20                	ja     80103c40 <set_ps_priority+0x30>
  pushcli();
80103c20:	e8 9b 0c 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80103c25:	e8 56 fa ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103c2a:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c30:	e8 cb 0c 00 00       	call   80104900 <popcli>
  return 0;
80103c35:	31 c0                	xor    %eax,%eax
  proc->ps_priority=priority;
80103c37:	89 1e                	mov    %ebx,(%esi)
}
80103c39:	5b                   	pop    %ebx
80103c3a:	5e                   	pop    %esi
80103c3b:	5d                   	pop    %ebp
80103c3c:	c3                   	ret    
80103c3d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80103c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c45:	eb f2                	jmp    80103c39 <set_ps_priority+0x29>
80103c47:	89 f6                	mov    %esi,%esi
80103c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c50 <set_cfs_priority>:
int set_cfs_priority(int option){
80103c50:	55                   	push   %ebp
80103c51:	89 e5                	mov    %esp,%ebp
80103c53:	56                   	push   %esi
80103c54:	53                   	push   %ebx
80103c55:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80103c58:	e8 63 0c 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80103c5d:	e8 1e fa ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103c62:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c68:	e8 93 0c 00 00       	call   80104900 <popcli>
  if(option==1)
80103c6d:	83 fb 01             	cmp    $0x1,%ebx
80103c70:	74 2e                	je     80103ca0 <set_cfs_priority+0x50>
  else if(option==2)
80103c72:	83 fb 02             	cmp    $0x2,%ebx
80103c75:	74 19                	je     80103c90 <set_cfs_priority+0x40>
  else if(option==3)
80103c77:	83 fb 03             	cmp    $0x3,%ebx
80103c7a:	75 34                	jne    80103cb0 <set_cfs_priority+0x60>
    proc->decay_factor=1.25;
80103c7c:	c7 46 1c 00 00 a0 3f 	movl   $0x3fa00000,0x1c(%esi)
  return 0;
80103c83:	31 c0                	xor    %eax,%eax
}
80103c85:	5b                   	pop    %ebx
80103c86:	5e                   	pop    %esi
80103c87:	5d                   	pop    %ebp
80103c88:	c3                   	ret    
80103c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    proc->decay_factor=1;
80103c90:	c7 46 1c 00 00 80 3f 	movl   $0x3f800000,0x1c(%esi)
  return 0;
80103c97:	31 c0                	xor    %eax,%eax
}
80103c99:	5b                   	pop    %ebx
80103c9a:	5e                   	pop    %esi
80103c9b:	5d                   	pop    %ebp
80103c9c:	c3                   	ret    
80103c9d:	8d 76 00             	lea    0x0(%esi),%esi
    proc->decay_factor=0.75;
80103ca0:	c7 46 1c 00 00 40 3f 	movl   $0x3f400000,0x1c(%esi)
  return 0;
80103ca7:	31 c0                	xor    %eax,%eax
}
80103ca9:	5b                   	pop    %ebx
80103caa:	5e                   	pop    %esi
80103cab:	5d                   	pop    %ebp
80103cac:	c3                   	ret    
80103cad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80103cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103cb5:	eb ce                	jmp    80103c85 <set_cfs_priority+0x35>
80103cb7:	89 f6                	mov    %esi,%esi
80103cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103cc0 <get_ratio>:
double get_ratio(struct proc *p){
80103cc0:	55                   	push   %ebp
80103cc1:	89 e5                	mov    %esp,%ebp
80103cc3:	83 ec 08             	sub    $0x8,%esp
80103cc6:	8b 55 08             	mov    0x8(%ebp),%edx
  numerator = (double)(p->rtime * p->decay_factor);
80103cc9:	db 42 0c             	fildl  0xc(%edx)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103ccc:	8b 42 0c             	mov    0xc(%edx),%eax
80103ccf:	03 42 10             	add    0x10(%edx),%eax
  numerator = (double)(p->rtime * p->decay_factor);
80103cd2:	d9 42 1c             	flds   0x1c(%edx)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103cd5:	03 42 14             	add    0x14(%edx),%eax
  numerator = (double)(p->rtime * p->decay_factor);
80103cd8:	de c9                	fmulp  %st,%st(1)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103cda:	89 45 fc             	mov    %eax,-0x4(%ebp)
80103cdd:	db 45 fc             	fildl  -0x4(%ebp)
}
80103ce0:	c9                   	leave  
  return (numerator / denominator);
80103ce1:	de f9                	fdivrp %st,%st(1)
}
80103ce3:	c3                   	ret    
80103ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103cf0 <default_action>:
void default_action(struct proc *p, struct cpu *c){
80103cf0:	55                   	push   %ebp
80103cf1:	89 e5                	mov    %esp,%ebp
80103cf3:	56                   	push   %esi
80103cf4:	53                   	push   %ebx
80103cf5:	8b 75 0c             	mov    0xc(%ebp),%esi
80103cf8:	8b 5d 08             	mov    0x8(%ebp),%ebx
      switchuvm(p);
80103cfb:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103cfe:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103d04:	53                   	push   %ebx
80103d05:	e8 b6 32 00 00       	call   80106fc0 <switchuvm>
      p->state = RUNNING;
80103d0a:	c7 43 2c 04 00 00 00 	movl   $0x4,0x2c(%ebx)
      swtch(&(c->scheduler), p->context);
80103d11:	58                   	pop    %eax
80103d12:	8d 46 04             	lea    0x4(%esi),%eax
80103d15:	5a                   	pop    %edx
80103d16:	ff 73 3c             	pushl  0x3c(%ebx)
80103d19:	50                   	push   %eax
80103d1a:	e8 bc 0f 00 00       	call   80104cdb <swtch>
      switchkvm();
80103d1f:	e8 7c 32 00 00       	call   80106fa0 <switchkvm>
      c->proc = 0;
80103d24:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103d2b:	00 00 00 
}
80103d2e:	83 c4 10             	add    $0x10,%esp
80103d31:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d34:	5b                   	pop    %ebx
80103d35:	5e                   	pop    %esi
80103d36:	5d                   	pop    %ebp
80103d37:	c3                   	ret    
80103d38:	90                   	nop
80103d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103d40 <proc_for_priority_scheduler>:
struct proc* proc_for_priority_scheduler(){
80103d40:	55                   	push   %ebp
  long long min_accu = -1;
80103d41:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103d46:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
struct proc* proc_for_priority_scheduler(){
80103d4b:	89 e5                	mov    %esp,%ebp
80103d4d:	57                   	push   %edi
80103d4e:	56                   	push   %esi
80103d4f:	53                   	push   %ebx
  long long min_accu = -1;
80103d50:	be ff ff ff ff       	mov    $0xffffffff,%esi
struct proc* proc_for_priority_scheduler(){
80103d55:	83 ec 0c             	sub    $0xc,%esp
  struct proc *min_proc = ptable.proc;
80103d58:	c7 45 ec 74 3d 11 80 	movl   $0x80113d74,-0x14(%ebp)
80103d5f:	eb 13                	jmp    80103d74 <proc_for_priority_scheduler+0x34>
80103d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103d68:	05 9c 00 00 00       	add    $0x9c,%eax
80103d6d:	3d 74 64 11 80       	cmp    $0x80116474,%eax
80103d72:	73 37                	jae    80103dab <proc_for_priority_scheduler+0x6b>
    if (p->state == RUNNABLE)
80103d74:	83 78 2c 03          	cmpl   $0x3,0x2c(%eax)
80103d78:	75 ee                	jne    80103d68 <proc_for_priority_scheduler+0x28>
      if (p->accumulator < min_accu || min_accu == -1)
80103d7a:	89 f3                	mov    %esi,%ebx
80103d7c:	8b 78 04             	mov    0x4(%eax),%edi
80103d7f:	8b 48 08             	mov    0x8(%eax),%ecx
80103d82:	21 d3                	and    %edx,%ebx
80103d84:	83 fb ff             	cmp    $0xffffffff,%ebx
80103d87:	74 0f                	je     80103d98 <proc_for_priority_scheduler+0x58>
80103d89:	39 d1                	cmp    %edx,%ecx
80103d8b:	7c 0b                	jl     80103d98 <proc_for_priority_scheduler+0x58>
80103d8d:	7f d9                	jg     80103d68 <proc_for_priority_scheduler+0x28>
80103d8f:	39 f7                	cmp    %esi,%edi
80103d91:	73 d5                	jae    80103d68 <proc_for_priority_scheduler+0x28>
80103d93:	90                   	nop
80103d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d98:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103d9b:	05 9c 00 00 00       	add    $0x9c,%eax
      if (p->accumulator < min_accu || min_accu == -1)
80103da0:	89 fe                	mov    %edi,%esi
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103da2:	3d 74 64 11 80       	cmp    $0x80116474,%eax
      if (p->accumulator < min_accu || min_accu == -1)
80103da7:	89 ca                	mov    %ecx,%edx
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103da9:	72 c9                	jb     80103d74 <proc_for_priority_scheduler+0x34>
}
80103dab:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103dae:	83 c4 0c             	add    $0xc,%esp
80103db1:	5b                   	pop    %ebx
80103db2:	5e                   	pop    %esi
80103db3:	5f                   	pop    %edi
80103db4:	5d                   	pop    %ebp
80103db5:	c3                   	ret    
80103db6:	8d 76 00             	lea    0x0(%esi),%esi
80103db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103dc0 <proc_for_cfs>:
  double min_ratio = -1.0;
80103dc0:	d9 e8                	fld1   
  struct proc *min_proc = ptable.proc;
80103dc2:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103dc7:	89 c2                	mov    %eax,%edx
  double min_ratio = -1.0;
80103dc9:	d9 e0                	fchs   
80103dcb:	eb 11                	jmp    80103dde <proc_for_cfs+0x1e>
80103dcd:	8d 76 00             	lea    0x0(%esi),%esi
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103dd0:	81 c2 9c 00 00 00    	add    $0x9c,%edx
80103dd6:	81 fa 74 64 11 80    	cmp    $0x80116474,%edx
80103ddc:	73 78                	jae    80103e56 <proc_for_cfs+0x96>
    if (p->state == RUNNABLE)
80103dde:	83 7a 2c 03          	cmpl   $0x3,0x2c(%edx)
80103de2:	75 ec                	jne    80103dd0 <proc_for_cfs+0x10>
struct proc* proc_for_cfs(){
80103de4:	55                   	push   %ebp
80103de5:	89 e5                	mov    %esp,%ebp
80103de7:	83 ec 08             	sub    $0x8,%esp
  numerator = (double)(p->rtime * p->decay_factor);
80103dea:	db 42 0c             	fildl  0xc(%edx)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103ded:	8b 4a 0c             	mov    0xc(%edx),%ecx
80103df0:	03 4a 10             	add    0x10(%edx),%ecx
  numerator = (double)(p->rtime * p->decay_factor);
80103df3:	d9 42 1c             	flds   0x1c(%edx)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103df6:	03 4a 14             	add    0x14(%edx),%ecx
  numerator = (double)(p->rtime * p->decay_factor);
80103df9:	de c9                	fmulp  %st,%st(1)
  denominator = (double)(p->rtime + p->stime + p->retime);
80103dfb:	89 4d fc             	mov    %ecx,-0x4(%ebp)
80103dfe:	db 45 fc             	fildl  -0x4(%ebp)
  return (numerator / denominator);
80103e01:	de f9                	fdivrp %st,%st(1)
80103e03:	d9 c9                	fxch   %st(1)
      if (ratio < min_ratio || min_ratio == -1.0)
80103e05:	db e9                	fucomi %st(1),%st
80103e07:	77 47                	ja     80103e50 <proc_for_cfs+0x90>
80103e09:	d9 e8                	fld1   
80103e0b:	d9 e0                	fchs   
80103e0d:	d9 c9                	fxch   %st(1)
80103e0f:	db e9                	fucomi %st(1),%st
80103e11:	dd d9                	fstp   %st(1)
80103e13:	7a 09                	jp     80103e1e <proc_for_cfs+0x5e>
        min_ratio = ratio;
80103e15:	da c9                	fcmove %st(1),%st
80103e17:	dd d9                	fstp   %st(1)
80103e19:	0f 44 c2             	cmove  %edx,%eax
80103e1c:	eb 02                	jmp    80103e20 <proc_for_cfs+0x60>
80103e1e:	dd d9                	fstp   %st(1)
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103e20:	81 c2 9c 00 00 00    	add    $0x9c,%edx
80103e26:	81 fa 74 64 11 80    	cmp    $0x80116474,%edx
80103e2c:	73 18                	jae    80103e46 <proc_for_cfs+0x86>
    if (p->state == RUNNABLE)
80103e2e:	83 7a 2c 03          	cmpl   $0x3,0x2c(%edx)
80103e32:	74 b6                	je     80103dea <proc_for_cfs+0x2a>
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103e34:	81 c2 9c 00 00 00    	add    $0x9c,%edx
80103e3a:	81 fa 74 64 11 80    	cmp    $0x80116474,%edx
80103e40:	72 ec                	jb     80103e2e <proc_for_cfs+0x6e>
80103e42:	dd d8                	fstp   %st(0)
80103e44:	eb 02                	jmp    80103e48 <proc_for_cfs+0x88>
80103e46:	dd d8                	fstp   %st(0)
}
80103e48:	c9                   	leave  
80103e49:	c3                   	ret    
80103e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e50:	dd d8                	fstp   %st(0)
80103e52:	89 d0                	mov    %edx,%eax
80103e54:	eb ca                	jmp    80103e20 <proc_for_cfs+0x60>
80103e56:	dd d8                	fstp   %st(0)
80103e58:	c3                   	ret    
80103e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103e60 <scheduler>:
{
80103e60:	55                   	push   %ebp
80103e61:	89 e5                	mov    %esp,%ebp
80103e63:	57                   	push   %edi
80103e64:	56                   	push   %esi
80103e65:	53                   	push   %ebx
80103e66:	83 ec 1c             	sub    $0x1c,%esp
  struct cpu *c = mycpu();
80103e69:	e8 12 f8 ff ff       	call   80103680 <mycpu>
  sched_type = 0;
80103e6e:	c7 05 b8 b5 10 80 00 	movl   $0x0,0x8010b5b8
80103e75:	00 00 00 
  struct cpu *c = mycpu();
80103e78:	89 c7                	mov    %eax,%edi
  c->proc = 0;
80103e7a:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103e81:	00 00 00 
80103e84:	eb 18                	jmp    80103e9e <scheduler+0x3e>
80103e86:	8d 76 00             	lea    0x0(%esi),%esi
80103e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (sched_type == 1)
80103e90:	83 f8 01             	cmp    $0x1,%eax
80103e93:	74 66                	je     80103efb <scheduler+0x9b>
    if (sched_type == 2)
80103e95:	83 f8 02             	cmp    $0x2,%eax
80103e98:	0f 84 fa 00 00 00    	je     80103f98 <scheduler+0x138>
  asm volatile("sti");
80103e9e:	fb                   	sti    
    if (sched_type == 0)
80103e9f:	a1 b8 b5 10 80       	mov    0x8010b5b8,%eax
80103ea4:	85 c0                	test   %eax,%eax
80103ea6:	75 e8                	jne    80103e90 <scheduler+0x30>
      acquire(&ptable.lock);
80103ea8:	83 ec 0c             	sub    $0xc,%esp
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103eab:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
      acquire(&ptable.lock);
80103eb0:	68 40 3d 11 80       	push   $0x80113d40
80103eb5:	e8 d6 0a 00 00       	call   80104990 <acquire>
80103eba:	83 c4 10             	add    $0x10,%esp
80103ebd:	8d 76 00             	lea    0x0(%esi),%esi
        if(p->state != RUNNABLE)
80103ec0:	83 7b 2c 03          	cmpl   $0x3,0x2c(%ebx)
80103ec4:	75 0d                	jne    80103ed3 <scheduler+0x73>
        default_action(p, c);
80103ec6:	83 ec 08             	sub    $0x8,%esp
80103ec9:	57                   	push   %edi
80103eca:	53                   	push   %ebx
80103ecb:	e8 20 fe ff ff       	call   80103cf0 <default_action>
80103ed0:	83 c4 10             	add    $0x10,%esp
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ed3:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103ed9:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
80103edf:	72 df                	jb     80103ec0 <scheduler+0x60>
    release(&ptable.lock);
80103ee1:	83 ec 0c             	sub    $0xc,%esp
80103ee4:	68 40 3d 11 80       	push   $0x80113d40
80103ee9:	e8 62 0b 00 00       	call   80104a50 <release>
80103eee:	a1 b8 b5 10 80       	mov    0x8010b5b8,%eax
80103ef3:	83 c4 10             	add    $0x10,%esp
    if (sched_type == 1)
80103ef6:	83 f8 01             	cmp    $0x1,%eax
80103ef9:	75 9a                	jne    80103e95 <scheduler+0x35>
      acquire(&ptable.lock);
80103efb:	83 ec 0c             	sub    $0xc,%esp
  long long min_accu = -1;
80103efe:	be ff ff ff ff       	mov    $0xffffffff,%esi
      acquire(&ptable.lock);
80103f03:	68 40 3d 11 80       	push   $0x80113d40
80103f08:	e8 83 0a 00 00       	call   80104990 <acquire>
  struct proc *min_proc = ptable.proc;
80103f0d:	ba 74 3d 11 80       	mov    $0x80113d74,%edx
      acquire(&ptable.lock);
80103f12:	83 c4 10             	add    $0x10,%esp
  long long min_accu = -1;
80103f15:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103f1a:	89 d0                	mov    %edx,%eax
80103f1c:	89 7d e0             	mov    %edi,-0x20(%ebp)
80103f1f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103f22:	eb 10                	jmp    80103f34 <scheduler+0xd4>
80103f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f28:	05 9c 00 00 00       	add    $0x9c,%eax
80103f2d:	3d 74 64 11 80       	cmp    $0x80116474,%eax
80103f32:	73 32                	jae    80103f66 <scheduler+0x106>
    if (p->state == RUNNABLE)
80103f34:	83 78 2c 03          	cmpl   $0x3,0x2c(%eax)
80103f38:	75 ee                	jne    80103f28 <scheduler+0xc8>
      if (p->accumulator < min_accu || min_accu == -1)
80103f3a:	8b 50 08             	mov    0x8(%eax),%edx
80103f3d:	8b 58 04             	mov    0x4(%eax),%ebx
80103f40:	39 ca                	cmp    %ecx,%edx
80103f42:	7c 0f                	jl     80103f53 <scheduler+0xf3>
80103f44:	7f 04                	jg     80103f4a <scheduler+0xea>
80103f46:	39 f3                	cmp    %esi,%ebx
80103f48:	72 09                	jb     80103f53 <scheduler+0xf3>
80103f4a:	89 f7                	mov    %esi,%edi
80103f4c:	21 cf                	and    %ecx,%edi
80103f4e:	83 ff ff             	cmp    $0xffffffff,%edi
80103f51:	75 d5                	jne    80103f28 <scheduler+0xc8>
80103f53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103f56:	05 9c 00 00 00       	add    $0x9c,%eax
      if (p->accumulator < min_accu || min_accu == -1)
80103f5b:	89 de                	mov    %ebx,%esi
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103f5d:	3d 74 64 11 80       	cmp    $0x80116474,%eax
      if (p->accumulator < min_accu || min_accu == -1)
80103f62:	89 d1                	mov    %edx,%ecx
  for (p = ptable.proc; p< &ptable.proc[NPROC]; p++)
80103f64:	72 ce                	jb     80103f34 <scheduler+0xd4>
80103f66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103f69:	8b 7d e0             	mov    -0x20(%ebp),%edi
        default_action(p, c);
80103f6c:	83 ec 08             	sub    $0x8,%esp
80103f6f:	57                   	push   %edi
80103f70:	50                   	push   %eax
80103f71:	e8 7a fd ff ff       	call   80103cf0 <default_action>
      release(&ptable.lock);
80103f76:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103f7d:	e8 ce 0a 00 00       	call   80104a50 <release>
80103f82:	a1 b8 b5 10 80       	mov    0x8010b5b8,%eax
80103f87:	83 c4 10             	add    $0x10,%esp
    if (sched_type == 2)
80103f8a:	83 f8 02             	cmp    $0x2,%eax
80103f8d:	0f 85 0b ff ff ff    	jne    80103e9e <scheduler+0x3e>
80103f93:	90                   	nop
80103f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      acquire(&ptable.lock);
80103f98:	83 ec 0c             	sub    $0xc,%esp
80103f9b:	68 40 3d 11 80       	push   $0x80113d40
80103fa0:	e8 eb 09 00 00       	call   80104990 <acquire>
      p = proc_for_cfs();
80103fa5:	e8 16 fe ff ff       	call   80103dc0 <proc_for_cfs>
      if(p!=null)
80103faa:	83 c4 10             	add    $0x10,%esp
80103fad:	85 c0                	test   %eax,%eax
80103faf:	74 0d                	je     80103fbe <scheduler+0x15e>
        default_action(p, c);
80103fb1:	83 ec 08             	sub    $0x8,%esp
80103fb4:	57                   	push   %edi
80103fb5:	50                   	push   %eax
80103fb6:	e8 35 fd ff ff       	call   80103cf0 <default_action>
80103fbb:	83 c4 10             	add    $0x10,%esp
      release(&ptable.lock);
80103fbe:	83 ec 0c             	sub    $0xc,%esp
80103fc1:	68 40 3d 11 80       	push   $0x80113d40
80103fc6:	e8 85 0a 00 00       	call   80104a50 <release>
80103fcb:	83 c4 10             	add    $0x10,%esp
80103fce:	e9 cb fe ff ff       	jmp    80103e9e <scheduler+0x3e>
80103fd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fe0 <sched>:
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	56                   	push   %esi
80103fe4:	53                   	push   %ebx
  pushcli();
80103fe5:	e8 d6 08 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80103fea:	e8 91 f6 ff ff       	call   80103680 <mycpu>
  p = c->proc;
80103fef:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ff5:	e8 06 09 00 00       	call   80104900 <popcli>
  if(!holding(&ptable.lock))
80103ffa:	83 ec 0c             	sub    $0xc,%esp
80103ffd:	68 40 3d 11 80       	push   $0x80113d40
80104002:	e8 59 09 00 00       	call   80104960 <holding>
80104007:	83 c4 10             	add    $0x10,%esp
8010400a:	85 c0                	test   %eax,%eax
8010400c:	74 4f                	je     8010405d <sched+0x7d>
  if(mycpu()->ncli != 1)
8010400e:	e8 6d f6 ff ff       	call   80103680 <mycpu>
80104013:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
8010401a:	75 68                	jne    80104084 <sched+0xa4>
  if(p->state == RUNNING)
8010401c:	83 7b 2c 04          	cmpl   $0x4,0x2c(%ebx)
80104020:	74 55                	je     80104077 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104022:	9c                   	pushf  
80104023:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104024:	f6 c4 02             	test   $0x2,%ah
80104027:	75 41                	jne    8010406a <sched+0x8a>
  intena = mycpu()->intena;
80104029:	e8 52 f6 ff ff       	call   80103680 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
8010402e:	83 c3 3c             	add    $0x3c,%ebx
  intena = mycpu()->intena;
80104031:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80104037:	e8 44 f6 ff ff       	call   80103680 <mycpu>
8010403c:	83 ec 08             	sub    $0x8,%esp
8010403f:	ff 70 04             	pushl  0x4(%eax)
80104042:	53                   	push   %ebx
80104043:	e8 93 0c 00 00       	call   80104cdb <swtch>
  mycpu()->intena = intena;
80104048:	e8 33 f6 ff ff       	call   80103680 <mycpu>
}
8010404d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80104050:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80104056:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104059:	5b                   	pop    %ebx
8010405a:	5e                   	pop    %esi
8010405b:	5d                   	pop    %ebp
8010405c:	c3                   	ret    
    panic("sched ptable.lock");
8010405d:	83 ec 0c             	sub    $0xc,%esp
80104060:	68 30 7c 10 80       	push   $0x80107c30
80104065:	e8 26 c3 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
8010406a:	83 ec 0c             	sub    $0xc,%esp
8010406d:	68 5c 7c 10 80       	push   $0x80107c5c
80104072:	e8 19 c3 ff ff       	call   80100390 <panic>
    panic("sched running");
80104077:	83 ec 0c             	sub    $0xc,%esp
8010407a:	68 4e 7c 10 80       	push   $0x80107c4e
8010407f:	e8 0c c3 ff ff       	call   80100390 <panic>
    panic("sched locks");
80104084:	83 ec 0c             	sub    $0xc,%esp
80104087:	68 42 7c 10 80       	push   $0x80107c42
8010408c:	e8 ff c2 ff ff       	call   80100390 <panic>
80104091:	eb 0d                	jmp    801040a0 <exit>
80104093:	90                   	nop
80104094:	90                   	nop
80104095:	90                   	nop
80104096:	90                   	nop
80104097:	90                   	nop
80104098:	90                   	nop
80104099:	90                   	nop
8010409a:	90                   	nop
8010409b:	90                   	nop
8010409c:	90                   	nop
8010409d:	90                   	nop
8010409e:	90                   	nop
8010409f:	90                   	nop

801040a0 <exit>:
{
801040a0:	55                   	push   %ebp
801040a1:	89 e5                	mov    %esp,%ebp
801040a3:	57                   	push   %edi
801040a4:	56                   	push   %esi
801040a5:	53                   	push   %ebx
801040a6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
801040a9:	e8 12 08 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801040ae:	e8 cd f5 ff ff       	call   80103680 <mycpu>
  p = c->proc;
801040b3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801040b9:	e8 42 08 00 00       	call   80104900 <popcli>
  if(curproc == initproc)
801040be:	39 35 bc b5 10 80    	cmp    %esi,0x8010b5bc
  curproc->status=status;
801040c4:	8b 45 08             	mov    0x8(%ebp),%eax
801040c7:	8d 5e 48             	lea    0x48(%esi),%ebx
801040ca:	8d be 88 00 00 00    	lea    0x88(%esi),%edi
801040d0:	89 46 18             	mov    %eax,0x18(%esi)
  if(curproc == initproc)
801040d3:	0f 84 b8 00 00 00    	je     80104191 <exit+0xf1>
801040d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd]){
801040e0:	8b 03                	mov    (%ebx),%eax
801040e2:	85 c0                	test   %eax,%eax
801040e4:	74 12                	je     801040f8 <exit+0x58>
      fileclose(curproc->ofile[fd]);
801040e6:	83 ec 0c             	sub    $0xc,%esp
801040e9:	50                   	push   %eax
801040ea:	e8 51 cd ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
801040ef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801040f5:	83 c4 10             	add    $0x10,%esp
801040f8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
801040fb:	39 df                	cmp    %ebx,%edi
801040fd:	75 e1                	jne    801040e0 <exit+0x40>
  begin_op();
801040ff:	e8 ac ea ff ff       	call   80102bb0 <begin_op>
  iput(curproc->cwd);
80104104:	83 ec 0c             	sub    $0xc,%esp
80104107:	ff b6 88 00 00 00    	pushl  0x88(%esi)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010410d:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
  iput(curproc->cwd);
80104112:	e8 99 d6 ff ff       	call   801017b0 <iput>
  end_op();
80104117:	e8 04 eb ff ff       	call   80102c20 <end_op>
  curproc->cwd = 0;
8010411c:	c7 86 88 00 00 00 00 	movl   $0x0,0x88(%esi)
80104123:	00 00 00 
  acquire(&ptable.lock);
80104126:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010412d:	e8 5e 08 00 00       	call   80104990 <acquire>
  wakeup1(curproc->parent);
80104132:	8b 46 34             	mov    0x34(%esi),%eax
80104135:	e8 d6 f7 ff ff       	call   80103910 <wakeup1>
8010413a:	83 c4 10             	add    $0x10,%esp
8010413d:	eb 0f                	jmp    8010414e <exit+0xae>
8010413f:	90                   	nop
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104140:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80104146:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
8010414c:	73 2a                	jae    80104178 <exit+0xd8>
    if(p->parent == curproc){
8010414e:	39 73 34             	cmp    %esi,0x34(%ebx)
80104151:	75 ed                	jne    80104140 <exit+0xa0>
      if(p->state == ZOMBIE)
80104153:	83 7b 2c 05          	cmpl   $0x5,0x2c(%ebx)
      p->parent = initproc;
80104157:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
8010415c:	89 43 34             	mov    %eax,0x34(%ebx)
      if(p->state == ZOMBIE)
8010415f:	75 df                	jne    80104140 <exit+0xa0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104161:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
        wakeup1(initproc);
80104167:	e8 a4 f7 ff ff       	call   80103910 <wakeup1>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010416c:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
80104172:	72 da                	jb     8010414e <exit+0xae>
80104174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  curproc->state = ZOMBIE;
80104178:	c7 46 2c 05 00 00 00 	movl   $0x5,0x2c(%esi)
  sched();
8010417f:	e8 5c fe ff ff       	call   80103fe0 <sched>
  panic("zombie exit");
80104184:	83 ec 0c             	sub    $0xc,%esp
80104187:	68 7d 7c 10 80       	push   $0x80107c7d
8010418c:	e8 ff c1 ff ff       	call   80100390 <panic>
    panic("init exiting");
80104191:	83 ec 0c             	sub    $0xc,%esp
80104194:	68 70 7c 10 80       	push   $0x80107c70
80104199:	e8 f2 c1 ff ff       	call   80100390 <panic>
8010419e:	66 90                	xchg   %ax,%ax

801041a0 <yield>:
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	53                   	push   %ebx
801041a4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
801041a7:	68 40 3d 11 80       	push   $0x80113d40
801041ac:	e8 df 07 00 00       	call   80104990 <acquire>
  pushcli();
801041b1:	e8 0a 07 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801041b6:	e8 c5 f4 ff ff       	call   80103680 <mycpu>
  p = c->proc;
801041bb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801041c1:	e8 3a 07 00 00       	call   80104900 <popcli>
  myproc()->state = RUNNABLE;
801041c6:	c7 43 2c 03 00 00 00 	movl   $0x3,0x2c(%ebx)
  sched();
801041cd:	e8 0e fe ff ff       	call   80103fe0 <sched>
  release(&ptable.lock);
801041d2:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801041d9:	e8 72 08 00 00       	call   80104a50 <release>
}
801041de:	83 c4 10             	add    $0x10,%esp
801041e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041e4:	c9                   	leave  
801041e5:	c3                   	ret    
801041e6:	8d 76 00             	lea    0x0(%esi),%esi
801041e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041f0 <sleep>:
{
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	57                   	push   %edi
801041f4:	56                   	push   %esi
801041f5:	53                   	push   %ebx
801041f6:	83 ec 0c             	sub    $0xc,%esp
801041f9:	8b 7d 08             	mov    0x8(%ebp),%edi
801041fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
801041ff:	e8 bc 06 00 00       	call   801048c0 <pushcli>
  c = mycpu();
80104204:	e8 77 f4 ff ff       	call   80103680 <mycpu>
  p = c->proc;
80104209:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010420f:	e8 ec 06 00 00       	call   80104900 <popcli>
  if(p == 0)
80104214:	85 db                	test   %ebx,%ebx
80104216:	0f 84 87 00 00 00    	je     801042a3 <sleep+0xb3>
  if(lk == 0)
8010421c:	85 f6                	test   %esi,%esi
8010421e:	74 76                	je     80104296 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104220:	81 fe 40 3d 11 80    	cmp    $0x80113d40,%esi
80104226:	74 50                	je     80104278 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80104228:	83 ec 0c             	sub    $0xc,%esp
8010422b:	68 40 3d 11 80       	push   $0x80113d40
80104230:	e8 5b 07 00 00       	call   80104990 <acquire>
    release(lk);
80104235:	89 34 24             	mov    %esi,(%esp)
80104238:	e8 13 08 00 00       	call   80104a50 <release>
  p->chan = chan;
8010423d:	89 7b 40             	mov    %edi,0x40(%ebx)
  p->state = SLEEPING;
80104240:	c7 43 2c 02 00 00 00 	movl   $0x2,0x2c(%ebx)
  sched();
80104247:	e8 94 fd ff ff       	call   80103fe0 <sched>
  p->chan = 0;
8010424c:	c7 43 40 00 00 00 00 	movl   $0x0,0x40(%ebx)
    release(&ptable.lock);
80104253:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010425a:	e8 f1 07 00 00       	call   80104a50 <release>
    acquire(lk);
8010425f:	89 75 08             	mov    %esi,0x8(%ebp)
80104262:	83 c4 10             	add    $0x10,%esp
}
80104265:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104268:	5b                   	pop    %ebx
80104269:	5e                   	pop    %esi
8010426a:	5f                   	pop    %edi
8010426b:	5d                   	pop    %ebp
    acquire(lk);
8010426c:	e9 1f 07 00 00       	jmp    80104990 <acquire>
80104271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80104278:	89 7b 40             	mov    %edi,0x40(%ebx)
  p->state = SLEEPING;
8010427b:	c7 43 2c 02 00 00 00 	movl   $0x2,0x2c(%ebx)
  sched();
80104282:	e8 59 fd ff ff       	call   80103fe0 <sched>
  p->chan = 0;
80104287:	c7 43 40 00 00 00 00 	movl   $0x0,0x40(%ebx)
}
8010428e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104291:	5b                   	pop    %ebx
80104292:	5e                   	pop    %esi
80104293:	5f                   	pop    %edi
80104294:	5d                   	pop    %ebp
80104295:	c3                   	ret    
    panic("sleep without lk");
80104296:	83 ec 0c             	sub    $0xc,%esp
80104299:	68 8f 7c 10 80       	push   $0x80107c8f
8010429e:	e8 ed c0 ff ff       	call   80100390 <panic>
    panic("sleep");
801042a3:	83 ec 0c             	sub    $0xc,%esp
801042a6:	68 89 7c 10 80       	push   $0x80107c89
801042ab:	e8 e0 c0 ff ff       	call   80100390 <panic>

801042b0 <wait>:
{
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	57                   	push   %edi
801042b4:	56                   	push   %esi
801042b5:	53                   	push   %ebx
801042b6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
801042b9:	e8 02 06 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801042be:	e8 bd f3 ff ff       	call   80103680 <mycpu>
  p = c->proc;
801042c3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801042c9:	e8 32 06 00 00       	call   80104900 <popcli>
  acquire(&ptable.lock);
801042ce:	83 ec 0c             	sub    $0xc,%esp
801042d1:	68 40 3d 11 80       	push   $0x80113d40
801042d6:	e8 b5 06 00 00       	call   80104990 <acquire>
801042db:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
801042de:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801042e0:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
801042e5:	eb 17                	jmp    801042fe <wait+0x4e>
801042e7:	89 f6                	mov    %esi,%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801042f0:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
801042f6:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
801042fc:	73 1e                	jae    8010431c <wait+0x6c>
      if(p->parent != curproc)
801042fe:	39 73 34             	cmp    %esi,0x34(%ebx)
80104301:	75 ed                	jne    801042f0 <wait+0x40>
      if(p->state == ZOMBIE){
80104303:	83 7b 2c 05          	cmpl   $0x5,0x2c(%ebx)
80104307:	74 3f                	je     80104348 <wait+0x98>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104309:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
      havekids = 1;
8010430f:	ba 01 00 00 00       	mov    $0x1,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104314:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
8010431a:	72 e2                	jb     801042fe <wait+0x4e>
    if(!havekids || curproc->killed){
8010431c:	85 d2                	test   %edx,%edx
8010431e:	0f 84 98 00 00 00    	je     801043bc <wait+0x10c>
80104324:	8b 46 44             	mov    0x44(%esi),%eax
80104327:	85 c0                	test   %eax,%eax
80104329:	0f 85 8d 00 00 00    	jne    801043bc <wait+0x10c>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
8010432f:	83 ec 08             	sub    $0x8,%esp
80104332:	68 40 3d 11 80       	push   $0x80113d40
80104337:	56                   	push   %esi
80104338:	e8 b3 fe ff ff       	call   801041f0 <sleep>
    havekids = 0;
8010433d:	83 c4 10             	add    $0x10,%esp
80104340:	eb 9c                	jmp    801042de <wait+0x2e>
80104342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	ff 73 28             	pushl  0x28(%ebx)
        pid = p->pid;
8010434e:	8b 73 30             	mov    0x30(%ebx),%esi
        childStatus=p->status;
80104351:	8b 7b 18             	mov    0x18(%ebx),%edi
        kfree(p->kstack);
80104354:	e8 c7 df ff ff       	call   80102320 <kfree>
        freevm(p->pgdir);
80104359:	5a                   	pop    %edx
8010435a:	ff 73 24             	pushl  0x24(%ebx)
        p->kstack = 0;
8010435d:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        freevm(p->pgdir);
80104364:	e8 07 30 00 00       	call   80107370 <freevm>
        if(status!=null)
80104369:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010436c:	83 c4 10             	add    $0x10,%esp
        p->pid = 0;
8010436f:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
        p->parent = 0;
80104376:	c7 43 34 00 00 00 00 	movl   $0x0,0x34(%ebx)
        p->name[0] = 0;
8010437d:	c6 83 8c 00 00 00 00 	movb   $0x0,0x8c(%ebx)
        p->killed = 0;
80104384:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
        p->state = UNUSED;
8010438b:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
        if(status!=null)
80104392:	85 c9                	test   %ecx,%ecx
        p->status = 0;
80104394:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        if(status!=null)
8010439b:	74 05                	je     801043a2 <wait+0xf2>
          *status=childStatus;
8010439d:	8b 45 08             	mov    0x8(%ebp),%eax
801043a0:	89 38                	mov    %edi,(%eax)
        release(&ptable.lock);
801043a2:	83 ec 0c             	sub    $0xc,%esp
801043a5:	68 40 3d 11 80       	push   $0x80113d40
801043aa:	e8 a1 06 00 00       	call   80104a50 <release>
        return pid;
801043af:	83 c4 10             	add    $0x10,%esp
}
801043b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801043b5:	89 f0                	mov    %esi,%eax
801043b7:	5b                   	pop    %ebx
801043b8:	5e                   	pop    %esi
801043b9:	5f                   	pop    %edi
801043ba:	5d                   	pop    %ebp
801043bb:	c3                   	ret    
      release(&ptable.lock);
801043bc:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801043bf:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
801043c4:	68 40 3d 11 80       	push   $0x80113d40
801043c9:	e8 82 06 00 00       	call   80104a50 <release>
      return -1;
801043ce:	83 c4 10             	add    $0x10,%esp
801043d1:	eb df                	jmp    801043b2 <wait+0x102>
801043d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043e0 <wakeup>:

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	53                   	push   %ebx
801043e4:	83 ec 10             	sub    $0x10,%esp
801043e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801043ea:	68 40 3d 11 80       	push   $0x80113d40
801043ef:	e8 9c 05 00 00       	call   80104990 <acquire>
  wakeup1(chan);
801043f4:	89 d8                	mov    %ebx,%eax
801043f6:	e8 15 f5 ff ff       	call   80103910 <wakeup1>
  release(&ptable.lock);
801043fb:	83 c4 10             	add    $0x10,%esp
801043fe:	c7 45 08 40 3d 11 80 	movl   $0x80113d40,0x8(%ebp)
}
80104405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104408:	c9                   	leave  
  release(&ptable.lock);
80104409:	e9 42 06 00 00       	jmp    80104a50 <release>
8010440e:	66 90                	xchg   %ax,%ax

80104410 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	53                   	push   %ebx
80104414:	83 ec 10             	sub    $0x10,%esp
80104417:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010441a:	68 40 3d 11 80       	push   $0x80113d40
8010441f:	e8 6c 05 00 00       	call   80104990 <acquire>
80104424:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104427:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
8010442c:	eb 0e                	jmp    8010443c <kill+0x2c>
8010442e:	66 90                	xchg   %ax,%ax
80104430:	05 9c 00 00 00       	add    $0x9c,%eax
80104435:	3d 74 64 11 80       	cmp    $0x80116474,%eax
8010443a:	73 34                	jae    80104470 <kill+0x60>
    if(p->pid == pid){
8010443c:	39 58 30             	cmp    %ebx,0x30(%eax)
8010443f:	75 ef                	jne    80104430 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104441:	83 78 2c 02          	cmpl   $0x2,0x2c(%eax)
      p->killed = 1;
80104445:	c7 40 44 01 00 00 00 	movl   $0x1,0x44(%eax)
      if(p->state == SLEEPING)
8010444c:	75 07                	jne    80104455 <kill+0x45>
        p->state = RUNNABLE;
8010444e:	c7 40 2c 03 00 00 00 	movl   $0x3,0x2c(%eax)
      release(&ptable.lock);
80104455:	83 ec 0c             	sub    $0xc,%esp
80104458:	68 40 3d 11 80       	push   $0x80113d40
8010445d:	e8 ee 05 00 00       	call   80104a50 <release>
      return 0;
80104462:	83 c4 10             	add    $0x10,%esp
80104465:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104467:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010446a:	c9                   	leave  
8010446b:	c3                   	ret    
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104470:	83 ec 0c             	sub    $0xc,%esp
80104473:	68 40 3d 11 80       	push   $0x80113d40
80104478:	e8 d3 05 00 00       	call   80104a50 <release>
  return -1;
8010447d:	83 c4 10             	add    $0x10,%esp
80104480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104488:	c9                   	leave  
80104489:	c3                   	ret    
8010448a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104490 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104490:	55                   	push   %ebp
80104491:	89 e5                	mov    %esp,%ebp
80104493:	57                   	push   %edi
80104494:	56                   	push   %esi
80104495:	53                   	push   %ebx
80104496:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104499:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
{
8010449e:	83 ec 3c             	sub    $0x3c,%esp
801044a1:	eb 27                	jmp    801044ca <procdump+0x3a>
801044a3:	90                   	nop
801044a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801044a8:	83 ec 0c             	sub    $0xc,%esp
801044ab:	68 0b 81 10 80       	push   $0x8010810b
801044b0:	e8 ab c1 ff ff       	call   80100660 <cprintf>
801044b5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044b8:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
801044be:	81 fb 74 64 11 80    	cmp    $0x80116474,%ebx
801044c4:	0f 83 96 00 00 00    	jae    80104560 <procdump+0xd0>
    if(p->state == UNUSED)
801044ca:	8b 43 2c             	mov    0x2c(%ebx),%eax
801044cd:	85 c0                	test   %eax,%eax
801044cf:	74 e7                	je     801044b8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801044d1:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801044d4:	ba a0 7c 10 80       	mov    $0x80107ca0,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801044d9:	77 11                	ja     801044ec <procdump+0x5c>
801044db:	8b 14 85 e0 7d 10 80 	mov    -0x7fef8220(,%eax,4),%edx
      state = "???";
801044e2:	b8 a0 7c 10 80       	mov    $0x80107ca0,%eax
801044e7:	85 d2                	test   %edx,%edx
801044e9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801044ec:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
801044f2:	50                   	push   %eax
801044f3:	52                   	push   %edx
801044f4:	ff 73 30             	pushl  0x30(%ebx)
801044f7:	68 a4 7c 10 80       	push   $0x80107ca4
801044fc:	e8 5f c1 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104501:	83 c4 10             	add    $0x10,%esp
80104504:	83 7b 2c 02          	cmpl   $0x2,0x2c(%ebx)
80104508:	75 9e                	jne    801044a8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010450a:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010450d:	83 ec 08             	sub    $0x8,%esp
80104510:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104513:	50                   	push   %eax
80104514:	8b 43 3c             	mov    0x3c(%ebx),%eax
80104517:	8b 40 0c             	mov    0xc(%eax),%eax
8010451a:	83 c0 08             	add    $0x8,%eax
8010451d:	50                   	push   %eax
8010451e:	e8 4d 03 00 00       	call   80104870 <getcallerpcs>
80104523:	83 c4 10             	add    $0x10,%esp
80104526:	8d 76 00             	lea    0x0(%esi),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      for(i=0; i<10 && pc[i] != 0; i++)
80104530:	8b 17                	mov    (%edi),%edx
80104532:	85 d2                	test   %edx,%edx
80104534:	0f 84 6e ff ff ff    	je     801044a8 <procdump+0x18>
        cprintf(" %p", pc[i]);
8010453a:	83 ec 08             	sub    $0x8,%esp
8010453d:	83 c7 04             	add    $0x4,%edi
80104540:	52                   	push   %edx
80104541:	68 e1 76 10 80       	push   $0x801076e1
80104546:	e8 15 c1 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
8010454b:	83 c4 10             	add    $0x10,%esp
8010454e:	39 fe                	cmp    %edi,%esi
80104550:	75 de                	jne    80104530 <procdump+0xa0>
80104552:	e9 51 ff ff ff       	jmp    801044a8 <procdump+0x18>
80104557:	89 f6                	mov    %esi,%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
80104560:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104563:	5b                   	pop    %ebx
80104564:	5e                   	pop    %esi
80104565:	5f                   	pop    %edi
80104566:	5d                   	pop    %ebp
80104567:	c3                   	ret    
80104568:	90                   	nop
80104569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104570 <policy>:

int policy(int pol){
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	53                   	push   %ebx
80104574:	83 ec 10             	sub    $0x10,%esp
80104577:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010457a:	68 40 3d 11 80       	push   $0x80113d40
8010457f:	e8 0c 04 00 00       	call   80104990 <acquire>
  if(pol==0){
80104584:	83 c4 10             	add    $0x10,%esp
80104587:	85 db                	test   %ebx,%ebx
80104589:	74 45                	je     801045d0 <policy+0x60>
    sched_type=0;
    cprintf("Policy has been successfully changed to Default Policy\n");
    cprintf("%d",sched_type);
  }
  else if(pol==1){
8010458b:	83 fb 01             	cmp    $0x1,%ebx
8010458e:	74 70                	je     80104600 <policy+0x90>
    sched_type=1;
    cprintf("Policy has been successfully changed to Priority Policy\n");
  }
  else if(pol==2){
80104590:	83 fb 02             	cmp    $0x2,%ebx
80104593:	0f 85 87 00 00 00    	jne    80104620 <policy+0xb0>
    sched_type=2;
    cprintf("Policy has been successfully changed to CFS Policy\n");
80104599:	83 ec 0c             	sub    $0xc,%esp
    sched_type=2;
8010459c:	c7 05 b8 b5 10 80 02 	movl   $0x2,0x8010b5b8
801045a3:	00 00 00 
    cprintf("Policy has been successfully changed to CFS Policy\n");
801045a6:	68 78 7d 10 80       	push   $0x80107d78
801045ab:	e8 b0 c0 ff ff       	call   80100660 <cprintf>
801045b0:	83 c4 10             	add    $0x10,%esp
  else{
    cprintf("Error replacing policy, no such policy number(%d)\n",pol);
    release(&ptable.lock);
    return -1;
  }
  release(&ptable.lock);
801045b3:	83 ec 0c             	sub    $0xc,%esp
801045b6:	68 40 3d 11 80       	push   $0x80113d40
801045bb:	e8 90 04 00 00       	call   80104a50 <release>
  return 0;
801045c0:	83 c4 10             	add    $0x10,%esp
801045c3:	31 c0                	xor    %eax,%eax
}
801045c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045c8:	c9                   	leave  
801045c9:	c3                   	ret    
801045ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cprintf("Policy has been successfully changed to Default Policy\n");
801045d0:	83 ec 0c             	sub    $0xc,%esp
    sched_type=0;
801045d3:	c7 05 b8 b5 10 80 00 	movl   $0x0,0x8010b5b8
801045da:	00 00 00 
    cprintf("Policy has been successfully changed to Default Policy\n");
801045dd:	68 04 7d 10 80       	push   $0x80107d04
801045e2:	e8 79 c0 ff ff       	call   80100660 <cprintf>
    cprintf("%d",sched_type);
801045e7:	58                   	pop    %eax
801045e8:	5a                   	pop    %edx
801045e9:	ff 35 b8 b5 10 80    	pushl  0x8010b5b8
801045ef:	68 ad 7c 10 80       	push   $0x80107cad
801045f4:	e8 67 c0 ff ff       	call   80100660 <cprintf>
801045f9:	83 c4 10             	add    $0x10,%esp
801045fc:	eb b5                	jmp    801045b3 <policy+0x43>
801045fe:	66 90                	xchg   %ax,%ax
    cprintf("Policy has been successfully changed to Priority Policy\n");
80104600:	83 ec 0c             	sub    $0xc,%esp
    sched_type=1;
80104603:	c7 05 b8 b5 10 80 01 	movl   $0x1,0x8010b5b8
8010460a:	00 00 00 
    cprintf("Policy has been successfully changed to Priority Policy\n");
8010460d:	68 3c 7d 10 80       	push   $0x80107d3c
80104612:	e8 49 c0 ff ff       	call   80100660 <cprintf>
80104617:	83 c4 10             	add    $0x10,%esp
8010461a:	eb 97                	jmp    801045b3 <policy+0x43>
8010461c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("Error replacing policy, no such policy number(%d)\n",pol);
80104620:	83 ec 08             	sub    $0x8,%esp
80104623:	53                   	push   %ebx
80104624:	68 ac 7d 10 80       	push   $0x80107dac
80104629:	e8 32 c0 ff ff       	call   80100660 <cprintf>
    release(&ptable.lock);
8010462e:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104635:	e8 16 04 00 00       	call   80104a50 <release>
    return -1;
8010463a:	83 c4 10             	add    $0x10,%esp
8010463d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104642:	e9 7e ff ff ff       	jmp    801045c5 <policy+0x55>
80104647:	89 f6                	mov    %esi,%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <increase_ticks>:

// this function increases the time related fields of all the processes in the system dependitg on their state
void increase_ticks(){
80104650:	55                   	push   %ebp
  struct proc *p;
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104651:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
void increase_ticks(){
80104656:	89 e5                	mov    %esp,%ebp
80104658:	eb 20                	jmp    8010467a <increase_ticks+0x2a>
8010465a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNING)
      p->rtime++;
    else if(p->state==RUNNABLE)
80104660:	83 fa 03             	cmp    $0x3,%edx
80104663:	74 33                	je     80104698 <increase_ticks+0x48>
      p->retime++;
    else if(p->state==SLEEPING)
80104665:	83 fa 02             	cmp    $0x2,%edx
80104668:	75 04                	jne    8010466e <increase_ticks+0x1e>
      p->stime++;
8010466a:	83 40 10 01          	addl   $0x1,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010466e:	05 9c 00 00 00       	add    $0x9c,%eax
80104673:	3d 74 64 11 80       	cmp    $0x80116474,%eax
80104678:	73 18                	jae    80104692 <increase_ticks+0x42>
    if(p->state==RUNNING)
8010467a:	8b 50 2c             	mov    0x2c(%eax),%edx
8010467d:	83 fa 04             	cmp    $0x4,%edx
80104680:	75 de                	jne    80104660 <increase_ticks+0x10>
      p->rtime++;
80104682:	83 40 0c 01          	addl   $0x1,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104686:	05 9c 00 00 00       	add    $0x9c,%eax
8010468b:	3d 74 64 11 80       	cmp    $0x80116474,%eax
80104690:	72 e8                	jb     8010467a <increase_ticks+0x2a>
  }
}
80104692:	5d                   	pop    %ebp
80104693:	c3                   	ret    
80104694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p->retime++;
80104698:	83 40 14 01          	addl   $0x1,0x14(%eax)
8010469c:	eb d0                	jmp    8010466e <increase_ticks+0x1e>
8010469e:	66 90                	xchg   %ax,%ax

801046a0 <proc_info>:

int proc_info(struct perf * performance){
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	56                   	push   %esi
801046a4:	53                   	push   %ebx
801046a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
801046a8:	e8 13 02 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801046ad:	e8 ce ef ff ff       	call   80103680 <mycpu>
  p = c->proc;
801046b2:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801046b8:	e8 43 02 00 00       	call   80104900 <popcli>
  performance->ps_priority=myproc()->ps_priority;
801046bd:	8b 06                	mov    (%esi),%eax
801046bf:	89 03                	mov    %eax,(%ebx)
  pushcli();
801046c1:	e8 fa 01 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801046c6:	e8 b5 ef ff ff       	call   80103680 <mycpu>
  p = c->proc;
801046cb:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801046d1:	e8 2a 02 00 00       	call   80104900 <popcli>
  performance->retime=myproc()->retime;
801046d6:	8b 46 14             	mov    0x14(%esi),%eax
801046d9:	89 43 08             	mov    %eax,0x8(%ebx)
  pushcli();
801046dc:	e8 df 01 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801046e1:	e8 9a ef ff ff       	call   80103680 <mycpu>
  p = c->proc;
801046e6:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801046ec:	e8 0f 02 00 00       	call   80104900 <popcli>
  performance->rtime=myproc()->rtime;
801046f1:	8b 46 0c             	mov    0xc(%esi),%eax
801046f4:	89 43 0c             	mov    %eax,0xc(%ebx)
  pushcli();
801046f7:	e8 c4 01 00 00       	call   801048c0 <pushcli>
  c = mycpu();
801046fc:	e8 7f ef ff ff       	call   80103680 <mycpu>
  p = c->proc;
80104701:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104707:	e8 f4 01 00 00       	call   80104900 <popcli>
  performance->stime=myproc()->stime;
8010470c:	8b 46 10             	mov    0x10(%esi),%eax
8010470f:	89 43 04             	mov    %eax,0x4(%ebx)
  return 0;
80104712:	31 c0                	xor    %eax,%eax
80104714:	5b                   	pop    %ebx
80104715:	5e                   	pop    %esi
80104716:	5d                   	pop    %ebp
80104717:	c3                   	ret    
80104718:	66 90                	xchg   %ax,%ax
8010471a:	66 90                	xchg   %ax,%ax
8010471c:	66 90                	xchg   %ax,%ax
8010471e:	66 90                	xchg   %ax,%ax

80104720 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	53                   	push   %ebx
80104724:	83 ec 0c             	sub    $0xc,%esp
80104727:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010472a:	68 f8 7d 10 80       	push   $0x80107df8
8010472f:	8d 43 04             	lea    0x4(%ebx),%eax
80104732:	50                   	push   %eax
80104733:	e8 18 01 00 00       	call   80104850 <initlock>
  lk->name = name;
80104738:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010473b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104741:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104744:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010474b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010474e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104751:	c9                   	leave  
80104752:	c3                   	ret    
80104753:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104760 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	56                   	push   %esi
80104764:	53                   	push   %ebx
80104765:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104768:	83 ec 0c             	sub    $0xc,%esp
8010476b:	8d 73 04             	lea    0x4(%ebx),%esi
8010476e:	56                   	push   %esi
8010476f:	e8 1c 02 00 00       	call   80104990 <acquire>
  while (lk->locked) {
80104774:	8b 13                	mov    (%ebx),%edx
80104776:	83 c4 10             	add    $0x10,%esp
80104779:	85 d2                	test   %edx,%edx
8010477b:	74 16                	je     80104793 <acquiresleep+0x33>
8010477d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104780:	83 ec 08             	sub    $0x8,%esp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	e8 66 fa ff ff       	call   801041f0 <sleep>
  while (lk->locked) {
8010478a:	8b 03                	mov    (%ebx),%eax
8010478c:	83 c4 10             	add    $0x10,%esp
8010478f:	85 c0                	test   %eax,%eax
80104791:	75 ed                	jne    80104780 <acquiresleep+0x20>
  }
  lk->locked = 1;
80104793:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104799:	e8 82 ef ff ff       	call   80103720 <myproc>
8010479e:	8b 40 30             	mov    0x30(%eax),%eax
801047a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801047a4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801047a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047aa:	5b                   	pop    %ebx
801047ab:	5e                   	pop    %esi
801047ac:	5d                   	pop    %ebp
  release(&lk->lk);
801047ad:	e9 9e 02 00 00       	jmp    80104a50 <release>
801047b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801047c8:	83 ec 0c             	sub    $0xc,%esp
801047cb:	8d 73 04             	lea    0x4(%ebx),%esi
801047ce:	56                   	push   %esi
801047cf:	e8 bc 01 00 00       	call   80104990 <acquire>
  lk->locked = 0;
801047d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801047da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801047e1:	89 1c 24             	mov    %ebx,(%esp)
801047e4:	e8 f7 fb ff ff       	call   801043e0 <wakeup>
  release(&lk->lk);
801047e9:	89 75 08             	mov    %esi,0x8(%ebp)
801047ec:	83 c4 10             	add    $0x10,%esp
}
801047ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047f2:	5b                   	pop    %ebx
801047f3:	5e                   	pop    %esi
801047f4:	5d                   	pop    %ebp
  release(&lk->lk);
801047f5:	e9 56 02 00 00       	jmp    80104a50 <release>
801047fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104800 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	57                   	push   %edi
80104804:	56                   	push   %esi
80104805:	53                   	push   %ebx
80104806:	31 ff                	xor    %edi,%edi
80104808:	83 ec 18             	sub    $0x18,%esp
8010480b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010480e:	8d 73 04             	lea    0x4(%ebx),%esi
80104811:	56                   	push   %esi
80104812:	e8 79 01 00 00       	call   80104990 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104817:	8b 03                	mov    (%ebx),%eax
80104819:	83 c4 10             	add    $0x10,%esp
8010481c:	85 c0                	test   %eax,%eax
8010481e:	74 13                	je     80104833 <holdingsleep+0x33>
80104820:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104823:	e8 f8 ee ff ff       	call   80103720 <myproc>
80104828:	39 58 30             	cmp    %ebx,0x30(%eax)
8010482b:	0f 94 c0             	sete   %al
8010482e:	0f b6 c0             	movzbl %al,%eax
80104831:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104833:	83 ec 0c             	sub    $0xc,%esp
80104836:	56                   	push   %esi
80104837:	e8 14 02 00 00       	call   80104a50 <release>
  return r;
}
8010483c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010483f:	89 f8                	mov    %edi,%eax
80104841:	5b                   	pop    %ebx
80104842:	5e                   	pop    %esi
80104843:	5f                   	pop    %edi
80104844:	5d                   	pop    %ebp
80104845:	c3                   	ret    
80104846:	66 90                	xchg   %ax,%ax
80104848:	66 90                	xchg   %ax,%ax
8010484a:	66 90                	xchg   %ax,%ax
8010484c:	66 90                	xchg   %ax,%ax
8010484e:	66 90                	xchg   %ax,%ax

80104850 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104850:	55                   	push   %ebp
80104851:	89 e5                	mov    %esp,%ebp
80104853:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104856:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104859:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010485f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104862:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104869:	5d                   	pop    %ebp
8010486a:	c3                   	ret    
8010486b:	90                   	nop
8010486c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104870 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104870:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104871:	31 d2                	xor    %edx,%edx
{
80104873:	89 e5                	mov    %esp,%ebp
80104875:	53                   	push   %ebx
  ebp = (uint*)v - 2;
80104876:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104879:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
8010487c:	83 e8 08             	sub    $0x8,%eax
8010487f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104880:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104886:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010488c:	77 1a                	ja     801048a8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010488e:	8b 58 04             	mov    0x4(%eax),%ebx
80104891:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
80104894:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80104897:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104899:	83 fa 0a             	cmp    $0xa,%edx
8010489c:	75 e2                	jne    80104880 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010489e:	5b                   	pop    %ebx
8010489f:	5d                   	pop    %ebp
801048a0:	c3                   	ret    
801048a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048a8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801048ab:	83 c1 28             	add    $0x28,%ecx
801048ae:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
801048b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801048b6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801048b9:	39 c1                	cmp    %eax,%ecx
801048bb:	75 f3                	jne    801048b0 <getcallerpcs+0x40>
}
801048bd:	5b                   	pop    %ebx
801048be:	5d                   	pop    %ebp
801048bf:	c3                   	ret    

801048c0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801048c0:	55                   	push   %ebp
801048c1:	89 e5                	mov    %esp,%ebp
801048c3:	53                   	push   %ebx
801048c4:	83 ec 04             	sub    $0x4,%esp
801048c7:	9c                   	pushf  
801048c8:	5b                   	pop    %ebx
  asm volatile("cli");
801048c9:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
801048ca:	e8 b1 ed ff ff       	call   80103680 <mycpu>
801048cf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801048d5:	85 c0                	test   %eax,%eax
801048d7:	75 11                	jne    801048ea <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
801048d9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801048df:	e8 9c ed ff ff       	call   80103680 <mycpu>
801048e4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
801048ea:	e8 91 ed ff ff       	call   80103680 <mycpu>
801048ef:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801048f6:	83 c4 04             	add    $0x4,%esp
801048f9:	5b                   	pop    %ebx
801048fa:	5d                   	pop    %ebp
801048fb:	c3                   	ret    
801048fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104900 <popcli>:

void
popcli(void)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104906:	9c                   	pushf  
80104907:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104908:	f6 c4 02             	test   $0x2,%ah
8010490b:	75 35                	jne    80104942 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010490d:	e8 6e ed ff ff       	call   80103680 <mycpu>
80104912:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104919:	78 34                	js     8010494f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010491b:	e8 60 ed ff ff       	call   80103680 <mycpu>
80104920:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104926:	85 d2                	test   %edx,%edx
80104928:	74 06                	je     80104930 <popcli+0x30>
    sti();
}
8010492a:	c9                   	leave  
8010492b:	c3                   	ret    
8010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104930:	e8 4b ed ff ff       	call   80103680 <mycpu>
80104935:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010493b:	85 c0                	test   %eax,%eax
8010493d:	74 eb                	je     8010492a <popcli+0x2a>
  asm volatile("sti");
8010493f:	fb                   	sti    
}
80104940:	c9                   	leave  
80104941:	c3                   	ret    
    panic("popcli - interruptible");
80104942:	83 ec 0c             	sub    $0xc,%esp
80104945:	68 03 7e 10 80       	push   $0x80107e03
8010494a:	e8 41 ba ff ff       	call   80100390 <panic>
    panic("popcli");
8010494f:	83 ec 0c             	sub    $0xc,%esp
80104952:	68 1a 7e 10 80       	push   $0x80107e1a
80104957:	e8 34 ba ff ff       	call   80100390 <panic>
8010495c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104960 <holding>:
{
80104960:	55                   	push   %ebp
80104961:	89 e5                	mov    %esp,%ebp
80104963:	56                   	push   %esi
80104964:	53                   	push   %ebx
80104965:	8b 75 08             	mov    0x8(%ebp),%esi
80104968:	31 db                	xor    %ebx,%ebx
  pushcli();
8010496a:	e8 51 ff ff ff       	call   801048c0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010496f:	8b 06                	mov    (%esi),%eax
80104971:	85 c0                	test   %eax,%eax
80104973:	74 10                	je     80104985 <holding+0x25>
80104975:	8b 5e 08             	mov    0x8(%esi),%ebx
80104978:	e8 03 ed ff ff       	call   80103680 <mycpu>
8010497d:	39 c3                	cmp    %eax,%ebx
8010497f:	0f 94 c3             	sete   %bl
80104982:	0f b6 db             	movzbl %bl,%ebx
  popcli();
80104985:	e8 76 ff ff ff       	call   80104900 <popcli>
}
8010498a:	89 d8                	mov    %ebx,%eax
8010498c:	5b                   	pop    %ebx
8010498d:	5e                   	pop    %esi
8010498e:	5d                   	pop    %ebp
8010498f:	c3                   	ret    

80104990 <acquire>:
{
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	56                   	push   %esi
80104994:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80104995:	e8 26 ff ff ff       	call   801048c0 <pushcli>
  if(holding(lk))
8010499a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010499d:	83 ec 0c             	sub    $0xc,%esp
801049a0:	53                   	push   %ebx
801049a1:	e8 ba ff ff ff       	call   80104960 <holding>
801049a6:	83 c4 10             	add    $0x10,%esp
801049a9:	85 c0                	test   %eax,%eax
801049ab:	0f 85 83 00 00 00    	jne    80104a34 <acquire+0xa4>
801049b1:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
801049b3:	ba 01 00 00 00       	mov    $0x1,%edx
801049b8:	eb 09                	jmp    801049c3 <acquire+0x33>
801049ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801049c3:	89 d0                	mov    %edx,%eax
801049c5:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
801049c8:	85 c0                	test   %eax,%eax
801049ca:	75 f4                	jne    801049c0 <acquire+0x30>
  __sync_synchronize();
801049cc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
801049d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801049d4:	e8 a7 ec ff ff       	call   80103680 <mycpu>
  getcallerpcs(&lk, lk->pcs);
801049d9:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
801049dc:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
801049df:	89 e8                	mov    %ebp,%eax
801049e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801049e8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801049ee:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801049f4:	77 1a                	ja     80104a10 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
801049f6:	8b 48 04             	mov    0x4(%eax),%ecx
801049f9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
801049fc:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
801049ff:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104a01:	83 fe 0a             	cmp    $0xa,%esi
80104a04:	75 e2                	jne    801049e8 <acquire+0x58>
}
80104a06:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a09:	5b                   	pop    %ebx
80104a0a:	5e                   	pop    %esi
80104a0b:	5d                   	pop    %ebp
80104a0c:	c3                   	ret    
80104a0d:	8d 76 00             	lea    0x0(%esi),%esi
80104a10:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104a13:	83 c2 28             	add    $0x28,%edx
80104a16:	8d 76 00             	lea    0x0(%esi),%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104a20:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104a26:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104a29:	39 d0                	cmp    %edx,%eax
80104a2b:	75 f3                	jne    80104a20 <acquire+0x90>
}
80104a2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a30:	5b                   	pop    %ebx
80104a31:	5e                   	pop    %esi
80104a32:	5d                   	pop    %ebp
80104a33:	c3                   	ret    
    panic("acquire");
80104a34:	83 ec 0c             	sub    $0xc,%esp
80104a37:	68 21 7e 10 80       	push   $0x80107e21
80104a3c:	e8 4f b9 ff ff       	call   80100390 <panic>
80104a41:	eb 0d                	jmp    80104a50 <release>
80104a43:	90                   	nop
80104a44:	90                   	nop
80104a45:	90                   	nop
80104a46:	90                   	nop
80104a47:	90                   	nop
80104a48:	90                   	nop
80104a49:	90                   	nop
80104a4a:	90                   	nop
80104a4b:	90                   	nop
80104a4c:	90                   	nop
80104a4d:	90                   	nop
80104a4e:	90                   	nop
80104a4f:	90                   	nop

80104a50 <release>:
{
80104a50:	55                   	push   %ebp
80104a51:	89 e5                	mov    %esp,%ebp
80104a53:	53                   	push   %ebx
80104a54:	83 ec 10             	sub    $0x10,%esp
80104a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
80104a5a:	53                   	push   %ebx
80104a5b:	e8 00 ff ff ff       	call   80104960 <holding>
80104a60:	83 c4 10             	add    $0x10,%esp
80104a63:	85 c0                	test   %eax,%eax
80104a65:	74 22                	je     80104a89 <release+0x39>
  lk->pcs[0] = 0;
80104a67:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104a6e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104a75:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104a7a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104a80:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a83:	c9                   	leave  
  popcli();
80104a84:	e9 77 fe ff ff       	jmp    80104900 <popcli>
    panic("release");
80104a89:	83 ec 0c             	sub    $0xc,%esp
80104a8c:	68 29 7e 10 80       	push   $0x80107e29
80104a91:	e8 fa b8 ff ff       	call   80100390 <panic>
80104a96:	66 90                	xchg   %ax,%ax
80104a98:	66 90                	xchg   %ax,%ax
80104a9a:	66 90                	xchg   %ax,%ax
80104a9c:	66 90                	xchg   %ax,%ax
80104a9e:	66 90                	xchg   %ax,%ax

80104aa0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	57                   	push   %edi
80104aa4:	53                   	push   %ebx
80104aa5:	8b 55 08             	mov    0x8(%ebp),%edx
80104aa8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
80104aab:	f6 c2 03             	test   $0x3,%dl
80104aae:	75 05                	jne    80104ab5 <memset+0x15>
80104ab0:	f6 c1 03             	test   $0x3,%cl
80104ab3:	74 13                	je     80104ac8 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104ab5:	89 d7                	mov    %edx,%edi
80104ab7:	8b 45 0c             	mov    0xc(%ebp),%eax
80104aba:	fc                   	cld    
80104abb:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104abd:	5b                   	pop    %ebx
80104abe:	89 d0                	mov    %edx,%eax
80104ac0:	5f                   	pop    %edi
80104ac1:	5d                   	pop    %ebp
80104ac2:	c3                   	ret    
80104ac3:	90                   	nop
80104ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104ac8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80104acc:	c1 e9 02             	shr    $0x2,%ecx
80104acf:	89 f8                	mov    %edi,%eax
80104ad1:	89 fb                	mov    %edi,%ebx
80104ad3:	c1 e0 18             	shl    $0x18,%eax
80104ad6:	c1 e3 10             	shl    $0x10,%ebx
80104ad9:	09 d8                	or     %ebx,%eax
80104adb:	09 f8                	or     %edi,%eax
80104add:	c1 e7 08             	shl    $0x8,%edi
80104ae0:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104ae2:	89 d7                	mov    %edx,%edi
80104ae4:	fc                   	cld    
80104ae5:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104ae7:	5b                   	pop    %ebx
80104ae8:	89 d0                	mov    %edx,%eax
80104aea:	5f                   	pop    %edi
80104aeb:	5d                   	pop    %ebp
80104aec:	c3                   	ret    
80104aed:	8d 76 00             	lea    0x0(%esi),%esi

80104af0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104af0:	55                   	push   %ebp
80104af1:	89 e5                	mov    %esp,%ebp
80104af3:	57                   	push   %edi
80104af4:	56                   	push   %esi
80104af5:	53                   	push   %ebx
80104af6:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104af9:	8b 75 08             	mov    0x8(%ebp),%esi
80104afc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104aff:	85 db                	test   %ebx,%ebx
80104b01:	74 29                	je     80104b2c <memcmp+0x3c>
    if(*s1 != *s2)
80104b03:	0f b6 16             	movzbl (%esi),%edx
80104b06:	0f b6 0f             	movzbl (%edi),%ecx
80104b09:	38 d1                	cmp    %dl,%cl
80104b0b:	75 2b                	jne    80104b38 <memcmp+0x48>
80104b0d:	b8 01 00 00 00       	mov    $0x1,%eax
80104b12:	eb 14                	jmp    80104b28 <memcmp+0x38>
80104b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b18:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
80104b1c:	83 c0 01             	add    $0x1,%eax
80104b1f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104b24:	38 ca                	cmp    %cl,%dl
80104b26:	75 10                	jne    80104b38 <memcmp+0x48>
  while(n-- > 0){
80104b28:	39 d8                	cmp    %ebx,%eax
80104b2a:	75 ec                	jne    80104b18 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
80104b2c:	5b                   	pop    %ebx
  return 0;
80104b2d:	31 c0                	xor    %eax,%eax
}
80104b2f:	5e                   	pop    %esi
80104b30:	5f                   	pop    %edi
80104b31:	5d                   	pop    %ebp
80104b32:	c3                   	ret    
80104b33:	90                   	nop
80104b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104b38:	0f b6 c2             	movzbl %dl,%eax
}
80104b3b:	5b                   	pop    %ebx
      return *s1 - *s2;
80104b3c:	29 c8                	sub    %ecx,%eax
}
80104b3e:	5e                   	pop    %esi
80104b3f:	5f                   	pop    %edi
80104b40:	5d                   	pop    %ebp
80104b41:	c3                   	ret    
80104b42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b50 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	56                   	push   %esi
80104b54:	53                   	push   %ebx
80104b55:	8b 45 08             	mov    0x8(%ebp),%eax
80104b58:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104b5b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104b5e:	39 c3                	cmp    %eax,%ebx
80104b60:	73 26                	jae    80104b88 <memmove+0x38>
80104b62:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104b65:	39 c8                	cmp    %ecx,%eax
80104b67:	73 1f                	jae    80104b88 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
80104b69:	85 f6                	test   %esi,%esi
80104b6b:	8d 56 ff             	lea    -0x1(%esi),%edx
80104b6e:	74 0f                	je     80104b7f <memmove+0x2f>
      *--d = *--s;
80104b70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104b74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
80104b77:	83 ea 01             	sub    $0x1,%edx
80104b7a:	83 fa ff             	cmp    $0xffffffff,%edx
80104b7d:	75 f1                	jne    80104b70 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104b7f:	5b                   	pop    %ebx
80104b80:	5e                   	pop    %esi
80104b81:	5d                   	pop    %ebp
80104b82:	c3                   	ret    
80104b83:	90                   	nop
80104b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
80104b88:	31 d2                	xor    %edx,%edx
80104b8a:	85 f6                	test   %esi,%esi
80104b8c:	74 f1                	je     80104b7f <memmove+0x2f>
80104b8e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104b90:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104b94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104b97:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
80104b9a:	39 d6                	cmp    %edx,%esi
80104b9c:	75 f2                	jne    80104b90 <memmove+0x40>
}
80104b9e:	5b                   	pop    %ebx
80104b9f:	5e                   	pop    %esi
80104ba0:	5d                   	pop    %ebp
80104ba1:	c3                   	ret    
80104ba2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bb0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104bb0:	55                   	push   %ebp
80104bb1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104bb3:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104bb4:	eb 9a                	jmp    80104b50 <memmove>
80104bb6:	8d 76 00             	lea    0x0(%esi),%esi
80104bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bc0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104bc0:	55                   	push   %ebp
80104bc1:	89 e5                	mov    %esp,%ebp
80104bc3:	57                   	push   %edi
80104bc4:	56                   	push   %esi
80104bc5:	8b 7d 10             	mov    0x10(%ebp),%edi
80104bc8:	53                   	push   %ebx
80104bc9:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104bcc:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
80104bcf:	85 ff                	test   %edi,%edi
80104bd1:	74 2f                	je     80104c02 <strncmp+0x42>
80104bd3:	0f b6 01             	movzbl (%ecx),%eax
80104bd6:	0f b6 1e             	movzbl (%esi),%ebx
80104bd9:	84 c0                	test   %al,%al
80104bdb:	74 37                	je     80104c14 <strncmp+0x54>
80104bdd:	38 c3                	cmp    %al,%bl
80104bdf:	75 33                	jne    80104c14 <strncmp+0x54>
80104be1:	01 f7                	add    %esi,%edi
80104be3:	eb 13                	jmp    80104bf8 <strncmp+0x38>
80104be5:	8d 76 00             	lea    0x0(%esi),%esi
80104be8:	0f b6 01             	movzbl (%ecx),%eax
80104beb:	84 c0                	test   %al,%al
80104bed:	74 21                	je     80104c10 <strncmp+0x50>
80104bef:	0f b6 1a             	movzbl (%edx),%ebx
80104bf2:	89 d6                	mov    %edx,%esi
80104bf4:	38 d8                	cmp    %bl,%al
80104bf6:	75 1c                	jne    80104c14 <strncmp+0x54>
    n--, p++, q++;
80104bf8:	8d 56 01             	lea    0x1(%esi),%edx
80104bfb:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80104bfe:	39 fa                	cmp    %edi,%edx
80104c00:	75 e6                	jne    80104be8 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104c02:	5b                   	pop    %ebx
    return 0;
80104c03:	31 c0                	xor    %eax,%eax
}
80104c05:	5e                   	pop    %esi
80104c06:	5f                   	pop    %edi
80104c07:	5d                   	pop    %ebp
80104c08:	c3                   	ret    
80104c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c10:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104c14:	29 d8                	sub    %ebx,%eax
}
80104c16:	5b                   	pop    %ebx
80104c17:	5e                   	pop    %esi
80104c18:	5f                   	pop    %edi
80104c19:	5d                   	pop    %ebp
80104c1a:	c3                   	ret    
80104c1b:	90                   	nop
80104c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c20 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	56                   	push   %esi
80104c24:	53                   	push   %ebx
80104c25:	8b 45 08             	mov    0x8(%ebp),%eax
80104c28:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104c2b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104c2e:	89 c2                	mov    %eax,%edx
80104c30:	eb 19                	jmp    80104c4b <strncpy+0x2b>
80104c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c38:	83 c3 01             	add    $0x1,%ebx
80104c3b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104c3f:	83 c2 01             	add    $0x1,%edx
80104c42:	84 c9                	test   %cl,%cl
80104c44:	88 4a ff             	mov    %cl,-0x1(%edx)
80104c47:	74 09                	je     80104c52 <strncpy+0x32>
80104c49:	89 f1                	mov    %esi,%ecx
80104c4b:	85 c9                	test   %ecx,%ecx
80104c4d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104c50:	7f e6                	jg     80104c38 <strncpy+0x18>
    ;
  while(n-- > 0)
80104c52:	31 c9                	xor    %ecx,%ecx
80104c54:	85 f6                	test   %esi,%esi
80104c56:	7e 17                	jle    80104c6f <strncpy+0x4f>
80104c58:	90                   	nop
80104c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104c60:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104c64:	89 f3                	mov    %esi,%ebx
80104c66:	83 c1 01             	add    $0x1,%ecx
80104c69:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
80104c6b:	85 db                	test   %ebx,%ebx
80104c6d:	7f f1                	jg     80104c60 <strncpy+0x40>
  return os;
}
80104c6f:	5b                   	pop    %ebx
80104c70:	5e                   	pop    %esi
80104c71:	5d                   	pop    %ebp
80104c72:	c3                   	ret    
80104c73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c80 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104c80:	55                   	push   %ebp
80104c81:	89 e5                	mov    %esp,%ebp
80104c83:	56                   	push   %esi
80104c84:	53                   	push   %ebx
80104c85:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104c88:	8b 45 08             	mov    0x8(%ebp),%eax
80104c8b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104c8e:	85 c9                	test   %ecx,%ecx
80104c90:	7e 26                	jle    80104cb8 <safestrcpy+0x38>
80104c92:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104c96:	89 c1                	mov    %eax,%ecx
80104c98:	eb 17                	jmp    80104cb1 <safestrcpy+0x31>
80104c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104ca0:	83 c2 01             	add    $0x1,%edx
80104ca3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104ca7:	83 c1 01             	add    $0x1,%ecx
80104caa:	84 db                	test   %bl,%bl
80104cac:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104caf:	74 04                	je     80104cb5 <safestrcpy+0x35>
80104cb1:	39 f2                	cmp    %esi,%edx
80104cb3:	75 eb                	jne    80104ca0 <safestrcpy+0x20>
    ;
  *s = 0;
80104cb5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104cb8:	5b                   	pop    %ebx
80104cb9:	5e                   	pop    %esi
80104cba:	5d                   	pop    %ebp
80104cbb:	c3                   	ret    
80104cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104cc0 <strlen>:

int
strlen(const char *s)
{
80104cc0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104cc1:	31 c0                	xor    %eax,%eax
{
80104cc3:	89 e5                	mov    %esp,%ebp
80104cc5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104cc8:	80 3a 00             	cmpb   $0x0,(%edx)
80104ccb:	74 0c                	je     80104cd9 <strlen+0x19>
80104ccd:	8d 76 00             	lea    0x0(%esi),%esi
80104cd0:	83 c0 01             	add    $0x1,%eax
80104cd3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104cd7:	75 f7                	jne    80104cd0 <strlen+0x10>
    ;
  return n;
}
80104cd9:	5d                   	pop    %ebp
80104cda:	c3                   	ret    

80104cdb <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104cdb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104cdf:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104ce3:	55                   	push   %ebp
  pushl %ebx
80104ce4:	53                   	push   %ebx
  pushl %esi
80104ce5:	56                   	push   %esi
  pushl %edi
80104ce6:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104ce7:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104ce9:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80104ceb:	5f                   	pop    %edi
  popl %esi
80104cec:	5e                   	pop    %esi
  popl %ebx
80104ced:	5b                   	pop    %ebx
  popl %ebp
80104cee:	5d                   	pop    %ebp
  ret
80104cef:	c3                   	ret    

80104cf0 <fetchint>:
// library system call function. The saved user %esp points
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int fetchint(uint addr, int *ip)
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	53                   	push   %ebx
80104cf4:	83 ec 04             	sub    $0x4,%esp
80104cf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104cfa:	e8 21 ea ff ff       	call   80103720 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104cff:	8b 40 20             	mov    0x20(%eax),%eax
80104d02:	39 d8                	cmp    %ebx,%eax
80104d04:	76 1a                	jbe    80104d20 <fetchint+0x30>
80104d06:	8d 53 04             	lea    0x4(%ebx),%edx
80104d09:	39 d0                	cmp    %edx,%eax
80104d0b:	72 13                	jb     80104d20 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
80104d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104d10:	8b 13                	mov    (%ebx),%edx
80104d12:	89 10                	mov    %edx,(%eax)
  return 0;
80104d14:	31 c0                	xor    %eax,%eax
}
80104d16:	83 c4 04             	add    $0x4,%esp
80104d19:	5b                   	pop    %ebx
80104d1a:	5d                   	pop    %ebp
80104d1b:	c3                   	ret    
80104d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d25:	eb ef                	jmp    80104d16 <fetchint+0x26>
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d30 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
80104d33:	53                   	push   %ebx
80104d34:	83 ec 04             	sub    $0x4,%esp
80104d37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104d3a:	e8 e1 e9 ff ff       	call   80103720 <myproc>

  if(addr >= curproc->sz)
80104d3f:	39 58 20             	cmp    %ebx,0x20(%eax)
80104d42:	76 28                	jbe    80104d6c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104d44:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104d47:	89 da                	mov    %ebx,%edx
80104d49:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
80104d4b:	8b 40 20             	mov    0x20(%eax),%eax
  for(s = *pp; s < ep; s++){
80104d4e:	39 c3                	cmp    %eax,%ebx
80104d50:	73 1a                	jae    80104d6c <fetchstr+0x3c>
    if(*s == 0)
80104d52:	80 3b 00             	cmpb   $0x0,(%ebx)
80104d55:	75 0e                	jne    80104d65 <fetchstr+0x35>
80104d57:	eb 37                	jmp    80104d90 <fetchstr+0x60>
80104d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d60:	80 3a 00             	cmpb   $0x0,(%edx)
80104d63:	74 1b                	je     80104d80 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104d65:	83 c2 01             	add    $0x1,%edx
80104d68:	39 d0                	cmp    %edx,%eax
80104d6a:	77 f4                	ja     80104d60 <fetchstr+0x30>
    return -1;
80104d6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
80104d71:	83 c4 04             	add    $0x4,%esp
80104d74:	5b                   	pop    %ebx
80104d75:	5d                   	pop    %ebp
80104d76:	c3                   	ret    
80104d77:	89 f6                	mov    %esi,%esi
80104d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d80:	83 c4 04             	add    $0x4,%esp
80104d83:	89 d0                	mov    %edx,%eax
80104d85:	29 d8                	sub    %ebx,%eax
80104d87:	5b                   	pop    %ebx
80104d88:	5d                   	pop    %ebp
80104d89:	c3                   	ret    
80104d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
80104d90:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104d92:	eb dd                	jmp    80104d71 <fetchstr+0x41>
80104d94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104da0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104da0:	55                   	push   %ebp
80104da1:	89 e5                	mov    %esp,%ebp
80104da3:	56                   	push   %esi
80104da4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104da5:	e8 76 e9 ff ff       	call   80103720 <myproc>
80104daa:	8b 40 38             	mov    0x38(%eax),%eax
80104dad:	8b 55 08             	mov    0x8(%ebp),%edx
80104db0:	8b 40 44             	mov    0x44(%eax),%eax
80104db3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104db6:	e8 65 e9 ff ff       	call   80103720 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104dbb:	8b 40 20             	mov    0x20(%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104dbe:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104dc1:	39 c6                	cmp    %eax,%esi
80104dc3:	73 1b                	jae    80104de0 <argint+0x40>
80104dc5:	8d 53 08             	lea    0x8(%ebx),%edx
80104dc8:	39 d0                	cmp    %edx,%eax
80104dca:	72 14                	jb     80104de0 <argint+0x40>
  *ip = *(int*)(addr);
80104dcc:	8b 45 0c             	mov    0xc(%ebp),%eax
80104dcf:	8b 53 04             	mov    0x4(%ebx),%edx
80104dd2:	89 10                	mov    %edx,(%eax)
  return 0;
80104dd4:	31 c0                	xor    %eax,%eax
}
80104dd6:	5b                   	pop    %ebx
80104dd7:	5e                   	pop    %esi
80104dd8:	5d                   	pop    %ebp
80104dd9:	c3                   	ret    
80104dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104de0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104de5:	eb ef                	jmp    80104dd6 <argint+0x36>
80104de7:	89 f6                	mov    %esi,%esi
80104de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104df0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104df0:	55                   	push   %ebp
80104df1:	89 e5                	mov    %esp,%ebp
80104df3:	56                   	push   %esi
80104df4:	53                   	push   %ebx
80104df5:	83 ec 10             	sub    $0x10,%esp
80104df8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104dfb:	e8 20 e9 ff ff       	call   80103720 <myproc>
80104e00:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104e02:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e05:	83 ec 08             	sub    $0x8,%esp
80104e08:	50                   	push   %eax
80104e09:	ff 75 08             	pushl  0x8(%ebp)
80104e0c:	e8 8f ff ff ff       	call   80104da0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104e11:	83 c4 10             	add    $0x10,%esp
80104e14:	85 c0                	test   %eax,%eax
80104e16:	78 28                	js     80104e40 <argptr+0x50>
80104e18:	85 db                	test   %ebx,%ebx
80104e1a:	78 24                	js     80104e40 <argptr+0x50>
80104e1c:	8b 56 20             	mov    0x20(%esi),%edx
80104e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104e22:	39 c2                	cmp    %eax,%edx
80104e24:	76 1a                	jbe    80104e40 <argptr+0x50>
80104e26:	01 c3                	add    %eax,%ebx
80104e28:	39 da                	cmp    %ebx,%edx
80104e2a:	72 14                	jb     80104e40 <argptr+0x50>
    return -1;
  *pp = (char*)i;
80104e2c:	8b 55 0c             	mov    0xc(%ebp),%edx
80104e2f:	89 02                	mov    %eax,(%edx)
  return 0;
80104e31:	31 c0                	xor    %eax,%eax
}
80104e33:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e36:	5b                   	pop    %ebx
80104e37:	5e                   	pop    %esi
80104e38:	5d                   	pop    %ebp
80104e39:	c3                   	ret    
80104e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e45:	eb ec                	jmp    80104e33 <argptr+0x43>
80104e47:	89 f6                	mov    %esi,%esi
80104e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e50 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104e56:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e59:	50                   	push   %eax
80104e5a:	ff 75 08             	pushl  0x8(%ebp)
80104e5d:	e8 3e ff ff ff       	call   80104da0 <argint>
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	85 c0                	test   %eax,%eax
80104e67:	78 17                	js     80104e80 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104e69:	83 ec 08             	sub    $0x8,%esp
80104e6c:	ff 75 0c             	pushl  0xc(%ebp)
80104e6f:	ff 75 f4             	pushl  -0xc(%ebp)
80104e72:	e8 b9 fe ff ff       	call   80104d30 <fetchstr>
80104e77:	83 c4 10             	add    $0x10,%esp
}
80104e7a:	c9                   	leave  
80104e7b:	c3                   	ret    
80104e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104e80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e85:	c9                   	leave  
80104e86:	c3                   	ret    
80104e87:	89 f6                	mov    %esi,%esi
80104e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e90 <syscall>:
[SYS_proc_info]  sys_proc_info
};

void
syscall(void)
{
80104e90:	55                   	push   %ebp
80104e91:	89 e5                	mov    %esp,%ebp
80104e93:	53                   	push   %ebx
80104e94:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104e97:	e8 84 e8 ff ff       	call   80103720 <myproc>
80104e9c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104e9e:	8b 40 38             	mov    0x38(%eax),%eax
80104ea1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104ea4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104ea7:	83 fa 19             	cmp    $0x19,%edx
80104eaa:	77 1c                	ja     80104ec8 <syscall+0x38>
80104eac:	8b 14 85 60 7e 10 80 	mov    -0x7fef81a0(,%eax,4),%edx
80104eb3:	85 d2                	test   %edx,%edx
80104eb5:	74 11                	je     80104ec8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104eb7:	ff d2                	call   *%edx
80104eb9:	8b 53 38             	mov    0x38(%ebx),%edx
80104ebc:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104ebf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ec2:	c9                   	leave  
80104ec3:	c3                   	ret    
80104ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104ec8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104ec9:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104ecf:	50                   	push   %eax
80104ed0:	ff 73 30             	pushl  0x30(%ebx)
80104ed3:	68 31 7e 10 80       	push   $0x80107e31
80104ed8:	e8 83 b7 ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104edd:	8b 43 38             	mov    0x38(%ebx),%eax
80104ee0:	83 c4 10             	add    $0x10,%esp
80104ee3:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104eea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104eed:	c9                   	leave  
80104eee:	c3                   	ret    
80104eef:	90                   	nop

80104ef0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	57                   	push   %edi
80104ef4:	56                   	push   %esi
80104ef5:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104ef6:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104ef9:	83 ec 34             	sub    $0x34,%esp
80104efc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104eff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104f02:	56                   	push   %esi
80104f03:	50                   	push   %eax
{
80104f04:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104f07:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104f0a:	e8 01 d0 ff ff       	call   80101f10 <nameiparent>
80104f0f:	83 c4 10             	add    $0x10,%esp
80104f12:	85 c0                	test   %eax,%eax
80104f14:	0f 84 46 01 00 00    	je     80105060 <create+0x170>
    return 0;
  ilock(dp);
80104f1a:	83 ec 0c             	sub    $0xc,%esp
80104f1d:	89 c3                	mov    %eax,%ebx
80104f1f:	50                   	push   %eax
80104f20:	e8 5b c7 ff ff       	call   80101680 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104f25:	83 c4 0c             	add    $0xc,%esp
80104f28:	6a 00                	push   $0x0
80104f2a:	56                   	push   %esi
80104f2b:	53                   	push   %ebx
80104f2c:	e8 7f cc ff ff       	call   80101bb0 <dirlookup>
80104f31:	83 c4 10             	add    $0x10,%esp
80104f34:	85 c0                	test   %eax,%eax
80104f36:	89 c7                	mov    %eax,%edi
80104f38:	74 36                	je     80104f70 <create+0x80>
    iunlockput(dp);
80104f3a:	83 ec 0c             	sub    $0xc,%esp
80104f3d:	53                   	push   %ebx
80104f3e:	e8 cd c9 ff ff       	call   80101910 <iunlockput>
    ilock(ip);
80104f43:	89 3c 24             	mov    %edi,(%esp)
80104f46:	e8 35 c7 ff ff       	call   80101680 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104f4b:	83 c4 10             	add    $0x10,%esp
80104f4e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104f53:	0f 85 97 00 00 00    	jne    80104ff0 <create+0x100>
80104f59:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104f5e:	0f 85 8c 00 00 00    	jne    80104ff0 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104f64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f67:	89 f8                	mov    %edi,%eax
80104f69:	5b                   	pop    %ebx
80104f6a:	5e                   	pop    %esi
80104f6b:	5f                   	pop    %edi
80104f6c:	5d                   	pop    %ebp
80104f6d:	c3                   	ret    
80104f6e:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104f70:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104f74:	83 ec 08             	sub    $0x8,%esp
80104f77:	50                   	push   %eax
80104f78:	ff 33                	pushl  (%ebx)
80104f7a:	e8 91 c5 ff ff       	call   80101510 <ialloc>
80104f7f:	83 c4 10             	add    $0x10,%esp
80104f82:	85 c0                	test   %eax,%eax
80104f84:	89 c7                	mov    %eax,%edi
80104f86:	0f 84 e8 00 00 00    	je     80105074 <create+0x184>
  ilock(ip);
80104f8c:	83 ec 0c             	sub    $0xc,%esp
80104f8f:	50                   	push   %eax
80104f90:	e8 eb c6 ff ff       	call   80101680 <ilock>
  ip->major = major;
80104f95:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104f99:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104f9d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104fa1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104fa5:	b8 01 00 00 00       	mov    $0x1,%eax
80104faa:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104fae:	89 3c 24             	mov    %edi,(%esp)
80104fb1:	e8 1a c6 ff ff       	call   801015d0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104fb6:	83 c4 10             	add    $0x10,%esp
80104fb9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104fbe:	74 50                	je     80105010 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104fc0:	83 ec 04             	sub    $0x4,%esp
80104fc3:	ff 77 04             	pushl  0x4(%edi)
80104fc6:	56                   	push   %esi
80104fc7:	53                   	push   %ebx
80104fc8:	e8 63 ce ff ff       	call   80101e30 <dirlink>
80104fcd:	83 c4 10             	add    $0x10,%esp
80104fd0:	85 c0                	test   %eax,%eax
80104fd2:	0f 88 8f 00 00 00    	js     80105067 <create+0x177>
  iunlockput(dp);
80104fd8:	83 ec 0c             	sub    $0xc,%esp
80104fdb:	53                   	push   %ebx
80104fdc:	e8 2f c9 ff ff       	call   80101910 <iunlockput>
  return ip;
80104fe1:	83 c4 10             	add    $0x10,%esp
}
80104fe4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fe7:	89 f8                	mov    %edi,%eax
80104fe9:	5b                   	pop    %ebx
80104fea:	5e                   	pop    %esi
80104feb:	5f                   	pop    %edi
80104fec:	5d                   	pop    %ebp
80104fed:	c3                   	ret    
80104fee:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104ff0:	83 ec 0c             	sub    $0xc,%esp
80104ff3:	57                   	push   %edi
    return 0;
80104ff4:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104ff6:	e8 15 c9 ff ff       	call   80101910 <iunlockput>
    return 0;
80104ffb:	83 c4 10             	add    $0x10,%esp
}
80104ffe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105001:	89 f8                	mov    %edi,%eax
80105003:	5b                   	pop    %ebx
80105004:	5e                   	pop    %esi
80105005:	5f                   	pop    %edi
80105006:	5d                   	pop    %ebp
80105007:	c3                   	ret    
80105008:	90                   	nop
80105009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80105010:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80105015:	83 ec 0c             	sub    $0xc,%esp
80105018:	53                   	push   %ebx
80105019:	e8 b2 c5 ff ff       	call   801015d0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010501e:	83 c4 0c             	add    $0xc,%esp
80105021:	ff 77 04             	pushl  0x4(%edi)
80105024:	68 e8 7e 10 80       	push   $0x80107ee8
80105029:	57                   	push   %edi
8010502a:	e8 01 ce ff ff       	call   80101e30 <dirlink>
8010502f:	83 c4 10             	add    $0x10,%esp
80105032:	85 c0                	test   %eax,%eax
80105034:	78 1c                	js     80105052 <create+0x162>
80105036:	83 ec 04             	sub    $0x4,%esp
80105039:	ff 73 04             	pushl  0x4(%ebx)
8010503c:	68 e7 7e 10 80       	push   $0x80107ee7
80105041:	57                   	push   %edi
80105042:	e8 e9 cd ff ff       	call   80101e30 <dirlink>
80105047:	83 c4 10             	add    $0x10,%esp
8010504a:	85 c0                	test   %eax,%eax
8010504c:	0f 89 6e ff ff ff    	jns    80104fc0 <create+0xd0>
      panic("create dots");
80105052:	83 ec 0c             	sub    $0xc,%esp
80105055:	68 db 7e 10 80       	push   $0x80107edb
8010505a:	e8 31 b3 ff ff       	call   80100390 <panic>
8010505f:	90                   	nop
    return 0;
80105060:	31 ff                	xor    %edi,%edi
80105062:	e9 fd fe ff ff       	jmp    80104f64 <create+0x74>
    panic("create: dirlink");
80105067:	83 ec 0c             	sub    $0xc,%esp
8010506a:	68 ea 7e 10 80       	push   $0x80107eea
8010506f:	e8 1c b3 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80105074:	83 ec 0c             	sub    $0xc,%esp
80105077:	68 cc 7e 10 80       	push   $0x80107ecc
8010507c:	e8 0f b3 ff ff       	call   80100390 <panic>
80105081:	eb 0d                	jmp    80105090 <argfd.constprop.0>
80105083:	90                   	nop
80105084:	90                   	nop
80105085:	90                   	nop
80105086:	90                   	nop
80105087:	90                   	nop
80105088:	90                   	nop
80105089:	90                   	nop
8010508a:	90                   	nop
8010508b:	90                   	nop
8010508c:	90                   	nop
8010508d:	90                   	nop
8010508e:	90                   	nop
8010508f:	90                   	nop

80105090 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	56                   	push   %esi
80105094:	53                   	push   %ebx
80105095:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80105097:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
8010509a:	89 d6                	mov    %edx,%esi
8010509c:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
8010509f:	50                   	push   %eax
801050a0:	6a 00                	push   $0x0
801050a2:	e8 f9 fc ff ff       	call   80104da0 <argint>
801050a7:	83 c4 10             	add    $0x10,%esp
801050aa:	85 c0                	test   %eax,%eax
801050ac:	78 2a                	js     801050d8 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
801050ae:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801050b2:	77 24                	ja     801050d8 <argfd.constprop.0+0x48>
801050b4:	e8 67 e6 ff ff       	call   80103720 <myproc>
801050b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801050bc:	8b 44 90 48          	mov    0x48(%eax,%edx,4),%eax
801050c0:	85 c0                	test   %eax,%eax
801050c2:	74 14                	je     801050d8 <argfd.constprop.0+0x48>
  if(pfd)
801050c4:	85 db                	test   %ebx,%ebx
801050c6:	74 02                	je     801050ca <argfd.constprop.0+0x3a>
    *pfd = fd;
801050c8:	89 13                	mov    %edx,(%ebx)
    *pf = f;
801050ca:	89 06                	mov    %eax,(%esi)
  return 0;
801050cc:	31 c0                	xor    %eax,%eax
}
801050ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801050d1:	5b                   	pop    %ebx
801050d2:	5e                   	pop    %esi
801050d3:	5d                   	pop    %ebp
801050d4:	c3                   	ret    
801050d5:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
801050d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050dd:	eb ef                	jmp    801050ce <argfd.constprop.0+0x3e>
801050df:	90                   	nop

801050e0 <sys_dup>:
{
801050e0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
801050e1:	31 c0                	xor    %eax,%eax
{
801050e3:	89 e5                	mov    %esp,%ebp
801050e5:	56                   	push   %esi
801050e6:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
801050e7:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
801050ea:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
801050ed:	e8 9e ff ff ff       	call   80105090 <argfd.constprop.0>
801050f2:	85 c0                	test   %eax,%eax
801050f4:	78 42                	js     80105138 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
801050f6:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
801050f9:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
801050fb:	e8 20 e6 ff ff       	call   80103720 <myproc>
80105100:	eb 0e                	jmp    80105110 <sys_dup+0x30>
80105102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80105108:	83 c3 01             	add    $0x1,%ebx
8010510b:	83 fb 10             	cmp    $0x10,%ebx
8010510e:	74 28                	je     80105138 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80105110:	8b 54 98 48          	mov    0x48(%eax,%ebx,4),%edx
80105114:	85 d2                	test   %edx,%edx
80105116:	75 f0                	jne    80105108 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80105118:	89 74 98 48          	mov    %esi,0x48(%eax,%ebx,4)
  filedup(f);
8010511c:	83 ec 0c             	sub    $0xc,%esp
8010511f:	ff 75 f4             	pushl  -0xc(%ebp)
80105122:	e8 c9 bc ff ff       	call   80100df0 <filedup>
  return fd;
80105127:	83 c4 10             	add    $0x10,%esp
}
8010512a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010512d:	89 d8                	mov    %ebx,%eax
8010512f:	5b                   	pop    %ebx
80105130:	5e                   	pop    %esi
80105131:	5d                   	pop    %ebp
80105132:	c3                   	ret    
80105133:	90                   	nop
80105134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105138:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
8010513b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80105140:	89 d8                	mov    %ebx,%eax
80105142:	5b                   	pop    %ebx
80105143:	5e                   	pop    %esi
80105144:	5d                   	pop    %ebp
80105145:	c3                   	ret    
80105146:	8d 76 00             	lea    0x0(%esi),%esi
80105149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105150 <sys_read>:
{
80105150:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105151:	31 c0                	xor    %eax,%eax
{
80105153:	89 e5                	mov    %esp,%ebp
80105155:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105158:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010515b:	e8 30 ff ff ff       	call   80105090 <argfd.constprop.0>
80105160:	85 c0                	test   %eax,%eax
80105162:	78 4c                	js     801051b0 <sys_read+0x60>
80105164:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105167:	83 ec 08             	sub    $0x8,%esp
8010516a:	50                   	push   %eax
8010516b:	6a 02                	push   $0x2
8010516d:	e8 2e fc ff ff       	call   80104da0 <argint>
80105172:	83 c4 10             	add    $0x10,%esp
80105175:	85 c0                	test   %eax,%eax
80105177:	78 37                	js     801051b0 <sys_read+0x60>
80105179:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010517c:	83 ec 04             	sub    $0x4,%esp
8010517f:	ff 75 f0             	pushl  -0x10(%ebp)
80105182:	50                   	push   %eax
80105183:	6a 01                	push   $0x1
80105185:	e8 66 fc ff ff       	call   80104df0 <argptr>
8010518a:	83 c4 10             	add    $0x10,%esp
8010518d:	85 c0                	test   %eax,%eax
8010518f:	78 1f                	js     801051b0 <sys_read+0x60>
  return fileread(f, p, n);
80105191:	83 ec 04             	sub    $0x4,%esp
80105194:	ff 75 f0             	pushl  -0x10(%ebp)
80105197:	ff 75 f4             	pushl  -0xc(%ebp)
8010519a:	ff 75 ec             	pushl  -0x14(%ebp)
8010519d:	e8 be bd ff ff       	call   80100f60 <fileread>
801051a2:	83 c4 10             	add    $0x10,%esp
}
801051a5:	c9                   	leave  
801051a6:	c3                   	ret    
801051a7:	89 f6                	mov    %esi,%esi
801051a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
801051b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051b5:	c9                   	leave  
801051b6:	c3                   	ret    
801051b7:	89 f6                	mov    %esi,%esi
801051b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051c0 <sys_write>:
{
801051c0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051c1:	31 c0                	xor    %eax,%eax
{
801051c3:	89 e5                	mov    %esp,%ebp
801051c5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051c8:	8d 55 ec             	lea    -0x14(%ebp),%edx
801051cb:	e8 c0 fe ff ff       	call   80105090 <argfd.constprop.0>
801051d0:	85 c0                	test   %eax,%eax
801051d2:	78 4c                	js     80105220 <sys_write+0x60>
801051d4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051d7:	83 ec 08             	sub    $0x8,%esp
801051da:	50                   	push   %eax
801051db:	6a 02                	push   $0x2
801051dd:	e8 be fb ff ff       	call   80104da0 <argint>
801051e2:	83 c4 10             	add    $0x10,%esp
801051e5:	85 c0                	test   %eax,%eax
801051e7:	78 37                	js     80105220 <sys_write+0x60>
801051e9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ec:	83 ec 04             	sub    $0x4,%esp
801051ef:	ff 75 f0             	pushl  -0x10(%ebp)
801051f2:	50                   	push   %eax
801051f3:	6a 01                	push   $0x1
801051f5:	e8 f6 fb ff ff       	call   80104df0 <argptr>
801051fa:	83 c4 10             	add    $0x10,%esp
801051fd:	85 c0                	test   %eax,%eax
801051ff:	78 1f                	js     80105220 <sys_write+0x60>
  return filewrite(f, p, n);
80105201:	83 ec 04             	sub    $0x4,%esp
80105204:	ff 75 f0             	pushl  -0x10(%ebp)
80105207:	ff 75 f4             	pushl  -0xc(%ebp)
8010520a:	ff 75 ec             	pushl  -0x14(%ebp)
8010520d:	e8 de bd ff ff       	call   80100ff0 <filewrite>
80105212:	83 c4 10             	add    $0x10,%esp
}
80105215:	c9                   	leave  
80105216:	c3                   	ret    
80105217:	89 f6                	mov    %esi,%esi
80105219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105225:	c9                   	leave  
80105226:	c3                   	ret    
80105227:	89 f6                	mov    %esi,%esi
80105229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105230 <sys_close>:
{
80105230:	55                   	push   %ebp
80105231:	89 e5                	mov    %esp,%ebp
80105233:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80105236:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105239:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010523c:	e8 4f fe ff ff       	call   80105090 <argfd.constprop.0>
80105241:	85 c0                	test   %eax,%eax
80105243:	78 2b                	js     80105270 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80105245:	e8 d6 e4 ff ff       	call   80103720 <myproc>
8010524a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
8010524d:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80105250:	c7 44 90 48 00 00 00 	movl   $0x0,0x48(%eax,%edx,4)
80105257:	00 
  fileclose(f);
80105258:	ff 75 f4             	pushl  -0xc(%ebp)
8010525b:	e8 e0 bb ff ff       	call   80100e40 <fileclose>
  return 0;
80105260:	83 c4 10             	add    $0x10,%esp
80105263:	31 c0                	xor    %eax,%eax
}
80105265:	c9                   	leave  
80105266:	c3                   	ret    
80105267:	89 f6                	mov    %esi,%esi
80105269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105270:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105275:	c9                   	leave  
80105276:	c3                   	ret    
80105277:	89 f6                	mov    %esi,%esi
80105279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105280 <sys_fstat>:
{
80105280:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105281:	31 c0                	xor    %eax,%eax
{
80105283:	89 e5                	mov    %esp,%ebp
80105285:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105288:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010528b:	e8 00 fe ff ff       	call   80105090 <argfd.constprop.0>
80105290:	85 c0                	test   %eax,%eax
80105292:	78 2c                	js     801052c0 <sys_fstat+0x40>
80105294:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105297:	83 ec 04             	sub    $0x4,%esp
8010529a:	6a 14                	push   $0x14
8010529c:	50                   	push   %eax
8010529d:	6a 01                	push   $0x1
8010529f:	e8 4c fb ff ff       	call   80104df0 <argptr>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	78 15                	js     801052c0 <sys_fstat+0x40>
  return filestat(f, st);
801052ab:	83 ec 08             	sub    $0x8,%esp
801052ae:	ff 75 f4             	pushl  -0xc(%ebp)
801052b1:	ff 75 f0             	pushl  -0x10(%ebp)
801052b4:	e8 57 bc ff ff       	call   80100f10 <filestat>
801052b9:	83 c4 10             	add    $0x10,%esp
}
801052bc:	c9                   	leave  
801052bd:	c3                   	ret    
801052be:	66 90                	xchg   %ax,%ax
    return -1;
801052c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052c5:	c9                   	leave  
801052c6:	c3                   	ret    
801052c7:	89 f6                	mov    %esi,%esi
801052c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801052d0 <sys_link>:
{
801052d0:	55                   	push   %ebp
801052d1:	89 e5                	mov    %esp,%ebp
801052d3:	57                   	push   %edi
801052d4:	56                   	push   %esi
801052d5:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801052d6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
801052d9:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801052dc:	50                   	push   %eax
801052dd:	6a 00                	push   $0x0
801052df:	e8 6c fb ff ff       	call   80104e50 <argstr>
801052e4:	83 c4 10             	add    $0x10,%esp
801052e7:	85 c0                	test   %eax,%eax
801052e9:	0f 88 fb 00 00 00    	js     801053ea <sys_link+0x11a>
801052ef:	8d 45 d0             	lea    -0x30(%ebp),%eax
801052f2:	83 ec 08             	sub    $0x8,%esp
801052f5:	50                   	push   %eax
801052f6:	6a 01                	push   $0x1
801052f8:	e8 53 fb ff ff       	call   80104e50 <argstr>
801052fd:	83 c4 10             	add    $0x10,%esp
80105300:	85 c0                	test   %eax,%eax
80105302:	0f 88 e2 00 00 00    	js     801053ea <sys_link+0x11a>
  begin_op();
80105308:	e8 a3 d8 ff ff       	call   80102bb0 <begin_op>
  if((ip = namei(old)) == 0){
8010530d:	83 ec 0c             	sub    $0xc,%esp
80105310:	ff 75 d4             	pushl  -0x2c(%ebp)
80105313:	e8 d8 cb ff ff       	call   80101ef0 <namei>
80105318:	83 c4 10             	add    $0x10,%esp
8010531b:	85 c0                	test   %eax,%eax
8010531d:	89 c3                	mov    %eax,%ebx
8010531f:	0f 84 ea 00 00 00    	je     8010540f <sys_link+0x13f>
  ilock(ip);
80105325:	83 ec 0c             	sub    $0xc,%esp
80105328:	50                   	push   %eax
80105329:	e8 52 c3 ff ff       	call   80101680 <ilock>
  if(ip->type == T_DIR){
8010532e:	83 c4 10             	add    $0x10,%esp
80105331:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105336:	0f 84 bb 00 00 00    	je     801053f7 <sys_link+0x127>
  ip->nlink++;
8010533c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105341:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80105344:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80105347:	53                   	push   %ebx
80105348:	e8 83 c2 ff ff       	call   801015d0 <iupdate>
  iunlock(ip);
8010534d:	89 1c 24             	mov    %ebx,(%esp)
80105350:	e8 0b c4 ff ff       	call   80101760 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80105355:	58                   	pop    %eax
80105356:	5a                   	pop    %edx
80105357:	57                   	push   %edi
80105358:	ff 75 d0             	pushl  -0x30(%ebp)
8010535b:	e8 b0 cb ff ff       	call   80101f10 <nameiparent>
80105360:	83 c4 10             	add    $0x10,%esp
80105363:	85 c0                	test   %eax,%eax
80105365:	89 c6                	mov    %eax,%esi
80105367:	74 5b                	je     801053c4 <sys_link+0xf4>
  ilock(dp);
80105369:	83 ec 0c             	sub    $0xc,%esp
8010536c:	50                   	push   %eax
8010536d:	e8 0e c3 ff ff       	call   80101680 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	8b 03                	mov    (%ebx),%eax
80105377:	39 06                	cmp    %eax,(%esi)
80105379:	75 3d                	jne    801053b8 <sys_link+0xe8>
8010537b:	83 ec 04             	sub    $0x4,%esp
8010537e:	ff 73 04             	pushl  0x4(%ebx)
80105381:	57                   	push   %edi
80105382:	56                   	push   %esi
80105383:	e8 a8 ca ff ff       	call   80101e30 <dirlink>
80105388:	83 c4 10             	add    $0x10,%esp
8010538b:	85 c0                	test   %eax,%eax
8010538d:	78 29                	js     801053b8 <sys_link+0xe8>
  iunlockput(dp);
8010538f:	83 ec 0c             	sub    $0xc,%esp
80105392:	56                   	push   %esi
80105393:	e8 78 c5 ff ff       	call   80101910 <iunlockput>
  iput(ip);
80105398:	89 1c 24             	mov    %ebx,(%esp)
8010539b:	e8 10 c4 ff ff       	call   801017b0 <iput>
  end_op();
801053a0:	e8 7b d8 ff ff       	call   80102c20 <end_op>
  return 0;
801053a5:	83 c4 10             	add    $0x10,%esp
801053a8:	31 c0                	xor    %eax,%eax
}
801053aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053ad:	5b                   	pop    %ebx
801053ae:	5e                   	pop    %esi
801053af:	5f                   	pop    %edi
801053b0:	5d                   	pop    %ebp
801053b1:	c3                   	ret    
801053b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
801053b8:	83 ec 0c             	sub    $0xc,%esp
801053bb:	56                   	push   %esi
801053bc:	e8 4f c5 ff ff       	call   80101910 <iunlockput>
    goto bad;
801053c1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801053c4:	83 ec 0c             	sub    $0xc,%esp
801053c7:	53                   	push   %ebx
801053c8:	e8 b3 c2 ff ff       	call   80101680 <ilock>
  ip->nlink--;
801053cd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801053d2:	89 1c 24             	mov    %ebx,(%esp)
801053d5:	e8 f6 c1 ff ff       	call   801015d0 <iupdate>
  iunlockput(ip);
801053da:	89 1c 24             	mov    %ebx,(%esp)
801053dd:	e8 2e c5 ff ff       	call   80101910 <iunlockput>
  end_op();
801053e2:	e8 39 d8 ff ff       	call   80102c20 <end_op>
  return -1;
801053e7:	83 c4 10             	add    $0x10,%esp
}
801053ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801053ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053f2:	5b                   	pop    %ebx
801053f3:	5e                   	pop    %esi
801053f4:	5f                   	pop    %edi
801053f5:	5d                   	pop    %ebp
801053f6:	c3                   	ret    
    iunlockput(ip);
801053f7:	83 ec 0c             	sub    $0xc,%esp
801053fa:	53                   	push   %ebx
801053fb:	e8 10 c5 ff ff       	call   80101910 <iunlockput>
    end_op();
80105400:	e8 1b d8 ff ff       	call   80102c20 <end_op>
    return -1;
80105405:	83 c4 10             	add    $0x10,%esp
80105408:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010540d:	eb 9b                	jmp    801053aa <sys_link+0xda>
    end_op();
8010540f:	e8 0c d8 ff ff       	call   80102c20 <end_op>
    return -1;
80105414:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105419:	eb 8f                	jmp    801053aa <sys_link+0xda>
8010541b:	90                   	nop
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_unlink>:
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80105426:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80105429:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010542c:	50                   	push   %eax
8010542d:	6a 00                	push   $0x0
8010542f:	e8 1c fa ff ff       	call   80104e50 <argstr>
80105434:	83 c4 10             	add    $0x10,%esp
80105437:	85 c0                	test   %eax,%eax
80105439:	0f 88 77 01 00 00    	js     801055b6 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
8010543f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80105442:	e8 69 d7 ff ff       	call   80102bb0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105447:	83 ec 08             	sub    $0x8,%esp
8010544a:	53                   	push   %ebx
8010544b:	ff 75 c0             	pushl  -0x40(%ebp)
8010544e:	e8 bd ca ff ff       	call   80101f10 <nameiparent>
80105453:	83 c4 10             	add    $0x10,%esp
80105456:	85 c0                	test   %eax,%eax
80105458:	89 c6                	mov    %eax,%esi
8010545a:	0f 84 60 01 00 00    	je     801055c0 <sys_unlink+0x1a0>
  ilock(dp);
80105460:	83 ec 0c             	sub    $0xc,%esp
80105463:	50                   	push   %eax
80105464:	e8 17 c2 ff ff       	call   80101680 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105469:	58                   	pop    %eax
8010546a:	5a                   	pop    %edx
8010546b:	68 e8 7e 10 80       	push   $0x80107ee8
80105470:	53                   	push   %ebx
80105471:	e8 1a c7 ff ff       	call   80101b90 <namecmp>
80105476:	83 c4 10             	add    $0x10,%esp
80105479:	85 c0                	test   %eax,%eax
8010547b:	0f 84 03 01 00 00    	je     80105584 <sys_unlink+0x164>
80105481:	83 ec 08             	sub    $0x8,%esp
80105484:	68 e7 7e 10 80       	push   $0x80107ee7
80105489:	53                   	push   %ebx
8010548a:	e8 01 c7 ff ff       	call   80101b90 <namecmp>
8010548f:	83 c4 10             	add    $0x10,%esp
80105492:	85 c0                	test   %eax,%eax
80105494:	0f 84 ea 00 00 00    	je     80105584 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010549a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010549d:	83 ec 04             	sub    $0x4,%esp
801054a0:	50                   	push   %eax
801054a1:	53                   	push   %ebx
801054a2:	56                   	push   %esi
801054a3:	e8 08 c7 ff ff       	call   80101bb0 <dirlookup>
801054a8:	83 c4 10             	add    $0x10,%esp
801054ab:	85 c0                	test   %eax,%eax
801054ad:	89 c3                	mov    %eax,%ebx
801054af:	0f 84 cf 00 00 00    	je     80105584 <sys_unlink+0x164>
  ilock(ip);
801054b5:	83 ec 0c             	sub    $0xc,%esp
801054b8:	50                   	push   %eax
801054b9:	e8 c2 c1 ff ff       	call   80101680 <ilock>
  if(ip->nlink < 1)
801054be:	83 c4 10             	add    $0x10,%esp
801054c1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801054c6:	0f 8e 10 01 00 00    	jle    801055dc <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
801054cc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054d1:	74 6d                	je     80105540 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
801054d3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801054d6:	83 ec 04             	sub    $0x4,%esp
801054d9:	6a 10                	push   $0x10
801054db:	6a 00                	push   $0x0
801054dd:	50                   	push   %eax
801054de:	e8 bd f5 ff ff       	call   80104aa0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801054e3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801054e6:	6a 10                	push   $0x10
801054e8:	ff 75 c4             	pushl  -0x3c(%ebp)
801054eb:	50                   	push   %eax
801054ec:	56                   	push   %esi
801054ed:	e8 6e c5 ff ff       	call   80101a60 <writei>
801054f2:	83 c4 20             	add    $0x20,%esp
801054f5:	83 f8 10             	cmp    $0x10,%eax
801054f8:	0f 85 eb 00 00 00    	jne    801055e9 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
801054fe:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105503:	0f 84 97 00 00 00    	je     801055a0 <sys_unlink+0x180>
  iunlockput(dp);
80105509:	83 ec 0c             	sub    $0xc,%esp
8010550c:	56                   	push   %esi
8010550d:	e8 fe c3 ff ff       	call   80101910 <iunlockput>
  ip->nlink--;
80105512:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105517:	89 1c 24             	mov    %ebx,(%esp)
8010551a:	e8 b1 c0 ff ff       	call   801015d0 <iupdate>
  iunlockput(ip);
8010551f:	89 1c 24             	mov    %ebx,(%esp)
80105522:	e8 e9 c3 ff ff       	call   80101910 <iunlockput>
  end_op();
80105527:	e8 f4 d6 ff ff       	call   80102c20 <end_op>
  return 0;
8010552c:	83 c4 10             	add    $0x10,%esp
8010552f:	31 c0                	xor    %eax,%eax
}
80105531:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105534:	5b                   	pop    %ebx
80105535:	5e                   	pop    %esi
80105536:	5f                   	pop    %edi
80105537:	5d                   	pop    %ebp
80105538:	c3                   	ret    
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105540:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105544:	76 8d                	jbe    801054d3 <sys_unlink+0xb3>
80105546:	bf 20 00 00 00       	mov    $0x20,%edi
8010554b:	eb 0f                	jmp    8010555c <sys_unlink+0x13c>
8010554d:	8d 76 00             	lea    0x0(%esi),%esi
80105550:	83 c7 10             	add    $0x10,%edi
80105553:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105556:	0f 83 77 ff ff ff    	jae    801054d3 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010555c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010555f:	6a 10                	push   $0x10
80105561:	57                   	push   %edi
80105562:	50                   	push   %eax
80105563:	53                   	push   %ebx
80105564:	e8 f7 c3 ff ff       	call   80101960 <readi>
80105569:	83 c4 10             	add    $0x10,%esp
8010556c:	83 f8 10             	cmp    $0x10,%eax
8010556f:	75 5e                	jne    801055cf <sys_unlink+0x1af>
    if(de.inum != 0)
80105571:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105576:	74 d8                	je     80105550 <sys_unlink+0x130>
    iunlockput(ip);
80105578:	83 ec 0c             	sub    $0xc,%esp
8010557b:	53                   	push   %ebx
8010557c:	e8 8f c3 ff ff       	call   80101910 <iunlockput>
    goto bad;
80105581:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80105584:	83 ec 0c             	sub    $0xc,%esp
80105587:	56                   	push   %esi
80105588:	e8 83 c3 ff ff       	call   80101910 <iunlockput>
  end_op();
8010558d:	e8 8e d6 ff ff       	call   80102c20 <end_op>
  return -1;
80105592:	83 c4 10             	add    $0x10,%esp
80105595:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010559a:	eb 95                	jmp    80105531 <sys_unlink+0x111>
8010559c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
801055a0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
801055a5:	83 ec 0c             	sub    $0xc,%esp
801055a8:	56                   	push   %esi
801055a9:	e8 22 c0 ff ff       	call   801015d0 <iupdate>
801055ae:	83 c4 10             	add    $0x10,%esp
801055b1:	e9 53 ff ff ff       	jmp    80105509 <sys_unlink+0xe9>
    return -1;
801055b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055bb:	e9 71 ff ff ff       	jmp    80105531 <sys_unlink+0x111>
    end_op();
801055c0:	e8 5b d6 ff ff       	call   80102c20 <end_op>
    return -1;
801055c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055ca:	e9 62 ff ff ff       	jmp    80105531 <sys_unlink+0x111>
      panic("isdirempty: readi");
801055cf:	83 ec 0c             	sub    $0xc,%esp
801055d2:	68 0c 7f 10 80       	push   $0x80107f0c
801055d7:	e8 b4 ad ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
801055dc:	83 ec 0c             	sub    $0xc,%esp
801055df:	68 fa 7e 10 80       	push   $0x80107efa
801055e4:	e8 a7 ad ff ff       	call   80100390 <panic>
    panic("unlink: writei");
801055e9:	83 ec 0c             	sub    $0xc,%esp
801055ec:	68 1e 7f 10 80       	push   $0x80107f1e
801055f1:	e8 9a ad ff ff       	call   80100390 <panic>
801055f6:	8d 76 00             	lea    0x0(%esi),%esi
801055f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105600 <sys_open>:

int
sys_open(void)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	57                   	push   %edi
80105604:	56                   	push   %esi
80105605:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105606:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105609:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010560c:	50                   	push   %eax
8010560d:	6a 00                	push   $0x0
8010560f:	e8 3c f8 ff ff       	call   80104e50 <argstr>
80105614:	83 c4 10             	add    $0x10,%esp
80105617:	85 c0                	test   %eax,%eax
80105619:	0f 88 1d 01 00 00    	js     8010573c <sys_open+0x13c>
8010561f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105622:	83 ec 08             	sub    $0x8,%esp
80105625:	50                   	push   %eax
80105626:	6a 01                	push   $0x1
80105628:	e8 73 f7 ff ff       	call   80104da0 <argint>
8010562d:	83 c4 10             	add    $0x10,%esp
80105630:	85 c0                	test   %eax,%eax
80105632:	0f 88 04 01 00 00    	js     8010573c <sys_open+0x13c>
    return -1;

  begin_op();
80105638:	e8 73 d5 ff ff       	call   80102bb0 <begin_op>

  if(omode & O_CREATE){
8010563d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105641:	0f 85 a9 00 00 00    	jne    801056f0 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105647:	83 ec 0c             	sub    $0xc,%esp
8010564a:	ff 75 e0             	pushl  -0x20(%ebp)
8010564d:	e8 9e c8 ff ff       	call   80101ef0 <namei>
80105652:	83 c4 10             	add    $0x10,%esp
80105655:	85 c0                	test   %eax,%eax
80105657:	89 c6                	mov    %eax,%esi
80105659:	0f 84 b2 00 00 00    	je     80105711 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
8010565f:	83 ec 0c             	sub    $0xc,%esp
80105662:	50                   	push   %eax
80105663:	e8 18 c0 ff ff       	call   80101680 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105668:	83 c4 10             	add    $0x10,%esp
8010566b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105670:	0f 84 aa 00 00 00    	je     80105720 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105676:	e8 05 b7 ff ff       	call   80100d80 <filealloc>
8010567b:	85 c0                	test   %eax,%eax
8010567d:	89 c7                	mov    %eax,%edi
8010567f:	0f 84 a6 00 00 00    	je     8010572b <sys_open+0x12b>
  struct proc *curproc = myproc();
80105685:	e8 96 e0 ff ff       	call   80103720 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010568a:	31 db                	xor    %ebx,%ebx
8010568c:	eb 0e                	jmp    8010569c <sys_open+0x9c>
8010568e:	66 90                	xchg   %ax,%ax
80105690:	83 c3 01             	add    $0x1,%ebx
80105693:	83 fb 10             	cmp    $0x10,%ebx
80105696:	0f 84 ac 00 00 00    	je     80105748 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
8010569c:	8b 54 98 48          	mov    0x48(%eax,%ebx,4),%edx
801056a0:	85 d2                	test   %edx,%edx
801056a2:	75 ec                	jne    80105690 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056a4:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
801056a7:	89 7c 98 48          	mov    %edi,0x48(%eax,%ebx,4)
  iunlock(ip);
801056ab:	56                   	push   %esi
801056ac:	e8 af c0 ff ff       	call   80101760 <iunlock>
  end_op();
801056b1:	e8 6a d5 ff ff       	call   80102c20 <end_op>

  f->type = FD_INODE;
801056b6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801056bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056bf:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801056c2:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
801056c5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801056cc:	89 d0                	mov    %edx,%eax
801056ce:	f7 d0                	not    %eax
801056d0:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056d3:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
801056d6:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056d9:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
801056dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056e0:	89 d8                	mov    %ebx,%eax
801056e2:	5b                   	pop    %ebx
801056e3:	5e                   	pop    %esi
801056e4:	5f                   	pop    %edi
801056e5:	5d                   	pop    %ebp
801056e6:	c3                   	ret    
801056e7:	89 f6                	mov    %esi,%esi
801056e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
801056f0:	83 ec 0c             	sub    $0xc,%esp
801056f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801056f6:	31 c9                	xor    %ecx,%ecx
801056f8:	6a 00                	push   $0x0
801056fa:	ba 02 00 00 00       	mov    $0x2,%edx
801056ff:	e8 ec f7 ff ff       	call   80104ef0 <create>
    if(ip == 0){
80105704:	83 c4 10             	add    $0x10,%esp
80105707:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105709:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010570b:	0f 85 65 ff ff ff    	jne    80105676 <sys_open+0x76>
      end_op();
80105711:	e8 0a d5 ff ff       	call   80102c20 <end_op>
      return -1;
80105716:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010571b:	eb c0                	jmp    801056dd <sys_open+0xdd>
8010571d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105720:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105723:	85 c9                	test   %ecx,%ecx
80105725:	0f 84 4b ff ff ff    	je     80105676 <sys_open+0x76>
    iunlockput(ip);
8010572b:	83 ec 0c             	sub    $0xc,%esp
8010572e:	56                   	push   %esi
8010572f:	e8 dc c1 ff ff       	call   80101910 <iunlockput>
    end_op();
80105734:	e8 e7 d4 ff ff       	call   80102c20 <end_op>
    return -1;
80105739:	83 c4 10             	add    $0x10,%esp
8010573c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105741:	eb 9a                	jmp    801056dd <sys_open+0xdd>
80105743:	90                   	nop
80105744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
80105748:	83 ec 0c             	sub    $0xc,%esp
8010574b:	57                   	push   %edi
8010574c:	e8 ef b6 ff ff       	call   80100e40 <fileclose>
80105751:	83 c4 10             	add    $0x10,%esp
80105754:	eb d5                	jmp    8010572b <sys_open+0x12b>
80105756:	8d 76 00             	lea    0x0(%esi),%esi
80105759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105760 <sys_mkdir>:

int
sys_mkdir(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105766:	e8 45 d4 ff ff       	call   80102bb0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010576b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010576e:	83 ec 08             	sub    $0x8,%esp
80105771:	50                   	push   %eax
80105772:	6a 00                	push   $0x0
80105774:	e8 d7 f6 ff ff       	call   80104e50 <argstr>
80105779:	83 c4 10             	add    $0x10,%esp
8010577c:	85 c0                	test   %eax,%eax
8010577e:	78 30                	js     801057b0 <sys_mkdir+0x50>
80105780:	83 ec 0c             	sub    $0xc,%esp
80105783:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105786:	31 c9                	xor    %ecx,%ecx
80105788:	6a 00                	push   $0x0
8010578a:	ba 01 00 00 00       	mov    $0x1,%edx
8010578f:	e8 5c f7 ff ff       	call   80104ef0 <create>
80105794:	83 c4 10             	add    $0x10,%esp
80105797:	85 c0                	test   %eax,%eax
80105799:	74 15                	je     801057b0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010579b:	83 ec 0c             	sub    $0xc,%esp
8010579e:	50                   	push   %eax
8010579f:	e8 6c c1 ff ff       	call   80101910 <iunlockput>
  end_op();
801057a4:	e8 77 d4 ff ff       	call   80102c20 <end_op>
  return 0;
801057a9:	83 c4 10             	add    $0x10,%esp
801057ac:	31 c0                	xor    %eax,%eax
}
801057ae:	c9                   	leave  
801057af:	c3                   	ret    
    end_op();
801057b0:	e8 6b d4 ff ff       	call   80102c20 <end_op>
    return -1;
801057b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057ba:	c9                   	leave  
801057bb:	c3                   	ret    
801057bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801057c0 <sys_mknod>:

int
sys_mknod(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801057c6:	e8 e5 d3 ff ff       	call   80102bb0 <begin_op>
  if((argstr(0, &path)) < 0 ||
801057cb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801057ce:	83 ec 08             	sub    $0x8,%esp
801057d1:	50                   	push   %eax
801057d2:	6a 00                	push   $0x0
801057d4:	e8 77 f6 ff ff       	call   80104e50 <argstr>
801057d9:	83 c4 10             	add    $0x10,%esp
801057dc:	85 c0                	test   %eax,%eax
801057de:	78 60                	js     80105840 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801057e0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057e3:	83 ec 08             	sub    $0x8,%esp
801057e6:	50                   	push   %eax
801057e7:	6a 01                	push   $0x1
801057e9:	e8 b2 f5 ff ff       	call   80104da0 <argint>
  if((argstr(0, &path)) < 0 ||
801057ee:	83 c4 10             	add    $0x10,%esp
801057f1:	85 c0                	test   %eax,%eax
801057f3:	78 4b                	js     80105840 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801057f5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057f8:	83 ec 08             	sub    $0x8,%esp
801057fb:	50                   	push   %eax
801057fc:	6a 02                	push   $0x2
801057fe:	e8 9d f5 ff ff       	call   80104da0 <argint>
     argint(1, &major) < 0 ||
80105803:	83 c4 10             	add    $0x10,%esp
80105806:	85 c0                	test   %eax,%eax
80105808:	78 36                	js     80105840 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010580a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010580e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105811:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105815:	ba 03 00 00 00       	mov    $0x3,%edx
8010581a:	50                   	push   %eax
8010581b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010581e:	e8 cd f6 ff ff       	call   80104ef0 <create>
80105823:	83 c4 10             	add    $0x10,%esp
80105826:	85 c0                	test   %eax,%eax
80105828:	74 16                	je     80105840 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010582a:	83 ec 0c             	sub    $0xc,%esp
8010582d:	50                   	push   %eax
8010582e:	e8 dd c0 ff ff       	call   80101910 <iunlockput>
  end_op();
80105833:	e8 e8 d3 ff ff       	call   80102c20 <end_op>
  return 0;
80105838:	83 c4 10             	add    $0x10,%esp
8010583b:	31 c0                	xor    %eax,%eax
}
8010583d:	c9                   	leave  
8010583e:	c3                   	ret    
8010583f:	90                   	nop
    end_op();
80105840:	e8 db d3 ff ff       	call   80102c20 <end_op>
    return -1;
80105845:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010584a:	c9                   	leave  
8010584b:	c3                   	ret    
8010584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105850 <sys_chdir>:

int
sys_chdir(void)
{
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	56                   	push   %esi
80105854:	53                   	push   %ebx
80105855:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105858:	e8 c3 de ff ff       	call   80103720 <myproc>
8010585d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010585f:	e8 4c d3 ff ff       	call   80102bb0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105864:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105867:	83 ec 08             	sub    $0x8,%esp
8010586a:	50                   	push   %eax
8010586b:	6a 00                	push   $0x0
8010586d:	e8 de f5 ff ff       	call   80104e50 <argstr>
80105872:	83 c4 10             	add    $0x10,%esp
80105875:	85 c0                	test   %eax,%eax
80105877:	78 77                	js     801058f0 <sys_chdir+0xa0>
80105879:	83 ec 0c             	sub    $0xc,%esp
8010587c:	ff 75 f4             	pushl  -0xc(%ebp)
8010587f:	e8 6c c6 ff ff       	call   80101ef0 <namei>
80105884:	83 c4 10             	add    $0x10,%esp
80105887:	85 c0                	test   %eax,%eax
80105889:	89 c3                	mov    %eax,%ebx
8010588b:	74 63                	je     801058f0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010588d:	83 ec 0c             	sub    $0xc,%esp
80105890:	50                   	push   %eax
80105891:	e8 ea bd ff ff       	call   80101680 <ilock>
  if(ip->type != T_DIR){
80105896:	83 c4 10             	add    $0x10,%esp
80105899:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010589e:	75 30                	jne    801058d0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801058a0:	83 ec 0c             	sub    $0xc,%esp
801058a3:	53                   	push   %ebx
801058a4:	e8 b7 be ff ff       	call   80101760 <iunlock>
  iput(curproc->cwd);
801058a9:	58                   	pop    %eax
801058aa:	ff b6 88 00 00 00    	pushl  0x88(%esi)
801058b0:	e8 fb be ff ff       	call   801017b0 <iput>
  end_op();
801058b5:	e8 66 d3 ff ff       	call   80102c20 <end_op>
  curproc->cwd = ip;
801058ba:	89 9e 88 00 00 00    	mov    %ebx,0x88(%esi)
  return 0;
801058c0:	83 c4 10             	add    $0x10,%esp
801058c3:	31 c0                	xor    %eax,%eax
}
801058c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801058c8:	5b                   	pop    %ebx
801058c9:	5e                   	pop    %esi
801058ca:	5d                   	pop    %ebp
801058cb:	c3                   	ret    
801058cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
801058d0:	83 ec 0c             	sub    $0xc,%esp
801058d3:	53                   	push   %ebx
801058d4:	e8 37 c0 ff ff       	call   80101910 <iunlockput>
    end_op();
801058d9:	e8 42 d3 ff ff       	call   80102c20 <end_op>
    return -1;
801058de:	83 c4 10             	add    $0x10,%esp
801058e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058e6:	eb dd                	jmp    801058c5 <sys_chdir+0x75>
801058e8:	90                   	nop
801058e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
801058f0:	e8 2b d3 ff ff       	call   80102c20 <end_op>
    return -1;
801058f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058fa:	eb c9                	jmp    801058c5 <sys_chdir+0x75>
801058fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105900 <sys_exec>:

int
sys_exec(void)
{
80105900:	55                   	push   %ebp
80105901:	89 e5                	mov    %esp,%ebp
80105903:	57                   	push   %edi
80105904:	56                   	push   %esi
80105905:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105906:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010590c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105912:	50                   	push   %eax
80105913:	6a 00                	push   $0x0
80105915:	e8 36 f5 ff ff       	call   80104e50 <argstr>
8010591a:	83 c4 10             	add    $0x10,%esp
8010591d:	85 c0                	test   %eax,%eax
8010591f:	0f 88 87 00 00 00    	js     801059ac <sys_exec+0xac>
80105925:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010592b:	83 ec 08             	sub    $0x8,%esp
8010592e:	50                   	push   %eax
8010592f:	6a 01                	push   $0x1
80105931:	e8 6a f4 ff ff       	call   80104da0 <argint>
80105936:	83 c4 10             	add    $0x10,%esp
80105939:	85 c0                	test   %eax,%eax
8010593b:	78 6f                	js     801059ac <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010593d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105943:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
80105946:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80105948:	68 80 00 00 00       	push   $0x80
8010594d:	6a 00                	push   $0x0
8010594f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105955:	50                   	push   %eax
80105956:	e8 45 f1 ff ff       	call   80104aa0 <memset>
8010595b:	83 c4 10             	add    $0x10,%esp
8010595e:	eb 2c                	jmp    8010598c <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
80105960:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105966:	85 c0                	test   %eax,%eax
80105968:	74 56                	je     801059c0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010596a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105970:	83 ec 08             	sub    $0x8,%esp
80105973:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105976:	52                   	push   %edx
80105977:	50                   	push   %eax
80105978:	e8 b3 f3 ff ff       	call   80104d30 <fetchstr>
8010597d:	83 c4 10             	add    $0x10,%esp
80105980:	85 c0                	test   %eax,%eax
80105982:	78 28                	js     801059ac <sys_exec+0xac>
  for(i=0;; i++){
80105984:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80105987:	83 fb 20             	cmp    $0x20,%ebx
8010598a:	74 20                	je     801059ac <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
8010598c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105992:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105999:	83 ec 08             	sub    $0x8,%esp
8010599c:	57                   	push   %edi
8010599d:	01 f0                	add    %esi,%eax
8010599f:	50                   	push   %eax
801059a0:	e8 4b f3 ff ff       	call   80104cf0 <fetchint>
801059a5:	83 c4 10             	add    $0x10,%esp
801059a8:	85 c0                	test   %eax,%eax
801059aa:	79 b4                	jns    80105960 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801059ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801059af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801059b4:	5b                   	pop    %ebx
801059b5:	5e                   	pop    %esi
801059b6:	5f                   	pop    %edi
801059b7:	5d                   	pop    %ebp
801059b8:	c3                   	ret    
801059b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
801059c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801059c6:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
801059c9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801059d0:	00 00 00 00 
  return exec(path, argv);
801059d4:	50                   	push   %eax
801059d5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801059db:	e8 30 b0 ff ff       	call   80100a10 <exec>
801059e0:	83 c4 10             	add    $0x10,%esp
}
801059e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059e6:	5b                   	pop    %ebx
801059e7:	5e                   	pop    %esi
801059e8:	5f                   	pop    %edi
801059e9:	5d                   	pop    %ebp
801059ea:	c3                   	ret    
801059eb:	90                   	nop
801059ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801059f0 <sys_pipe>:

int
sys_pipe(void)
{
801059f0:	55                   	push   %ebp
801059f1:	89 e5                	mov    %esp,%ebp
801059f3:	57                   	push   %edi
801059f4:	56                   	push   %esi
801059f5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801059f6:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
801059f9:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801059fc:	6a 08                	push   $0x8
801059fe:	50                   	push   %eax
801059ff:	6a 00                	push   $0x0
80105a01:	e8 ea f3 ff ff       	call   80104df0 <argptr>
80105a06:	83 c4 10             	add    $0x10,%esp
80105a09:	85 c0                	test   %eax,%eax
80105a0b:	0f 88 ae 00 00 00    	js     80105abf <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105a11:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105a14:	83 ec 08             	sub    $0x8,%esp
80105a17:	50                   	push   %eax
80105a18:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105a1b:	50                   	push   %eax
80105a1c:	e8 2f d8 ff ff       	call   80103250 <pipealloc>
80105a21:	83 c4 10             	add    $0x10,%esp
80105a24:	85 c0                	test   %eax,%eax
80105a26:	0f 88 93 00 00 00    	js     80105abf <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105a2c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
80105a2f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105a31:	e8 ea dc ff ff       	call   80103720 <myproc>
80105a36:	eb 10                	jmp    80105a48 <sys_pipe+0x58>
80105a38:	90                   	nop
80105a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
80105a40:	83 c3 01             	add    $0x1,%ebx
80105a43:	83 fb 10             	cmp    $0x10,%ebx
80105a46:	74 60                	je     80105aa8 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
80105a48:	8b 74 98 48          	mov    0x48(%eax,%ebx,4),%esi
80105a4c:	85 f6                	test   %esi,%esi
80105a4e:	75 f0                	jne    80105a40 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
80105a50:	8d 73 10             	lea    0x10(%ebx),%esi
80105a53:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105a57:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
80105a5a:	e8 c1 dc ff ff       	call   80103720 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80105a5f:	31 d2                	xor    %edx,%edx
80105a61:	eb 0d                	jmp    80105a70 <sys_pipe+0x80>
80105a63:	90                   	nop
80105a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a68:	83 c2 01             	add    $0x1,%edx
80105a6b:	83 fa 10             	cmp    $0x10,%edx
80105a6e:	74 28                	je     80105a98 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
80105a70:	8b 4c 90 48          	mov    0x48(%eax,%edx,4),%ecx
80105a74:	85 c9                	test   %ecx,%ecx
80105a76:	75 f0                	jne    80105a68 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
80105a78:	89 7c 90 48          	mov    %edi,0x48(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105a7c:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105a7f:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105a81:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105a84:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
80105a87:	31 c0                	xor    %eax,%eax
}
80105a89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a8c:	5b                   	pop    %ebx
80105a8d:	5e                   	pop    %esi
80105a8e:	5f                   	pop    %edi
80105a8f:	5d                   	pop    %ebp
80105a90:	c3                   	ret    
80105a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
80105a98:	e8 83 dc ff ff       	call   80103720 <myproc>
80105a9d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105aa4:	00 
80105aa5:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
80105aa8:	83 ec 0c             	sub    $0xc,%esp
80105aab:	ff 75 e0             	pushl  -0x20(%ebp)
80105aae:	e8 8d b3 ff ff       	call   80100e40 <fileclose>
    fileclose(wf);
80105ab3:	58                   	pop    %eax
80105ab4:	ff 75 e4             	pushl  -0x1c(%ebp)
80105ab7:	e8 84 b3 ff ff       	call   80100e40 <fileclose>
    return -1;
80105abc:	83 c4 10             	add    $0x10,%esp
80105abf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ac4:	eb c3                	jmp    80105a89 <sys_pipe+0x99>
80105ac6:	66 90                	xchg   %ax,%ax
80105ac8:	66 90                	xchg   %ax,%ax
80105aca:	66 90                	xchg   %ax,%ax
80105acc:	66 90                	xchg   %ax,%ax
80105ace:	66 90                	xchg   %ax,%ax

80105ad0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105ad0:	55                   	push   %ebp
80105ad1:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105ad3:	5d                   	pop    %ebp
  return fork();
80105ad4:	e9 07 e0 ff ff       	jmp    80103ae0 <fork>
80105ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ae0 <sys_exit>:

int
sys_exit(void)
{
80105ae0:	55                   	push   %ebp
80105ae1:	89 e5                	mov    %esp,%ebp
80105ae3:	83 ec 20             	sub    $0x20,%esp
  int status;
  if(argint(0,&status)<0)
80105ae6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ae9:	50                   	push   %eax
80105aea:	6a 00                	push   $0x0
80105aec:	e8 af f2 ff ff       	call   80104da0 <argint>
80105af1:	83 c4 10             	add    $0x10,%esp
80105af4:	85 c0                	test   %eax,%eax
80105af6:	78 18                	js     80105b10 <sys_exit+0x30>
    return -1;
  exit(status);
80105af8:	83 ec 0c             	sub    $0xc,%esp
80105afb:	ff 75 f4             	pushl  -0xc(%ebp)
80105afe:	e8 9d e5 ff ff       	call   801040a0 <exit>
  return 0;  // not reached
80105b03:	83 c4 10             	add    $0x10,%esp
80105b06:	31 c0                	xor    %eax,%eax
}
80105b08:	c9                   	leave  
80105b09:	c3                   	ret    
80105b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105b10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b15:	c9                   	leave  
80105b16:	c3                   	ret    
80105b17:	89 f6                	mov    %esi,%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b20 <sys_wait>:

int
sys_wait(void)
{
80105b20:	55                   	push   %ebp
80105b21:	89 e5                	mov    %esp,%ebp
80105b23:	83 ec 1c             	sub    $0x1c,%esp
  char *status;
  if(argptr(0,&status,4)<0)
80105b26:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b29:	6a 04                	push   $0x4
80105b2b:	50                   	push   %eax
80105b2c:	6a 00                	push   $0x0
80105b2e:	e8 bd f2 ff ff       	call   80104df0 <argptr>
80105b33:	83 c4 10             	add    $0x10,%esp
80105b36:	85 c0                	test   %eax,%eax
80105b38:	78 16                	js     80105b50 <sys_wait+0x30>
    return -1;
  return wait((int*)status);
80105b3a:	83 ec 0c             	sub    $0xc,%esp
80105b3d:	ff 75 f4             	pushl  -0xc(%ebp)
80105b40:	e8 6b e7 ff ff       	call   801042b0 <wait>
80105b45:	83 c4 10             	add    $0x10,%esp
}
80105b48:	c9                   	leave  
80105b49:	c3                   	ret    
80105b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b55:	c9                   	leave  
80105b56:	c3                   	ret    
80105b57:	89 f6                	mov    %esi,%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b60 <sys_kill>:

int
sys_kill(void)
{
80105b60:	55                   	push   %ebp
80105b61:	89 e5                	mov    %esp,%ebp
80105b63:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105b66:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b69:	50                   	push   %eax
80105b6a:	6a 00                	push   $0x0
80105b6c:	e8 2f f2 ff ff       	call   80104da0 <argint>
80105b71:	83 c4 10             	add    $0x10,%esp
80105b74:	85 c0                	test   %eax,%eax
80105b76:	78 18                	js     80105b90 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105b78:	83 ec 0c             	sub    $0xc,%esp
80105b7b:	ff 75 f4             	pushl  -0xc(%ebp)
80105b7e:	e8 8d e8 ff ff       	call   80104410 <kill>
80105b83:	83 c4 10             	add    $0x10,%esp
}
80105b86:	c9                   	leave  
80105b87:	c3                   	ret    
80105b88:	90                   	nop
80105b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b95:	c9                   	leave  
80105b96:	c3                   	ret    
80105b97:	89 f6                	mov    %esi,%esi
80105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ba0 <sys_getpid>:

int
sys_getpid(void)
{
80105ba0:	55                   	push   %ebp
80105ba1:	89 e5                	mov    %esp,%ebp
80105ba3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105ba6:	e8 75 db ff ff       	call   80103720 <myproc>
80105bab:	8b 40 30             	mov    0x30(%eax),%eax
}
80105bae:	c9                   	leave  
80105baf:	c3                   	ret    

80105bb0 <sys_sbrk>:

int
sys_sbrk(void)
{
80105bb0:	55                   	push   %ebp
80105bb1:	89 e5                	mov    %esp,%ebp
80105bb3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105bb4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105bb7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
80105bba:	50                   	push   %eax
80105bbb:	6a 00                	push   $0x0
80105bbd:	e8 de f1 ff ff       	call   80104da0 <argint>
80105bc2:	83 c4 10             	add    $0x10,%esp
80105bc5:	85 c0                	test   %eax,%eax
80105bc7:	78 27                	js     80105bf0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105bc9:	e8 52 db ff ff       	call   80103720 <myproc>
  if(growproc(n) < 0)
80105bce:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105bd1:	8b 58 20             	mov    0x20(%eax),%ebx
  if(growproc(n) < 0)
80105bd4:	ff 75 f4             	pushl  -0xc(%ebp)
80105bd7:	e8 84 de ff ff       	call   80103a60 <growproc>
80105bdc:	83 c4 10             	add    $0x10,%esp
80105bdf:	85 c0                	test   %eax,%eax
80105be1:	78 0d                	js     80105bf0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105be3:	89 d8                	mov    %ebx,%eax
80105be5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105be8:	c9                   	leave  
80105be9:	c3                   	ret    
80105bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105bf0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105bf5:	eb ec                	jmp    80105be3 <sys_sbrk+0x33>
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c00 <sys_sleep>:

int
sys_sleep(void)
{
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
80105c03:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105c04:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105c07:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
80105c0a:	50                   	push   %eax
80105c0b:	6a 00                	push   $0x0
80105c0d:	e8 8e f1 ff ff       	call   80104da0 <argint>
80105c12:	83 c4 10             	add    $0x10,%esp
80105c15:	85 c0                	test   %eax,%eax
80105c17:	0f 88 8a 00 00 00    	js     80105ca7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
80105c1d:	83 ec 0c             	sub    $0xc,%esp
80105c20:	68 80 64 11 80       	push   $0x80116480
80105c25:	e8 66 ed ff ff       	call   80104990 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105c2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105c2d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105c30:	8b 1d c0 6c 11 80    	mov    0x80116cc0,%ebx
  while(ticks - ticks0 < n){
80105c36:	85 d2                	test   %edx,%edx
80105c38:	75 27                	jne    80105c61 <sys_sleep+0x61>
80105c3a:	eb 54                	jmp    80105c90 <sys_sleep+0x90>
80105c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105c40:	83 ec 08             	sub    $0x8,%esp
80105c43:	68 80 64 11 80       	push   $0x80116480
80105c48:	68 c0 6c 11 80       	push   $0x80116cc0
80105c4d:	e8 9e e5 ff ff       	call   801041f0 <sleep>
  while(ticks - ticks0 < n){
80105c52:	a1 c0 6c 11 80       	mov    0x80116cc0,%eax
80105c57:	83 c4 10             	add    $0x10,%esp
80105c5a:	29 d8                	sub    %ebx,%eax
80105c5c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105c5f:	73 2f                	jae    80105c90 <sys_sleep+0x90>
    if(myproc()->killed){
80105c61:	e8 ba da ff ff       	call   80103720 <myproc>
80105c66:	8b 40 44             	mov    0x44(%eax),%eax
80105c69:	85 c0                	test   %eax,%eax
80105c6b:	74 d3                	je     80105c40 <sys_sleep+0x40>
      release(&tickslock);
80105c6d:	83 ec 0c             	sub    $0xc,%esp
80105c70:	68 80 64 11 80       	push   $0x80116480
80105c75:	e8 d6 ed ff ff       	call   80104a50 <release>
      return -1;
80105c7a:	83 c4 10             	add    $0x10,%esp
80105c7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105c82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105c85:	c9                   	leave  
80105c86:	c3                   	ret    
80105c87:	89 f6                	mov    %esi,%esi
80105c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105c90:	83 ec 0c             	sub    $0xc,%esp
80105c93:	68 80 64 11 80       	push   $0x80116480
80105c98:	e8 b3 ed ff ff       	call   80104a50 <release>
  return 0;
80105c9d:	83 c4 10             	add    $0x10,%esp
80105ca0:	31 c0                	xor    %eax,%eax
}
80105ca2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ca5:	c9                   	leave  
80105ca6:	c3                   	ret    
    return -1;
80105ca7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105cac:	eb f4                	jmp    80105ca2 <sys_sleep+0xa2>
80105cae:	66 90                	xchg   %ax,%ax

80105cb0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105cb0:	55                   	push   %ebp
80105cb1:	89 e5                	mov    %esp,%ebp
80105cb3:	53                   	push   %ebx
80105cb4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105cb7:	68 80 64 11 80       	push   $0x80116480
80105cbc:	e8 cf ec ff ff       	call   80104990 <acquire>
  xticks = ticks;
80105cc1:	8b 1d c0 6c 11 80    	mov    0x80116cc0,%ebx
  release(&tickslock);
80105cc7:	c7 04 24 80 64 11 80 	movl   $0x80116480,(%esp)
80105cce:	e8 7d ed ff ff       	call   80104a50 <release>
  return xticks;
}
80105cd3:	89 d8                	mov    %ebx,%eax
80105cd5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105cd8:	c9                   	leave  
80105cd9:	c3                   	ret    
80105cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105ce0 <sys_memsize>:

int sys_memsize(void){
80105ce0:	55                   	push   %ebp
80105ce1:	89 e5                	mov    %esp,%ebp
80105ce3:	83 ec 08             	sub    $0x8,%esp
  return (int)myproc()->sz;
80105ce6:	e8 35 da ff ff       	call   80103720 <myproc>
80105ceb:	8b 40 20             	mov    0x20(%eax),%eax
}
80105cee:	c9                   	leave  
80105cef:	c3                   	ret    

80105cf0 <sys_set_ps_priority>:

int sys_set_ps_priority(void){
80105cf0:	55                   	push   %ebp
80105cf1:	89 e5                	mov    %esp,%ebp
80105cf3:	83 ec 20             	sub    $0x20,%esp
  int priority;
  if(argint(0, &priority) < 0)
80105cf6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cf9:	50                   	push   %eax
80105cfa:	6a 00                	push   $0x0
80105cfc:	e8 9f f0 ff ff       	call   80104da0 <argint>
80105d01:	83 c4 10             	add    $0x10,%esp
80105d04:	85 c0                	test   %eax,%eax
80105d06:	78 18                	js     80105d20 <sys_set_ps_priority+0x30>
    return -1;
  return set_ps_priority(priority);
80105d08:	83 ec 0c             	sub    $0xc,%esp
80105d0b:	ff 75 f4             	pushl  -0xc(%ebp)
80105d0e:	e8 fd de ff ff       	call   80103c10 <set_ps_priority>
80105d13:	83 c4 10             	add    $0x10,%esp
}
80105d16:	c9                   	leave  
80105d17:	c3                   	ret    
80105d18:	90                   	nop
80105d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105d25:	c9                   	leave  
80105d26:	c3                   	ret    
80105d27:	89 f6                	mov    %esi,%esi
80105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d30 <sys_set_cfs_priority>:
int sys_set_cfs_priority(void){
80105d30:	55                   	push   %ebp
80105d31:	89 e5                	mov    %esp,%ebp
80105d33:	83 ec 20             	sub    $0x20,%esp
  int priority;
  if(argint(0, &priority) < 0)
80105d36:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d39:	50                   	push   %eax
80105d3a:	6a 00                	push   $0x0
80105d3c:	e8 5f f0 ff ff       	call   80104da0 <argint>
80105d41:	83 c4 10             	add    $0x10,%esp
80105d44:	85 c0                	test   %eax,%eax
80105d46:	78 18                	js     80105d60 <sys_set_cfs_priority+0x30>
    return -1;
  return set_cfs_priority(priority);
80105d48:	83 ec 0c             	sub    $0xc,%esp
80105d4b:	ff 75 f4             	pushl  -0xc(%ebp)
80105d4e:	e8 fd de ff ff       	call   80103c50 <set_cfs_priority>
80105d53:	83 c4 10             	add    $0x10,%esp
}
80105d56:	c9                   	leave  
80105d57:	c3                   	ret    
80105d58:	90                   	nop
80105d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105d65:	c9                   	leave  
80105d66:	c3                   	ret    
80105d67:	89 f6                	mov    %esi,%esi
80105d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d70 <sys_policy>:

int sys_policy(void){
80105d70:	55                   	push   %ebp
80105d71:	89 e5                	mov    %esp,%ebp
80105d73:	83 ec 20             	sub    $0x20,%esp
  int pol;
  if(argint(0,&pol)<0)
80105d76:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d79:	50                   	push   %eax
80105d7a:	6a 00                	push   $0x0
80105d7c:	e8 1f f0 ff ff       	call   80104da0 <argint>
80105d81:	83 c4 10             	add    $0x10,%esp
80105d84:	85 c0                	test   %eax,%eax
80105d86:	78 18                	js     80105da0 <sys_policy+0x30>
    return -1;
  return policy(pol);
80105d88:	83 ec 0c             	sub    $0xc,%esp
80105d8b:	ff 75 f4             	pushl  -0xc(%ebp)
80105d8e:	e8 dd e7 ff ff       	call   80104570 <policy>
80105d93:	83 c4 10             	add    $0x10,%esp
}
80105d96:	c9                   	leave  
80105d97:	c3                   	ret    
80105d98:	90                   	nop
80105d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105da0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105da5:	c9                   	leave  
80105da6:	c3                   	ret    
80105da7:	89 f6                	mov    %esi,%esi
80105da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105db0 <sys_proc_info>:

int sys_proc_info(void){
80105db0:	55                   	push   %ebp
80105db1:	89 e5                	mov    %esp,%ebp
80105db3:	83 ec 1c             	sub    $0x1c,%esp
  char * performance;
  if(argptr(0,&performance,16)<0)
80105db6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105db9:	6a 10                	push   $0x10
80105dbb:	50                   	push   %eax
80105dbc:	6a 00                	push   $0x0
80105dbe:	e8 2d f0 ff ff       	call   80104df0 <argptr>
80105dc3:	83 c4 10             	add    $0x10,%esp
80105dc6:	85 c0                	test   %eax,%eax
80105dc8:	78 16                	js     80105de0 <sys_proc_info+0x30>
    return -1;
  return proc_info((struct perf*)performance);
80105dca:	83 ec 0c             	sub    $0xc,%esp
80105dcd:	ff 75 f4             	pushl  -0xc(%ebp)
80105dd0:	e8 cb e8 ff ff       	call   801046a0 <proc_info>
80105dd5:	83 c4 10             	add    $0x10,%esp
80105dd8:	c9                   	leave  
80105dd9:	c3                   	ret    
80105dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105de0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105de5:	c9                   	leave  
80105de6:	c3                   	ret    

80105de7 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105de7:	1e                   	push   %ds
  pushl %es
80105de8:	06                   	push   %es
  pushl %fs
80105de9:	0f a0                	push   %fs
  pushl %gs
80105deb:	0f a8                	push   %gs
  pushal
80105ded:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105dee:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105df2:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105df4:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105df6:	54                   	push   %esp
  call trap
80105df7:	e8 c4 00 00 00       	call   80105ec0 <trap>
  addl $4, %esp
80105dfc:	83 c4 04             	add    $0x4,%esp

80105dff <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105dff:	61                   	popa   
  popl %gs
80105e00:	0f a9                	pop    %gs
  popl %fs
80105e02:	0f a1                	pop    %fs
  popl %es
80105e04:	07                   	pop    %es
  popl %ds
80105e05:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105e06:	83 c4 08             	add    $0x8,%esp
  iret
80105e09:	cf                   	iret   
80105e0a:	66 90                	xchg   %ax,%ax
80105e0c:	66 90                	xchg   %ax,%ax
80105e0e:	66 90                	xchg   %ax,%ax

80105e10 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105e10:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105e11:	31 c0                	xor    %eax,%eax
{
80105e13:	89 e5                	mov    %esp,%ebp
80105e15:	83 ec 08             	sub    $0x8,%esp
80105e18:	90                   	nop
80105e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105e20:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105e27:	c7 04 c5 c2 64 11 80 	movl   $0x8e000008,-0x7fee9b3e(,%eax,8)
80105e2e:	08 00 00 8e 
80105e32:	66 89 14 c5 c0 64 11 	mov    %dx,-0x7fee9b40(,%eax,8)
80105e39:	80 
80105e3a:	c1 ea 10             	shr    $0x10,%edx
80105e3d:	66 89 14 c5 c6 64 11 	mov    %dx,-0x7fee9b3a(,%eax,8)
80105e44:	80 
  for(i = 0; i < 256; i++)
80105e45:	83 c0 01             	add    $0x1,%eax
80105e48:	3d 00 01 00 00       	cmp    $0x100,%eax
80105e4d:	75 d1                	jne    80105e20 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105e4f:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105e54:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105e57:	c7 05 c2 66 11 80 08 	movl   $0xef000008,0x801166c2
80105e5e:	00 00 ef 
  initlock(&tickslock, "time");
80105e61:	68 2d 7f 10 80       	push   $0x80107f2d
80105e66:	68 80 64 11 80       	push   $0x80116480
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105e6b:	66 a3 c0 66 11 80    	mov    %ax,0x801166c0
80105e71:	c1 e8 10             	shr    $0x10,%eax
80105e74:	66 a3 c6 66 11 80    	mov    %ax,0x801166c6
  initlock(&tickslock, "time");
80105e7a:	e8 d1 e9 ff ff       	call   80104850 <initlock>
}
80105e7f:	83 c4 10             	add    $0x10,%esp
80105e82:	c9                   	leave  
80105e83:	c3                   	ret    
80105e84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105e8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105e90 <idtinit>:

void
idtinit(void)
{
80105e90:	55                   	push   %ebp
  pd[0] = size-1;
80105e91:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105e96:	89 e5                	mov    %esp,%ebp
80105e98:	83 ec 10             	sub    $0x10,%esp
80105e9b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105e9f:	b8 c0 64 11 80       	mov    $0x801164c0,%eax
80105ea4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105ea8:	c1 e8 10             	shr    $0x10,%eax
80105eab:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105eaf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105eb2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105eb5:	c9                   	leave  
80105eb6:	c3                   	ret    
80105eb7:	89 f6                	mov    %esi,%esi
80105eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ec0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105ec0:	55                   	push   %ebp
80105ec1:	89 e5                	mov    %esp,%ebp
80105ec3:	57                   	push   %edi
80105ec4:	56                   	push   %esi
80105ec5:	53                   	push   %ebx
80105ec6:	83 ec 1c             	sub    $0x1c,%esp
80105ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105ecc:	8b 47 30             	mov    0x30(%edi),%eax
80105ecf:	83 f8 40             	cmp    $0x40,%eax
80105ed2:	0f 84 f0 00 00 00    	je     80105fc8 <trap+0x108>
    if(myproc()->killed)
      exit(0);
    return;
  }

  switch(tf->trapno){
80105ed8:	83 e8 20             	sub    $0x20,%eax
80105edb:	83 f8 1f             	cmp    $0x1f,%eax
80105ede:	77 10                	ja     80105ef0 <trap+0x30>
80105ee0:	ff 24 85 d4 7f 10 80 	jmp    *-0x7fef802c(,%eax,4)
80105ee7:	89 f6                	mov    %esi,%esi
80105ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105ef0:	e8 2b d8 ff ff       	call   80103720 <myproc>
80105ef5:	85 c0                	test   %eax,%eax
80105ef7:	8b 5f 38             	mov    0x38(%edi),%ebx
80105efa:	0f 84 31 02 00 00    	je     80106131 <trap+0x271>
80105f00:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105f04:	0f 84 27 02 00 00    	je     80106131 <trap+0x271>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105f0a:	0f 20 d1             	mov    %cr2,%ecx
80105f0d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.m
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f10:	e8 eb d7 ff ff       	call   80103700 <cpuid>
80105f15:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105f18:	8b 47 34             	mov    0x34(%edi),%eax
80105f1b:	8b 77 30             	mov    0x30(%edi),%esi
80105f1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105f21:	e8 fa d7 ff ff       	call   80103720 <myproc>
80105f26:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105f29:	e8 f2 d7 ff ff       	call   80103720 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f2e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105f31:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105f34:	51                   	push   %ecx
80105f35:	53                   	push   %ebx
80105f36:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105f37:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f3a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105f3d:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105f3e:	81 c2 8c 00 00 00    	add    $0x8c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f44:	52                   	push   %edx
80105f45:	ff 70 30             	pushl  0x30(%eax)
80105f48:	68 90 7f 10 80       	push   $0x80107f90
80105f4d:	e8 0e a7 ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105f52:	83 c4 20             	add    $0x20,%esp
80105f55:	e8 c6 d7 ff ff       	call   80103720 <myproc>
80105f5a:	c7 40 44 01 00 00 00 	movl   $0x1,0x44(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f61:	e8 ba d7 ff ff       	call   80103720 <myproc>
80105f66:	85 c0                	test   %eax,%eax
80105f68:	74 1d                	je     80105f87 <trap+0xc7>
80105f6a:	e8 b1 d7 ff ff       	call   80103720 <myproc>
80105f6f:	8b 50 44             	mov    0x44(%eax),%edx
80105f72:	85 d2                	test   %edx,%edx
80105f74:	74 11                	je     80105f87 <trap+0xc7>
80105f76:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105f7a:	83 e0 03             	and    $0x3,%eax
80105f7d:	66 83 f8 03          	cmp    $0x3,%ax
80105f81:	0f 84 59 01 00 00    	je     801060e0 <trap+0x220>
    exit(0);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105f87:	e8 94 d7 ff ff       	call   80103720 <myproc>
80105f8c:	85 c0                	test   %eax,%eax
80105f8e:	74 0b                	je     80105f9b <trap+0xdb>
80105f90:	e8 8b d7 ff ff       	call   80103720 <myproc>
80105f95:	83 78 2c 04          	cmpl   $0x4,0x2c(%eax)
80105f99:	74 6d                	je     80106008 <trap+0x148>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f9b:	e8 80 d7 ff ff       	call   80103720 <myproc>
80105fa0:	85 c0                	test   %eax,%eax
80105fa2:	74 19                	je     80105fbd <trap+0xfd>
80105fa4:	e8 77 d7 ff ff       	call   80103720 <myproc>
80105fa9:	8b 40 44             	mov    0x44(%eax),%eax
80105fac:	85 c0                	test   %eax,%eax
80105fae:	74 0d                	je     80105fbd <trap+0xfd>
80105fb0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105fb4:	83 e0 03             	and    $0x3,%eax
80105fb7:	66 83 f8 03          	cmp    $0x3,%ax
80105fbb:	74 34                	je     80105ff1 <trap+0x131>
    exit(0);
}
80105fbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105fc0:	5b                   	pop    %ebx
80105fc1:	5e                   	pop    %esi
80105fc2:	5f                   	pop    %edi
80105fc3:	5d                   	pop    %ebp
80105fc4:	c3                   	ret    
80105fc5:	8d 76 00             	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105fc8:	e8 53 d7 ff ff       	call   80103720 <myproc>
80105fcd:	8b 58 44             	mov    0x44(%eax),%ebx
80105fd0:	85 db                	test   %ebx,%ebx
80105fd2:	0f 85 f0 00 00 00    	jne    801060c8 <trap+0x208>
    myproc()->tf = tf;
80105fd8:	e8 43 d7 ff ff       	call   80103720 <myproc>
80105fdd:	89 78 38             	mov    %edi,0x38(%eax)
    syscall();
80105fe0:	e8 ab ee ff ff       	call   80104e90 <syscall>
    if(myproc()->killed)
80105fe5:	e8 36 d7 ff ff       	call   80103720 <myproc>
80105fea:	8b 48 44             	mov    0x44(%eax),%ecx
80105fed:	85 c9                	test   %ecx,%ecx
80105fef:	74 cc                	je     80105fbd <trap+0xfd>
      exit(0);
80105ff1:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
80105ff8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ffb:	5b                   	pop    %ebx
80105ffc:	5e                   	pop    %esi
80105ffd:	5f                   	pop    %edi
80105ffe:	5d                   	pop    %ebp
      exit(0);
80105fff:	e9 9c e0 ff ff       	jmp    801040a0 <exit>
80106004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->state == RUNNING &&
80106008:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010600c:	75 8d                	jne    80105f9b <trap+0xdb>
    yield();
8010600e:	e8 8d e1 ff ff       	call   801041a0 <yield>
80106013:	eb 86                	jmp    80105f9b <trap+0xdb>
80106015:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80106018:	e8 e3 d6 ff ff       	call   80103700 <cpuid>
8010601d:	85 c0                	test   %eax,%eax
8010601f:	0f 84 d3 00 00 00    	je     801060f8 <trap+0x238>
    lapiceoi();
80106025:	e8 36 c7 ff ff       	call   80102760 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
8010602a:	e8 f1 d6 ff ff       	call   80103720 <myproc>
8010602f:	85 c0                	test   %eax,%eax
80106031:	0f 85 33 ff ff ff    	jne    80105f6a <trap+0xaa>
80106037:	e9 4b ff ff ff       	jmp    80105f87 <trap+0xc7>
8010603c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80106040:	e8 db c5 ff ff       	call   80102620 <kbdintr>
    lapiceoi();
80106045:	e8 16 c7 ff ff       	call   80102760 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
8010604a:	e8 d1 d6 ff ff       	call   80103720 <myproc>
8010604f:	85 c0                	test   %eax,%eax
80106051:	0f 85 13 ff ff ff    	jne    80105f6a <trap+0xaa>
80106057:	e9 2b ff ff ff       	jmp    80105f87 <trap+0xc7>
8010605c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80106060:	e8 6b 02 00 00       	call   801062d0 <uartintr>
    lapiceoi();
80106065:	e8 f6 c6 ff ff       	call   80102760 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
8010606a:	e8 b1 d6 ff ff       	call   80103720 <myproc>
8010606f:	85 c0                	test   %eax,%eax
80106071:	0f 85 f3 fe ff ff    	jne    80105f6a <trap+0xaa>
80106077:	e9 0b ff ff ff       	jmp    80105f87 <trap+0xc7>
8010607c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106080:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80106084:	8b 77 38             	mov    0x38(%edi),%esi
80106087:	e8 74 d6 ff ff       	call   80103700 <cpuid>
8010608c:	56                   	push   %esi
8010608d:	53                   	push   %ebx
8010608e:	50                   	push   %eax
8010608f:	68 38 7f 10 80       	push   $0x80107f38
80106094:	e8 c7 a5 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80106099:	e8 c2 c6 ff ff       	call   80102760 <lapiceoi>
    break;
8010609e:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801060a1:	e8 7a d6 ff ff       	call   80103720 <myproc>
801060a6:	85 c0                	test   %eax,%eax
801060a8:	0f 85 bc fe ff ff    	jne    80105f6a <trap+0xaa>
801060ae:	e9 d4 fe ff ff       	jmp    80105f87 <trap+0xc7>
801060b3:	90                   	nop
801060b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
801060b8:	e8 d3 bf ff ff       	call   80102090 <ideintr>
801060bd:	e9 63 ff ff ff       	jmp    80106025 <trap+0x165>
801060c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit(0);
801060c8:	83 ec 0c             	sub    $0xc,%esp
801060cb:	6a 00                	push   $0x0
801060cd:	e8 ce df ff ff       	call   801040a0 <exit>
801060d2:	83 c4 10             	add    $0x10,%esp
801060d5:	e9 fe fe ff ff       	jmp    80105fd8 <trap+0x118>
801060da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit(0);
801060e0:	83 ec 0c             	sub    $0xc,%esp
801060e3:	6a 00                	push   $0x0
801060e5:	e8 b6 df ff ff       	call   801040a0 <exit>
801060ea:	83 c4 10             	add    $0x10,%esp
801060ed:	e9 95 fe ff ff       	jmp    80105f87 <trap+0xc7>
801060f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
801060f8:	83 ec 0c             	sub    $0xc,%esp
801060fb:	68 80 64 11 80       	push   $0x80116480
80106100:	e8 8b e8 ff ff       	call   80104990 <acquire>
      ticks++;
80106105:	83 05 c0 6c 11 80 01 	addl   $0x1,0x80116cc0
      increase_ticks();//CALLS THE FUNCTION TO INCREASE ALL FIELDS OF ALL THE PROCESSES----TO BE CONTINUED
8010610c:	e8 3f e5 ff ff       	call   80104650 <increase_ticks>
      wakeup(&ticks);
80106111:	c7 04 24 c0 6c 11 80 	movl   $0x80116cc0,(%esp)
80106118:	e8 c3 e2 ff ff       	call   801043e0 <wakeup>
      release(&tickslock);
8010611d:	c7 04 24 80 64 11 80 	movl   $0x80116480,(%esp)
80106124:	e8 27 e9 ff ff       	call   80104a50 <release>
80106129:	83 c4 10             	add    $0x10,%esp
8010612c:	e9 f4 fe ff ff       	jmp    80106025 <trap+0x165>
80106131:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106134:	e8 c7 d5 ff ff       	call   80103700 <cpuid>
80106139:	83 ec 0c             	sub    $0xc,%esp
8010613c:	56                   	push   %esi
8010613d:	53                   	push   %ebx
8010613e:	50                   	push   %eax
8010613f:	ff 77 30             	pushl  0x30(%edi)
80106142:	68 5c 7f 10 80       	push   $0x80107f5c
80106147:	e8 14 a5 ff ff       	call   80100660 <cprintf>
      panic("trap");
8010614c:	83 c4 14             	add    $0x14,%esp
8010614f:	68 32 7f 10 80       	push   $0x80107f32
80106154:	e8 37 a2 ff ff       	call   80100390 <panic>
80106159:	66 90                	xchg   %ax,%ax
8010615b:	66 90                	xchg   %ax,%ax
8010615d:	66 90                	xchg   %ax,%ax
8010615f:	90                   	nop

80106160 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80106160:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
{
80106165:	55                   	push   %ebp
80106166:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106168:	85 c0                	test   %eax,%eax
8010616a:	74 1c                	je     80106188 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010616c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106171:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80106172:	a8 01                	test   $0x1,%al
80106174:	74 12                	je     80106188 <uartgetc+0x28>
80106176:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010617b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
8010617c:	0f b6 c0             	movzbl %al,%eax
}
8010617f:	5d                   	pop    %ebp
80106180:	c3                   	ret    
80106181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80106188:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010618d:	5d                   	pop    %ebp
8010618e:	c3                   	ret    
8010618f:	90                   	nop

80106190 <uartputc.part.0>:
uartputc(int c)
80106190:	55                   	push   %ebp
80106191:	89 e5                	mov    %esp,%ebp
80106193:	57                   	push   %edi
80106194:	56                   	push   %esi
80106195:	53                   	push   %ebx
80106196:	89 c7                	mov    %eax,%edi
80106198:	bb 80 00 00 00       	mov    $0x80,%ebx
8010619d:	be fd 03 00 00       	mov    $0x3fd,%esi
801061a2:	83 ec 0c             	sub    $0xc,%esp
801061a5:	eb 1b                	jmp    801061c2 <uartputc.part.0+0x32>
801061a7:	89 f6                	mov    %esi,%esi
801061a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
801061b0:	83 ec 0c             	sub    $0xc,%esp
801061b3:	6a 0a                	push   $0xa
801061b5:	e8 c6 c5 ff ff       	call   80102780 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801061ba:	83 c4 10             	add    $0x10,%esp
801061bd:	83 eb 01             	sub    $0x1,%ebx
801061c0:	74 07                	je     801061c9 <uartputc.part.0+0x39>
801061c2:	89 f2                	mov    %esi,%edx
801061c4:	ec                   	in     (%dx),%al
801061c5:	a8 20                	test   $0x20,%al
801061c7:	74 e7                	je     801061b0 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801061c9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801061ce:	89 f8                	mov    %edi,%eax
801061d0:	ee                   	out    %al,(%dx)
}
801061d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061d4:	5b                   	pop    %ebx
801061d5:	5e                   	pop    %esi
801061d6:	5f                   	pop    %edi
801061d7:	5d                   	pop    %ebp
801061d8:	c3                   	ret    
801061d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801061e0 <uartinit>:
{
801061e0:	55                   	push   %ebp
801061e1:	31 c9                	xor    %ecx,%ecx
801061e3:	89 c8                	mov    %ecx,%eax
801061e5:	89 e5                	mov    %esp,%ebp
801061e7:	57                   	push   %edi
801061e8:	56                   	push   %esi
801061e9:	53                   	push   %ebx
801061ea:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801061ef:	89 da                	mov    %ebx,%edx
801061f1:	83 ec 0c             	sub    $0xc,%esp
801061f4:	ee                   	out    %al,(%dx)
801061f5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801061fa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801061ff:	89 fa                	mov    %edi,%edx
80106201:	ee                   	out    %al,(%dx)
80106202:	b8 0c 00 00 00       	mov    $0xc,%eax
80106207:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010620c:	ee                   	out    %al,(%dx)
8010620d:	be f9 03 00 00       	mov    $0x3f9,%esi
80106212:	89 c8                	mov    %ecx,%eax
80106214:	89 f2                	mov    %esi,%edx
80106216:	ee                   	out    %al,(%dx)
80106217:	b8 03 00 00 00       	mov    $0x3,%eax
8010621c:	89 fa                	mov    %edi,%edx
8010621e:	ee                   	out    %al,(%dx)
8010621f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80106224:	89 c8                	mov    %ecx,%eax
80106226:	ee                   	out    %al,(%dx)
80106227:	b8 01 00 00 00       	mov    $0x1,%eax
8010622c:	89 f2                	mov    %esi,%edx
8010622e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010622f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106234:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80106235:	3c ff                	cmp    $0xff,%al
80106237:	74 5a                	je     80106293 <uartinit+0xb3>
  uart = 1;
80106239:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
80106240:	00 00 00 
80106243:	89 da                	mov    %ebx,%edx
80106245:	ec                   	in     (%dx),%al
80106246:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010624b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
8010624c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
8010624f:	bb 54 80 10 80       	mov    $0x80108054,%ebx
  ioapicenable(IRQ_COM1, 0);
80106254:	6a 00                	push   $0x0
80106256:	6a 04                	push   $0x4
80106258:	e8 83 c0 ff ff       	call   801022e0 <ioapicenable>
8010625d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80106260:	b8 78 00 00 00       	mov    $0x78,%eax
80106265:	eb 13                	jmp    8010627a <uartinit+0x9a>
80106267:	89 f6                	mov    %esi,%esi
80106269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106270:	83 c3 01             	add    $0x1,%ebx
80106273:	0f be 03             	movsbl (%ebx),%eax
80106276:	84 c0                	test   %al,%al
80106278:	74 19                	je     80106293 <uartinit+0xb3>
  if(!uart)
8010627a:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80106280:	85 d2                	test   %edx,%edx
80106282:	74 ec                	je     80106270 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80106284:	83 c3 01             	add    $0x1,%ebx
80106287:	e8 04 ff ff ff       	call   80106190 <uartputc.part.0>
8010628c:	0f be 03             	movsbl (%ebx),%eax
8010628f:	84 c0                	test   %al,%al
80106291:	75 e7                	jne    8010627a <uartinit+0x9a>
}
80106293:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106296:	5b                   	pop    %ebx
80106297:	5e                   	pop    %esi
80106298:	5f                   	pop    %edi
80106299:	5d                   	pop    %ebp
8010629a:	c3                   	ret    
8010629b:	90                   	nop
8010629c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801062a0 <uartputc>:
  if(!uart)
801062a0:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
{
801062a6:	55                   	push   %ebp
801062a7:	89 e5                	mov    %esp,%ebp
  if(!uart)
801062a9:	85 d2                	test   %edx,%edx
{
801062ab:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
801062ae:	74 10                	je     801062c0 <uartputc+0x20>
}
801062b0:	5d                   	pop    %ebp
801062b1:	e9 da fe ff ff       	jmp    80106190 <uartputc.part.0>
801062b6:	8d 76 00             	lea    0x0(%esi),%esi
801062b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801062c0:	5d                   	pop    %ebp
801062c1:	c3                   	ret    
801062c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801062c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801062d0 <uartintr>:

void
uartintr(void)
{
801062d0:	55                   	push   %ebp
801062d1:	89 e5                	mov    %esp,%ebp
801062d3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
801062d6:	68 60 61 10 80       	push   $0x80106160
801062db:	e8 30 a5 ff ff       	call   80100810 <consoleintr>
}
801062e0:	83 c4 10             	add    $0x10,%esp
801062e3:	c9                   	leave  
801062e4:	c3                   	ret    

801062e5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
801062e5:	6a 00                	push   $0x0
  pushl $0
801062e7:	6a 00                	push   $0x0
  jmp alltraps
801062e9:	e9 f9 fa ff ff       	jmp    80105de7 <alltraps>

801062ee <vector1>:
.globl vector1
vector1:
  pushl $0
801062ee:	6a 00                	push   $0x0
  pushl $1
801062f0:	6a 01                	push   $0x1
  jmp alltraps
801062f2:	e9 f0 fa ff ff       	jmp    80105de7 <alltraps>

801062f7 <vector2>:
.globl vector2
vector2:
  pushl $0
801062f7:	6a 00                	push   $0x0
  pushl $2
801062f9:	6a 02                	push   $0x2
  jmp alltraps
801062fb:	e9 e7 fa ff ff       	jmp    80105de7 <alltraps>

80106300 <vector3>:
.globl vector3
vector3:
  pushl $0
80106300:	6a 00                	push   $0x0
  pushl $3
80106302:	6a 03                	push   $0x3
  jmp alltraps
80106304:	e9 de fa ff ff       	jmp    80105de7 <alltraps>

80106309 <vector4>:
.globl vector4
vector4:
  pushl $0
80106309:	6a 00                	push   $0x0
  pushl $4
8010630b:	6a 04                	push   $0x4
  jmp alltraps
8010630d:	e9 d5 fa ff ff       	jmp    80105de7 <alltraps>

80106312 <vector5>:
.globl vector5
vector5:
  pushl $0
80106312:	6a 00                	push   $0x0
  pushl $5
80106314:	6a 05                	push   $0x5
  jmp alltraps
80106316:	e9 cc fa ff ff       	jmp    80105de7 <alltraps>

8010631b <vector6>:
.globl vector6
vector6:
  pushl $0
8010631b:	6a 00                	push   $0x0
  pushl $6
8010631d:	6a 06                	push   $0x6
  jmp alltraps
8010631f:	e9 c3 fa ff ff       	jmp    80105de7 <alltraps>

80106324 <vector7>:
.globl vector7
vector7:
  pushl $0
80106324:	6a 00                	push   $0x0
  pushl $7
80106326:	6a 07                	push   $0x7
  jmp alltraps
80106328:	e9 ba fa ff ff       	jmp    80105de7 <alltraps>

8010632d <vector8>:
.globl vector8
vector8:
  pushl $8
8010632d:	6a 08                	push   $0x8
  jmp alltraps
8010632f:	e9 b3 fa ff ff       	jmp    80105de7 <alltraps>

80106334 <vector9>:
.globl vector9
vector9:
  pushl $0
80106334:	6a 00                	push   $0x0
  pushl $9
80106336:	6a 09                	push   $0x9
  jmp alltraps
80106338:	e9 aa fa ff ff       	jmp    80105de7 <alltraps>

8010633d <vector10>:
.globl vector10
vector10:
  pushl $10
8010633d:	6a 0a                	push   $0xa
  jmp alltraps
8010633f:	e9 a3 fa ff ff       	jmp    80105de7 <alltraps>

80106344 <vector11>:
.globl vector11
vector11:
  pushl $11
80106344:	6a 0b                	push   $0xb
  jmp alltraps
80106346:	e9 9c fa ff ff       	jmp    80105de7 <alltraps>

8010634b <vector12>:
.globl vector12
vector12:
  pushl $12
8010634b:	6a 0c                	push   $0xc
  jmp alltraps
8010634d:	e9 95 fa ff ff       	jmp    80105de7 <alltraps>

80106352 <vector13>:
.globl vector13
vector13:
  pushl $13
80106352:	6a 0d                	push   $0xd
  jmp alltraps
80106354:	e9 8e fa ff ff       	jmp    80105de7 <alltraps>

80106359 <vector14>:
.globl vector14
vector14:
  pushl $14
80106359:	6a 0e                	push   $0xe
  jmp alltraps
8010635b:	e9 87 fa ff ff       	jmp    80105de7 <alltraps>

80106360 <vector15>:
.globl vector15
vector15:
  pushl $0
80106360:	6a 00                	push   $0x0
  pushl $15
80106362:	6a 0f                	push   $0xf
  jmp alltraps
80106364:	e9 7e fa ff ff       	jmp    80105de7 <alltraps>

80106369 <vector16>:
.globl vector16
vector16:
  pushl $0
80106369:	6a 00                	push   $0x0
  pushl $16
8010636b:	6a 10                	push   $0x10
  jmp alltraps
8010636d:	e9 75 fa ff ff       	jmp    80105de7 <alltraps>

80106372 <vector17>:
.globl vector17
vector17:
  pushl $17
80106372:	6a 11                	push   $0x11
  jmp alltraps
80106374:	e9 6e fa ff ff       	jmp    80105de7 <alltraps>

80106379 <vector18>:
.globl vector18
vector18:
  pushl $0
80106379:	6a 00                	push   $0x0
  pushl $18
8010637b:	6a 12                	push   $0x12
  jmp alltraps
8010637d:	e9 65 fa ff ff       	jmp    80105de7 <alltraps>

80106382 <vector19>:
.globl vector19
vector19:
  pushl $0
80106382:	6a 00                	push   $0x0
  pushl $19
80106384:	6a 13                	push   $0x13
  jmp alltraps
80106386:	e9 5c fa ff ff       	jmp    80105de7 <alltraps>

8010638b <vector20>:
.globl vector20
vector20:
  pushl $0
8010638b:	6a 00                	push   $0x0
  pushl $20
8010638d:	6a 14                	push   $0x14
  jmp alltraps
8010638f:	e9 53 fa ff ff       	jmp    80105de7 <alltraps>

80106394 <vector21>:
.globl vector21
vector21:
  pushl $0
80106394:	6a 00                	push   $0x0
  pushl $21
80106396:	6a 15                	push   $0x15
  jmp alltraps
80106398:	e9 4a fa ff ff       	jmp    80105de7 <alltraps>

8010639d <vector22>:
.globl vector22
vector22:
  pushl $0
8010639d:	6a 00                	push   $0x0
  pushl $22
8010639f:	6a 16                	push   $0x16
  jmp alltraps
801063a1:	e9 41 fa ff ff       	jmp    80105de7 <alltraps>

801063a6 <vector23>:
.globl vector23
vector23:
  pushl $0
801063a6:	6a 00                	push   $0x0
  pushl $23
801063a8:	6a 17                	push   $0x17
  jmp alltraps
801063aa:	e9 38 fa ff ff       	jmp    80105de7 <alltraps>

801063af <vector24>:
.globl vector24
vector24:
  pushl $0
801063af:	6a 00                	push   $0x0
  pushl $24
801063b1:	6a 18                	push   $0x18
  jmp alltraps
801063b3:	e9 2f fa ff ff       	jmp    80105de7 <alltraps>

801063b8 <vector25>:
.globl vector25
vector25:
  pushl $0
801063b8:	6a 00                	push   $0x0
  pushl $25
801063ba:	6a 19                	push   $0x19
  jmp alltraps
801063bc:	e9 26 fa ff ff       	jmp    80105de7 <alltraps>

801063c1 <vector26>:
.globl vector26
vector26:
  pushl $0
801063c1:	6a 00                	push   $0x0
  pushl $26
801063c3:	6a 1a                	push   $0x1a
  jmp alltraps
801063c5:	e9 1d fa ff ff       	jmp    80105de7 <alltraps>

801063ca <vector27>:
.globl vector27
vector27:
  pushl $0
801063ca:	6a 00                	push   $0x0
  pushl $27
801063cc:	6a 1b                	push   $0x1b
  jmp alltraps
801063ce:	e9 14 fa ff ff       	jmp    80105de7 <alltraps>

801063d3 <vector28>:
.globl vector28
vector28:
  pushl $0
801063d3:	6a 00                	push   $0x0
  pushl $28
801063d5:	6a 1c                	push   $0x1c
  jmp alltraps
801063d7:	e9 0b fa ff ff       	jmp    80105de7 <alltraps>

801063dc <vector29>:
.globl vector29
vector29:
  pushl $0
801063dc:	6a 00                	push   $0x0
  pushl $29
801063de:	6a 1d                	push   $0x1d
  jmp alltraps
801063e0:	e9 02 fa ff ff       	jmp    80105de7 <alltraps>

801063e5 <vector30>:
.globl vector30
vector30:
  pushl $0
801063e5:	6a 00                	push   $0x0
  pushl $30
801063e7:	6a 1e                	push   $0x1e
  jmp alltraps
801063e9:	e9 f9 f9 ff ff       	jmp    80105de7 <alltraps>

801063ee <vector31>:
.globl vector31
vector31:
  pushl $0
801063ee:	6a 00                	push   $0x0
  pushl $31
801063f0:	6a 1f                	push   $0x1f
  jmp alltraps
801063f2:	e9 f0 f9 ff ff       	jmp    80105de7 <alltraps>

801063f7 <vector32>:
.globl vector32
vector32:
  pushl $0
801063f7:	6a 00                	push   $0x0
  pushl $32
801063f9:	6a 20                	push   $0x20
  jmp alltraps
801063fb:	e9 e7 f9 ff ff       	jmp    80105de7 <alltraps>

80106400 <vector33>:
.globl vector33
vector33:
  pushl $0
80106400:	6a 00                	push   $0x0
  pushl $33
80106402:	6a 21                	push   $0x21
  jmp alltraps
80106404:	e9 de f9 ff ff       	jmp    80105de7 <alltraps>

80106409 <vector34>:
.globl vector34
vector34:
  pushl $0
80106409:	6a 00                	push   $0x0
  pushl $34
8010640b:	6a 22                	push   $0x22
  jmp alltraps
8010640d:	e9 d5 f9 ff ff       	jmp    80105de7 <alltraps>

80106412 <vector35>:
.globl vector35
vector35:
  pushl $0
80106412:	6a 00                	push   $0x0
  pushl $35
80106414:	6a 23                	push   $0x23
  jmp alltraps
80106416:	e9 cc f9 ff ff       	jmp    80105de7 <alltraps>

8010641b <vector36>:
.globl vector36
vector36:
  pushl $0
8010641b:	6a 00                	push   $0x0
  pushl $36
8010641d:	6a 24                	push   $0x24
  jmp alltraps
8010641f:	e9 c3 f9 ff ff       	jmp    80105de7 <alltraps>

80106424 <vector37>:
.globl vector37
vector37:
  pushl $0
80106424:	6a 00                	push   $0x0
  pushl $37
80106426:	6a 25                	push   $0x25
  jmp alltraps
80106428:	e9 ba f9 ff ff       	jmp    80105de7 <alltraps>

8010642d <vector38>:
.globl vector38
vector38:
  pushl $0
8010642d:	6a 00                	push   $0x0
  pushl $38
8010642f:	6a 26                	push   $0x26
  jmp alltraps
80106431:	e9 b1 f9 ff ff       	jmp    80105de7 <alltraps>

80106436 <vector39>:
.globl vector39
vector39:
  pushl $0
80106436:	6a 00                	push   $0x0
  pushl $39
80106438:	6a 27                	push   $0x27
  jmp alltraps
8010643a:	e9 a8 f9 ff ff       	jmp    80105de7 <alltraps>

8010643f <vector40>:
.globl vector40
vector40:
  pushl $0
8010643f:	6a 00                	push   $0x0
  pushl $40
80106441:	6a 28                	push   $0x28
  jmp alltraps
80106443:	e9 9f f9 ff ff       	jmp    80105de7 <alltraps>

80106448 <vector41>:
.globl vector41
vector41:
  pushl $0
80106448:	6a 00                	push   $0x0
  pushl $41
8010644a:	6a 29                	push   $0x29
  jmp alltraps
8010644c:	e9 96 f9 ff ff       	jmp    80105de7 <alltraps>

80106451 <vector42>:
.globl vector42
vector42:
  pushl $0
80106451:	6a 00                	push   $0x0
  pushl $42
80106453:	6a 2a                	push   $0x2a
  jmp alltraps
80106455:	e9 8d f9 ff ff       	jmp    80105de7 <alltraps>

8010645a <vector43>:
.globl vector43
vector43:
  pushl $0
8010645a:	6a 00                	push   $0x0
  pushl $43
8010645c:	6a 2b                	push   $0x2b
  jmp alltraps
8010645e:	e9 84 f9 ff ff       	jmp    80105de7 <alltraps>

80106463 <vector44>:
.globl vector44
vector44:
  pushl $0
80106463:	6a 00                	push   $0x0
  pushl $44
80106465:	6a 2c                	push   $0x2c
  jmp alltraps
80106467:	e9 7b f9 ff ff       	jmp    80105de7 <alltraps>

8010646c <vector45>:
.globl vector45
vector45:
  pushl $0
8010646c:	6a 00                	push   $0x0
  pushl $45
8010646e:	6a 2d                	push   $0x2d
  jmp alltraps
80106470:	e9 72 f9 ff ff       	jmp    80105de7 <alltraps>

80106475 <vector46>:
.globl vector46
vector46:
  pushl $0
80106475:	6a 00                	push   $0x0
  pushl $46
80106477:	6a 2e                	push   $0x2e
  jmp alltraps
80106479:	e9 69 f9 ff ff       	jmp    80105de7 <alltraps>

8010647e <vector47>:
.globl vector47
vector47:
  pushl $0
8010647e:	6a 00                	push   $0x0
  pushl $47
80106480:	6a 2f                	push   $0x2f
  jmp alltraps
80106482:	e9 60 f9 ff ff       	jmp    80105de7 <alltraps>

80106487 <vector48>:
.globl vector48
vector48:
  pushl $0
80106487:	6a 00                	push   $0x0
  pushl $48
80106489:	6a 30                	push   $0x30
  jmp alltraps
8010648b:	e9 57 f9 ff ff       	jmp    80105de7 <alltraps>

80106490 <vector49>:
.globl vector49
vector49:
  pushl $0
80106490:	6a 00                	push   $0x0
  pushl $49
80106492:	6a 31                	push   $0x31
  jmp alltraps
80106494:	e9 4e f9 ff ff       	jmp    80105de7 <alltraps>

80106499 <vector50>:
.globl vector50
vector50:
  pushl $0
80106499:	6a 00                	push   $0x0
  pushl $50
8010649b:	6a 32                	push   $0x32
  jmp alltraps
8010649d:	e9 45 f9 ff ff       	jmp    80105de7 <alltraps>

801064a2 <vector51>:
.globl vector51
vector51:
  pushl $0
801064a2:	6a 00                	push   $0x0
  pushl $51
801064a4:	6a 33                	push   $0x33
  jmp alltraps
801064a6:	e9 3c f9 ff ff       	jmp    80105de7 <alltraps>

801064ab <vector52>:
.globl vector52
vector52:
  pushl $0
801064ab:	6a 00                	push   $0x0
  pushl $52
801064ad:	6a 34                	push   $0x34
  jmp alltraps
801064af:	e9 33 f9 ff ff       	jmp    80105de7 <alltraps>

801064b4 <vector53>:
.globl vector53
vector53:
  pushl $0
801064b4:	6a 00                	push   $0x0
  pushl $53
801064b6:	6a 35                	push   $0x35
  jmp alltraps
801064b8:	e9 2a f9 ff ff       	jmp    80105de7 <alltraps>

801064bd <vector54>:
.globl vector54
vector54:
  pushl $0
801064bd:	6a 00                	push   $0x0
  pushl $54
801064bf:	6a 36                	push   $0x36
  jmp alltraps
801064c1:	e9 21 f9 ff ff       	jmp    80105de7 <alltraps>

801064c6 <vector55>:
.globl vector55
vector55:
  pushl $0
801064c6:	6a 00                	push   $0x0
  pushl $55
801064c8:	6a 37                	push   $0x37
  jmp alltraps
801064ca:	e9 18 f9 ff ff       	jmp    80105de7 <alltraps>

801064cf <vector56>:
.globl vector56
vector56:
  pushl $0
801064cf:	6a 00                	push   $0x0
  pushl $56
801064d1:	6a 38                	push   $0x38
  jmp alltraps
801064d3:	e9 0f f9 ff ff       	jmp    80105de7 <alltraps>

801064d8 <vector57>:
.globl vector57
vector57:
  pushl $0
801064d8:	6a 00                	push   $0x0
  pushl $57
801064da:	6a 39                	push   $0x39
  jmp alltraps
801064dc:	e9 06 f9 ff ff       	jmp    80105de7 <alltraps>

801064e1 <vector58>:
.globl vector58
vector58:
  pushl $0
801064e1:	6a 00                	push   $0x0
  pushl $58
801064e3:	6a 3a                	push   $0x3a
  jmp alltraps
801064e5:	e9 fd f8 ff ff       	jmp    80105de7 <alltraps>

801064ea <vector59>:
.globl vector59
vector59:
  pushl $0
801064ea:	6a 00                	push   $0x0
  pushl $59
801064ec:	6a 3b                	push   $0x3b
  jmp alltraps
801064ee:	e9 f4 f8 ff ff       	jmp    80105de7 <alltraps>

801064f3 <vector60>:
.globl vector60
vector60:
  pushl $0
801064f3:	6a 00                	push   $0x0
  pushl $60
801064f5:	6a 3c                	push   $0x3c
  jmp alltraps
801064f7:	e9 eb f8 ff ff       	jmp    80105de7 <alltraps>

801064fc <vector61>:
.globl vector61
vector61:
  pushl $0
801064fc:	6a 00                	push   $0x0
  pushl $61
801064fe:	6a 3d                	push   $0x3d
  jmp alltraps
80106500:	e9 e2 f8 ff ff       	jmp    80105de7 <alltraps>

80106505 <vector62>:
.globl vector62
vector62:
  pushl $0
80106505:	6a 00                	push   $0x0
  pushl $62
80106507:	6a 3e                	push   $0x3e
  jmp alltraps
80106509:	e9 d9 f8 ff ff       	jmp    80105de7 <alltraps>

8010650e <vector63>:
.globl vector63
vector63:
  pushl $0
8010650e:	6a 00                	push   $0x0
  pushl $63
80106510:	6a 3f                	push   $0x3f
  jmp alltraps
80106512:	e9 d0 f8 ff ff       	jmp    80105de7 <alltraps>

80106517 <vector64>:
.globl vector64
vector64:
  pushl $0
80106517:	6a 00                	push   $0x0
  pushl $64
80106519:	6a 40                	push   $0x40
  jmp alltraps
8010651b:	e9 c7 f8 ff ff       	jmp    80105de7 <alltraps>

80106520 <vector65>:
.globl vector65
vector65:
  pushl $0
80106520:	6a 00                	push   $0x0
  pushl $65
80106522:	6a 41                	push   $0x41
  jmp alltraps
80106524:	e9 be f8 ff ff       	jmp    80105de7 <alltraps>

80106529 <vector66>:
.globl vector66
vector66:
  pushl $0
80106529:	6a 00                	push   $0x0
  pushl $66
8010652b:	6a 42                	push   $0x42
  jmp alltraps
8010652d:	e9 b5 f8 ff ff       	jmp    80105de7 <alltraps>

80106532 <vector67>:
.globl vector67
vector67:
  pushl $0
80106532:	6a 00                	push   $0x0
  pushl $67
80106534:	6a 43                	push   $0x43
  jmp alltraps
80106536:	e9 ac f8 ff ff       	jmp    80105de7 <alltraps>

8010653b <vector68>:
.globl vector68
vector68:
  pushl $0
8010653b:	6a 00                	push   $0x0
  pushl $68
8010653d:	6a 44                	push   $0x44
  jmp alltraps
8010653f:	e9 a3 f8 ff ff       	jmp    80105de7 <alltraps>

80106544 <vector69>:
.globl vector69
vector69:
  pushl $0
80106544:	6a 00                	push   $0x0
  pushl $69
80106546:	6a 45                	push   $0x45
  jmp alltraps
80106548:	e9 9a f8 ff ff       	jmp    80105de7 <alltraps>

8010654d <vector70>:
.globl vector70
vector70:
  pushl $0
8010654d:	6a 00                	push   $0x0
  pushl $70
8010654f:	6a 46                	push   $0x46
  jmp alltraps
80106551:	e9 91 f8 ff ff       	jmp    80105de7 <alltraps>

80106556 <vector71>:
.globl vector71
vector71:
  pushl $0
80106556:	6a 00                	push   $0x0
  pushl $71
80106558:	6a 47                	push   $0x47
  jmp alltraps
8010655a:	e9 88 f8 ff ff       	jmp    80105de7 <alltraps>

8010655f <vector72>:
.globl vector72
vector72:
  pushl $0
8010655f:	6a 00                	push   $0x0
  pushl $72
80106561:	6a 48                	push   $0x48
  jmp alltraps
80106563:	e9 7f f8 ff ff       	jmp    80105de7 <alltraps>

80106568 <vector73>:
.globl vector73
vector73:
  pushl $0
80106568:	6a 00                	push   $0x0
  pushl $73
8010656a:	6a 49                	push   $0x49
  jmp alltraps
8010656c:	e9 76 f8 ff ff       	jmp    80105de7 <alltraps>

80106571 <vector74>:
.globl vector74
vector74:
  pushl $0
80106571:	6a 00                	push   $0x0
  pushl $74
80106573:	6a 4a                	push   $0x4a
  jmp alltraps
80106575:	e9 6d f8 ff ff       	jmp    80105de7 <alltraps>

8010657a <vector75>:
.globl vector75
vector75:
  pushl $0
8010657a:	6a 00                	push   $0x0
  pushl $75
8010657c:	6a 4b                	push   $0x4b
  jmp alltraps
8010657e:	e9 64 f8 ff ff       	jmp    80105de7 <alltraps>

80106583 <vector76>:
.globl vector76
vector76:
  pushl $0
80106583:	6a 00                	push   $0x0
  pushl $76
80106585:	6a 4c                	push   $0x4c
  jmp alltraps
80106587:	e9 5b f8 ff ff       	jmp    80105de7 <alltraps>

8010658c <vector77>:
.globl vector77
vector77:
  pushl $0
8010658c:	6a 00                	push   $0x0
  pushl $77
8010658e:	6a 4d                	push   $0x4d
  jmp alltraps
80106590:	e9 52 f8 ff ff       	jmp    80105de7 <alltraps>

80106595 <vector78>:
.globl vector78
vector78:
  pushl $0
80106595:	6a 00                	push   $0x0
  pushl $78
80106597:	6a 4e                	push   $0x4e
  jmp alltraps
80106599:	e9 49 f8 ff ff       	jmp    80105de7 <alltraps>

8010659e <vector79>:
.globl vector79
vector79:
  pushl $0
8010659e:	6a 00                	push   $0x0
  pushl $79
801065a0:	6a 4f                	push   $0x4f
  jmp alltraps
801065a2:	e9 40 f8 ff ff       	jmp    80105de7 <alltraps>

801065a7 <vector80>:
.globl vector80
vector80:
  pushl $0
801065a7:	6a 00                	push   $0x0
  pushl $80
801065a9:	6a 50                	push   $0x50
  jmp alltraps
801065ab:	e9 37 f8 ff ff       	jmp    80105de7 <alltraps>

801065b0 <vector81>:
.globl vector81
vector81:
  pushl $0
801065b0:	6a 00                	push   $0x0
  pushl $81
801065b2:	6a 51                	push   $0x51
  jmp alltraps
801065b4:	e9 2e f8 ff ff       	jmp    80105de7 <alltraps>

801065b9 <vector82>:
.globl vector82
vector82:
  pushl $0
801065b9:	6a 00                	push   $0x0
  pushl $82
801065bb:	6a 52                	push   $0x52
  jmp alltraps
801065bd:	e9 25 f8 ff ff       	jmp    80105de7 <alltraps>

801065c2 <vector83>:
.globl vector83
vector83:
  pushl $0
801065c2:	6a 00                	push   $0x0
  pushl $83
801065c4:	6a 53                	push   $0x53
  jmp alltraps
801065c6:	e9 1c f8 ff ff       	jmp    80105de7 <alltraps>

801065cb <vector84>:
.globl vector84
vector84:
  pushl $0
801065cb:	6a 00                	push   $0x0
  pushl $84
801065cd:	6a 54                	push   $0x54
  jmp alltraps
801065cf:	e9 13 f8 ff ff       	jmp    80105de7 <alltraps>

801065d4 <vector85>:
.globl vector85
vector85:
  pushl $0
801065d4:	6a 00                	push   $0x0
  pushl $85
801065d6:	6a 55                	push   $0x55
  jmp alltraps
801065d8:	e9 0a f8 ff ff       	jmp    80105de7 <alltraps>

801065dd <vector86>:
.globl vector86
vector86:
  pushl $0
801065dd:	6a 00                	push   $0x0
  pushl $86
801065df:	6a 56                	push   $0x56
  jmp alltraps
801065e1:	e9 01 f8 ff ff       	jmp    80105de7 <alltraps>

801065e6 <vector87>:
.globl vector87
vector87:
  pushl $0
801065e6:	6a 00                	push   $0x0
  pushl $87
801065e8:	6a 57                	push   $0x57
  jmp alltraps
801065ea:	e9 f8 f7 ff ff       	jmp    80105de7 <alltraps>

801065ef <vector88>:
.globl vector88
vector88:
  pushl $0
801065ef:	6a 00                	push   $0x0
  pushl $88
801065f1:	6a 58                	push   $0x58
  jmp alltraps
801065f3:	e9 ef f7 ff ff       	jmp    80105de7 <alltraps>

801065f8 <vector89>:
.globl vector89
vector89:
  pushl $0
801065f8:	6a 00                	push   $0x0
  pushl $89
801065fa:	6a 59                	push   $0x59
  jmp alltraps
801065fc:	e9 e6 f7 ff ff       	jmp    80105de7 <alltraps>

80106601 <vector90>:
.globl vector90
vector90:
  pushl $0
80106601:	6a 00                	push   $0x0
  pushl $90
80106603:	6a 5a                	push   $0x5a
  jmp alltraps
80106605:	e9 dd f7 ff ff       	jmp    80105de7 <alltraps>

8010660a <vector91>:
.globl vector91
vector91:
  pushl $0
8010660a:	6a 00                	push   $0x0
  pushl $91
8010660c:	6a 5b                	push   $0x5b
  jmp alltraps
8010660e:	e9 d4 f7 ff ff       	jmp    80105de7 <alltraps>

80106613 <vector92>:
.globl vector92
vector92:
  pushl $0
80106613:	6a 00                	push   $0x0
  pushl $92
80106615:	6a 5c                	push   $0x5c
  jmp alltraps
80106617:	e9 cb f7 ff ff       	jmp    80105de7 <alltraps>

8010661c <vector93>:
.globl vector93
vector93:
  pushl $0
8010661c:	6a 00                	push   $0x0
  pushl $93
8010661e:	6a 5d                	push   $0x5d
  jmp alltraps
80106620:	e9 c2 f7 ff ff       	jmp    80105de7 <alltraps>

80106625 <vector94>:
.globl vector94
vector94:
  pushl $0
80106625:	6a 00                	push   $0x0
  pushl $94
80106627:	6a 5e                	push   $0x5e
  jmp alltraps
80106629:	e9 b9 f7 ff ff       	jmp    80105de7 <alltraps>

8010662e <vector95>:
.globl vector95
vector95:
  pushl $0
8010662e:	6a 00                	push   $0x0
  pushl $95
80106630:	6a 5f                	push   $0x5f
  jmp alltraps
80106632:	e9 b0 f7 ff ff       	jmp    80105de7 <alltraps>

80106637 <vector96>:
.globl vector96
vector96:
  pushl $0
80106637:	6a 00                	push   $0x0
  pushl $96
80106639:	6a 60                	push   $0x60
  jmp alltraps
8010663b:	e9 a7 f7 ff ff       	jmp    80105de7 <alltraps>

80106640 <vector97>:
.globl vector97
vector97:
  pushl $0
80106640:	6a 00                	push   $0x0
  pushl $97
80106642:	6a 61                	push   $0x61
  jmp alltraps
80106644:	e9 9e f7 ff ff       	jmp    80105de7 <alltraps>

80106649 <vector98>:
.globl vector98
vector98:
  pushl $0
80106649:	6a 00                	push   $0x0
  pushl $98
8010664b:	6a 62                	push   $0x62
  jmp alltraps
8010664d:	e9 95 f7 ff ff       	jmp    80105de7 <alltraps>

80106652 <vector99>:
.globl vector99
vector99:
  pushl $0
80106652:	6a 00                	push   $0x0
  pushl $99
80106654:	6a 63                	push   $0x63
  jmp alltraps
80106656:	e9 8c f7 ff ff       	jmp    80105de7 <alltraps>

8010665b <vector100>:
.globl vector100
vector100:
  pushl $0
8010665b:	6a 00                	push   $0x0
  pushl $100
8010665d:	6a 64                	push   $0x64
  jmp alltraps
8010665f:	e9 83 f7 ff ff       	jmp    80105de7 <alltraps>

80106664 <vector101>:
.globl vector101
vector101:
  pushl $0
80106664:	6a 00                	push   $0x0
  pushl $101
80106666:	6a 65                	push   $0x65
  jmp alltraps
80106668:	e9 7a f7 ff ff       	jmp    80105de7 <alltraps>

8010666d <vector102>:
.globl vector102
vector102:
  pushl $0
8010666d:	6a 00                	push   $0x0
  pushl $102
8010666f:	6a 66                	push   $0x66
  jmp alltraps
80106671:	e9 71 f7 ff ff       	jmp    80105de7 <alltraps>

80106676 <vector103>:
.globl vector103
vector103:
  pushl $0
80106676:	6a 00                	push   $0x0
  pushl $103
80106678:	6a 67                	push   $0x67
  jmp alltraps
8010667a:	e9 68 f7 ff ff       	jmp    80105de7 <alltraps>

8010667f <vector104>:
.globl vector104
vector104:
  pushl $0
8010667f:	6a 00                	push   $0x0
  pushl $104
80106681:	6a 68                	push   $0x68
  jmp alltraps
80106683:	e9 5f f7 ff ff       	jmp    80105de7 <alltraps>

80106688 <vector105>:
.globl vector105
vector105:
  pushl $0
80106688:	6a 00                	push   $0x0
  pushl $105
8010668a:	6a 69                	push   $0x69
  jmp alltraps
8010668c:	e9 56 f7 ff ff       	jmp    80105de7 <alltraps>

80106691 <vector106>:
.globl vector106
vector106:
  pushl $0
80106691:	6a 00                	push   $0x0
  pushl $106
80106693:	6a 6a                	push   $0x6a
  jmp alltraps
80106695:	e9 4d f7 ff ff       	jmp    80105de7 <alltraps>

8010669a <vector107>:
.globl vector107
vector107:
  pushl $0
8010669a:	6a 00                	push   $0x0
  pushl $107
8010669c:	6a 6b                	push   $0x6b
  jmp alltraps
8010669e:	e9 44 f7 ff ff       	jmp    80105de7 <alltraps>

801066a3 <vector108>:
.globl vector108
vector108:
  pushl $0
801066a3:	6a 00                	push   $0x0
  pushl $108
801066a5:	6a 6c                	push   $0x6c
  jmp alltraps
801066a7:	e9 3b f7 ff ff       	jmp    80105de7 <alltraps>

801066ac <vector109>:
.globl vector109
vector109:
  pushl $0
801066ac:	6a 00                	push   $0x0
  pushl $109
801066ae:	6a 6d                	push   $0x6d
  jmp alltraps
801066b0:	e9 32 f7 ff ff       	jmp    80105de7 <alltraps>

801066b5 <vector110>:
.globl vector110
vector110:
  pushl $0
801066b5:	6a 00                	push   $0x0
  pushl $110
801066b7:	6a 6e                	push   $0x6e
  jmp alltraps
801066b9:	e9 29 f7 ff ff       	jmp    80105de7 <alltraps>

801066be <vector111>:
.globl vector111
vector111:
  pushl $0
801066be:	6a 00                	push   $0x0
  pushl $111
801066c0:	6a 6f                	push   $0x6f
  jmp alltraps
801066c2:	e9 20 f7 ff ff       	jmp    80105de7 <alltraps>

801066c7 <vector112>:
.globl vector112
vector112:
  pushl $0
801066c7:	6a 00                	push   $0x0
  pushl $112
801066c9:	6a 70                	push   $0x70
  jmp alltraps
801066cb:	e9 17 f7 ff ff       	jmp    80105de7 <alltraps>

801066d0 <vector113>:
.globl vector113
vector113:
  pushl $0
801066d0:	6a 00                	push   $0x0
  pushl $113
801066d2:	6a 71                	push   $0x71
  jmp alltraps
801066d4:	e9 0e f7 ff ff       	jmp    80105de7 <alltraps>

801066d9 <vector114>:
.globl vector114
vector114:
  pushl $0
801066d9:	6a 00                	push   $0x0
  pushl $114
801066db:	6a 72                	push   $0x72
  jmp alltraps
801066dd:	e9 05 f7 ff ff       	jmp    80105de7 <alltraps>

801066e2 <vector115>:
.globl vector115
vector115:
  pushl $0
801066e2:	6a 00                	push   $0x0
  pushl $115
801066e4:	6a 73                	push   $0x73
  jmp alltraps
801066e6:	e9 fc f6 ff ff       	jmp    80105de7 <alltraps>

801066eb <vector116>:
.globl vector116
vector116:
  pushl $0
801066eb:	6a 00                	push   $0x0
  pushl $116
801066ed:	6a 74                	push   $0x74
  jmp alltraps
801066ef:	e9 f3 f6 ff ff       	jmp    80105de7 <alltraps>

801066f4 <vector117>:
.globl vector117
vector117:
  pushl $0
801066f4:	6a 00                	push   $0x0
  pushl $117
801066f6:	6a 75                	push   $0x75
  jmp alltraps
801066f8:	e9 ea f6 ff ff       	jmp    80105de7 <alltraps>

801066fd <vector118>:
.globl vector118
vector118:
  pushl $0
801066fd:	6a 00                	push   $0x0
  pushl $118
801066ff:	6a 76                	push   $0x76
  jmp alltraps
80106701:	e9 e1 f6 ff ff       	jmp    80105de7 <alltraps>

80106706 <vector119>:
.globl vector119
vector119:
  pushl $0
80106706:	6a 00                	push   $0x0
  pushl $119
80106708:	6a 77                	push   $0x77
  jmp alltraps
8010670a:	e9 d8 f6 ff ff       	jmp    80105de7 <alltraps>

8010670f <vector120>:
.globl vector120
vector120:
  pushl $0
8010670f:	6a 00                	push   $0x0
  pushl $120
80106711:	6a 78                	push   $0x78
  jmp alltraps
80106713:	e9 cf f6 ff ff       	jmp    80105de7 <alltraps>

80106718 <vector121>:
.globl vector121
vector121:
  pushl $0
80106718:	6a 00                	push   $0x0
  pushl $121
8010671a:	6a 79                	push   $0x79
  jmp alltraps
8010671c:	e9 c6 f6 ff ff       	jmp    80105de7 <alltraps>

80106721 <vector122>:
.globl vector122
vector122:
  pushl $0
80106721:	6a 00                	push   $0x0
  pushl $122
80106723:	6a 7a                	push   $0x7a
  jmp alltraps
80106725:	e9 bd f6 ff ff       	jmp    80105de7 <alltraps>

8010672a <vector123>:
.globl vector123
vector123:
  pushl $0
8010672a:	6a 00                	push   $0x0
  pushl $123
8010672c:	6a 7b                	push   $0x7b
  jmp alltraps
8010672e:	e9 b4 f6 ff ff       	jmp    80105de7 <alltraps>

80106733 <vector124>:
.globl vector124
vector124:
  pushl $0
80106733:	6a 00                	push   $0x0
  pushl $124
80106735:	6a 7c                	push   $0x7c
  jmp alltraps
80106737:	e9 ab f6 ff ff       	jmp    80105de7 <alltraps>

8010673c <vector125>:
.globl vector125
vector125:
  pushl $0
8010673c:	6a 00                	push   $0x0
  pushl $125
8010673e:	6a 7d                	push   $0x7d
  jmp alltraps
80106740:	e9 a2 f6 ff ff       	jmp    80105de7 <alltraps>

80106745 <vector126>:
.globl vector126
vector126:
  pushl $0
80106745:	6a 00                	push   $0x0
  pushl $126
80106747:	6a 7e                	push   $0x7e
  jmp alltraps
80106749:	e9 99 f6 ff ff       	jmp    80105de7 <alltraps>

8010674e <vector127>:
.globl vector127
vector127:
  pushl $0
8010674e:	6a 00                	push   $0x0
  pushl $127
80106750:	6a 7f                	push   $0x7f
  jmp alltraps
80106752:	e9 90 f6 ff ff       	jmp    80105de7 <alltraps>

80106757 <vector128>:
.globl vector128
vector128:
  pushl $0
80106757:	6a 00                	push   $0x0
  pushl $128
80106759:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010675e:	e9 84 f6 ff ff       	jmp    80105de7 <alltraps>

80106763 <vector129>:
.globl vector129
vector129:
  pushl $0
80106763:	6a 00                	push   $0x0
  pushl $129
80106765:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010676a:	e9 78 f6 ff ff       	jmp    80105de7 <alltraps>

8010676f <vector130>:
.globl vector130
vector130:
  pushl $0
8010676f:	6a 00                	push   $0x0
  pushl $130
80106771:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106776:	e9 6c f6 ff ff       	jmp    80105de7 <alltraps>

8010677b <vector131>:
.globl vector131
vector131:
  pushl $0
8010677b:	6a 00                	push   $0x0
  pushl $131
8010677d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106782:	e9 60 f6 ff ff       	jmp    80105de7 <alltraps>

80106787 <vector132>:
.globl vector132
vector132:
  pushl $0
80106787:	6a 00                	push   $0x0
  pushl $132
80106789:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010678e:	e9 54 f6 ff ff       	jmp    80105de7 <alltraps>

80106793 <vector133>:
.globl vector133
vector133:
  pushl $0
80106793:	6a 00                	push   $0x0
  pushl $133
80106795:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010679a:	e9 48 f6 ff ff       	jmp    80105de7 <alltraps>

8010679f <vector134>:
.globl vector134
vector134:
  pushl $0
8010679f:	6a 00                	push   $0x0
  pushl $134
801067a1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801067a6:	e9 3c f6 ff ff       	jmp    80105de7 <alltraps>

801067ab <vector135>:
.globl vector135
vector135:
  pushl $0
801067ab:	6a 00                	push   $0x0
  pushl $135
801067ad:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801067b2:	e9 30 f6 ff ff       	jmp    80105de7 <alltraps>

801067b7 <vector136>:
.globl vector136
vector136:
  pushl $0
801067b7:	6a 00                	push   $0x0
  pushl $136
801067b9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801067be:	e9 24 f6 ff ff       	jmp    80105de7 <alltraps>

801067c3 <vector137>:
.globl vector137
vector137:
  pushl $0
801067c3:	6a 00                	push   $0x0
  pushl $137
801067c5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801067ca:	e9 18 f6 ff ff       	jmp    80105de7 <alltraps>

801067cf <vector138>:
.globl vector138
vector138:
  pushl $0
801067cf:	6a 00                	push   $0x0
  pushl $138
801067d1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801067d6:	e9 0c f6 ff ff       	jmp    80105de7 <alltraps>

801067db <vector139>:
.globl vector139
vector139:
  pushl $0
801067db:	6a 00                	push   $0x0
  pushl $139
801067dd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801067e2:	e9 00 f6 ff ff       	jmp    80105de7 <alltraps>

801067e7 <vector140>:
.globl vector140
vector140:
  pushl $0
801067e7:	6a 00                	push   $0x0
  pushl $140
801067e9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801067ee:	e9 f4 f5 ff ff       	jmp    80105de7 <alltraps>

801067f3 <vector141>:
.globl vector141
vector141:
  pushl $0
801067f3:	6a 00                	push   $0x0
  pushl $141
801067f5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801067fa:	e9 e8 f5 ff ff       	jmp    80105de7 <alltraps>

801067ff <vector142>:
.globl vector142
vector142:
  pushl $0
801067ff:	6a 00                	push   $0x0
  pushl $142
80106801:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106806:	e9 dc f5 ff ff       	jmp    80105de7 <alltraps>

8010680b <vector143>:
.globl vector143
vector143:
  pushl $0
8010680b:	6a 00                	push   $0x0
  pushl $143
8010680d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106812:	e9 d0 f5 ff ff       	jmp    80105de7 <alltraps>

80106817 <vector144>:
.globl vector144
vector144:
  pushl $0
80106817:	6a 00                	push   $0x0
  pushl $144
80106819:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010681e:	e9 c4 f5 ff ff       	jmp    80105de7 <alltraps>

80106823 <vector145>:
.globl vector145
vector145:
  pushl $0
80106823:	6a 00                	push   $0x0
  pushl $145
80106825:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010682a:	e9 b8 f5 ff ff       	jmp    80105de7 <alltraps>

8010682f <vector146>:
.globl vector146
vector146:
  pushl $0
8010682f:	6a 00                	push   $0x0
  pushl $146
80106831:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106836:	e9 ac f5 ff ff       	jmp    80105de7 <alltraps>

8010683b <vector147>:
.globl vector147
vector147:
  pushl $0
8010683b:	6a 00                	push   $0x0
  pushl $147
8010683d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106842:	e9 a0 f5 ff ff       	jmp    80105de7 <alltraps>

80106847 <vector148>:
.globl vector148
vector148:
  pushl $0
80106847:	6a 00                	push   $0x0
  pushl $148
80106849:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010684e:	e9 94 f5 ff ff       	jmp    80105de7 <alltraps>

80106853 <vector149>:
.globl vector149
vector149:
  pushl $0
80106853:	6a 00                	push   $0x0
  pushl $149
80106855:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010685a:	e9 88 f5 ff ff       	jmp    80105de7 <alltraps>

8010685f <vector150>:
.globl vector150
vector150:
  pushl $0
8010685f:	6a 00                	push   $0x0
  pushl $150
80106861:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106866:	e9 7c f5 ff ff       	jmp    80105de7 <alltraps>

8010686b <vector151>:
.globl vector151
vector151:
  pushl $0
8010686b:	6a 00                	push   $0x0
  pushl $151
8010686d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106872:	e9 70 f5 ff ff       	jmp    80105de7 <alltraps>

80106877 <vector152>:
.globl vector152
vector152:
  pushl $0
80106877:	6a 00                	push   $0x0
  pushl $152
80106879:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010687e:	e9 64 f5 ff ff       	jmp    80105de7 <alltraps>

80106883 <vector153>:
.globl vector153
vector153:
  pushl $0
80106883:	6a 00                	push   $0x0
  pushl $153
80106885:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010688a:	e9 58 f5 ff ff       	jmp    80105de7 <alltraps>

8010688f <vector154>:
.globl vector154
vector154:
  pushl $0
8010688f:	6a 00                	push   $0x0
  pushl $154
80106891:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106896:	e9 4c f5 ff ff       	jmp    80105de7 <alltraps>

8010689b <vector155>:
.globl vector155
vector155:
  pushl $0
8010689b:	6a 00                	push   $0x0
  pushl $155
8010689d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801068a2:	e9 40 f5 ff ff       	jmp    80105de7 <alltraps>

801068a7 <vector156>:
.globl vector156
vector156:
  pushl $0
801068a7:	6a 00                	push   $0x0
  pushl $156
801068a9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801068ae:	e9 34 f5 ff ff       	jmp    80105de7 <alltraps>

801068b3 <vector157>:
.globl vector157
vector157:
  pushl $0
801068b3:	6a 00                	push   $0x0
  pushl $157
801068b5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801068ba:	e9 28 f5 ff ff       	jmp    80105de7 <alltraps>

801068bf <vector158>:
.globl vector158
vector158:
  pushl $0
801068bf:	6a 00                	push   $0x0
  pushl $158
801068c1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801068c6:	e9 1c f5 ff ff       	jmp    80105de7 <alltraps>

801068cb <vector159>:
.globl vector159
vector159:
  pushl $0
801068cb:	6a 00                	push   $0x0
  pushl $159
801068cd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801068d2:	e9 10 f5 ff ff       	jmp    80105de7 <alltraps>

801068d7 <vector160>:
.globl vector160
vector160:
  pushl $0
801068d7:	6a 00                	push   $0x0
  pushl $160
801068d9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801068de:	e9 04 f5 ff ff       	jmp    80105de7 <alltraps>

801068e3 <vector161>:
.globl vector161
vector161:
  pushl $0
801068e3:	6a 00                	push   $0x0
  pushl $161
801068e5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801068ea:	e9 f8 f4 ff ff       	jmp    80105de7 <alltraps>

801068ef <vector162>:
.globl vector162
vector162:
  pushl $0
801068ef:	6a 00                	push   $0x0
  pushl $162
801068f1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801068f6:	e9 ec f4 ff ff       	jmp    80105de7 <alltraps>

801068fb <vector163>:
.globl vector163
vector163:
  pushl $0
801068fb:	6a 00                	push   $0x0
  pushl $163
801068fd:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106902:	e9 e0 f4 ff ff       	jmp    80105de7 <alltraps>

80106907 <vector164>:
.globl vector164
vector164:
  pushl $0
80106907:	6a 00                	push   $0x0
  pushl $164
80106909:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010690e:	e9 d4 f4 ff ff       	jmp    80105de7 <alltraps>

80106913 <vector165>:
.globl vector165
vector165:
  pushl $0
80106913:	6a 00                	push   $0x0
  pushl $165
80106915:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010691a:	e9 c8 f4 ff ff       	jmp    80105de7 <alltraps>

8010691f <vector166>:
.globl vector166
vector166:
  pushl $0
8010691f:	6a 00                	push   $0x0
  pushl $166
80106921:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106926:	e9 bc f4 ff ff       	jmp    80105de7 <alltraps>

8010692b <vector167>:
.globl vector167
vector167:
  pushl $0
8010692b:	6a 00                	push   $0x0
  pushl $167
8010692d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106932:	e9 b0 f4 ff ff       	jmp    80105de7 <alltraps>

80106937 <vector168>:
.globl vector168
vector168:
  pushl $0
80106937:	6a 00                	push   $0x0
  pushl $168
80106939:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010693e:	e9 a4 f4 ff ff       	jmp    80105de7 <alltraps>

80106943 <vector169>:
.globl vector169
vector169:
  pushl $0
80106943:	6a 00                	push   $0x0
  pushl $169
80106945:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010694a:	e9 98 f4 ff ff       	jmp    80105de7 <alltraps>

8010694f <vector170>:
.globl vector170
vector170:
  pushl $0
8010694f:	6a 00                	push   $0x0
  pushl $170
80106951:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106956:	e9 8c f4 ff ff       	jmp    80105de7 <alltraps>

8010695b <vector171>:
.globl vector171
vector171:
  pushl $0
8010695b:	6a 00                	push   $0x0
  pushl $171
8010695d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106962:	e9 80 f4 ff ff       	jmp    80105de7 <alltraps>

80106967 <vector172>:
.globl vector172
vector172:
  pushl $0
80106967:	6a 00                	push   $0x0
  pushl $172
80106969:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010696e:	e9 74 f4 ff ff       	jmp    80105de7 <alltraps>

80106973 <vector173>:
.globl vector173
vector173:
  pushl $0
80106973:	6a 00                	push   $0x0
  pushl $173
80106975:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010697a:	e9 68 f4 ff ff       	jmp    80105de7 <alltraps>

8010697f <vector174>:
.globl vector174
vector174:
  pushl $0
8010697f:	6a 00                	push   $0x0
  pushl $174
80106981:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106986:	e9 5c f4 ff ff       	jmp    80105de7 <alltraps>

8010698b <vector175>:
.globl vector175
vector175:
  pushl $0
8010698b:	6a 00                	push   $0x0
  pushl $175
8010698d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106992:	e9 50 f4 ff ff       	jmp    80105de7 <alltraps>

80106997 <vector176>:
.globl vector176
vector176:
  pushl $0
80106997:	6a 00                	push   $0x0
  pushl $176
80106999:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010699e:	e9 44 f4 ff ff       	jmp    80105de7 <alltraps>

801069a3 <vector177>:
.globl vector177
vector177:
  pushl $0
801069a3:	6a 00                	push   $0x0
  pushl $177
801069a5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801069aa:	e9 38 f4 ff ff       	jmp    80105de7 <alltraps>

801069af <vector178>:
.globl vector178
vector178:
  pushl $0
801069af:	6a 00                	push   $0x0
  pushl $178
801069b1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801069b6:	e9 2c f4 ff ff       	jmp    80105de7 <alltraps>

801069bb <vector179>:
.globl vector179
vector179:
  pushl $0
801069bb:	6a 00                	push   $0x0
  pushl $179
801069bd:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801069c2:	e9 20 f4 ff ff       	jmp    80105de7 <alltraps>

801069c7 <vector180>:
.globl vector180
vector180:
  pushl $0
801069c7:	6a 00                	push   $0x0
  pushl $180
801069c9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801069ce:	e9 14 f4 ff ff       	jmp    80105de7 <alltraps>

801069d3 <vector181>:
.globl vector181
vector181:
  pushl $0
801069d3:	6a 00                	push   $0x0
  pushl $181
801069d5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801069da:	e9 08 f4 ff ff       	jmp    80105de7 <alltraps>

801069df <vector182>:
.globl vector182
vector182:
  pushl $0
801069df:	6a 00                	push   $0x0
  pushl $182
801069e1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801069e6:	e9 fc f3 ff ff       	jmp    80105de7 <alltraps>

801069eb <vector183>:
.globl vector183
vector183:
  pushl $0
801069eb:	6a 00                	push   $0x0
  pushl $183
801069ed:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801069f2:	e9 f0 f3 ff ff       	jmp    80105de7 <alltraps>

801069f7 <vector184>:
.globl vector184
vector184:
  pushl $0
801069f7:	6a 00                	push   $0x0
  pushl $184
801069f9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801069fe:	e9 e4 f3 ff ff       	jmp    80105de7 <alltraps>

80106a03 <vector185>:
.globl vector185
vector185:
  pushl $0
80106a03:	6a 00                	push   $0x0
  pushl $185
80106a05:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
80106a0a:	e9 d8 f3 ff ff       	jmp    80105de7 <alltraps>

80106a0f <vector186>:
.globl vector186
vector186:
  pushl $0
80106a0f:	6a 00                	push   $0x0
  pushl $186
80106a11:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106a16:	e9 cc f3 ff ff       	jmp    80105de7 <alltraps>

80106a1b <vector187>:
.globl vector187
vector187:
  pushl $0
80106a1b:	6a 00                	push   $0x0
  pushl $187
80106a1d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106a22:	e9 c0 f3 ff ff       	jmp    80105de7 <alltraps>

80106a27 <vector188>:
.globl vector188
vector188:
  pushl $0
80106a27:	6a 00                	push   $0x0
  pushl $188
80106a29:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
80106a2e:	e9 b4 f3 ff ff       	jmp    80105de7 <alltraps>

80106a33 <vector189>:
.globl vector189
vector189:
  pushl $0
80106a33:	6a 00                	push   $0x0
  pushl $189
80106a35:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80106a3a:	e9 a8 f3 ff ff       	jmp    80105de7 <alltraps>

80106a3f <vector190>:
.globl vector190
vector190:
  pushl $0
80106a3f:	6a 00                	push   $0x0
  pushl $190
80106a41:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106a46:	e9 9c f3 ff ff       	jmp    80105de7 <alltraps>

80106a4b <vector191>:
.globl vector191
vector191:
  pushl $0
80106a4b:	6a 00                	push   $0x0
  pushl $191
80106a4d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106a52:	e9 90 f3 ff ff       	jmp    80105de7 <alltraps>

80106a57 <vector192>:
.globl vector192
vector192:
  pushl $0
80106a57:	6a 00                	push   $0x0
  pushl $192
80106a59:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80106a5e:	e9 84 f3 ff ff       	jmp    80105de7 <alltraps>

80106a63 <vector193>:
.globl vector193
vector193:
  pushl $0
80106a63:	6a 00                	push   $0x0
  pushl $193
80106a65:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80106a6a:	e9 78 f3 ff ff       	jmp    80105de7 <alltraps>

80106a6f <vector194>:
.globl vector194
vector194:
  pushl $0
80106a6f:	6a 00                	push   $0x0
  pushl $194
80106a71:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106a76:	e9 6c f3 ff ff       	jmp    80105de7 <alltraps>

80106a7b <vector195>:
.globl vector195
vector195:
  pushl $0
80106a7b:	6a 00                	push   $0x0
  pushl $195
80106a7d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106a82:	e9 60 f3 ff ff       	jmp    80105de7 <alltraps>

80106a87 <vector196>:
.globl vector196
vector196:
  pushl $0
80106a87:	6a 00                	push   $0x0
  pushl $196
80106a89:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80106a8e:	e9 54 f3 ff ff       	jmp    80105de7 <alltraps>

80106a93 <vector197>:
.globl vector197
vector197:
  pushl $0
80106a93:	6a 00                	push   $0x0
  pushl $197
80106a95:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80106a9a:	e9 48 f3 ff ff       	jmp    80105de7 <alltraps>

80106a9f <vector198>:
.globl vector198
vector198:
  pushl $0
80106a9f:	6a 00                	push   $0x0
  pushl $198
80106aa1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106aa6:	e9 3c f3 ff ff       	jmp    80105de7 <alltraps>

80106aab <vector199>:
.globl vector199
vector199:
  pushl $0
80106aab:	6a 00                	push   $0x0
  pushl $199
80106aad:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106ab2:	e9 30 f3 ff ff       	jmp    80105de7 <alltraps>

80106ab7 <vector200>:
.globl vector200
vector200:
  pushl $0
80106ab7:	6a 00                	push   $0x0
  pushl $200
80106ab9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80106abe:	e9 24 f3 ff ff       	jmp    80105de7 <alltraps>

80106ac3 <vector201>:
.globl vector201
vector201:
  pushl $0
80106ac3:	6a 00                	push   $0x0
  pushl $201
80106ac5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106aca:	e9 18 f3 ff ff       	jmp    80105de7 <alltraps>

80106acf <vector202>:
.globl vector202
vector202:
  pushl $0
80106acf:	6a 00                	push   $0x0
  pushl $202
80106ad1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106ad6:	e9 0c f3 ff ff       	jmp    80105de7 <alltraps>

80106adb <vector203>:
.globl vector203
vector203:
  pushl $0
80106adb:	6a 00                	push   $0x0
  pushl $203
80106add:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106ae2:	e9 00 f3 ff ff       	jmp    80105de7 <alltraps>

80106ae7 <vector204>:
.globl vector204
vector204:
  pushl $0
80106ae7:	6a 00                	push   $0x0
  pushl $204
80106ae9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80106aee:	e9 f4 f2 ff ff       	jmp    80105de7 <alltraps>

80106af3 <vector205>:
.globl vector205
vector205:
  pushl $0
80106af3:	6a 00                	push   $0x0
  pushl $205
80106af5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
80106afa:	e9 e8 f2 ff ff       	jmp    80105de7 <alltraps>

80106aff <vector206>:
.globl vector206
vector206:
  pushl $0
80106aff:	6a 00                	push   $0x0
  pushl $206
80106b01:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106b06:	e9 dc f2 ff ff       	jmp    80105de7 <alltraps>

80106b0b <vector207>:
.globl vector207
vector207:
  pushl $0
80106b0b:	6a 00                	push   $0x0
  pushl $207
80106b0d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106b12:	e9 d0 f2 ff ff       	jmp    80105de7 <alltraps>

80106b17 <vector208>:
.globl vector208
vector208:
  pushl $0
80106b17:	6a 00                	push   $0x0
  pushl $208
80106b19:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106b1e:	e9 c4 f2 ff ff       	jmp    80105de7 <alltraps>

80106b23 <vector209>:
.globl vector209
vector209:
  pushl $0
80106b23:	6a 00                	push   $0x0
  pushl $209
80106b25:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106b2a:	e9 b8 f2 ff ff       	jmp    80105de7 <alltraps>

80106b2f <vector210>:
.globl vector210
vector210:
  pushl $0
80106b2f:	6a 00                	push   $0x0
  pushl $210
80106b31:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106b36:	e9 ac f2 ff ff       	jmp    80105de7 <alltraps>

80106b3b <vector211>:
.globl vector211
vector211:
  pushl $0
80106b3b:	6a 00                	push   $0x0
  pushl $211
80106b3d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106b42:	e9 a0 f2 ff ff       	jmp    80105de7 <alltraps>

80106b47 <vector212>:
.globl vector212
vector212:
  pushl $0
80106b47:	6a 00                	push   $0x0
  pushl $212
80106b49:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106b4e:	e9 94 f2 ff ff       	jmp    80105de7 <alltraps>

80106b53 <vector213>:
.globl vector213
vector213:
  pushl $0
80106b53:	6a 00                	push   $0x0
  pushl $213
80106b55:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106b5a:	e9 88 f2 ff ff       	jmp    80105de7 <alltraps>

80106b5f <vector214>:
.globl vector214
vector214:
  pushl $0
80106b5f:	6a 00                	push   $0x0
  pushl $214
80106b61:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106b66:	e9 7c f2 ff ff       	jmp    80105de7 <alltraps>

80106b6b <vector215>:
.globl vector215
vector215:
  pushl $0
80106b6b:	6a 00                	push   $0x0
  pushl $215
80106b6d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106b72:	e9 70 f2 ff ff       	jmp    80105de7 <alltraps>

80106b77 <vector216>:
.globl vector216
vector216:
  pushl $0
80106b77:	6a 00                	push   $0x0
  pushl $216
80106b79:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106b7e:	e9 64 f2 ff ff       	jmp    80105de7 <alltraps>

80106b83 <vector217>:
.globl vector217
vector217:
  pushl $0
80106b83:	6a 00                	push   $0x0
  pushl $217
80106b85:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106b8a:	e9 58 f2 ff ff       	jmp    80105de7 <alltraps>

80106b8f <vector218>:
.globl vector218
vector218:
  pushl $0
80106b8f:	6a 00                	push   $0x0
  pushl $218
80106b91:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106b96:	e9 4c f2 ff ff       	jmp    80105de7 <alltraps>

80106b9b <vector219>:
.globl vector219
vector219:
  pushl $0
80106b9b:	6a 00                	push   $0x0
  pushl $219
80106b9d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106ba2:	e9 40 f2 ff ff       	jmp    80105de7 <alltraps>

80106ba7 <vector220>:
.globl vector220
vector220:
  pushl $0
80106ba7:	6a 00                	push   $0x0
  pushl $220
80106ba9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106bae:	e9 34 f2 ff ff       	jmp    80105de7 <alltraps>

80106bb3 <vector221>:
.globl vector221
vector221:
  pushl $0
80106bb3:	6a 00                	push   $0x0
  pushl $221
80106bb5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106bba:	e9 28 f2 ff ff       	jmp    80105de7 <alltraps>

80106bbf <vector222>:
.globl vector222
vector222:
  pushl $0
80106bbf:	6a 00                	push   $0x0
  pushl $222
80106bc1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106bc6:	e9 1c f2 ff ff       	jmp    80105de7 <alltraps>

80106bcb <vector223>:
.globl vector223
vector223:
  pushl $0
80106bcb:	6a 00                	push   $0x0
  pushl $223
80106bcd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106bd2:	e9 10 f2 ff ff       	jmp    80105de7 <alltraps>

80106bd7 <vector224>:
.globl vector224
vector224:
  pushl $0
80106bd7:	6a 00                	push   $0x0
  pushl $224
80106bd9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106bde:	e9 04 f2 ff ff       	jmp    80105de7 <alltraps>

80106be3 <vector225>:
.globl vector225
vector225:
  pushl $0
80106be3:	6a 00                	push   $0x0
  pushl $225
80106be5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106bea:	e9 f8 f1 ff ff       	jmp    80105de7 <alltraps>

80106bef <vector226>:
.globl vector226
vector226:
  pushl $0
80106bef:	6a 00                	push   $0x0
  pushl $226
80106bf1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106bf6:	e9 ec f1 ff ff       	jmp    80105de7 <alltraps>

80106bfb <vector227>:
.globl vector227
vector227:
  pushl $0
80106bfb:	6a 00                	push   $0x0
  pushl $227
80106bfd:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106c02:	e9 e0 f1 ff ff       	jmp    80105de7 <alltraps>

80106c07 <vector228>:
.globl vector228
vector228:
  pushl $0
80106c07:	6a 00                	push   $0x0
  pushl $228
80106c09:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106c0e:	e9 d4 f1 ff ff       	jmp    80105de7 <alltraps>

80106c13 <vector229>:
.globl vector229
vector229:
  pushl $0
80106c13:	6a 00                	push   $0x0
  pushl $229
80106c15:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106c1a:	e9 c8 f1 ff ff       	jmp    80105de7 <alltraps>

80106c1f <vector230>:
.globl vector230
vector230:
  pushl $0
80106c1f:	6a 00                	push   $0x0
  pushl $230
80106c21:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106c26:	e9 bc f1 ff ff       	jmp    80105de7 <alltraps>

80106c2b <vector231>:
.globl vector231
vector231:
  pushl $0
80106c2b:	6a 00                	push   $0x0
  pushl $231
80106c2d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106c32:	e9 b0 f1 ff ff       	jmp    80105de7 <alltraps>

80106c37 <vector232>:
.globl vector232
vector232:
  pushl $0
80106c37:	6a 00                	push   $0x0
  pushl $232
80106c39:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106c3e:	e9 a4 f1 ff ff       	jmp    80105de7 <alltraps>

80106c43 <vector233>:
.globl vector233
vector233:
  pushl $0
80106c43:	6a 00                	push   $0x0
  pushl $233
80106c45:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106c4a:	e9 98 f1 ff ff       	jmp    80105de7 <alltraps>

80106c4f <vector234>:
.globl vector234
vector234:
  pushl $0
80106c4f:	6a 00                	push   $0x0
  pushl $234
80106c51:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106c56:	e9 8c f1 ff ff       	jmp    80105de7 <alltraps>

80106c5b <vector235>:
.globl vector235
vector235:
  pushl $0
80106c5b:	6a 00                	push   $0x0
  pushl $235
80106c5d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106c62:	e9 80 f1 ff ff       	jmp    80105de7 <alltraps>

80106c67 <vector236>:
.globl vector236
vector236:
  pushl $0
80106c67:	6a 00                	push   $0x0
  pushl $236
80106c69:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106c6e:	e9 74 f1 ff ff       	jmp    80105de7 <alltraps>

80106c73 <vector237>:
.globl vector237
vector237:
  pushl $0
80106c73:	6a 00                	push   $0x0
  pushl $237
80106c75:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106c7a:	e9 68 f1 ff ff       	jmp    80105de7 <alltraps>

80106c7f <vector238>:
.globl vector238
vector238:
  pushl $0
80106c7f:	6a 00                	push   $0x0
  pushl $238
80106c81:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106c86:	e9 5c f1 ff ff       	jmp    80105de7 <alltraps>

80106c8b <vector239>:
.globl vector239
vector239:
  pushl $0
80106c8b:	6a 00                	push   $0x0
  pushl $239
80106c8d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106c92:	e9 50 f1 ff ff       	jmp    80105de7 <alltraps>

80106c97 <vector240>:
.globl vector240
vector240:
  pushl $0
80106c97:	6a 00                	push   $0x0
  pushl $240
80106c99:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106c9e:	e9 44 f1 ff ff       	jmp    80105de7 <alltraps>

80106ca3 <vector241>:
.globl vector241
vector241:
  pushl $0
80106ca3:	6a 00                	push   $0x0
  pushl $241
80106ca5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106caa:	e9 38 f1 ff ff       	jmp    80105de7 <alltraps>

80106caf <vector242>:
.globl vector242
vector242:
  pushl $0
80106caf:	6a 00                	push   $0x0
  pushl $242
80106cb1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106cb6:	e9 2c f1 ff ff       	jmp    80105de7 <alltraps>

80106cbb <vector243>:
.globl vector243
vector243:
  pushl $0
80106cbb:	6a 00                	push   $0x0
  pushl $243
80106cbd:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106cc2:	e9 20 f1 ff ff       	jmp    80105de7 <alltraps>

80106cc7 <vector244>:
.globl vector244
vector244:
  pushl $0
80106cc7:	6a 00                	push   $0x0
  pushl $244
80106cc9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106cce:	e9 14 f1 ff ff       	jmp    80105de7 <alltraps>

80106cd3 <vector245>:
.globl vector245
vector245:
  pushl $0
80106cd3:	6a 00                	push   $0x0
  pushl $245
80106cd5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106cda:	e9 08 f1 ff ff       	jmp    80105de7 <alltraps>

80106cdf <vector246>:
.globl vector246
vector246:
  pushl $0
80106cdf:	6a 00                	push   $0x0
  pushl $246
80106ce1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106ce6:	e9 fc f0 ff ff       	jmp    80105de7 <alltraps>

80106ceb <vector247>:
.globl vector247
vector247:
  pushl $0
80106ceb:	6a 00                	push   $0x0
  pushl $247
80106ced:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106cf2:	e9 f0 f0 ff ff       	jmp    80105de7 <alltraps>

80106cf7 <vector248>:
.globl vector248
vector248:
  pushl $0
80106cf7:	6a 00                	push   $0x0
  pushl $248
80106cf9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106cfe:	e9 e4 f0 ff ff       	jmp    80105de7 <alltraps>

80106d03 <vector249>:
.globl vector249
vector249:
  pushl $0
80106d03:	6a 00                	push   $0x0
  pushl $249
80106d05:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106d0a:	e9 d8 f0 ff ff       	jmp    80105de7 <alltraps>

80106d0f <vector250>:
.globl vector250
vector250:
  pushl $0
80106d0f:	6a 00                	push   $0x0
  pushl $250
80106d11:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106d16:	e9 cc f0 ff ff       	jmp    80105de7 <alltraps>

80106d1b <vector251>:
.globl vector251
vector251:
  pushl $0
80106d1b:	6a 00                	push   $0x0
  pushl $251
80106d1d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106d22:	e9 c0 f0 ff ff       	jmp    80105de7 <alltraps>

80106d27 <vector252>:
.globl vector252
vector252:
  pushl $0
80106d27:	6a 00                	push   $0x0
  pushl $252
80106d29:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106d2e:	e9 b4 f0 ff ff       	jmp    80105de7 <alltraps>

80106d33 <vector253>:
.globl vector253
vector253:
  pushl $0
80106d33:	6a 00                	push   $0x0
  pushl $253
80106d35:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106d3a:	e9 a8 f0 ff ff       	jmp    80105de7 <alltraps>

80106d3f <vector254>:
.globl vector254
vector254:
  pushl $0
80106d3f:	6a 00                	push   $0x0
  pushl $254
80106d41:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106d46:	e9 9c f0 ff ff       	jmp    80105de7 <alltraps>

80106d4b <vector255>:
.globl vector255
vector255:
  pushl $0
80106d4b:	6a 00                	push   $0x0
  pushl $255
80106d4d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106d52:	e9 90 f0 ff ff       	jmp    80105de7 <alltraps>
80106d57:	66 90                	xchg   %ax,%ax
80106d59:	66 90                	xchg   %ax,%ax
80106d5b:	66 90                	xchg   %ax,%ax
80106d5d:	66 90                	xchg   %ax,%ax
80106d5f:	90                   	nop

80106d60 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106d66:	89 d3                	mov    %edx,%ebx
{
80106d68:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
80106d6a:	c1 eb 16             	shr    $0x16,%ebx
80106d6d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106d70:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106d73:	8b 06                	mov    (%esi),%eax
80106d75:	a8 01                	test   $0x1,%al
80106d77:	74 27                	je     80106da0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106d79:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d7e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106d84:	c1 ef 0a             	shr    $0xa,%edi
}
80106d87:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
80106d8a:	89 fa                	mov    %edi,%edx
80106d8c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106d92:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106d95:	5b                   	pop    %ebx
80106d96:	5e                   	pop    %esi
80106d97:	5f                   	pop    %edi
80106d98:	5d                   	pop    %ebp
80106d99:	c3                   	ret    
80106d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106da0:	85 c9                	test   %ecx,%ecx
80106da2:	74 2c                	je     80106dd0 <walkpgdir+0x70>
80106da4:	e8 27 b7 ff ff       	call   801024d0 <kalloc>
80106da9:	85 c0                	test   %eax,%eax
80106dab:	89 c3                	mov    %eax,%ebx
80106dad:	74 21                	je     80106dd0 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
80106daf:	83 ec 04             	sub    $0x4,%esp
80106db2:	68 00 10 00 00       	push   $0x1000
80106db7:	6a 00                	push   $0x0
80106db9:	50                   	push   %eax
80106dba:	e8 e1 dc ff ff       	call   80104aa0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106dbf:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106dc5:	83 c4 10             	add    $0x10,%esp
80106dc8:	83 c8 07             	or     $0x7,%eax
80106dcb:	89 06                	mov    %eax,(%esi)
80106dcd:	eb b5                	jmp    80106d84 <walkpgdir+0x24>
80106dcf:	90                   	nop
}
80106dd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106dd3:	31 c0                	xor    %eax,%eax
}
80106dd5:	5b                   	pop    %ebx
80106dd6:	5e                   	pop    %esi
80106dd7:	5f                   	pop    %edi
80106dd8:	5d                   	pop    %ebp
80106dd9:	c3                   	ret    
80106dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106de0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	57                   	push   %edi
80106de4:	56                   	push   %esi
80106de5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106de6:	89 d3                	mov    %edx,%ebx
80106de8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106dee:	83 ec 1c             	sub    $0x1c,%esp
80106df1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106df4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106df8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106dfb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e00:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106e03:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e06:	29 df                	sub    %ebx,%edi
80106e08:	83 c8 01             	or     $0x1,%eax
80106e0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106e0e:	eb 15                	jmp    80106e25 <mappages+0x45>
    if(*pte & PTE_P)
80106e10:	f6 00 01             	testb  $0x1,(%eax)
80106e13:	75 45                	jne    80106e5a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106e15:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106e18:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106e1b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106e1d:	74 31                	je     80106e50 <mappages+0x70>
      break;
    a += PGSIZE;
80106e1f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106e25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e28:	b9 01 00 00 00       	mov    $0x1,%ecx
80106e2d:	89 da                	mov    %ebx,%edx
80106e2f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106e32:	e8 29 ff ff ff       	call   80106d60 <walkpgdir>
80106e37:	85 c0                	test   %eax,%eax
80106e39:	75 d5                	jne    80106e10 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106e3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106e3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106e43:	5b                   	pop    %ebx
80106e44:	5e                   	pop    %esi
80106e45:	5f                   	pop    %edi
80106e46:	5d                   	pop    %ebp
80106e47:	c3                   	ret    
80106e48:	90                   	nop
80106e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e50:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106e53:	31 c0                	xor    %eax,%eax
}
80106e55:	5b                   	pop    %ebx
80106e56:	5e                   	pop    %esi
80106e57:	5f                   	pop    %edi
80106e58:	5d                   	pop    %ebp
80106e59:	c3                   	ret    
      panic("remap");
80106e5a:	83 ec 0c             	sub    $0xc,%esp
80106e5d:	68 5c 80 10 80       	push   $0x8010805c
80106e62:	e8 29 95 ff ff       	call   80100390 <panic>
80106e67:	89 f6                	mov    %esi,%esi
80106e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e70 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106e76:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106e7c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106e7e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106e84:	83 ec 1c             	sub    $0x1c,%esp
80106e87:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106e8a:	39 d3                	cmp    %edx,%ebx
80106e8c:	73 66                	jae    80106ef4 <deallocuvm.part.0+0x84>
80106e8e:	89 d6                	mov    %edx,%esi
80106e90:	eb 3d                	jmp    80106ecf <deallocuvm.part.0+0x5f>
80106e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106e98:	8b 10                	mov    (%eax),%edx
80106e9a:	f6 c2 01             	test   $0x1,%dl
80106e9d:	74 26                	je     80106ec5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106e9f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106ea5:	74 58                	je     80106eff <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106ea7:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106eaa:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106eb0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106eb3:	52                   	push   %edx
80106eb4:	e8 67 b4 ff ff       	call   80102320 <kfree>
      *pte = 0;
80106eb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ebc:	83 c4 10             	add    $0x10,%esp
80106ebf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106ec5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ecb:	39 f3                	cmp    %esi,%ebx
80106ecd:	73 25                	jae    80106ef4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106ecf:	31 c9                	xor    %ecx,%ecx
80106ed1:	89 da                	mov    %ebx,%edx
80106ed3:	89 f8                	mov    %edi,%eax
80106ed5:	e8 86 fe ff ff       	call   80106d60 <walkpgdir>
    if(!pte)
80106eda:	85 c0                	test   %eax,%eax
80106edc:	75 ba                	jne    80106e98 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106ede:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106ee4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106eea:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ef0:	39 f3                	cmp    %esi,%ebx
80106ef2:	72 db                	jb     80106ecf <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106ef4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ef7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106efa:	5b                   	pop    %ebx
80106efb:	5e                   	pop    %esi
80106efc:	5f                   	pop    %edi
80106efd:	5d                   	pop    %ebp
80106efe:	c3                   	ret    
        panic("kfree");
80106eff:	83 ec 0c             	sub    $0xc,%esp
80106f02:	68 06 79 10 80       	push   $0x80107906
80106f07:	e8 84 94 ff ff       	call   80100390 <panic>
80106f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f10 <seginit>:
{
80106f10:	55                   	push   %ebp
80106f11:	89 e5                	mov    %esp,%ebp
80106f13:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106f16:	e8 e5 c7 ff ff       	call   80103700 <cpuid>
80106f1b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106f21:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106f26:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106f2a:	c7 80 18 38 11 80 ff 	movl   $0xffff,-0x7feec7e8(%eax)
80106f31:	ff 00 00 
80106f34:	c7 80 1c 38 11 80 00 	movl   $0xcf9a00,-0x7feec7e4(%eax)
80106f3b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106f3e:	c7 80 20 38 11 80 ff 	movl   $0xffff,-0x7feec7e0(%eax)
80106f45:	ff 00 00 
80106f48:	c7 80 24 38 11 80 00 	movl   $0xcf9200,-0x7feec7dc(%eax)
80106f4f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106f52:	c7 80 28 38 11 80 ff 	movl   $0xffff,-0x7feec7d8(%eax)
80106f59:	ff 00 00 
80106f5c:	c7 80 2c 38 11 80 00 	movl   $0xcffa00,-0x7feec7d4(%eax)
80106f63:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106f66:	c7 80 30 38 11 80 ff 	movl   $0xffff,-0x7feec7d0(%eax)
80106f6d:	ff 00 00 
80106f70:	c7 80 34 38 11 80 00 	movl   $0xcff200,-0x7feec7cc(%eax)
80106f77:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106f7a:	05 10 38 11 80       	add    $0x80113810,%eax
  pd[1] = (uint)p;
80106f7f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106f83:	c1 e8 10             	shr    $0x10,%eax
80106f86:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106f8a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106f8d:	0f 01 10             	lgdtl  (%eax)
}
80106f90:	c9                   	leave  
80106f91:	c3                   	ret    
80106f92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106fa0:	a1 c4 6c 11 80       	mov    0x80116cc4,%eax
{
80106fa5:	55                   	push   %ebp
80106fa6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106fa8:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106fad:	0f 22 d8             	mov    %eax,%cr3
}
80106fb0:	5d                   	pop    %ebp
80106fb1:	c3                   	ret    
80106fb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fc0 <switchuvm>:
{
80106fc0:	55                   	push   %ebp
80106fc1:	89 e5                	mov    %esp,%ebp
80106fc3:	57                   	push   %edi
80106fc4:	56                   	push   %esi
80106fc5:	53                   	push   %ebx
80106fc6:	83 ec 1c             	sub    $0x1c,%esp
80106fc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106fcc:	85 db                	test   %ebx,%ebx
80106fce:	0f 84 cb 00 00 00    	je     8010709f <switchuvm+0xdf>
  if(p->kstack == 0)
80106fd4:	8b 43 28             	mov    0x28(%ebx),%eax
80106fd7:	85 c0                	test   %eax,%eax
80106fd9:	0f 84 da 00 00 00    	je     801070b9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106fdf:	8b 43 24             	mov    0x24(%ebx),%eax
80106fe2:	85 c0                	test   %eax,%eax
80106fe4:	0f 84 c2 00 00 00    	je     801070ac <switchuvm+0xec>
  pushcli();
80106fea:	e8 d1 d8 ff ff       	call   801048c0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106fef:	e8 8c c6 ff ff       	call   80103680 <mycpu>
80106ff4:	89 c6                	mov    %eax,%esi
80106ff6:	e8 85 c6 ff ff       	call   80103680 <mycpu>
80106ffb:	89 c7                	mov    %eax,%edi
80106ffd:	e8 7e c6 ff ff       	call   80103680 <mycpu>
80107002:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107005:	83 c7 08             	add    $0x8,%edi
80107008:	e8 73 c6 ff ff       	call   80103680 <mycpu>
8010700d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107010:	83 c0 08             	add    $0x8,%eax
80107013:	ba 67 00 00 00       	mov    $0x67,%edx
80107018:	c1 e8 18             	shr    $0x18,%eax
8010701b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80107022:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80107029:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
8010702f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80107034:	83 c1 08             	add    $0x8,%ecx
80107037:	c1 e9 10             	shr    $0x10,%ecx
8010703a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80107040:	b9 99 40 00 00       	mov    $0x4099,%ecx
80107045:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010704c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80107051:	e8 2a c6 ff ff       	call   80103680 <mycpu>
80107056:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010705d:	e8 1e c6 ff ff       	call   80103680 <mycpu>
80107062:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80107066:	8b 73 28             	mov    0x28(%ebx),%esi
80107069:	e8 12 c6 ff ff       	call   80103680 <mycpu>
8010706e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80107074:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80107077:	e8 04 c6 ff ff       	call   80103680 <mycpu>
8010707c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80107080:	b8 28 00 00 00       	mov    $0x28,%eax
80107085:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80107088:	8b 43 24             	mov    0x24(%ebx),%eax
8010708b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80107090:	0f 22 d8             	mov    %eax,%cr3
}
80107093:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107096:	5b                   	pop    %ebx
80107097:	5e                   	pop    %esi
80107098:	5f                   	pop    %edi
80107099:	5d                   	pop    %ebp
  popcli();
8010709a:	e9 61 d8 ff ff       	jmp    80104900 <popcli>
    panic("switchuvm: no process");
8010709f:	83 ec 0c             	sub    $0xc,%esp
801070a2:	68 62 80 10 80       	push   $0x80108062
801070a7:	e8 e4 92 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
801070ac:	83 ec 0c             	sub    $0xc,%esp
801070af:	68 8d 80 10 80       	push   $0x8010808d
801070b4:	e8 d7 92 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
801070b9:	83 ec 0c             	sub    $0xc,%esp
801070bc:	68 78 80 10 80       	push   $0x80108078
801070c1:	e8 ca 92 ff ff       	call   80100390 <panic>
801070c6:	8d 76 00             	lea    0x0(%esi),%esi
801070c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070d0 <inituvm>:
{
801070d0:	55                   	push   %ebp
801070d1:	89 e5                	mov    %esp,%ebp
801070d3:	57                   	push   %edi
801070d4:	56                   	push   %esi
801070d5:	53                   	push   %ebx
801070d6:	83 ec 1c             	sub    $0x1c,%esp
801070d9:	8b 75 10             	mov    0x10(%ebp),%esi
801070dc:	8b 45 08             	mov    0x8(%ebp),%eax
801070df:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
801070e2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
801070e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
801070eb:	77 49                	ja     80107136 <inituvm+0x66>
  mem = kalloc();
801070ed:	e8 de b3 ff ff       	call   801024d0 <kalloc>
  memset(mem, 0, PGSIZE);
801070f2:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
801070f5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801070f7:	68 00 10 00 00       	push   $0x1000
801070fc:	6a 00                	push   $0x0
801070fe:	50                   	push   %eax
801070ff:	e8 9c d9 ff ff       	call   80104aa0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80107104:	58                   	pop    %eax
80107105:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010710b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107110:	5a                   	pop    %edx
80107111:	6a 06                	push   $0x6
80107113:	50                   	push   %eax
80107114:	31 d2                	xor    %edx,%edx
80107116:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107119:	e8 c2 fc ff ff       	call   80106de0 <mappages>
  memmove(mem, init, sz);
8010711e:	89 75 10             	mov    %esi,0x10(%ebp)
80107121:	89 7d 0c             	mov    %edi,0xc(%ebp)
80107124:	83 c4 10             	add    $0x10,%esp
80107127:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010712a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010712d:	5b                   	pop    %ebx
8010712e:	5e                   	pop    %esi
8010712f:	5f                   	pop    %edi
80107130:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80107131:	e9 1a da ff ff       	jmp    80104b50 <memmove>
    panic("inituvm: more than a page");
80107136:	83 ec 0c             	sub    $0xc,%esp
80107139:	68 a1 80 10 80       	push   $0x801080a1
8010713e:	e8 4d 92 ff ff       	call   80100390 <panic>
80107143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107150 <loaduvm>:
{
80107150:	55                   	push   %ebp
80107151:	89 e5                	mov    %esp,%ebp
80107153:	57                   	push   %edi
80107154:	56                   	push   %esi
80107155:	53                   	push   %ebx
80107156:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80107159:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107160:	0f 85 91 00 00 00    	jne    801071f7 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80107166:	8b 75 18             	mov    0x18(%ebp),%esi
80107169:	31 db                	xor    %ebx,%ebx
8010716b:	85 f6                	test   %esi,%esi
8010716d:	75 1a                	jne    80107189 <loaduvm+0x39>
8010716f:	eb 6f                	jmp    801071e0 <loaduvm+0x90>
80107171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107178:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010717e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107184:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107187:	76 57                	jbe    801071e0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107189:	8b 55 0c             	mov    0xc(%ebp),%edx
8010718c:	8b 45 08             	mov    0x8(%ebp),%eax
8010718f:	31 c9                	xor    %ecx,%ecx
80107191:	01 da                	add    %ebx,%edx
80107193:	e8 c8 fb ff ff       	call   80106d60 <walkpgdir>
80107198:	85 c0                	test   %eax,%eax
8010719a:	74 4e                	je     801071ea <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
8010719c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
8010719e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
801071a1:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
801071a6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
801071ab:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801071b1:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
801071b4:	01 d9                	add    %ebx,%ecx
801071b6:	05 00 00 00 80       	add    $0x80000000,%eax
801071bb:	57                   	push   %edi
801071bc:	51                   	push   %ecx
801071bd:	50                   	push   %eax
801071be:	ff 75 10             	pushl  0x10(%ebp)
801071c1:	e8 9a a7 ff ff       	call   80101960 <readi>
801071c6:	83 c4 10             	add    $0x10,%esp
801071c9:	39 f8                	cmp    %edi,%eax
801071cb:	74 ab                	je     80107178 <loaduvm+0x28>
}
801071cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801071d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801071d5:	5b                   	pop    %ebx
801071d6:	5e                   	pop    %esi
801071d7:	5f                   	pop    %edi
801071d8:	5d                   	pop    %ebp
801071d9:	c3                   	ret    
801071da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801071e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801071e3:	31 c0                	xor    %eax,%eax
}
801071e5:	5b                   	pop    %ebx
801071e6:	5e                   	pop    %esi
801071e7:	5f                   	pop    %edi
801071e8:	5d                   	pop    %ebp
801071e9:	c3                   	ret    
      panic("loaduvm: address should exist");
801071ea:	83 ec 0c             	sub    $0xc,%esp
801071ed:	68 bb 80 10 80       	push   $0x801080bb
801071f2:	e8 99 91 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
801071f7:	83 ec 0c             	sub    $0xc,%esp
801071fa:	68 5c 81 10 80       	push   $0x8010815c
801071ff:	e8 8c 91 ff ff       	call   80100390 <panic>
80107204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010720a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107210 <allocuvm>:
{
80107210:	55                   	push   %ebp
80107211:	89 e5                	mov    %esp,%ebp
80107213:	57                   	push   %edi
80107214:	56                   	push   %esi
80107215:	53                   	push   %ebx
80107216:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80107219:	8b 7d 10             	mov    0x10(%ebp),%edi
8010721c:	85 ff                	test   %edi,%edi
8010721e:	0f 88 8e 00 00 00    	js     801072b2 <allocuvm+0xa2>
  if(newsz < oldsz)
80107224:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107227:	0f 82 93 00 00 00    	jb     801072c0 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
8010722d:	8b 45 0c             	mov    0xc(%ebp),%eax
80107230:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80107236:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
8010723c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010723f:	0f 86 7e 00 00 00    	jbe    801072c3 <allocuvm+0xb3>
80107245:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80107248:	8b 7d 08             	mov    0x8(%ebp),%edi
8010724b:	eb 42                	jmp    8010728f <allocuvm+0x7f>
8010724d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80107250:	83 ec 04             	sub    $0x4,%esp
80107253:	68 00 10 00 00       	push   $0x1000
80107258:	6a 00                	push   $0x0
8010725a:	50                   	push   %eax
8010725b:	e8 40 d8 ff ff       	call   80104aa0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107260:	58                   	pop    %eax
80107261:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80107267:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010726c:	5a                   	pop    %edx
8010726d:	6a 06                	push   $0x6
8010726f:	50                   	push   %eax
80107270:	89 da                	mov    %ebx,%edx
80107272:	89 f8                	mov    %edi,%eax
80107274:	e8 67 fb ff ff       	call   80106de0 <mappages>
80107279:	83 c4 10             	add    $0x10,%esp
8010727c:	85 c0                	test   %eax,%eax
8010727e:	78 50                	js     801072d0 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80107280:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107286:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80107289:	0f 86 81 00 00 00    	jbe    80107310 <allocuvm+0x100>
    mem = kalloc();
8010728f:	e8 3c b2 ff ff       	call   801024d0 <kalloc>
    if(mem == 0){
80107294:	85 c0                	test   %eax,%eax
    mem = kalloc();
80107296:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80107298:	75 b6                	jne    80107250 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
8010729a:	83 ec 0c             	sub    $0xc,%esp
8010729d:	68 d9 80 10 80       	push   $0x801080d9
801072a2:	e8 b9 93 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
801072a7:	83 c4 10             	add    $0x10,%esp
801072aa:	8b 45 0c             	mov    0xc(%ebp),%eax
801072ad:	39 45 10             	cmp    %eax,0x10(%ebp)
801072b0:	77 6e                	ja     80107320 <allocuvm+0x110>
}
801072b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
801072b5:	31 ff                	xor    %edi,%edi
}
801072b7:	89 f8                	mov    %edi,%eax
801072b9:	5b                   	pop    %ebx
801072ba:	5e                   	pop    %esi
801072bb:	5f                   	pop    %edi
801072bc:	5d                   	pop    %ebp
801072bd:	c3                   	ret    
801072be:	66 90                	xchg   %ax,%ax
    return oldsz;
801072c0:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
801072c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072c6:	89 f8                	mov    %edi,%eax
801072c8:	5b                   	pop    %ebx
801072c9:	5e                   	pop    %esi
801072ca:	5f                   	pop    %edi
801072cb:	5d                   	pop    %ebp
801072cc:	c3                   	ret    
801072cd:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
801072d0:	83 ec 0c             	sub    $0xc,%esp
801072d3:	68 f1 80 10 80       	push   $0x801080f1
801072d8:	e8 83 93 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
801072dd:	83 c4 10             	add    $0x10,%esp
801072e0:	8b 45 0c             	mov    0xc(%ebp),%eax
801072e3:	39 45 10             	cmp    %eax,0x10(%ebp)
801072e6:	76 0d                	jbe    801072f5 <allocuvm+0xe5>
801072e8:	89 c1                	mov    %eax,%ecx
801072ea:	8b 55 10             	mov    0x10(%ebp),%edx
801072ed:	8b 45 08             	mov    0x8(%ebp),%eax
801072f0:	e8 7b fb ff ff       	call   80106e70 <deallocuvm.part.0>
      kfree(mem);
801072f5:	83 ec 0c             	sub    $0xc,%esp
      return 0;
801072f8:	31 ff                	xor    %edi,%edi
      kfree(mem);
801072fa:	56                   	push   %esi
801072fb:	e8 20 b0 ff ff       	call   80102320 <kfree>
      return 0;
80107300:	83 c4 10             	add    $0x10,%esp
}
80107303:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107306:	89 f8                	mov    %edi,%eax
80107308:	5b                   	pop    %ebx
80107309:	5e                   	pop    %esi
8010730a:	5f                   	pop    %edi
8010730b:	5d                   	pop    %ebp
8010730c:	c3                   	ret    
8010730d:	8d 76 00             	lea    0x0(%esi),%esi
80107310:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80107313:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107316:	5b                   	pop    %ebx
80107317:	89 f8                	mov    %edi,%eax
80107319:	5e                   	pop    %esi
8010731a:	5f                   	pop    %edi
8010731b:	5d                   	pop    %ebp
8010731c:	c3                   	ret    
8010731d:	8d 76 00             	lea    0x0(%esi),%esi
80107320:	89 c1                	mov    %eax,%ecx
80107322:	8b 55 10             	mov    0x10(%ebp),%edx
80107325:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80107328:	31 ff                	xor    %edi,%edi
8010732a:	e8 41 fb ff ff       	call   80106e70 <deallocuvm.part.0>
8010732f:	eb 92                	jmp    801072c3 <allocuvm+0xb3>
80107331:	eb 0d                	jmp    80107340 <deallocuvm>
80107333:	90                   	nop
80107334:	90                   	nop
80107335:	90                   	nop
80107336:	90                   	nop
80107337:	90                   	nop
80107338:	90                   	nop
80107339:	90                   	nop
8010733a:	90                   	nop
8010733b:	90                   	nop
8010733c:	90                   	nop
8010733d:	90                   	nop
8010733e:	90                   	nop
8010733f:	90                   	nop

80107340 <deallocuvm>:
{
80107340:	55                   	push   %ebp
80107341:	89 e5                	mov    %esp,%ebp
80107343:	8b 55 0c             	mov    0xc(%ebp),%edx
80107346:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107349:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010734c:	39 d1                	cmp    %edx,%ecx
8010734e:	73 10                	jae    80107360 <deallocuvm+0x20>
}
80107350:	5d                   	pop    %ebp
80107351:	e9 1a fb ff ff       	jmp    80106e70 <deallocuvm.part.0>
80107356:	8d 76 00             	lea    0x0(%esi),%esi
80107359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107360:	89 d0                	mov    %edx,%eax
80107362:	5d                   	pop    %ebp
80107363:	c3                   	ret    
80107364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010736a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107370 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107370:	55                   	push   %ebp
80107371:	89 e5                	mov    %esp,%ebp
80107373:	57                   	push   %edi
80107374:	56                   	push   %esi
80107375:	53                   	push   %ebx
80107376:	83 ec 0c             	sub    $0xc,%esp
80107379:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010737c:	85 f6                	test   %esi,%esi
8010737e:	74 59                	je     801073d9 <freevm+0x69>
80107380:	31 c9                	xor    %ecx,%ecx
80107382:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107387:	89 f0                	mov    %esi,%eax
80107389:	e8 e2 fa ff ff       	call   80106e70 <deallocuvm.part.0>
8010738e:	89 f3                	mov    %esi,%ebx
80107390:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107396:	eb 0f                	jmp    801073a7 <freevm+0x37>
80107398:	90                   	nop
80107399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801073a0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801073a3:	39 fb                	cmp    %edi,%ebx
801073a5:	74 23                	je     801073ca <freevm+0x5a>
    if(pgdir[i] & PTE_P){
801073a7:	8b 03                	mov    (%ebx),%eax
801073a9:	a8 01                	test   $0x1,%al
801073ab:	74 f3                	je     801073a0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
801073ad:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
801073b2:	83 ec 0c             	sub    $0xc,%esp
801073b5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
801073b8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801073bd:	50                   	push   %eax
801073be:	e8 5d af ff ff       	call   80102320 <kfree>
801073c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
801073c6:	39 fb                	cmp    %edi,%ebx
801073c8:	75 dd                	jne    801073a7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
801073ca:	89 75 08             	mov    %esi,0x8(%ebp)
}
801073cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801073d0:	5b                   	pop    %ebx
801073d1:	5e                   	pop    %esi
801073d2:	5f                   	pop    %edi
801073d3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801073d4:	e9 47 af ff ff       	jmp    80102320 <kfree>
    panic("freevm: no pgdir");
801073d9:	83 ec 0c             	sub    $0xc,%esp
801073dc:	68 0d 81 10 80       	push   $0x8010810d
801073e1:	e8 aa 8f ff ff       	call   80100390 <panic>
801073e6:	8d 76 00             	lea    0x0(%esi),%esi
801073e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801073f0 <setupkvm>:
{
801073f0:	55                   	push   %ebp
801073f1:	89 e5                	mov    %esp,%ebp
801073f3:	56                   	push   %esi
801073f4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
801073f5:	e8 d6 b0 ff ff       	call   801024d0 <kalloc>
801073fa:	85 c0                	test   %eax,%eax
801073fc:	89 c6                	mov    %eax,%esi
801073fe:	74 42                	je     80107442 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80107400:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107403:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
80107408:	68 00 10 00 00       	push   $0x1000
8010740d:	6a 00                	push   $0x0
8010740f:	50                   	push   %eax
80107410:	e8 8b d6 ff ff       	call   80104aa0 <memset>
80107415:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107418:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010741b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010741e:	83 ec 08             	sub    $0x8,%esp
80107421:	8b 13                	mov    (%ebx),%edx
80107423:	ff 73 0c             	pushl  0xc(%ebx)
80107426:	50                   	push   %eax
80107427:	29 c1                	sub    %eax,%ecx
80107429:	89 f0                	mov    %esi,%eax
8010742b:	e8 b0 f9 ff ff       	call   80106de0 <mappages>
80107430:	83 c4 10             	add    $0x10,%esp
80107433:	85 c0                	test   %eax,%eax
80107435:	78 19                	js     80107450 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107437:	83 c3 10             	add    $0x10,%ebx
8010743a:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107440:	75 d6                	jne    80107418 <setupkvm+0x28>
}
80107442:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107445:	89 f0                	mov    %esi,%eax
80107447:	5b                   	pop    %ebx
80107448:	5e                   	pop    %esi
80107449:	5d                   	pop    %ebp
8010744a:	c3                   	ret    
8010744b:	90                   	nop
8010744c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107450:	83 ec 0c             	sub    $0xc,%esp
80107453:	56                   	push   %esi
      return 0;
80107454:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107456:	e8 15 ff ff ff       	call   80107370 <freevm>
      return 0;
8010745b:	83 c4 10             	add    $0x10,%esp
}
8010745e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107461:	89 f0                	mov    %esi,%eax
80107463:	5b                   	pop    %ebx
80107464:	5e                   	pop    %esi
80107465:	5d                   	pop    %ebp
80107466:	c3                   	ret    
80107467:	89 f6                	mov    %esi,%esi
80107469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107470 <kvmalloc>:
{
80107470:	55                   	push   %ebp
80107471:	89 e5                	mov    %esp,%ebp
80107473:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107476:	e8 75 ff ff ff       	call   801073f0 <setupkvm>
8010747b:	a3 c4 6c 11 80       	mov    %eax,0x80116cc4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107480:	05 00 00 00 80       	add    $0x80000000,%eax
80107485:	0f 22 d8             	mov    %eax,%cr3
}
80107488:	c9                   	leave  
80107489:	c3                   	ret    
8010748a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107490 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107490:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107491:	31 c9                	xor    %ecx,%ecx
{
80107493:	89 e5                	mov    %esp,%ebp
80107495:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107498:	8b 55 0c             	mov    0xc(%ebp),%edx
8010749b:	8b 45 08             	mov    0x8(%ebp),%eax
8010749e:	e8 bd f8 ff ff       	call   80106d60 <walkpgdir>
  if(pte == 0)
801074a3:	85 c0                	test   %eax,%eax
801074a5:	74 05                	je     801074ac <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801074a7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801074aa:	c9                   	leave  
801074ab:	c3                   	ret    
    panic("clearpteu");
801074ac:	83 ec 0c             	sub    $0xc,%esp
801074af:	68 1e 81 10 80       	push   $0x8010811e
801074b4:	e8 d7 8e ff ff       	call   80100390 <panic>
801074b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801074c0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801074c0:	55                   	push   %ebp
801074c1:	89 e5                	mov    %esp,%ebp
801074c3:	57                   	push   %edi
801074c4:	56                   	push   %esi
801074c5:	53                   	push   %ebx
801074c6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801074c9:	e8 22 ff ff ff       	call   801073f0 <setupkvm>
801074ce:	85 c0                	test   %eax,%eax
801074d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801074d3:	0f 84 9f 00 00 00    	je     80107578 <copyuvm+0xb8>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801074d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801074dc:	85 c9                	test   %ecx,%ecx
801074de:	0f 84 94 00 00 00    	je     80107578 <copyuvm+0xb8>
801074e4:	31 ff                	xor    %edi,%edi
801074e6:	eb 4a                	jmp    80107532 <copyuvm+0x72>
801074e8:	90                   	nop
801074e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801074f0:	83 ec 04             	sub    $0x4,%esp
801074f3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801074f9:	68 00 10 00 00       	push   $0x1000
801074fe:	53                   	push   %ebx
801074ff:	50                   	push   %eax
80107500:	e8 4b d6 ff ff       	call   80104b50 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107505:	58                   	pop    %eax
80107506:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010750c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107511:	5a                   	pop    %edx
80107512:	ff 75 e4             	pushl  -0x1c(%ebp)
80107515:	50                   	push   %eax
80107516:	89 fa                	mov    %edi,%edx
80107518:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010751b:	e8 c0 f8 ff ff       	call   80106de0 <mappages>
80107520:	83 c4 10             	add    $0x10,%esp
80107523:	85 c0                	test   %eax,%eax
80107525:	78 61                	js     80107588 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80107527:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010752d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107530:	76 46                	jbe    80107578 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107532:	8b 45 08             	mov    0x8(%ebp),%eax
80107535:	31 c9                	xor    %ecx,%ecx
80107537:	89 fa                	mov    %edi,%edx
80107539:	e8 22 f8 ff ff       	call   80106d60 <walkpgdir>
8010753e:	85 c0                	test   %eax,%eax
80107540:	74 61                	je     801075a3 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80107542:	8b 00                	mov    (%eax),%eax
80107544:	a8 01                	test   $0x1,%al
80107546:	74 4e                	je     80107596 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80107548:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
8010754a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
8010754f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80107555:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80107558:	e8 73 af ff ff       	call   801024d0 <kalloc>
8010755d:	85 c0                	test   %eax,%eax
8010755f:	89 c6                	mov    %eax,%esi
80107561:	75 8d                	jne    801074f0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80107563:	83 ec 0c             	sub    $0xc,%esp
80107566:	ff 75 e0             	pushl  -0x20(%ebp)
80107569:	e8 02 fe ff ff       	call   80107370 <freevm>
  return 0;
8010756e:	83 c4 10             	add    $0x10,%esp
80107571:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107578:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010757b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010757e:	5b                   	pop    %ebx
8010757f:	5e                   	pop    %esi
80107580:	5f                   	pop    %edi
80107581:	5d                   	pop    %ebp
80107582:	c3                   	ret    
80107583:	90                   	nop
80107584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107588:	83 ec 0c             	sub    $0xc,%esp
8010758b:	56                   	push   %esi
8010758c:	e8 8f ad ff ff       	call   80102320 <kfree>
      goto bad;
80107591:	83 c4 10             	add    $0x10,%esp
80107594:	eb cd                	jmp    80107563 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80107596:	83 ec 0c             	sub    $0xc,%esp
80107599:	68 42 81 10 80       	push   $0x80108142
8010759e:	e8 ed 8d ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
801075a3:	83 ec 0c             	sub    $0xc,%esp
801075a6:	68 28 81 10 80       	push   $0x80108128
801075ab:	e8 e0 8d ff ff       	call   80100390 <panic>

801075b0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801075b0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801075b1:	31 c9                	xor    %ecx,%ecx
{
801075b3:	89 e5                	mov    %esp,%ebp
801075b5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801075b8:	8b 55 0c             	mov    0xc(%ebp),%edx
801075bb:	8b 45 08             	mov    0x8(%ebp),%eax
801075be:	e8 9d f7 ff ff       	call   80106d60 <walkpgdir>
  if((*pte & PTE_P) == 0)
801075c3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
801075c5:	c9                   	leave  
  if((*pte & PTE_U) == 0)
801075c6:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801075c8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
801075cd:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801075d0:	05 00 00 00 80       	add    $0x80000000,%eax
801075d5:	83 fa 05             	cmp    $0x5,%edx
801075d8:	ba 00 00 00 00       	mov    $0x0,%edx
801075dd:	0f 45 c2             	cmovne %edx,%eax
}
801075e0:	c3                   	ret    
801075e1:	eb 0d                	jmp    801075f0 <copyout>
801075e3:	90                   	nop
801075e4:	90                   	nop
801075e5:	90                   	nop
801075e6:	90                   	nop
801075e7:	90                   	nop
801075e8:	90                   	nop
801075e9:	90                   	nop
801075ea:	90                   	nop
801075eb:	90                   	nop
801075ec:	90                   	nop
801075ed:	90                   	nop
801075ee:	90                   	nop
801075ef:	90                   	nop

801075f0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801075f0:	55                   	push   %ebp
801075f1:	89 e5                	mov    %esp,%ebp
801075f3:	57                   	push   %edi
801075f4:	56                   	push   %esi
801075f5:	53                   	push   %ebx
801075f6:	83 ec 1c             	sub    $0x1c,%esp
801075f9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801075fc:	8b 55 0c             	mov    0xc(%ebp),%edx
801075ff:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107602:	85 db                	test   %ebx,%ebx
80107604:	75 40                	jne    80107646 <copyout+0x56>
80107606:	eb 70                	jmp    80107678 <copyout+0x88>
80107608:	90                   	nop
80107609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107610:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107613:	89 f1                	mov    %esi,%ecx
80107615:	29 d1                	sub    %edx,%ecx
80107617:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010761d:	39 d9                	cmp    %ebx,%ecx
8010761f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107622:	29 f2                	sub    %esi,%edx
80107624:	83 ec 04             	sub    $0x4,%esp
80107627:	01 d0                	add    %edx,%eax
80107629:	51                   	push   %ecx
8010762a:	57                   	push   %edi
8010762b:	50                   	push   %eax
8010762c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010762f:	e8 1c d5 ff ff       	call   80104b50 <memmove>
    len -= n;
    buf += n;
80107634:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107637:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010763a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107640:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107642:	29 cb                	sub    %ecx,%ebx
80107644:	74 32                	je     80107678 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107646:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107648:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010764b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010764e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107654:	56                   	push   %esi
80107655:	ff 75 08             	pushl  0x8(%ebp)
80107658:	e8 53 ff ff ff       	call   801075b0 <uva2ka>
    if(pa0 == 0)
8010765d:	83 c4 10             	add    $0x10,%esp
80107660:	85 c0                	test   %eax,%eax
80107662:	75 ac                	jne    80107610 <copyout+0x20>
  }
  return 0;
}
80107664:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107667:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010766c:	5b                   	pop    %ebx
8010766d:	5e                   	pop    %esi
8010766e:	5f                   	pop    %edi
8010766f:	5d                   	pop    %ebp
80107670:	c3                   	ret    
80107671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107678:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010767b:	31 c0                	xor    %eax,%eax
}
8010767d:	5b                   	pop    %ebx
8010767e:	5e                   	pop    %esi
8010767f:	5f                   	pop    %edi
80107680:	5d                   	pop    %ebp
80107681:	c3                   	ret    

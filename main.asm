[org 0x7c00]
	[bits 16]


	mov bp, 0x8000
	mov sp, bp ;init stack at 0x8000

	mov dx, 0xdead
	call printhex
	call newline
	mov dx, 0xbeef
	call printhex

	cli
	lgdt [gdtdescriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp codeseg:startptcmode

	

newline:
	push ax
	mov ah, 0x0e
	mov al, 0xA
	int 0x10
	mov al, 0xD
	int 0x10
	pop ax
	ret

;PRINT ROUTINES 

printstring:
	pusha ;preserve regs
	mov ah, 0x0e ;load interrupt code
prntstriter:
	mov al, BYTE[bx] ;load byte of string into al
	or al, al ;check for 0 byte
	jz prntstrend
	int 0x10 ;call char print interrupt
	add bx, 1 ;increment string pointer
	jmp prntstriter
	prntstrend:
	popa ;restore regs
	ret ;exit function

printhex:
	pusha
	;this is an unrolled loop
	;it works from lsb to msb
	;rotate to and mask out everything but current byte
	;add to hexkey to index into ascii hex value map
	;copy to corresponding byte in hex display string 
	mov bx, dx 
	and bx, 0x000f
	add bx, hexkey
	mov al, [bx]
	mov [hextemp + 5], al;least significant byte
	shr dx, 4
	mov bx, dx 
	and bx, 0x000f
	add bx, hexkey
	mov al, [bx]
	mov [hextemp + 4], al
	shr dx, 4
	mov bx, dx 
	and bx, 0x000f
	add bx, hexkey
	mov al, [bx]
	mov [hextemp + 3], al
	shr dx, 4
	mov bx, dx 
	and bx, 0x000f
	add bx, hexkey
	mov al, [bx]
	mov [hextemp + 2], al;most significant byte
	mov bx, hextemp
	call printstring
	popa
	ret
hextemp:
	db "0x0000",0
hexkey:
	db "0123456789ABCDEF"
  
 ;GDT 
	gdtstart:

gdtnull:
	dd 0x0
	dd 0x0
gdtcode:
	dw 0xffff 
	dw 0x0 
	db 0x0
	db 10011010b
	db 11001111b 
	db 0x0 
gdtdata :
	dw 0xffff 
	dw 0x0 
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0 
gdtend : 
gdtdescriptor:
	dw gdtend - gdtstart - 1 
	dd gdtstart 
codeseg equ gdtcode - gdtstart
dataseg equ gdtdata - gdtstart


	[bits 32]


startptcmode:

	mov ax, dataseg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000 ;far, far away
	mov esp, ebp

	mov ebx, hello
	call bleachscreen
	call printstring32

	jmp $;loop forever

;32 BIT PRINT ROUTINE AND VRAM CLEAR
vram equ 0xb8000
white_black equ 0x0f
cyan_lime equ 0x32

printstring32:
	pusha ;preserve regs
	mov edx, vram ;load vram address
	mov ah, white_black ;white text on black background
prntstriter32:
	mov al, BYTE[ebx] ;load byte of string into al
	or al, al ;check for end of string 
	jz prntstrend32
	mov WORD[edx], ax
	add ebx, 1 ;increment string pointer
	add edx, 2 ;increment vram pointer
	jmp prntstriter32 
prntstrend32:
	popa ;restore regs
	ret ;exit function

bleachscreen:
	pusha
	mov edx, vram + ((80 * 25) * 2) - 2; point to last byte of vram
	mov ah, cyan_lime ;nauseating cyan on lime so we can easily spot our text
	mov al, "k" ;just because
bleachloop:
	mov WORD[edx], ax;load current index with blue on green k
	dec edx 
	dec edx ;decrease edx 2 times, 2 bytes
	cmp edx, vram ;are we at the beginning?
	jge bleachloop;if not, do it again
	popa
	ret
hello:
	db "Hello World!",0
bootdrive:
	db 0

	; Fill with 510 zeros minus the size of the previous code
	times 510-($-$$) db 0
	; Magic number
	dw 0xaa55

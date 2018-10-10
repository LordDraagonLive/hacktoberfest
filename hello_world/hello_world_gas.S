###########################################
# Hello World write in assembly language
# Assemble with:
# as hello_world_gas.S -o hello_world_gas.o
# And load with
# ld hello_world_gas.o -o hello_world_gas
# The syntax is AT&T
###########################################

.section .data

msg:
	.ascii "Hello World!\n"

.section .text

.globl _start

_start:
	movl $4, %eax
	movl $1, %ebx
	movl $msg, %ecx
	movl $13, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80

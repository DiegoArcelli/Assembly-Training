;implement mul function just using the add instruction

section .data
	n db 10
	num db 2
	res db 0
section .text
	global _start

_start:
	mov al, byte[num]
	mov bl, byte[n]
sumLoop:
	add al, byte[num]
	dec bl
	jnz sumLoop

	mov rax, 60
	mov rbx, 0
	syscall

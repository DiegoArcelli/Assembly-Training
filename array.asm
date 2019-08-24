;trying to understand how arrays work

section .data
	arr db 5,6,7,8

section .text
	global _start

_start:
	mov al,[arr]
	mov bl,[arr+1]
	mov cl,[arr+2]
	mov dl,[arr+3]
	mov rax,60
	mov rbx,0
	syscall

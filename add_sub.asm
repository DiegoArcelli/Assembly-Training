;program that perform the operations
;sum = num1 + num2
;diff = num1 - num2

section .data
	n1add dq 0x5
	n2add dq 0x7
	n1dif dq 0x15
	n2dif dq 0x47
	sum dq 0x0
	diff dq 0x0

section .text
	global _start

_start:
	mov rax, qword [n1add]
	add rax, qword [n2add]
	mov qword [sum], rax

	mov rcx, qword [n1dif]
	sub rcx, qword [n2dif]
	mov qword [diff], rdx

	mov rax, 60
	mov rbx, 0
	syscall

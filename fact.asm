;calculate the factorial of num and put it in res

section .data
	num dq 6
	res dq 0

section .text
	global _start

_start:

	mov rax,1
	mov rbx,qword[num]
fact_start:
	imul rax, rbx
	dec rbx
	jnz fact_start
	mov qword[res],rax
	mov rax, 60
	mov rbx, 0
	syscall


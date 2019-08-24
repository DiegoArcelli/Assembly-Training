;if num is odd the rbx register is set to 1
;if num is even the rbx register is set to 0

section .data
	num dq -12

section .text
	global _start

_start:
	mov rax, qword[num]
	ror rax,1
	cmp rax,0
	jl odd
	jg fine
odd:
	mov rbx,1
fine:
	mov rax,60
	mov rbx,0
	syscall

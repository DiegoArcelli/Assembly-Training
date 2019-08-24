;calculate the n number of fibonacci sequence

section .data
	num dq 1
	fib1 dq 0
	fib2 dq 1

section .text
	global _start

_start:
	mov rax,qword[num]
	cmp rax,2
	jl base
	mov rax,qword[fib2]
	mov rbx,qword[fib1]
	sub qword[num],2
ciclo:
	mov rcx,rax
	add rax, rbx
	mov rbx, rcx
	dec qword[num]
	jnz ciclo
	mov rcx, rax
	jmp fine
base:
	mov rcx,qword[num]
	jmp fine
fine:
	mov rax,60
	mov rbx,0
	sycall

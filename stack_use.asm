;doing things with stack

section .data
	arr dq 4,8,6


section .text
	global _start

_start:

	mov rax,qword[arr]
	push rax
	mov rax,qword[arr+8]
	push rax
        mov rax,qword[arr+16]
        push rax
	mov rax,0
	mov rax,qword[rsp]
	mov rax,0
	pop rax
	mov rax,qword[rsp]

	mov rax,60
	mov rbx,0
	syscall

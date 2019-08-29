;binary search algorithm

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
	arr dq 1,3,4,6,8,11,13,22
	num dq 2
	len dq 8
	due dq 2
	otto dq 8

section .text
	global _start
	global search

search:
	cmp rbx,rcx
	jg niente
	mov r8,qword[num]
	mov rax,rcx
	add rax,rbx
	idiv rax,qword[due]
	mov rdx,0
	imul rax,8
	mov rsi,arr
	add rsi,rax
	cmp qword[rsi],r8
	je trovato
	jg grande
	jl piccolo
grande:
	idiv rax,qword[otto]
	mov rdx,0
	mov rcx,rax
	dec rcx
	jmp search
piccolo:
	idiv rax,qword[otto]
	mov rdx,0
	mov rbx,rax
	inc rbx
	jmp search
trovato:
	idiv rax,qword[otto]
	mov rdx,rax
	jmp fine
niente:
	mov rdx,-1
fine:
ret

_start:
	mov rbx,0
	mov rcx,qword[len]
	dec rcx
	call search
	close



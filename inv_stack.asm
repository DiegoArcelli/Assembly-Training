;put five elements in the stack and then invert their order

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
	arr dw 0,0,0,0,0
	idx dw 0

section .text
	global _start

_start:
	mov rax,2
	mov rcx,5
push_el:
	push rax
	add rax,2
	loop push_el

	mov rcx,5
	mov rbx,arr
copy:
	pop qword[rbx]
	add rbx,8
	loop copy

	mov rcx,5
	mov rbx,arr
invert:
	mov rax,qword[rbx]
	push rax
	add rbx,8
	loop invert

	close

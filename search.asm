;search the num number in the array
;if num is in the array its index is put on rax register
;if num isn't in the array rax is set to -1

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
	arr dq 5,4,8,6,4,11,5
	num dq 11
	len dq 7

section .text
	global _start
	global _search

search:
	mov rax,arr
	mov rbx,qword[len]
	mov rcx,-1
ciclo:
	inc rcx
	mov rdx,qword[rax]
	cmp qword[num],rdx
	je trovato
	add rax,8
	dec rbx
	jnz ciclo
	mov rcx,-1
trovato:
	mov rax,rcx
ret


_start:
	call search
	close

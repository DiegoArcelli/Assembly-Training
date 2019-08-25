;trying to understand how functions work
;for passing parameter I used the stack
;the function perform the product of the number put in the stack and 5
;and put the result in rax register

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data

section .text

	global exemp
	global _start

exemp:
	mov rbx,5
	mov rax,qword[rsp+8]
	imul rax,rbx
ret

_start:
	mov rax,4
	push rax
	call exemp
	close

;change the value of each position of an array with its power

section .data
	arr dw 5,6,7,8

section .text
	global _start

_start:
	mov eax,arr
	mov cl,4
ciclo:
	mov bx,word[eax]
	imul bx,word[eax]
	mov word[eax],bx
	add eax,2
	dec cl
	jnz ciclo
	mov rax, 60
	mov rbx, 0
	syscall

;find the max value inside the array and put it in dx register

section .data
	arr dw 8,4,12,6,3
	max dw -32768

section .text
	global _start

_start:
	mov eax,arr
	mov cl,5
ciclo:
	mov bx,word[eax]
	cmp bx,word[max]
	jg newMax
	jmp avanti
newMax:
	mov word[max],bx
avanti:
	add eax,2
	dec cl
	jnz ciclo
	mov dx,word[max]
	mov rax, 60
	mov rbx, 0
	syscall

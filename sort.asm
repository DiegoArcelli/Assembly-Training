;sorting algorithm

section .data
	arr dw 12,8,6,4,3

section .text
	global _start

_start:
	mov eax,arr
	mov cx,4
ciclo:
	mov dx,4
ciclo_in:
	mov bx,word[eax]
	mov si,word[eax+2]
	cmp bx,si
	jg inverti
	jmp avanti
inverti:
	mov bx,word[eax]
	mov si,word[eax+2]
	mov word[eax],si
	mov word[eax+2],bx
avanti:
	add eax,2
	dec dx
	jnz ciclo_in
	mov eax,arr
	dec cx
	jnz ciclo
	jmp fine

fine:
	mov eax,0
	mov ax,word[arr]
	mov bx,word[arr+2]
	mov cx,word[arr+4]
	mov dx,word[arr+6]
	mov si,word[arr+8]
	mov rax, 60
	mov rbx, 0
	syscall

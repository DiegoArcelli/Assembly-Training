;count the number of characters of a string

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
	stringa db "questa è una stringa",0

section .text
	global _start
	global find_length

find_length:
	mov rax,stringa
	mov cl,0
ciclo:
	mov bl,byte[rax]
	cmp byte[rax],0
	jnz increment
	jmp end
increment:
	inc cl
	add rax,1
	jmp ciclo
end:
ret

_start:
	call find_length
	close


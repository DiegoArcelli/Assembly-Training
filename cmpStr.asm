;put 0 in rax if str1 is different from str2
;otherwise put 1 in rax if str1 is equal to str2

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
    str1 db "cane",0
    str2 db "canetto",0

section .text
    global _start
    global compare

compare:
    mov rax,str1
    mov rbx,str2
ciclo:
    mov cl,byte[rax]
    mov dl,byte[rbx]
    inc rax
    inc rbx
    cmp cl,dl
    je ciclo
    cmp cl,0
    jne different
    cmp dl,0
    jne different
    mov rax,1
    jmp fine
different:
    mov rax,0
fine:
ret

_start:
    call compare
    close
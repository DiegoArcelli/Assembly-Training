;put 1 in rax if the substring sub_str is inside the main string string
;put 0 in rax if the substring sub_str isn't inside the main string string

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
    string db "third impact",0
    sub_str db "impact",0

section .text
    global _start
    global replace

replace:
    mov rax,string
    mov rbx,sub_str
ciclo:
    mov cl,byte[rax]
    mov dl,byte[rbx]
    inc rax
    inc rbx
    cmp cl,dl
    je equal
    mov rbx,sub_str
    cmp cl,0
    je not_found
    jmp ciclo
equal:
    cmp byte[rax+1],0
    je found
    jmp ciclo
found:
    mov rax,1
    jmp end
not_found:
    mov rax,0
end:
ret

_start:
    call replace
    close
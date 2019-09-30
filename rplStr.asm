;if sub_str is in string it is replaced by rep_str

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

section .data
    string dq "lol asd xd",0
    sub_str db "asd",0
    rep_str db "mhanz",0
    new_string db 0

section .text
    global _start
    global replace

replace:
    mov rax,string
    mov rbx,sub_str
    mov r8,rax
    mov r9,rax
ciclo:
    mov cl,byte[rax]
    mov dl,byte[rbx]
    inc rax
    inc rbx
    cmp cl,dl
    je equal
    mov rbx,sub_str
    mov r8,rax
    mov r9,rax
    cmp cl,0
    je end
    jmp ciclo
equal:
    mov r9,rax
    cmp byte[rbx],0
    je found
    jmp ciclo
found:
    mov rax,string
    mov rbx,new_string
ciclo_rpl:
    mov cl,byte[rax]
    mov byte[rbx],cl
    cmp rax,r8  
    je replace_2
    inc rax
    inc rbx
    jmp ciclo_rpl
replace_2:
    ;inc rax
    ;inc rbx
    mov rax,rep_str
ciclo_rpl2:
    mov cl,byte[rax]
    mov byte[rbx],cl
    inc rax
    inc rbx
    cmp byte[rax],0  
    jne ciclo_rpl2
    mov rax,r9
ciclo_rpl3:
    mov cl,byte[rax]
    mov byte[rbx],cl
    inc rax
    inc rbx
    cmp byte[rax],0
    jne ciclo_rpl3
    mov byte[rax],0
    mov rax,1
    mov rdi,1
    mov rsi,new_string
    mov rdx,14
    syscall
end:
ret

_start:
    call replace
    close

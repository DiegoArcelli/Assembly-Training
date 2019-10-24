;implementation of recursive factorial

%macro close 0
    mov rax,60
    mov rbx,0
    syscall
%endmacro

section .data
    num dq 5

section .text
    global _start
    global fact

fact:
    push rax
    mov rcx,qword[rsp]
    cmp qword[rsp],1
    jg recursive
    jmp base
recursive:
    dec rax
    call fact
base:
    pop rbx
    mov rdx,qword[rsp+8]
    imul rdx,rbx
    mov qword[rsp+8],rdx
    mov r8,qword[rsp+8]
fine:
ret

_start:
    mov rax,qword[num]
    call fact
    close

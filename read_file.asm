;read a file and print its content in the terminal

section .data
    NULL equ 0
    LF equ 10
    SYS_READ equ 0
    SYS_WRITE equ 1
    SYS_OPEN equ 2
    SYS_CLOSE equ 3
    SYS_EXIT equ 60
    O_RDONLY equ 000000q
    BUFF_SIZE equ 255
    STDOUT equ 1
    EXIT_SUCCESS equ 0
    fileDesc dq 0
    fileName db "prova.txt",NULL

section .bss
    readBuffer resb BUFF_SIZE

section .text
    global _start
    global print_string

printString:
    push rbp
    mov rbp,rsp
    push rbx

    mov rbx,rdi
    mov rdx,0
strCountLoop:
    cmp byte[rbx],NULL
    je strCountDone
    inc rdx
    inc rbx
    jmp strCountLoop
strCountDone:
    cmp rdx,0
    je prtDone

    mov rax,SYS_WRITE
    mov rsi,rdi
    mov rdi,STDOUT
    syscall

prtDone:
    pop rbx
    pop rbp
    ret

_start:

    mov rax,SYS_OPEN
    mov rdi,fileName
    mov rsi,O_RDONLY
    syscall

    cmp rax,0
    mov qword[fileDesc],rax
    mov rax,SYS_READ
    mov rdi,qword[fileDesc]
    mov rsi,readBuffer
    mov rdx,BUFF_SIZE
    syscall

    cmp rax,0
    mov rsi,readBuffer
    mov byte[rsi+rax],NULL
    mov rdi,readBuffer
    call printString

    printNewLine

    mov rax,SYS_CLOSE
    mov rdi,qword[fileDesc]
    syscall

    mov rax,SYS_EXIT
    mov rdi,EXIT_SUCCESS
    syscall

;check if num is a prime number and print the result on the terminal

%macro close 0
	mov rax,60
	mov rbx,0
	syscall
%endmacro

%macro print 0
	mov rax, 1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 14
	syscall
%endmacro

section .data
	num dq 4
	prim dq "prime"
	no_prim dq "not prime"

section .text
	global _start
	global prime

prime:
	mov rbx,[rsp+8]
	dec rbx
	mov rsi,1
ciclo:
	mov rax,qword[num]
	div rbx
	cmp rdx,0
	je divisore
avanti:
	mov rdx,0
	dec rbx
	cmp rbx,0
	je is_prime
	jmp ciclo
divisore:
	dec rsi
	cmp rsi,0
	jl no_prime
	jmp avanti
is_prime:
	mov rax,1
	jmp fine
no_prime:
	mov rax,0
fine:
ret

_start:
	mov rax, qword[num]
	push rax
	call prime
	cmp rax,0
	je print_no_prim
	jmp print_prim
print_prim:
	mov r8,prim
	jmp end
print_no_prim:
	mov r8,no_prim
end:
	print
	close


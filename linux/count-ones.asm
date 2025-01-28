global main

extern printf

%define arr_sizeof 8

section .data
	arr dq (num_format - $) / arr_sizeof, 1, 1, 1
	num_format db "%d", 10

section .text
main:
	sub rsp, 8
	xor rax, rax
	mov rbx, arr + arr_sizeof
	mov rcx, [arr]
	xor rdx, rdx
	mov r8, 1
	while:
		mov r9, [arr + (rcx * arr_sizeof) + -arr_sizeof]
		cmp r9, r8
		jnz if_false
			inc rax
		if_false:
		loop while
	mov rdi, num_format
	mov rsi, rax
	call printf
	add rsp, 8
	ret

	mov rax, 60 ; exit
	syscall

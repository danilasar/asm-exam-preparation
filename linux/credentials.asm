global main

section .data
myname: db "Danila Grigoriev", 0ah, 0
	mylen equ $ - myname

section .text
main:
	mov rax, 1
	mov rdi, 1
	mov rsi, myname
	mov rdx, mylen
	syscall
	ret

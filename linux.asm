global main

section .data
message: db "Hello, world!",10

section .text
main:
    mov rax, 1 ; дескриптор вызова write
    mov rdi, 1 ; дескриптор потока stdout
    mov rsi, message ; адрес строки для вывод
    mov rdx, 13 ; количество байтов
    syscall ; выполняем системный вызов write
 
    mov rax, 60 ; дескриптор системного вызова exit
		xor rdi, rdi
    syscall

org 0x7c00
bits 16
jmp start


print_string_si:
    push ax                   ; сохраняем ax на стеке

    mov ah, 0x0e              ; устанавливаем ah в 0x0e, чтобы вызвать функцию
    call print_next_char      ; прерывания

    pop ax                    ; восстанавливаем ax
    ret                       ; и выходим

print_next_char:
    mov al, [si]              ; загрузка одного символа
    cmp al, 0                 ; если si закончилась

    jz if_zero                ; то выходим из функции

    int 0x10                  ; в обратном случае печатаем al
    inc si                    ; и инкрементируем указатель

    jmp print_next_char       ; и начинаем заново...

if_zero:
    ret

start:
	cli

	mov ah, 0x00
	mov al, 0x03
	int 0x10

	mov sp, 0x7c00

	mov si, greetings
	call print_string_si


greetings: db "The OS is on. Type 'help' for commands", 0x0d, 0xa, 0xa, 0

times 510 - ($-$$) db 0 
dw 0xaa55

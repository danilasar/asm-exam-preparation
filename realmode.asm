org 0x7c00
bits 16
jmp start

print_string_si:
	push ax                   ; сохраняем ax на стеке
	mov ES:1610, byte 'P'
	mov ES:1612, byte 7

	mov ah, 0x13              ; устанавливаем ah в 0x0e, чтобы вызвать функцию
	mov al, 3
	mov bl, 7
	mov cx, greetings_len
	mov dx, 0
	mov bp, greetings
	int 0x10

	ret

start:
	cli
	xor ax, ax
	mov ds, ax
	mov ss, ax
	mov sp, 0x7c00
	mov ax, 0b800h         ;используем сегментные регистр ES
	mov es, ax             ;для организации записи данных в видеопамять по адресу B800:0000h

	mov ah, 00h            ;запрос на установку видеорежима
	mov al, 03h            ;стандартный цветовой текстовый режим
	int 10h                ;вызов прерывания

	mov ah, 05h            ;код прерыв. для установки выводимой стр-цы
	mov al, 00h            ;первая страница
	int 10h                ;вызов прерывания

	mov ah, 0x00
	mov al, 0x03
	int 0x10

	mov ah, 0x03
	mov si, greetings

greetings: db "The OS is on. Type 'help' for commands", 0x0d, 0xa, 0xa, 0
greetings_len: dw $ - greetings

times 510 - ($-$$) db 0
dw 0xaa55

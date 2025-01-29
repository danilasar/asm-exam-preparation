.model small

.stack 100h

.data
	myname db "Danila Grigoriev, 251$"

.code
start:
	mov ax, @data
	mov ds, ax

	mov ah, 9
	lea dx, myname
	int 21h

	mov ax, 4c00h
	int 21h
end start

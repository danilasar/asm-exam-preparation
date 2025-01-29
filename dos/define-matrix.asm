.model small

.stack 100h

.data
	matr db 5 dup (5 dup (?))

.code
start:
	mov ax, @data
	mov ds, ax

	mov ax, 4c00h
	int 21h
end start

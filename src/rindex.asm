; x86-64 assembly rindex
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global rindex

rindex:
	xor rcx, rcx		; set a 64bit index to 0
	jmp .SET_INDEX		; goto '.SET_INDEX'

.INCREMENT:
	inc rcx			; increment the index

.SET_INDEX:
	mov dl, BYTE [rdi+rcx]	; put str[rcx] into dl
	cmp dl, 0		; is it the end of the string ?
	jne .INCREMENT		; if no, goto '.INCREMENT'
	jmp .LOOP		; goto '.LOOP'

.DECREMENT:
	cmp rcx, 0		; is it the begining of the string ?
	je .RET_NULL		; if yes, goto '.RET_NULL'
	dec rcx			; decrement the index

.LOOP:
	movsx edx, BYTE [rdi+rcx] ; put str[rcx] into edx
	cmp edx, esi		; is edx equal to esi ?
	jne .DECREMENT		; if no, goto '.DECREMENT'
	mov rax, rdi		; set return value to str
	add rax, rcx		; add index to return value
	jmp .END		; goto '.END'

.RET_NULL:
	xor rax, rax		; set return to NULL

.END:
	ret			; end
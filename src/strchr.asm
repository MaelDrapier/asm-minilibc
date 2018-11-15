; x86-64 assembly strchr
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strchr

strchr:
	xor rcx, rcx		; set a 64bit index to 0
	jmp .LOOP		; goto '.LOOP' label

.INCREMENT:
	inc rcx			; rcx index incrementation

.LOOP:
	movsx edx, BYTE [rdi+rcx] ; put str[rcx] into edx
	cmp edx, 0		; is it the end of the string ?
	je .RET_NULL		; if yes, goto '.RET_NULL'
	cmp edx, esi		; is edx equal to esi ?
	jne .INCREMENT		; if no, goto '.INCREMENT'
	mov rax, rdi		; set return value to str
	add rax, rcx		; add index to return value
	jmp .END		; goto '.END'

.RET_NULL:
	xor rax, rax		; set return to NULL

.END:
	ret			; end
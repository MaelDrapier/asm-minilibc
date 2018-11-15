; x86-64 assembly memcpy
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global memcpy

memcpy:
	xor rcx, rcx		; set an index to 0
	jmp .LOOP		; goto '.LOOP' label

.INCREMENT:
	inc rcx			; increment index

.LOOP:
	cmp rcx, rdx		; is index equal to third arg ?
	je .END			; if yes, goto '.END'
	mov al, BYTE [rsi+rcx]	; set al char to src[rcx]
	mov BYTE [rdi+rcx], al	; set dest[rcx] to al char
	jmp .INCREMENT		; goto '.INCREMENT' label

.END:
	mov rax, rdi		; set return value to dest
	ret			; end
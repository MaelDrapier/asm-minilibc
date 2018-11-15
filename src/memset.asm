; x86-64 assembly memset
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global memset

memset:
	xor rcx, rcx		; set an index to 0
	jmp .LOOP		; goto '.LOOP' label

.INCREMENT:
	inc rcx			; increment index

.LOOP:
	cmp rcx, rdx		; is index equal to third arg ?
	je .END			; if yes, goto '.END'
	mov BYTE [rdi+rcx], sil	; set dest[rcx] to sil value
	jmp .INCREMENT		; goto '.INCREMENT' label

.END:
	mov rax, rdi		; set return value to dest
	ret			; end
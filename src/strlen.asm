; x86-64 assembly strlen
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strlen

strlen:
	xor ecx, ecx		; set an int to 0
	jmp .LOOP		; goto '.LOOP' label

.INCREMENT:
	inc ecx			; increment length

.LOOP:
	movsx rdx, ecx		; put 4bytes ecx into 8bytes rdx
	mov sil, BYTE [rdi+rdx]	; put a char into 'sil'
	cmp sil, 0		; compare 'sil' char and '\0'
	jne .INCREMENT		; jump to '.INCREMENT' label if 'sil' != '\0'
	mov eax, ecx		; set return value
	ret			; end
; x86-64 assembly strcspn
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strcspn

strcspn:
	xor rbx, rbx		; set rbx index to 0
	jmp .LOOP		; goto '.LOOP'

.INCREMENT:
	inc rbx			; rbx index incrementation

.LOOP:
	mov al, BYTE [rdi+rbx]	; put str1[rbx] into al
	cmp al, 0		; is al equal to 0 ?
	je .END			; if yes, goto '.END'
	xor rcx, rcx		; set rcx index to 0
	jmp .SUB_LOOP		; goto '.SUB_LOOP'

.INC_SUB:
	inc rcx			; rcx index incrementation

.SUB_LOOP:
	mov dl, BYTE [rsi+rcx]	; put str2[rcx] into dl
	cmp dl, 0		; is dl equal to 0 ?
	je .INCREMENT		; if yes, goto '.INCREMENT'
	cmp al, dl		; is al equal to dl ?
	je .END			; if yes, goto '.END'
	jmp .INC_SUB		; goto '.INC_SUB'

.END:
	mov rax, rbx		; set return value
	ret			; end
; x86-64 assembly strcmp
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strcmp

strcmp:
	xor eax, eax		; set return value to 0
	xor rcx, rcx		; set an index to 0
	jmp .LOOP		; goto '.LOOP'

.INCREMENT:
	cmp bl, 0		; id bl equal to '\0' ?
	je .END			; if yes, goto '.END'
	inc rcx			; index incrementation

.LOOP:
	mov bl, BYTE [rdi+rcx]	; put str1[rcx] into bl
	mov dl, BYTE [rsi+rcx]	; put str2[rcx] into dl
	cmp bl, dl		; is bl equal to dl ?
	je .INCREMENT		; if yes, goto '.INCREMENT'

.DIFF_FOUND:
	movsx eax, bl		; put bl char into eax int
	movsx ebx, dl		; put dl char into ebx int
	sub eax, ebx		; eax = eax - ebx

.END:
	ret			; end
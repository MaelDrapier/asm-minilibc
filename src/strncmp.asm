; x86-64 assembly strncmp
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strncmp

strcmp:
	xor eax, eax		; set return value to 0
	xor rcx, rcx		; set an index to 0
	jmp .LOOP		; goto '.LOOP'

.INCREMENT:
	cmp bl, 0		; id bl equal to '\0' ?
	je .END			; if yes, goto '.END'
	inc rcx			; index incrementation

.LOOP:
	cmp rdx, rcx		; is index equal to arg3
	je .END			; if yes, goto '.END'
	mov bl, BYTE [rdi+rcx]	; put str1[rcx] into bl
	mov r8b, BYTE [rsi+rcx]	; put str2[rcx] into r8b
	cmp bl, r8b		; is bl equal to r8b ?
	je .INCREMENT		; if yes, goto '.INCREMENT'

.DIFF_FOUND:
	movsx eax, bl		; put bl char into eax int
	movsx ebx, r8b		; put rb8 char into ebx int
	sub eax, ebx		; eax = eax - ebx

.END:
	ret			; end
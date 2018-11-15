; x86-64 assembly strcasecmp
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strcasecmp

strcasecmp:
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
	cmp bl, 'A'		; is bl < 'A' ?
	jl .NO_UPPER1		; if yes, goto '.NO_UPPER1'
	cmp bl, 'Z'		; is bl > 'Z' ?
	jg .NO_UPPER1		; if yes, goto '.NO_UPPER1'
	add bl, 32		; lowercase bl

.NO_UPPER1:
	cmp dl, 'A'		; is dl < 'A' ?
	jl .NO_UPPER2		; if yes, goto '.NO_UPPER2'
	cmp dl, 'Z'		; is dl > 'Z' ?
	jg .NO_UPPER2		; if yes, goto '.NO_UPPER2'
	add dl, 32		; lowercase dl

.NO_UPPER2:
	cmp bl, dl		; is bl equal to dl ?
	je .INCREMENT		; if yes, goto '.INCREMENT'

.DIFF_FOUND:
	movsx eax, bl		; put bl char into eax int
	movsx ebx, dl		; put dl char into ebx int
	sub eax, ebx		; eax = eax - ebx

.END:
	ret			; end
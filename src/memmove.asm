; x86-64 assembly memmove
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global memmove

memmove:
	cmp rdx, 0		; is third arg equal to 0 ?
	je .END			; if yes, goto '.END'
	xor rcx, rcx		; set an index to 0
	jmp .WRITE_STACK	; goto '.WRITE_STACK' label

.INCREMENT:
	inc rcx			; increment index

.WRITE_STACK:
	cmp rcx, rdx		; is index equal to third arg ?
	je .READ_STACK		; if yes, goto '.READ_STACK'
	movsx rbx, BYTE [rsi+rcx] ; set rxb to src[rcx]
	push rbx		; push rbx into the stack
	jmp .INCREMENT		; goto '.INCREMENT' label


.READ_STACK:
	dec rcx			; decrement index
	pop rbx			; pop rbx from the stack
	mov BYTE [rdi+rcx], bl	; set dest[rcx] to bl char
	cmp rcx, 0		; is index equal to 0 ?
	je .END			; if yes, goto '.END'
	jmp .READ_STACK		; goto '.READ_STACK' label

.END:
	mov rax, rdi		; set return value to dest
	ret			; end

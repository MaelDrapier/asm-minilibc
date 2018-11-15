; x86-64 assembly strstr
; by Mael Drapier, EPITECH promo 2021

BITS 64

section .text
global strstr

strstr:
	xor rbx, rbx		; set an index to 0
	jmp .LOOP		; goto '.LOOP'

.INCREMENT:
	inc rbx			; rbx index incrementation

.LOOP:
	mov r8, rbx		; index copy into r8
	xor rcx, rcx		; set rcx index to 0
	jmp .SUB_LOOP		; goto '.SUB_LOOP'

.INC_SUB:
	inc r8			; r8 incrementation
	inc rcx			; rcx index incrementation

.SUB_LOOP:
	mov dl, BYTE [rsi+rcx]	; put str2[rcx] into dl
	cmp dl, 0		; is dl equal to 0 ?
	je .RET_NON_NULL	; if yes, goto '.RET_NON_NULL'
	mov al, BYTE [rdi+r8]	; put str1[r8] into al
	cmp al, 0		; is al equal to 0 ?
	je .RET_NULL		; if yes, goto '.RET_NULL'
	cmp al, dl		; is al equal to dl ?
	je .INC_SUB		; if yes, goto '.INC_SUB'
	jmp .INCREMENT		; goto '.INCREMENT'

.RET_NULL:
	xor rax, rax		; set return value to NULL
	jmp .END		; goto '.END'

.RET_NON_NULL:
	mov rax, rdi		; set return value to rdi
	add rax, rbx		; add index to return value

.END:
	ret			; end
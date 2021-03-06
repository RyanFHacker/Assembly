	;; Practice from x86_64 Linux Assembly #6 by kupala

	
section .data
	text	db "Hello, World!",10,0

section .text
	global _start

_start:
	mov rax, text
	call _print

	mov rax, 60
	mov rdi, 0
	syscall

	;; input rax as pointer to string
	;; output: print string at rax

_print:
	push rax		;save value of rax
	mov rbx, 0		;rbx to count lenght of string

_printLoop:
	inc rax			;increase rax by one
	inc rbx			;increase rbx by one
	mov cl, [rax]		;
	cmp cl, 0		;compare cl to 0, set flag
	jne _printLoop		;begins loop again if flag is set to equal

	mov rax, 1		; write out
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret

	;; Practice from x86_64 Linux Assembly #8
	;; Subroutine to Print Integers

	;; 123 / 10 = 12 R 3
	;; store 3
	;; 12 / 10 = 1 R 2
	;; store 2
	;; 1 / 10 = 0 R 1
	;; store 1
	
section .bss
	digitSpace resb 100	;reserving 100 bytes for many digits
	digitSpacePos resb 8	;reserving 8 bytes
	
section .data

section .text
	global _start
	
%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro

_start:
	mov rax, 13370
	call _printRAX

	exit

_printRAX:
	mov rcx, digitSpace	;
	mov rbx, 10		;new line characer
	mov [rcx], rbx		;
	inc rcx			;increment character
	mov [digitSpacePos], rcx ;track how far into the string

_printRAXLoop:
	mov rdx, 0		;
	mov rbx, 10		;
	div rbx			;
	push rax		;
	add rdx, 48		;add 48 to refer to character

	mov rcx, [digitSpacePos]
	mov [rcx], dl
	inc rcx
	mov [digitSpacePos], rcx

	pop rax
	cmp rax, 0
	jne _printRAXLoop
	ret

_printRAXLoop2:
	mov rcx, [digitSpacePos]
	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 1
	syscall

	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx

	cmp rcx, digitSpace
	jge _printRAXLoop2

	ret
	

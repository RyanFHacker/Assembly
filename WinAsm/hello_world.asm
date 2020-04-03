; Ex 1 Asm Tutorial
;

bits 64							; tells NASM the assembler to generate code designed for 64bit
default rel						; relative addressing

segment .data
	msg db "Hello, World!", 0xd, 0xa, 0		; define variable msg
	
segment .text
global main						; export symbol main

extern _CRT_INIT				; import symbol _CRT_INIT -C standard run-time library
extern ExitProcess				; import symbol ExitProcess
extern printf					; import symbol printf

main:							; label main entry point
	push	rbp					
	mov		rbp, rsp
	sub		rsp, 32
	
	lea		rcx,[msg]
	call	printf
	
	xor		rax, rax
	call	ExitProcess
default rel
bits 64

segment .data
	fmt db "factorial is: %d", 0xd, 0xa, 0

segment	.text

global main
global factorial

extern _CRT_INIT
extern ExitProcess
extern printf

factorial:
    push    rbp			; save pointer value
    mov     rbp, rsp	; set new pointer value
    sub     rsp, 32		; room for 32 byte local variable

    test    ecx, ecx    ; n
    jz     .zero

    mov    ebx, 1       ; counter c
    mov    eax, 1       ; result

    inc    ecx

.for_loop:
    cmp    ebx, ecx
    je     .end_loop

    mul    ebx          ; multiply ebx * eax and store in eax

    inc    ebx          ; ++c
    jmp    .for_loop

.zero:
    mov    eax, 1

.end_loop:
    leave
    ret
	
main:
	push	rbp			; save pointer
	mov		rbp, rsp	; set new pointer value
	sub		rsp, 32		; make room for 32 byte local variable
		
	mov		rcx, 5		; 
	call	factorial
	
	lea		rcx, [fmt]	;
	mov		rdx, rax	;
	call	printf		;
	
	xor		rax, rax	;
	call	ExitProcess	;
	
	
	
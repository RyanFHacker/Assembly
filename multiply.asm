	;; User input string, return that string
	;; Take two numbers, get product of numbers, print out product


	section .bss
	number1 resb 16
	number2 resb 16
	product resb 16

	section .text
	global _start
_start:
	call _printGive1
	call _getNumber1
	call _printGive2
	call _getNumber2
	call _getProduct
	call _printAnswer
	

	mov rax, 60
	mov rdi, 0
	syscall

_getNumber1:
	mov rax, 0
	mov rdi, 0
	mov rsi, number1
	mov rdx, 16
	syscall
	ret

_getNumber2:
	mov rax, 0
	mov rdi, 0
	mov rsi, number2
	mov rdx, 16
	syscall
	ret

_printGive1:
	mov rax, 1
	mov rdi, 1
	mov rsi, give1
	mov rdx, 23
	syscall
	ret
	
_printGive2:
	mov rax, 1
	mov rdi, 1
	mov rsi, give2
	mov rdx, 24
	syscall
	ret

_getProduct:
	mov rax, number1 	; first number goes to register
	mov rdx, number2	; second number to register
	mul rdx
	mov rdx, product
	ret
	
_printAnswer:
	mov rax, 1
	mov rdi, 1
	mov rsi, product
	mov rdx, 16
	syscall
	ret

	section .data
give1:	db	"Give number the first: " 	;prompt for first number on same line
give2:	db	"Give number the second: " 	;prompt for second number on same line
answer:	db	"Your product is: "		;display with answer
	

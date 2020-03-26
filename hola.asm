; Writes "Hola, mundo" to the console using a C library. Runs as Linux
;
; nasm -felf64 hola.asm && gcc -no-pie hola.o && ./a.out
; Debian switched to PIC/PIE binaries in 64-bits mode & GCC is trying to link objects as PIC
; I'm not entirely sure what the above means but it fixed an erro I recieved with gcc

		global	main
		extern	puts

		section	.text
main:						; This is called by the C library startup code
		mov	rdi, message		; First integer (or pointer) argument in rdi
		call	puts			; puts(message)
		ret				; Return from main back into C library wrapper
message:
		db	"Hola, mundo", 0	; Note string must be terminated with 0 in C

; This program prints out my name 10 times to the screen.	
	
		.MODEL medium ; Program size, usage.
		
		.STACK ; Stack 1K.
		.DATA ; Program data space.
		
		; Store data for program to use.
msg1 	BYTE "Daniel",10,13,"$"
		; 10 & 13 are ASCII characters. 
		
		; Code starts here.
		.CODE
		.STARTUP ; Program starts here at run time.
		
		; create a space with value 10
		mov cx,10
	
; start & back are labels.
start:	mov bx,OFFSET msg1 ; OFFSET finds the number of address locations for msg1 and moves it to bx.

; Register Indirect Addressing. dx is loaded with the contents of memory locations from bx...
back: 	mov dx,[bx] ;dl=letters

		; Compare dl with '$'.
		cmp dl,'$' ; cmp subtracts its two operands, and sets flags accordingly.
		jz done ; jz is "Jump if zero".
		
		mov ah,02h
		int 021h ; Print character in dl.
		
		inc bx ; Increment bx. bx = bx + 1
		jmp back ; Jump to the code where the label 'back' points to.

done: 		nop ; Single instruction, no operation

		; decrease value
		dec cx
		
		; jump to start to repeat printing
		jnz start

		; Program terminates here.
		.EXIT

; End of everything in program.
END

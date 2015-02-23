	; This program print only numbers that are inputed via the keyboard.
	
		.MODEL	SMALL
		.STACK
		.DATA
		
		.CODE
		
		.STARTUP
		
nextc:	mov ah,8
		int 021h ;all characters pressed
		mov dl,al
		
		cmp dl,48
		jc nextc
		
		cmp dl,58
		jnc nextc
		
		mov ah,02h; ;print dl
		int 021h
		
		cmp dl,27
		jnz nextc
		
		
		.EXIT
		
		END

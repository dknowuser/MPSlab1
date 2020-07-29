$MOD52                          

CSEG
ORG 00h
	mov DPTR, #datas
	mov R1, #20h
	mov R0, #08h
	
read:
	mov A, #00h
	movc A, @A + DPTR
	mov @R1, A
	dec R0
	inc R1
	inc DPTR
	cjne R0, #00h, read
	
lp:
	jmp lp

ORG 1000h
datas:
	DB 0FFh, 0FEh, 0FDh, 0FCh, 0FBh, 0FAh, 0F9h, 0F8h
END

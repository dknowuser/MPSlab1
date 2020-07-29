$MOD52                          

;QMAX EQU 2Ah
;QMIN EQU 2Bh

CARRY BIT PSW + 7
L BIT P1 + 0
H BIT P1 + 1

CSEG
ORG 00h
	; Каждое хранимое значение в памяти делим на число значений,
	mov R2, #00h; а потом суммируем в регистре R2
	mov R0, #20h		   
	
sum:
	mov B, #0Ah
	mov A, @R0
	div AB
	add A, R2
	mov R2, A	
	inc R0
	cjne R0, #2Ah, sum
	
	;В зависимости от значения R2 формируем признак и выводим его на линии порта P1
	mov A, R2
	;mov R1, QMAX
	clr CARRY
	subb A, @R0
	inc R0
	jz above_Qmax
	jnc above_Qmax
	
	mov A, R2
	;mov R1, QMIN
	clr CARRY
	subb A, @R0
	jz below_Qmin
	jc below_Qmin
	jmp between
	
above_Qmax:
	setb L
	setb H
	jmp lp
	
between:
	clr L
	setb H
	jmp lp
	
below_Qmin:
	clr L
	clr H
	
lp:
	jmp lp

END

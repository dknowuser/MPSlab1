$MOD52                          

REG_BANK_L BIT PSW + 3

CSEG
ORG 00h
	;Переключаемся на первый регистровый банк
	setb REG_BANK_L
	mov R0, #18h
	
	mov @R0, DPH
	inc R0
	
	mov @R0, DPL
	inc R0
	
	mov @R0, TH0
	inc R0
	
	mov @R0, TL0
	inc R0
	
	mov @R0, TH1
	inc R0
	
	mov @R0, TL1	
lp:
	jmp lp

END

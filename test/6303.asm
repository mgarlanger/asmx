	PROCESSOR 6303

	FCB	$00
	NOP
	FCB	$02
	FCB	$03
	LSRD
	ASLD
	TAP
	TPA
	INX
	DEX
	CLV
	SEV
	CLC
	SEC
	CLI
	SEI

	SBA
	CBA
	FCB	$12
	FCB	$13
	FCB	$14
	FCB	$15
	TAB
	TBA
	XGDX
	DAA
	SLP
	ABA
	FCB	$1C
	FCB	$1D
	FCB	$1E
	FCB	$1F

	BRA	.+2
	BRN	.+2
	BHI	.+2
	BLS	.+2
	BCC	.+2		; also BHS
	BCS	.+2		; also BLO
	BNE	.+2
	BEQ	.+2
	BVC	.+2
	BVS	.+2
	BPL	.+2
	BMI	.+2
	BGE	.+2
	BLT	.+2
	BGT	.+2
	BLE	.+2

	TSX
	INS
	PULA
	PULB
	DES
	TXS
	PSHA
	PSHB
	PULX
	RTS
	ABX
	RTI
	PSHX
	MUL
	WAI
	SWI

	NEGA
	FCB	$41
	FCB	$42
	COMA
	LSRA
	FCB	$45
	RORA
	ASRA
	ASLA
	ROLA
	DECA
	FCB	$4B
	INCA
	TSTA
	FCB	$4E
	CLRA

	NEGB
	FCB	$51
	FCB	$52
	COMB
	LSRB
	FCB	$55
	RORB
	ASRB
	ASLB
	ROLB
	DECB
	FCB	$5B
	INCB
	TSTB
	FCB	$5E
	CLRB

	NEG	$58,X
	AIM	#$49,$58,X
	OIM	#$49,$58,X
	COM	$58,X
	LSR	$58,X
	EIM	#$49,$58,X
	ROR	$58,X
	ASR	$58,X
	ASL	$58,X
	ROL	$58,X
	DEC	$58,X
	TIM	#$49,$58,X
	INC	$58,X
	TST	$58,X
	JMP	$58,X
	CLR	$58,X

	NEG	$4558
	AIM	#$49,$44
	OIM	#$49,$44
	COM	$4558
	LSR	$4558
	EIM	#$49,$44
	ROR	$4558
	ASR	$4558
	ASL	$4558
	ROL	$4558
	DEC	$4558
	TIM	#$49,$44
	INC	$4558
	TST	$4558
	JMP	.+3
	CLR	$4558

	SUBA	#$49
	CMPA	#$49
	SBCA	#$49
	SUBD	#$494D
	ANDA	#$49
	BITA	#$49
	LDAA	#$49
	FCB	$87
	EORA	#$49
	ADCA	#$49
	ORAA	#$49
	ADDA	#$49
	CPX	#$494D
	BSR	.+2
	LDS	#$494D
	FCB	$8F

	SUBA	$44
	CMPA	$44
	SBCA	$44
	SUBD	$44
	ANDA	$44
	BITA	$44
	LDAA	$44
	STAA	$44
	EORA	$44
	ADCA	$44
	ORAA	$44
	ADDA	$44
	CPX	$44
	JSR	$44
	LDS	$44
	STS	$44

	SUBA	$58,X
	CMPA	$58,X
	SBCA	$58,X
	SUBD	$58,X
	ANDA	$58,X
	BITA	$58,X
	LDAA	$58,X
	STAA	$58,X
	EORA	$58,X
	ADCA	$58,X
	ORAA	$58,X
	ADDA	$58,X
	CPX	$58,X
	JSR	$58,X
	LDS	$58,X
	STS	$58,X

	SUBA	$4558
	CMPA	$4558
	SBCA	$4558
	SUBD	$4558
	ANDA	$4558
	BITA	$4558
	LDAA	$4558
	STAA	$4558
	EORA	$4558
	ADCA	$4558
	ORAA	$4558
	ADDA	$4558
	CPX	$4558
	JSR	.+3
	LDS	$4558
	STS	$4558

	SUBB	#$49
	CMPB	#$49
	SBCB	#$49
	ADDD	#$494D
	ANDB	#$49
	BITB	#$49
	LDAB	#$49
	FCB	$C7
	EORB	#$49
	ADCB	#$49
	ORAB	#$49
	ADDB	#$49
	LDD	#$494D
	FCB	$CD
	LDX	#$494D
	FCB	$CF

	SUBB	$44
	CMPB	$44
	SBCB	$44
	ADDD	$44
	ANDB	$44
	BITB	$44
	LDAB	$44
	STAB	$44
	EORB	$44
	ADCB	$44
	ORAB	$44
	ADDB	$44
	LDD	$44
	STD	$44
	LDX	$44
	STX	$44

	SUBB	$58,X
	CMPB	$58,X
	SBCB	$58,X
	ADDD	$58,X
	ANDB	$58,X
	BITB	$58,X
	LDAB	$58,X
	STAB	$58,X
	EORB	$58,X
	ADCB	$58,X
	ORAB	$58,X
	ADDB	$58,X
	LDD	$58,X
	STD	$58,X
	LDX	$58,X
	STX	$58,X

	SUBB	$4558
	CMPB	$4558
	SBCB	$4558
	ADDD	$4558
	ANDB	$4558
	BITB	$4558
	LDAB	$4558
	STAB	$4558
	EORB	$4558
	ADCB	$4558
	ORAB	$4558
	ADDB	$4558
	LDD	$4558
	STD	$4558
	LDX	$4558
	STX	$4558

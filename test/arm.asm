	CPU	ARM_BE

	ADC	R1,R2,R3	; E0A21003
	ADCS	R1,R2,R3	; E0B21003
	ADCEQ	R1,R2,R3	; 00A21003
	ADCEQS	R1,R2,R3	; 00B21003

	ADC	R1,R2,#3	; E2A21003
	ADC	R1,R2,R3,LSL #8	; E0A21403
	ADC	R1,R2,R3,LSL R4	; E0A21413
	ADC	R1,R2,R3,LSR #8	; E0A21423
	ADC	R1,R2,R3,LSR R4	; E0A21433
	ADC	R1,R2,R3,ASR #8	; E0A21443
	ADC	R1,R2,R3,ASR R4	; E0A21453
	ADC	R1,R2,R3,ROR #8	; E0A21463
	ADC	R1,R2,R3,ROR R4	; E0A21473
	ADC	R1,R2,R3,RRX	; E0A21063

	ADD	R1,R2,R3	; E0821003
	ADDS	R1,R2,R3	; E0921003
	ADDEQ	R1,R2,R3	; 00821003
	ADCEQS	R1,R2,R3	; 00921003

; E24 = SUB
; E28 = ADD
 add r1,pc,#8

	ADR	R1,.		; E24F1008
	ADREQ	R1,.		; 024F1008
	ADRL	R1,.		; E24F1008
	ADRLEQ	R1,.		; 024F1008
	ADRL	R1,.+$1000	; E28F1FFE E2811B03
;	ADRL	R1,.+$100000	; E28F1FFE E2811BFF E2811703
;	ADRL	R1,.+$10000000	; E28F1FFE E2811BFF E28117FF E2811303

	AND	R1,R2,R3	; E0021003
	ANDS	R1,R2,R3	; E0121003
	ANDEQ	R1,R2,R3	; 00021003
	ANDEQS	R1,R2,R3	; 00121003

	B	.		; EAFFFFFE
	BEQ	.		; 0AFFFFFE
	BNE	.		; 1AFFFFFE
	BCS	.		; 2AFFFFFE
	BHS	.		; 2AFFFFFE
	BCC	.		; 3AFFFFFE
	BLO	.		; 3AFFFFFE
	BMI	.		; 4AFFFFFE
	BPL	.		; 5AFFFFFE
	BVS	.		; 6AFFFFFE
	BVC	.		; 7AFFFFFE
	BHI	.		; 8AFFFFFE
	BLS	.		; 9AFFFFFE
	BGE	.		; AAFFFFFE
	BLT	.		; BAFFFFFE
	BGT	.		; CAFFFFFE
	BLE	.		; DAFFFFFE
	BAL	.		; EAFFFFFE

	BL	.		; EBFFFFFE
	BLEQ	.		; 0BFFFFFE
	BLNE	.		; 1BFFFFFE
	BLCS	.		; 2BFFFFFE
	BLHS	.		; 2BFFFFFE
	BLCC	.		; 3BFFFFFE
	BLLO	.		; 3BFFFFFE
	BLMI	.		; 4BFFFFFE
	BLPL	.		; 5BFFFFFE
	BLVS	.		; 6BFFFFFE
	BLVC	.		; 7BFFFFFE
	BLHI	.		; 8BFFFFFE
	BLLS	.		; 9BFFFFFE
	BLGE	.		; ABFFFFFE
	BLLT	.		; BBFFFFFE
	BLGT	.		; CBFFFFFE
	BLLE	.		; DBFFFFFE
	BLAL	.		; EBFFFFFE

	BIC	R1,R2,R3	; E1C21003
	BICS	R1,R2,R3	; E1D21003
	BICEQ	R1,R2,R3	; 01C21003
	BICEQS	R1,R2,R3	; 01D21003


	BKPT	'BK'		; E124247B

	; BLX in ARM5+
	BLX	.		; FAFFFFFE
;	BLXEQ	.		; ILLEGAL
	BLX	R1		; E12FFF31
	BLXEQ	R1		; 012FFF31

	; BX in ARM4T, ARM5+
	BX	R1		; E12FFF11
	BXEQ	R1		; 012FFF11

	; CDP in ARM2+
	CDP	P1,2,CR1,CR2,CR3,3 ; EE221163
	CDPEQ	P1,2,CR1,CR2,CR3,3 ; 0E221163

	; CDP2 in ARM5+
	CDP2	P1,2,CR1,CR2,CR3,3 ; FE221163
;	CDPEQ2	P1,2,CR1,CR2,CR3,3 ; INVALID

	; CLZ in ARM5+
	CLZ	R1,R2		; E16F1F12
	CLZEQ	R1,R2		; 016F1F12

	CMN	R1,R2		; E1710002
	CMNEQ	R1,R2		; 01710002

	CMP	R1,R2		; E1510002
	CMPEQ	R1,R2		; 01510002

	EOR	R1,R2,R3	; E0221003
	EORS	R1,R2,R3	; E0321003
	EOREQ	R1,R2,R3	; 00221003
	EOREQS	R1,R2,R3	; 00321003

	; LDC in ARM2+
	LDC	P1,CR1,[R2],{0}	; EC921100
	LDCL	P1,CR1,[R2],{0}	; ECD21100
	LDCEQ	P1,CR1,[R2],{0}	; 0C921100
	LDCEQL	P1,CR1,[R2],{0}	; 0CD21100

	; LDC2 in ARM5+
	LDC2	P1,CR1,[R2],{0}	; FC921100
	LDC2L	P1,CR1,[R2],{0}	; FCD21100

	LDMIA	SP,{r0-r9}	; E89D03FF
	LDMEQIA	SP,{r0-r9}	; 089D03FF
	LDMIB	SP,{r0-r9}	; E99D03FF
	LDMEQIB	SP,{r0-r9}	; 099D03FF
	LDMDA	SP,{r0-r9}	; E81D03FF
	LDMEQDA	SP,{r0-r9}	; 081D03FF
	LDMDB	SP,{r0-r9}	; E91D03FF
	LDMEQDB	SP,{r0-r9}	; 091D03FF

	LDMEA	SP,{r0-r9}	; E91D03FF
	LDMEQEA	SP,{r0-r9}	; 091D03FF
	LDMED	SP,{r0-r9}	; E99D03FF
	LDMEQED	SP,{r0-r9}	; 099D03FF
	LDMFA	SP,{r0-r9}	; E81D03FF
	LDMEQFA	SP,{r0-r9}	; 081D03FF
	LDMFD	SP,{r0-r9}	; E89D03FF
	LDMEQFD	SP,{r0-r9}	; 089D03FF

	LDMIA	SP!,{r0-r9}	; E8BD03FF
	LDMIA	SP,{r0-r9}^	; E8DD03FF
;	LDMIA	SP!,{r0-r9}^	; ILLEGAL
	LDMIA	SP!,{r0-r15}^	; E8FDFFFF

	; LDRH/LDRSB/LDRSH in ARM4+
	LDR	R1,[R2,+R3]	; E7921003
	LDRB	R1,[R2,+R3]	; E7D21003
	LDRBT	R1,[R2],+R3	; E6F21003
	LDRH	R1,[R2,+R3]	; E19210B3
	LDRSB	R1,[R2,+R3]	; E19210D3
	LDRSH	R1,[R2,+R3]	; E19210F3
	LDRT	R1,[R2],+R3	; E6B21003
;	LDRX	R1,[R2,+R3]	; INVALID

	; MCR in ARM2+
	MCR	P1,2,R1,CR2,CR3,3 ; EE421173
	MCREQ	P1,2,R1,CR2,CR3,3 ; 0E421173

	; MCR2 in ARM5+
	MCR2	P1,2,R1,CR2,CR3,3 ; FE421173
;	MCREQ2	P1,2,R1,CR2,CR3,3 ; INVALID

	; MLA in ARM2+
	MLA	R1,R2,R3,R4	; E0214392
	MLAS	R1,R2,R3,R4	; E0314392
	MLAEQ	R1,R2,R3,R4	; 00214392
	MLAEQS	R1,R2,R3,R4	; 00314392

	MOV	R1,R2		; E1A01002
	MOVS	R1,R2		; E1B01002
	MOVEQ	R1,R2		; 01A01002
	MOVEQS	R1,R2		; 01B01002

	; MRC in ARM2+
	MRC	P1,2,R1,CR2,CR3,3 ; EE521173
	MRCEQ	P1,2,R1,CR2,CR3,3 ; 0E521173

	; MRC2 in ARM5+
	MRC2	P1,2,R1,CR2,CR3,3 ; FE521173
;	MRCEQ2	P1,2,R1,CR2,CR3,3 ; INVALID
;	MRC2EQ	P1,2,R1,CR2,CR3,3 ; INVALID

	; MRS in ARM3+
	MRS	R1,CPSR		; E10F1000
	MRS	R1,SPSR		; E14F1000
	MRSEQ	R1,SPSR		; 014F1000

	; MSR in ARM3+
	MSR	CPSR_cxsf,#1	; E32FF001
	MSR	CPSR_cxsf,R1	; E12FF001
	MSR	SPSR_cxsf,#1	; E36FF001
	MSR	SPSR_cxsf,R1	; E16FF001
	MSREQ	CPSR_c,#1	; 0321F001
	MSR	CPSR_x,#1	; E322F001
	MSR	CPSR_s,#1	; E324F001
	MSR	CPSR_f,#1	; E328F001
;	MSR	CPSR_cc,#1	; ILLEGAL

	; MUL in ARM2+
	MUL	R1,R2,R3	; E0010392
	MULS	R1,R2,R3	; E0110392
	MULEQ	R1,R2,R3	; 00010392
	MULEQS	R1,R2,R3	; 00110392

	MVN	R1,R2		; E1E01002
	MVNS	R1,R2		; E1F01002
	MVNEQ	R1,R2		; 01E01002
	MVNEQS	R1,R2		; 01F01002

	NOP			; E1A00000 (MOV R0,R0)

	ORR	R1,R2,R3	; E1821003
	ORRS	R1,R2,R3	; E1921003
	ORREQ	R1,R2,R3	; 01821003
	ORREQS	R1,R2,R3	; 01921003

	RSB	R1,R2,R3	; E0621003
	RSBS	R1,R2,R3	; E0721003
	RSBEQ	R1,R2,R3	; 00621003
	RSBEQS	R1,R2,R3	; 00721003

	RSC	R1,R2,R3	; E0E21003
	RSCS	R1,R2,R3	; E0F21003
	RSCEQ	R1,R2,R3	; 00E21003
	RSCEQS	R1,R2,R3	; 00F21003

	SBC	R1,R2,R3	; E0C21003
	SBCS	R1,R2,R3	; E0D21003
	SBCEQ	R1,R2,R3	; 00C21003
	SBCEQS	R1,R2,R3	; 00D21003

	; SMLAL in ARM-M
	SMLAL	R1,R2,R3,R4	; E0E21493
	SMLALS	R1,R2,R3,R4	; E0F21493
	SMLALEQ	R1,R2,R3,R4	; 00E21493
	SMLALEQS R1,R2,R3,R4	; 00F21493

	; SMULL in ARM-M
	SMULL	R1,R2,R3,R4	; E0C21493
	SMULLS	R1,R2,R3,R4	; E0D21493
	SMULLEQ	R1,R2,R3,R4	; 00C21493
	SMULLEQS R1,R2,R3,R4	; 00D21493

	; STC in ARM5+
	STC	P1,CR1,[R2],{0}	; EC821100
	STCL	P1,CR1,[R2],{0}	; ECC21100
	STCEQ	P1,CR1,[R2],{0}	; 0C821100
	STCEQL	P1,CR1,[R2],{0}	; 0CC21100

	; STC2 in ARM5+
	STC2	P1,CR1,[R2],{0}	; FC821100
	STC2L	P1,CR1,[R2],{0}	; FCC21100

	STMIA	SP,{r0-r9}	; E88D03FF
	STMEQIA	SP,{r0-r9}	; 088D03FF
	STMIB	SP,{r0-r9}	; E98D03FF
	STMEQIB	SP,{r0-r9}	; 098D03FF
	STMDA	SP,{r0-r9}	; E80D03FF
	STMEQDA	SP,{r0-r9}	; 080D03FF
	STMDB	SP,{r0-r9}	; E90D03FF
	STMEQDB	SP,{r0-r9}	; 090D03FF

	STMEA	SP,{r0-r9}	; E88D03FF
	STMEQEA	SP,{r0-r9}	; 088D03FF
	STMED	SP,{r0-r9}	; E80D03FF
	STMEQED	SP,{r0-r9}	; 080D03FF
	STMFA	SP,{r0-r9}	; E98D03FF
	STMEQFA	SP,{r0-r9}	; 098D03FF
	STMFD	SP,{r0-r9}	; E90D03FF
	STMEQFD	SP,{r0-r9}	; 090D03FF

	STMIA	SP!,{r0-r9}	; E8AD03FF

	; STRH in ARM4+
	STR	R1,[R2,+R3]	; E7821003
	STRB	R1,[R2,+R3]	; E7C21003
	STRBT	R1,[R2],+R3	; E6E21003
	STRH	R1,[R2,+R3]	; E18210B3
;	STRSB	R1,[R2,+R3]	; ILLEGAL
;	STRSH	R1,[R2,+R3]	; ILLEGAL
	STRT	R1,[R2],+R3	; E6A21003
;	STRX	R1,[R2,+R3]	; INVALID
;	STRBTX	R1,[R2],+R3	; INVALID

	SUB	R1,R2,R3	; E0421003
	SUBS	R1,R2,R3	; E0521003
	SUBEQ	R1,R2,R3	; 00421003
	SUBEQS	R1,R2,R3	; 00521003

	SWI	'ABC'		; EF414243
	SWIEQ	'ABC'		; 0F414243

	; SWP in ARM2a,ARM3+
	SWP	R1,R2,[R3]	; E1031092
	SWPEQ	R1,R2,[R3]	; 01031092
	SWPB	R1,R2,[R3]	; E1431092
	SWPEQB	R1,R2,[R3]	; 01431092

	TEQ	R1,R2		; E1310002
	TEQEQ	R1,R2		; 01310002

	TST	R1,R2		; E1110002
	TSTEQ	R1,R2		; 01110002

	; UMLAL in ARMM
	UMLAL	R1,R2,R3,R4	; E0A21493
	UMLALS	R1,R2,R3,R4	; E0B21493
	UMLALEQ	R1,R2,R3,R4	; 00A21493
	UMLALEQS R1,R2,R3,R4	; 00B21493

	; UMULL in ARMM
	UMULL	R1,R2,R3,R4	; E0821493
	UMULLS	R1,R2,R3,R4	; E0921493
	UMULLEQ	R1,R2,R3,R4	; 00821493
	UMULLEQS R1,R2,R3,R4	; 00921493

; === shift addressing modes ===

	ADC	R1,R2,#3		; E2A21003
	ADC	R1,R2,R3		; E0A21003
	ADC	R1,R2,R3,LSL #8		; E0A21403
	ADC	R1,R2,R3,LSL R4		; E0A21413
	ADC	R1,R2,R3,LSR #8		; E0A21423
	ADC	R1,R2,R3,LSR R4		; E0A21433
	ADC	R1,R2,R3,ASR #8		; E0A21443
	ADC	R1,R2,R3,ASR R4		; E0A21453
	ADC	R1,R2,R3,ROR #8		; E0A21463
	ADC	R1,R2,R3,ROR R4		; E0A21473
	ADC	R1,R2,R3,RRX		; E0A21063

; === LDR/STR addressing modes (except BT/T) ===

	LDR	R1,[R2]			; E5121000
	LDR	R1,[R2]!		; E5B21000 (?)

	LDR	R1,[R2,#0]		; E5921000
	LDR	R1,[R2,#1]		; E5921001
	LDR	R1,[R2,#-1]		; E5121001
	LDR	R1,[R2,#+1]!		; E5B21001

	LDR	R1,[R2,R3]		; E7921003
	LDR	R1,[R2,+R3]		; E7921003
	LDR	R1,[R2,-R3]		; E7121003
	LDR	R1,[R2,+R3]!		; E7B21003

	LDR	R1,[R2,R3,LSL #1]	; E7921083
	LDR	R1,[R2,R3,LSR #1]	; E79210A3
	LDR	R1,[R2,R3,ASL #1]	; E79210B3
	LDR	R1,[R2,R3,ASR #1]	; E79210C3
	LDR	R1,[R2,R3,ROR #1]	; E79210E3
	LDR	R1,[R2,R3,ROR #1]!	; E7B210E3
	LDR	R1,[R2,R3,RRX]		; E7921063
	LDR	R1,[R2,R3,RRX]!		; E7B21063

; === LDR/STR addressing modes (including BT/T) ===

	LDR	R1,[R2],#0		; E4921000
	LDR	R1,[R2],#1		; E4921001
	LDR	R1,[R2],#-1		; E4121001

	LDR	R1,[R2],R3		; E6921003
	LDR	R1,[R2],+R3		; E6921003
	LDR	R1,[R2],-R3		; E6121003

	LDR	R1,[R2],R3,LSL #1	; E6921083
	LDR	R1,[R2],R3,LSR #1	; E69210A3
	LDR	R1,[R2],R3,ASL #1	; E6921083
	LDR	R1,[R2],R3,ASR #1	; E69210C3
	LDR	R1,[R2],R3,ROR #1	; E69210E3
	LDR	R1,[R2],R3,RRX		; E6921063

; === LDRH/LDRSB/LDRSH addressing modes ===

	LDRH	R1,[R2]			; E15210B0
	LDRH	R1,[R2]!		; E1F210B0 (?)

	LDRH	R1,[R2,#0]		; E1D210B0
	LDRH	R1,[R2,#1]		; E1D210B1
	LDRH	R1,[R2,#-1]		; E15210B1
	LDRH	R1,[R2,#+1]!		; E1F210B1

	LDRH	R1,[R2,R3]		; E19210B3
	LDRH	R1,[R2,+R3]		; E19210B3
	LDRH	R1,[R2,-R3]!		; E13210B3

	LDRH	R1,[R2],#0		; E0D210B0
	LDRH	R1,[R2],#1		; E0D210B1
	LDRH	R1,[R2],#-1		; E05210B1
	LDRH	R1,[R2],#+1		; E0D210B1

	LDRH	R1,[R2],R3		; E09210B3
	LDRH	R1,[R2],+R3		; E09210B3
	LDRH	R1,[R2],-R3		; E01210B3

; === coprocessor addrmodes ===

	LDC	P1,CR1,[R2]		; ED121100
	LDC	P1,CR1,[R2]!		; EDB21100 (?)

	LDC	P1,CR1,[R2,#0]		; ED921100
	LDC	P1,CR1,[R2,#4]		; ED921101
	LDC	P1,CR1,[R2,#4]		; ED921101
	LDC	P1,CR1,[R2,#-4]		; ED121101
	LDC	P1,CR1,[R2,#+4]!	; EDB21101

	LDC	P1,CR1,[R2],#0		; ECB21100
	LDC	P1,CR1,[R2],#4		; ECB21101
	LDC	P1,CR1,[R2],#-4		; EC321101

	LDC	P1,CR1,[R2],{255}	; EC9211FF
// asmnano.c - copyright 2021 Lennie Araki

#define versionName "Nano 16-bit assembler"
#include "asmx.h"

enum nano_types
{
	o_AluImmReg,    // two-operand ALU Rx,#Imm or Rx,Ry
	o_MulDiv,		// MUL/DIV (reserved)
	o_Shift,        // ASR/LSR
	o_Immed8,       // BKPT/SWI
	o_RegImm8,		// mov Rx,#Imm
	o_Branch,       // B
	o_BranchCC,     // Bcc
	o_LbSb,         // LB/SB
	o_LdSt,         // LW/SW
	o_Immed12,      // IMM #prefix
	o_Implied       // NOP
};

//
//  Conditional Branch
//
enum nano_cond
{
	COND_BEQ,		/* Branch EQual */
	COND_BNE,		/* Branch Not Equal */
	COND_BHI,		/* Branch HIgher */
	COND_BLS,		/* Branch Lower/Same */
	COND_BHS,		/* Branch Higher/Same */
	COND_BLO,		/* Branch LOwer */
	COND_BGT,		/* Branch if Greater Than */
	COND_BLE,		/* Branch if Less/Equal */
	COND_BGE,		/* Branch if Greater/Equal */
	COND_BLT,		/* Branch if Less Than */
	COND_BRA,		/* BRanch Always */
	COND_RET,		/* RETurn */
	COND_BD,		/* Branch reserved D */
	COND_BE,		/* Branch reserved E */
	COND_BF,		/* Repeat reserved F */
} BRANCH_COND;

const char nano_r0_r15_SP[] =
	"R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15 SP LR";
const char nano_r0_r15[] =
	"R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15";

struct OpcdRec Nano_opcdTab[] =
{
	{"ADD",   o_AluImmReg,	0x0000},
	{"SUB",   o_AluImmReg,	0x1001},
	{"ADC",   o_AluImmReg,	0x2002},
	{"SBC",   o_AluImmReg,	0x3003},
	{"RSUB",  o_AluImmReg,	0x4004},
	{"AND",   o_AluImmReg,	0x5005},
	{"OR",    o_AluImmReg,	0x6006},
	{"XOR",   o_AluImmReg,	0x7007},

	{"LB",    o_LbSb,		0x8000},
	{"SB",    o_LbSb,		0x9000},

	{"MUL",   o_Shift,		0xA008},
	{"DIV",   o_Shift,		0xA009},
	{"ASR",   o_Shift,		0xA00A},
	{"LSR",   o_Shift,		0xA00B},

	{"BRA",   o_Branch, 	0xB000},
	{"SWI",   o_Immed8, 	0xBF00},

	{"BEQ",   o_Branch, 	0xB000},
	{"BNE",   o_Branch, 	0xB100},
	{"BHI",   o_Branch, 	0xB200},
	{"BLS",   o_Branch, 	0xB300},
	{"BHS",   o_Branch, 	0xB400},
	{"BLO",   o_Branch, 	0xB500},
	{"BGT",   o_Branch, 	0xB600},
	{"BLE",   o_Branch, 	0xB700},
	{"BGE",   o_Branch, 	0xB800},
	{"BLT",   o_Branch, 	0xB900},
	{"BRA",   o_Branch, 	0xBA00},
	{"RTS",   o_Branch, 	0xBB00},
	{"JAL",   o_Branch, 	0xBC00},
	{"BDX",   o_Branch, 	0xBD00},
	{"BEX",   o_Branch, 	0xBE00},
	{"BFX",   o_Branch, 	0xBF00},

	{"MOV",   o_RegImm8,	0xC000},

	{"LW",    o_LdSt,		0xD000},
	{"SW",    o_LdSt,		0xE000},

	{"IMM",   o_Immed12,	0xF000},

	{"",      o_Illegal,	0}
};

// --------------------------------------------------------------

int RelBranch(int width, int instrLen)
{
	long val;
	long limit;

	limit = (1 << width) - 1;

	val = Eval();
	val = val - locPtr - instrLen;
	if (!errFlag && ((val & 1) || val < ~limit || val > limit))
		Error("Branch out of range");

	return val;
}


int Nano_DoCPUOpcode(int typ, int parm)
{
	int     val;
	Str255  word;
	char    *oldLine;
	int     token;
	int    	Rx,Ry;
	u_short regbits;

	switch(typ)
	{
		case o_AluImmReg:		// two-operand ALU Rx,#imm or Rx,Ry
			Rx = GetReg(nano_r0_r15_SP);
			if (Rx > 15) Rx = Rx - 2; // SP LR -> R14 R15
			if (CheckReg(Rx)) break;

			if (Comma()) break;

			oldLine = linePtr;
			token = GetWord(word);
			if (token == '#')
			{ // Rd,#immed8 / SP,#immed7
				if (Rx <= 15)
				{
					val = EvalByte();
					InstrW(parm & 0xF000 | (Rx << 8) | (val & 0xFF));
				}
			}
			else
			{ // Rx,Ry
				linePtr = oldLine;

				Ry = GetReg(nano_r0_r15_SP);
				if (Ry > 15) Ry = Ry - 2; // SP LR -> R14 R15
				if (CheckReg(Ry)) break;
				else // ALU Rx,Ry
					InstrW(0xA000 | (parm & 0x000F) | (Rx << 8) | (Ry << 4));
			}
			break;

		case o_MulDiv:		// MUL/DIV
			Rx = GetReg(nano_r0_r15);
			if (CheckReg(Rx)) break;

			if (Comma()) break;

			Ry = GetReg(nano_r0_r15);
			if (CheckReg(Ry)) break;

			InstrW(0xA000 | (parm & 0x000F) | (Rx << 12) | (Ry << 4));
			break;

		case o_Shift:        // ASR/LSL/LSR
			Rx = GetReg(nano_r0_r15);
			if (CheckReg(Rx)) break;

			if (Comma()) break;
			if (Expect("#")) break;
			if (Expect("1")) break;

			InstrW((parm & 0xFFFF) | (Rx << 12) | Ry << 8);

			break;

		case o_Immed8:       // BKPT/SWI
			val = EvalByte();
			InstrW(parm | (val & 0xFF));
			break;

		case o_RegImm8:    // mov #Imm
			Rx = GetReg(nano_r0_r15_SP);
			if (Rx > 15) Rx = Rx - 2; // SP LR -> R14 R15
			if (CheckReg(Rx)) break;

			if (Comma()) break;
			val = EvalByte();
			InstrW(parm | (Rx << 12) | (val & 0xFF));
			break;

		case o_Branch:       // Branch
			val = RelBranch(9,2);
			InstrW(parm | ((val >> 1) & 0xFF));
			break;

		case o_LbSb:		// LB/SB
			Rx = GetReg(nano_r0_r15_SP);
			if (Rx > 15) Rx = Rx - 2; // SP LR -> R14 R15
			if (CheckReg(Rx)) break;

			if (Comma()) break;
			val = Eval();
			if (Expect("[")) break;
			Ry = GetReg(nano_r0_r15_SP);
			if (Ry > 15) Ry = Ry - 2; // SP LR -> R14 R15
			if (CheckReg(Ry)) break;
			if (Expect("]")) break;
			InstrW(parm | (Rx << 8) | (Ry << 4) | val & 0x0F);
			break;

		case o_LdSt:		// LW/SW
			Rx = GetReg(nano_r0_r15_SP);
			if (Rx > 15) Rx = Rx - 2; // SP LR -> R14 R15
			if (CheckReg(Rx)) break;

			if (Comma()) break;
			val = Eval();
			if (Expect("[")) break;
			Ry = GetReg(nano_r0_r15_SP);
			if (Ry > 15) Ry = Ry - 2; // SP LR -> R14 R15
			if (CheckReg(Ry)) break;
			if (Expect("]")) break;
			InstrW(parm | (Rx << 8) | (Ry << 4) | (val >> 1) & 0x0F);
			break;

		case o_Implied:      // NOP
			InstrW(parm);
			break;

		default:
			return 0;
			break;
	}

	if (locPtr & 1)
	{
		Error("Code at non-word-aligned address");
		// deposit an extra byte to reset alignment and prevent further errors
		InstrAddB(0);
		// note: Inserting bytes in front won't work because offsets have already been assembled.
		// The line could be re-assembled by recursively calling DoCPUOpcode, but then
		// the label before the instruction would still be at the odd address.
	}

	return 1;
}


void AsmNanoInit(void)
{
	char* p = AddAsm(versionName, &Nano_DoCPUOpcode, NULL, NULL);
	AddCPU(p, "NANO16"   , 0, BIG_END, ADDR_16, LIST_16, 8, 0, Nano_opcdTab);
}

.ORIG x3000
PROMPT	.STRINGZ "Enter a legal LC-3 instruction: "
ERROR_MESSAGE	.STRINGZ "The string you entered is not a valid instruction.\nEnter a legal LC-3 instruction: "
NEWLINE .STRINGZ "\n"
LETTERS .FILL x2FFF 
		BR SET
RESET	LEA R0,NEWLINE
		PUTS
SET		LEA R0,PROMPT
		PUTS
		BRnzp START
ERROR	LEA R0,ERROR_MESSAGE
		PUTS
START	LD R1,LETTERS
LOOP1	GETC
		OUT
		STR R0,R1,#0
		ADD R1,R1,#-1
		NOT R0,R0
		ADD R0,R0,#11
		BRz END
		BRnp LOOP1
END		LEA R0,NEWLINE
		PUTS
		LDI R1,C1
		LD R2,AU
		LD R3,al
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp BR_ ;move on to next first letter
		LDI R1,C2
		LD R2,NU
		LD R3,nl
		ADD R0,R1,R2
		BRz #10
		ADD R0,R1,R3
		BRz #8
		LDI R1,C2
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz #11
		ADD R0,R1,R3
		BRz #9
		JSR ERROR ;error
		LDI R1,C3
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz _AND
		ADD R0,R1,R3
		BRz _AND
		JSR ERROR ;error
		LDI R1,C3
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz _ADD
		ADD R0,R1,R3
		BRz _ADD
		JSR ERROR ;error
_ADD	LDI R4,C4
		LD R1,C6
		ADD R1,R1,R4
		BRnp ERROR
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		LD R0,O
		OUT
		JSR RESET
_AND	LDI R4,C4
		LD R1,C6
		ADD R1,R1,R4
		BRnp ERROR
		LD R0,Z
		OUT
		LD R0,O
		OUT
		LD R0,Z
		OUT
		LD R0,O
		OUT
		JSR RESET
BR_		LDI R1,C1
		LD R2,BU
		LD R3,bl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp JMP_ ;move on to next first letter
		LDI R1,C2
		LD R2,RUP
		LD R3,rlo
		ADD R0,R1,R2
		BRz _BR
		ADD R0,R1,R3
		BRz _BR
		JSR ERROR ;error
BU		.FILL xFFBE
bl		.FILL xFF9E
_BR		LDI R3,C3
		LD R1,C6
		ADD R1,R1,R3
		BRnp ERROR
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		JSR RESET
JMP_	LDI R1,C1
		LD R2,JU
		LD R3,jl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp JSR_ ;move on to next first letter
		LDI R1,C2
		LD R2,MU
		LD R3,ml
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp JSR_ ;move on to next first letter
		LDI R1,C3
		LD R2,PU
		LD R3,pl
		ADD R0,R1,R2
		BRz _JMP
		ADD R0,R1,R3
		BRz _JMP
		JSR ERROR ;error
MU		.FILL xFFB3
ml		.FILL xFF93
PU		.FILL xFFB0
pl		.FILL xFF90
_JMP	LDI R4,C4
		LD R1,C6
		ADD R1,R1,R4
		BRnp ERROR
		LD R0,O
		OUT
		LD R0,O
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		JSR RESET
JSR_	LDI R1,C1
		LD R2,JU
		LD R3,jl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp JSRR_ ;move on to next first letter
		LDI R1,C2
		LD R2,SU
		LD R3,sl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp JSRR_ ;move on to next first letter
		LDI R1,C3
		LD R2,RUP
		LD R3,rlo
		ADD R0,R1,R2
		BRz _JSR
		ADD R0,R1,R3
		BRz _JSR
		BRnp JSRR_ ;move on to next first letter
JU		.FILL xFFB6
jl		.FILL xFF96
DU		.FILL xFFBC
dl		.FILL xFF9C
_JSR	LDI R4,C4
		LD R1,C6
		ADD R1,R1,R4
		BRnp JSRR_
		LD R0,Z
		OUT
		LD R0,O
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		JSR RESET
JSRR_	LDI R1,C1
		LD R2,JU
		LD R3,jl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LD_ ;move on to next first letter
		LDI R1,C2
		LD R2,SU
		LD R3,sl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LD_ ;move on to next first letter
		LDI R1,C3
		LD R2,RUP
		LD R3,rlo
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LD_ ;move on to next first letter
		LDI R1,C4
		LD R2,RUP
		LD R3,rlo
		ADD R0,R1,R2
		BRz _JSRR
		ADD R0,R1,R3
		BRz _JSRR
		JSR ERROR ;error
AU		.FILL xFFBF
al		.FILL xFF9F
_JSRR	LDI R5,C5
		LD R1,C6
		ADD R1,R1,R5
		BRnp ERROR
		LD R0,Z
		OUT
		LD R0,O
		OUT
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		JSR RESET
LD_		LDI R1,C1
		LD R2,LU
		LD R3,ll
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LDI_ ;move on to next first letter
		LDI R1,C2
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz _LD
		ADD R0,R1,R3
		BRz _LD
		BRnp LDI_ ;move on to next first letter
NU		.FILL xFFB2
nl		.FILL xFF92
_LD		LDI R3,C3
		LD R1,C6
		ADD R1,R1,R3
		BRnp LDI_
		LD R0,Z
		OUT
		LD R0,Z
		OUT
		LD R0,O
		OUT
		LD R0,Z
		OUT
		JSR RESET
Z		.FILL xFF30
O		.FILL x0031
C1		.FILL x2FFF
C2		.FILL x2FFE
C3		.FILL x2FFD
C4		.FILL x2FFC
C5		.FILL x2FFB
C6		.FILL xFFF6
RUP 	.FILL xFFAE
rlo		.FILL xFF8E
LDI_	LDI R1,C1
		LD R2,LU
		LD R3,ll
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LDR_ ;move on to next first letter
		LDI R1,C2
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LDR_ ;move on to next first letter
		LDI R1,C3
		LD R2,IU
		LD R3,il
		ADD R0,R1,R2
		BRz _LDI
		ADD R0,R1,R3
		BRz _LDI
		BRnp LDR_ ;move on to next first letter
_LDI	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,zero
		OUT
		LD R0,one
		OUT
		LD R0,zero
		OUT
		JSR RESET
LDR_	LDI R1,L1
		LD R2,LU
		LD R3,ll
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LEA_ ;move on to next first letter
		LDI R1,L2
		LD R2,DU
		LD R3,dl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp LEA_ ;move on to next first letter
		LDI R1,L3
		LD R2,RU
		LD R3,rl
		ADD R0,R1,R2
		BRz _LDR
		ADD R0,R1,R3
		BRz _LDR
		BRnp LEA_ ;move on to next first letter
LU		.FILL xFFB4
ll		.FILL xFF94
_LDR	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,zero
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,zero
		OUT
		JSR RESET
LEA_	LDI R1,L1
		LD R2,LU
		LD R3,ll
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp NOT_ ;move on to next first letter
		LDI R1,L2
		LD R2,EU
		LD R3,el
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp NOT_ ;move on to next first letter
		LDI R1,L3
		LD R2,AU
		LD R3,al
		ADD R0,R1,R2
		BRz _LEA
		ADD R0,R1,R3
		BRz _LEA
		JSR ERROR ;error
SU		.FILL xFFAD
sl		.FILL xFF8D
_LEA	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,zero
		OUT
		JSR RESET
NOT_	LDI R1,L1
		LD R2,NU
		LD R3,nl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp RET_ ;move on to next first letter
		LDI R1,L2
		LD R2,OU
		LD R3,ol
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp RET_ ;move on to next first letter
		LDI R1,L3
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz _NOT
		ADD R0,R1,R3
		BRz _NOT
		JSR ERROR ;error
_NOT	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,zero
		OUT
		LD R0,zero
		OUT
		LD R0,one
		OUT
		JSR RESET
EU		.FILL xFFBB
el		.FILL xFF9B
OU		.FILL xFFB1
ol		.FILL xFF91
AUP		.FILL xFFBF
alo		.FILL xFF9F
zero	.FILL xFF30
one		.FILL x0031
L1		.FILL x2FFF
L2		.FILL x2FFE
L3		.FILL x2FFD
RET_	LDI R1,L1
		LD R2,RU
		LD R3,rl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp RTI_ ;move on to next first letter
		LDI R1,L2
		LD R2,EU
		LD R3,el
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp RTI_ ;move on to next first letter
		LDI R1,L3
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz _RET
		ADD R0,R1,R3
		BRz _RET
		JSR ERROR ;error
L5		.FILL x2FFB
L4		.FILL x2FFC
IU		.FILL xFFB7
il		.FILL xFF97
RU		.FILL xFFAE
rl		.FILL xFF8E
return	.FILL xFFF6
_RET	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,zero
		OUT
		LD R0,zero
		OUT
		JSR RESET
RTI_	LDI R1,L1
		LD R2,RU
		LD R3,rl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp ST_ ;move on to next first letter
		LDI R1,L2
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp ST_ ;move on to next first letter
		LDI R1,L3
		LD R2,IU
		LD R3,il
		ADD R0,R1,R2
		BRz _RTI
		ADD R0,R1,R3
		BRz _RTI
		JSR ERROR ;error
_RTI	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,zero
		OUT
		LD R0,zero
		OUT
		LD R0,zero
		OUT
		JSR RESET
ST_		LDI R1,L1
		LD R2,SU
		LD R3,sl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp STI_ ;move on to next first letter
		LDI R1,L2
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz _ST
		ADD R0,R1,R3
		BRz _ST
		BRnp STI_ ;move on to next first letter
TU		.FILL xFFAC
tl		.FILL xFF8C
_ST		LDI R3,L3
		LD R1,return
		ADD R1,R1,R3
		BRnp STI_
		LD R0,zero
		OUT
		LD R0,zero
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		JSR RESET
STI_	LDI R1,L1
		LD R2,SU
		LD R3,sl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp STR_ ;move on to next first letter
		LDI R1,L2
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp STR_ ;move on to next first letter
		LDI R1,L3
		LD R2,IU
		LD R3,il
		ADD R0,R1,R2
		BRz _STI
		ADD R0,R1,R3
		BRz _STI
		BRnp STR_ ;move on to next first letter
_STI	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,zero
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		JSR RESET
STR_	LDI R1,L1
		LD R2,SU
		LD R3,sl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp TRAP_ ;move on to next first letter
		LDI R1,L2
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp TRAP_ ;move on to next first letter
		LDI R1,L3
		LD R2,RU
		LD R3,rl
		ADD R0,R1,R2
		BRz _STR
		ADD R0,R1,R3
		BRz _STR
		JSR ERROR ;error
_STR	LDI R4,L4
		LD R1,return
		ADD R1,R1,R4
		BRz #1
		JSR ERROR
		LD R0,zero
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		JSR RESET
TRAP_	LDI R1,L1
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp QUIT_
		LDI R1,L2
		LD R2,RU
		LD R3,rl
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp QUIT_
		LDI R1,L3
		LD R2,AUP
		LD R3,alo
		ADD R0,R1,R2
		BRz #2
		ADD R0,R1,R3
		BRnp QUIT_
		LDI R1,L4
		LD R2,PUP
		LD R3,plo
		ADD R0,R1,R2
		BRz _TRAP
		ADD R0,R1,R3
		BRz _TRAP
		BRnp QUIT_
PUP		.FILL xFFB0
plo		.FILL xFF90
_TRAP	LDI R5,L5
		LD R1,return
		ADD R1,R1,R5
		BRz #1
		JSR ERROR
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		LD R0,one
		OUT
		JSR RESET
QU		.FILL xFFAF
ql		.FILL xFF8F
UU		.FILL xFFAB
ul		.FILL xFF8B
QUIT_	LDI R1,L1
		LD R2,QU
		LD R3,ql
		ADD R0,R1,R2
		BRz #3
		ADD R0,R1,R3
		BRz #1
		JSR ERROR
		LDI R1,L2
		LD R2,UU
		LD R3,ul
		ADD R0,R1,R2
		BRz #3
		ADD R0,R1,R3
		BRz #1
		JSR ERROR
		LDI R1,L3
		LD R2,IU
		LD R3,il
		ADD R0,R1,R2
		BRz #3
		ADD R0,R1,R3
		BRz #1
		JSR ERROR
		LDI R1,L4
		LD R2,TU
		LD R3,tl
		ADD R0,R1,R2
		BRz #3
		ADD R0,R1,R3
		BRz #1
		JSR ERROR
		LDI R1,L5
		LD R2,return
		ADD R1,R1,R2
		BRz #1
		JSR ERROR
		HALT
.END
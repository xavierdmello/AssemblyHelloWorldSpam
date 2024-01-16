.global _start
.equ HELLOAMOUNT, 100000
_start:
	LDR R11, =HELLOAMOUNT
	BL startloop
	
	MOV R7, #1
	SWI 0
	
sayHi:
	MOV R0, #1
	LDR R1, =message
	LDR R2, =len
	MOV R7, #4
	SWI 0
	
	ADD R3, R3, #1
	BX lr

startloop:
	PUSH {lr}
nextloop:
	BL sayHi
	CMP R3, R11
	BLT nextloop
	POP {lr}
	BX lr
	

.data
message:
	.string "Hello World! "
len = .-message
	
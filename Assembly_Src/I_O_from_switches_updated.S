.equ SWITCHES, 0x11000000
.equ BUS_OUT_0, 0x110A0000
.equ BUS_OUT_1, 0x110B0000
.equ BUS_OUT_2, 0x110C0000
.equ BUS_OUT_3, 0x110D0000
.equ SSEG, 0x110E0000


.text

.global init
.type init, @function
##################################
##                              ##
## Func Gen ISR Control Routine ##
##                              ##  
##################################
init:
	li x6, 1
	csrw mie, x6
	la x6, ISR
	csrw mtvec, x6
	li x8, 0 #interrupt_counter
	li x6, SWITCHES
	li x20, BUS_OUT_0
	li x21, BUS_OUT_1
	li x22, BUS_OUT_2
	li x23, BUS_OUT_3
	li x24, SSEG
	li x25, 12
	sw x25, 0(x24)
	j main
main:
	addi x0,x0,0
	addi x0,x0,0
	j main
ISR:
	csrw mie, 0
	bne x8,x0,next1 
	lw x7, 0(x6) #loading scaling values for cos1 and cos2
	slli x7, x7, 16 
	addi x8, x8, 1
	li x25, 34
	sw x25, 0(x24)
	beq x0,x0, finish
next1:
	li x9, 1
	bne x8, x9, next2
	lw x5, 0(x6) #loading scaling values for cos3 and cos4
	add x7,x7,x5
	sw x7, 0(x20) #store into input bus 0
	addi x8, x8, 1
	li x25, 56
	sw x25, 0(x24)
	beq x0,x0, finish
next2:
	li x9, 2
	bne x8, x9, next3
	lw x7,0(x6) #loading scaling values for cos5 and cos6
	slli x7, x7, 16
	addi x8, x8, 1
	li x25, 78
	sw x25, 0(x24)
	beq x0, x0, finish
next3:
	li x9, 3
	bne x8, x9, next4
	lw x5,0(x6) #loading scaling values for cos7 and cos8
	add x7,x7,x5
	sw x7, (0)x21 #store into input bus 1
	addi x8, x8, 1
	li x25, 112
	sw x25, 0(x24)
	beq x0,x0, finish
next4:
	li x9, 4
	bne x8, x9, next5
	lw x7, 0(x6) #loading scaling values for sin1 and sin2
	slli x7, x7, 16 
	addi x8, x8, 1
	li x25, 134
	sw x25, 0(x24)
	beq x0,x0,finish
next5:
	li x9, 5
	bne x8, x9, next6
	lw x5,0(x6) #loading scaling values for sin3 and sin4
	add x7,x7,x5
	sw x7, 0(x22)
	addi x8, x8, 1
	li x25, 156
	sw x25, 0(x24)
	beq x0,x0, finish
next6:
	li x9, 6
	bne x8, x9, next7
	lw x7, 0(x6) #loading scaling values for sin5 and sin6
	slli x7, x7, 16 
	addi x8, x8, 1
	li x25, 178
	sw x25, 0(x24)
	beq x0,x0,finish
next7:
	li x9, 7
	bne x8, x9, reset_counter
	lw x5,0(x6) #loading scaling values for sin7 and sin8
	add x7,x7,x5
	sw x7, 0(x23)
	li x25, 012
	sw x25, 0(x24)
reset_counter:
	li x8, 0
finish:
	li x9, 1
	csrw mie, x9
	mret
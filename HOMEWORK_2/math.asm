.data
	prompt1: .asciiz "Enter a first number: "
	prompt2: .asciiz "Enter a second number: "
	newline: .asciiz "\n"

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# ask user for a first number
	li $v0, 5
	syscall
	move $t0, $v0
	
	# display prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# ask user for a second number
	li $v0, 5
	syscall
	move $t1, $v0
	
	# perform arithmetic operations
	add $t2, $t0, $t1
	sub $t3, $t0, $t1
	mul $t4, $t0, $t1
	div $t0, $t1
	mflo $t5 # store the quotient
	mfhi $t6 # store the remainder
	
	# print results of arithmetic operations
	# print sum
	li $v0, 1
	move $a0, $t2
	syscall 
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print difference
	li $v0, 1
	move $a0, $t3
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print multiplication
	li $v0, 1
	move $a0, $t4
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print quotient
	li $v0, 1
	move $a0, $t5
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print remainder
	li $v0, 1
	move $a0, $t6
	syscall
	
	# exit from program
	li $v0, 10
	syscall
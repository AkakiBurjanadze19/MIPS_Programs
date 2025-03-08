.data
	newline: .asciiz "\n"
	addMessage: .asciiz "Addition: "
	subMessage: .asciiz "Subtraction: "
	mulMessage: .asciiz "Multiplication: "
	divMessage: .asciiz "Division: (quotient) "
	remMessage: .asciiz "Division: (remainder) "
	
.text
main:
	# init variables
	li $t0, 20
	li $t1, 10

	# perform addition and print the result
	li $v0, 4
	la $a0, addMessage
	syscall
	li $v0, 1
	add $t2, $t0, $t1
	add $a0, $zero, $t2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# perform subtraction and print the result
	li $v0, 4
	la $a0, subMessage
	syscall
	li $v0, 1
	sub $t2, $t0, $t1
	add $a0, $zero, $t2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# perform multiplication and print the result
	li $v0, 4
	la $a0, mulMessage
	syscall
	li $v0, 1
	mul $t2, $t0, $t1
	add $a0, $zero, $t2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# perform division and print the result (quotient)
	li $v0, 4
	la $a0, divMessage
	syscall
	li $v0, 1
	div $t2, $t0, $t1
	mflo $t3
	add $a0, $zero, $t3
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# perform division and print the result (remainder)
	li $v0, 4
	la $a0, remMessage
	syscall
	li $v0, 1
	div $t2, $t0, $t1
	mfhi $t3
	add $a0, $zero, $t3
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# exit from program
	li $v0, 10
	syscall
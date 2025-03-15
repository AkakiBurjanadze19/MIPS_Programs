.data
	prompt1: .asciiz "Enter a first number: "
	prompt2: .asciiz "Enter a second number: "
	quotientMessage: .asciiz "Quotient: "
	remainderMessage: .asciiz "Remainder: "
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
	
	div $t0, $t1 # perform division ($t0 / $t1)
	mflo $t2 # store quotient
	mfhi $t3 # store remainder
	
	# print "Quotient: "
	li $v0, 4
	la $a0, quotientMessage
	syscall
	
	# print actual quotient
	li $v0, 1
	move $a0, $t2
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print "Remainder: "
	li $v0, 4
	la $a0, remainderMessage
	syscall
	
	# print actual remainder
	li $v0, 1
	move $a0, $t3
	syscall
	
	# exit from program
	j exit
	
exit:
	# exit from program
	li $v0, 10
	syscall
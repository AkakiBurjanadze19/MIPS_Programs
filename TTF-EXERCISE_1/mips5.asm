.data
	message: .asciiz "Sum: "
	newline: .asciiz "\n"

.text
main:	
	# print "Sum: "
	li $v0, 4
	la $a0, message
	syscall
	
	li $a0, 10 # first function argument
	li $a1, 20 # second function argument
	jal sum # call function
	
	# print actual sum
	move $a0, $v0
	li $v0, 1
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print "Sum: "
	li $v0, 4
	la $a0, message
	syscall
	
	li $a0, 10 # first function argument
	li $a1, 9 # second function argument
	jal sum # call function

	# print actual sum
	move $a0, $v0
	li $v0, 1
	syscall

	# exit from program
	li $v0, 10
	syscall

sum:
	add $v0, $a0, $a1
	jr $ra

# Program purpose: perform addition, subtraction, multiplication and division on two numbers

.text
main:
	# add two numbers and print the result
	li $v0, 1
	li $t1, 10
	li $t2, 20
	
	# perform addition
	add $t3, $t1, $t2
	
	add $a0, $zero, $t3
	syscall
	
	# print newline
	li $v0, 11
	li $a0, 10
	syscall
	
	# subtract two numbers and print the result
	li $v0, 1
	li $t1, 10
	li $t2, 20
	
	# perform subtraction
	sub $t3, $t1, $t2
	
	add $a0, $zero, $t3
	syscall
	
	# print newline
	li $v0, 11
	li $a0, 10
	syscall
	
	# multiply two numbers and print the result
	li $v0, 1
	li $t1, 10
	li $t2, 20
	
	# perform multiplication
	mul $t3, $t1, $t2
	
	add $a0, $zero, $t3
	syscall
	
	# print newline
	li $v0, 11
	li $a0, 10
	syscall
	
	# divide two numbers and print the result
	li $v0, 1
	li $t1, 10
	li $t2, 20
	
	# perform division
	div $t3, $t1, $t2
	
	add $a0, $zero, $t3
	syscall
	
	# print newline
	li $v0, 11
	li $a0, 10
	syscall
	
	# exit from the program
	li $v0, 10
	syscall
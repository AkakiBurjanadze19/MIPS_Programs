# Program purpose: swap values of two variables using XOR

.text
main:
	# init variables
	li $t1, 5
	li $t2, 10
	
	# swap variables using XOR operator
	xor $t1, $t1, $t2
	xor $t2, $t1, $t2
	xor $t1, $t1, $t2
	
	# print swapped value
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	
	# print newline
	li $v0, 11
	li $a0, 10
	syscall
	
	# print another swapped value
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# exit from the program
	li $v0, 10
	syscall
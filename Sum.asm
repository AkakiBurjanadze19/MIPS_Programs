# Program purpose: calculate the sum of numbers from 1 to 10

.text
main:
	# init variables
	li $t0, 10 # n
	li $t1, 0 # sum
	li $t2, 1 # counter
	
sum:
	# calculate sum
	bgt $t2, $t0, finish_program
	add $t1, $t1, $t2
	addi $t2, $t2, 1
	# repeat loop
	j sum

finish_program:
	# print sum
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	
	# exit from the program
	li $v0, 10
	syscall
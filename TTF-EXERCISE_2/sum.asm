.data
	prompt: .asciiz "Enter a number: "

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# ask user for a input
	li $v0, 5
	syscall
	move $t0, $v0
	
	# calculate sum from 1 to n. [1, n]
	li $t1, 0 # sum
	li $t2, 1 # counter
	
sum:
	# if counter >= sum, exit from program
	bgt $t2, $t0, exit
	
	add $t1, $t1, $t2 # increment sum
	addi $t2, $t2, 1 # increment counter
	
	# jump back to loop
	j sum
	
exit:
	# print sum
	li $v0, 1
	move $a0, $t1
	syscall
	
	# exit from program
	li $v0, 10
	syscall
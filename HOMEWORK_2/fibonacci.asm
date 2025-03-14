.data
	prompt: .asciiz "Enter a number: "
	space: .asciiz " "

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# ask user for a number
	li $v0, 5
	syscall
	move $t0, $v0
	
	# init variables
	li $t1, 0 # current fibonacci number
	li $t2, 1 # first fibonacci number
	li $t3, 0 # second fibonacci number
	li $t4, 2 # loop counter
	
	# print first two fibonacci numbers
	# print first fibonacci number
	li $v0, 1
	move $a0, $t1
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
	# print second fibonacci number
	li $v0, 1
	move $a0, $t2
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
fibonacci_loop:
	bgt $t4, $t0, exit
	
	add $t1, $t2, $t3 # current fibonacci number
	move $t3, $t2 # second = first
	move $t2, $t1 # first = current
	addi $t4, $t4, 1 # increment counter
	
	# print sequence
	li $v0, 1
	move $a0, $t1
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
	# repeat loop
	j fibonacci_loop

exit:
	# exit from program
	li $v0, 10
	syscall
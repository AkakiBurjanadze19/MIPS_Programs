.data
	prompt: .asciiz "Enter a number: "

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
	
	# init product and counter
	li $t1, 1 # product
	li $t2, 1 # counter
	
factorial_loop:
	bgt $t2, $t0, exit
	
	mul $t1, $t1, $t2
	addi $t2, $t2, 1
	
	j factorial_loop

exit:
	# print result
	li $v0, 1
	move $a0, $t1
	syscall

	# exit from program
	li $v0, 10
	syscall
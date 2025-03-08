.data
	num1: .word 10
	num2: .word 20
	message: .asciiz "a is between 10 and 20\n"

.text
main:
	# load values of the variables
	lw $t0, num1
	lw $t1, num2
	
	li $t3, 15
	
	# if out of range, exit from program
	ble $t3, $t0, exit
	bge $t3, $t1, exit
	
	# if condition is met, print the message
	li $v0, 4
	la $a0, message
	syscall

exit:
	# exit from program
	li $v0, 10
	syscall
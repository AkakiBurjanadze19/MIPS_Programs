.data
	array: .word 10 15 20 25 30

.text
main:
	la $t1, array # base address of an array
	lw $t0, 8($t1) # third element
	addi $t0, $t0, 5 # $t0 = $t0 + 5
	sw $t0, 8($t1) # store new number at its original place
	
	# print updated number
	li $v0, 1
	move $a0, $t0
	syscall
	
	# exit from program
	li $v0, 10
	syscall
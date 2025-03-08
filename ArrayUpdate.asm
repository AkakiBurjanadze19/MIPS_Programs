.data
	array: .word 10, 15, 20, 25, 30
	newline: .asciiz "\n"

.text
main:
	la $t0, array # load base address of array
	
	# update first element with a new value
	li $t1, 19
	sw $t1, 0($t0)
	
	# update last element with a new value
	li $t1, 119
	sw $t1, 16($t0)
	
	# load modified values and print them
	lw $t2, 0($t0)
	lw $t3, 16($t0)
	
	# print the first element
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print the last element
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	# exit from program
	li $v0, 10
	syscall
	
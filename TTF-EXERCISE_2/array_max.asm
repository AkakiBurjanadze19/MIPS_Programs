.data
	array: .word 5 12 8 3 17 9 20
	size: .word 7
	newline: .asciiz "\n"

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	lw $t2, 0($t0) # initial max
	add $t3, $t0, 4 # start from the second element
	li $t4, 1 # counter
	
find_max:
	bge $t4, $t1, exit
	
	# load the current element
	lw $t5, 0($t3)
	
	# compare current to initial max
	ble $t5, $t2, skip
	
	# update max value
	move $t2, $t5
	
skip:
	# move to the next element
	addi $t3, $t3, 4
	addi $t4, $t4, 1 # increment counter
	
	j find_max
	
exit:
	# print the maximum number
	li $v0, 1
	move $a0, $t2
	syscall

	# exit from program
	li $v0, 10
	syscall
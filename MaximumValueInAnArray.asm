# Program purpose: find maximum value in an array

.data
	numbers: .word 5, 10, 15, 20, 25
	size: .word 5

.text
main:
	# init variables
	la $t0, numbers
	lw $t1, size
	lw $t2, 0($t0) # max is initially the first element (at index 0)
	li $t3, 1
	
loop:
	bge $t3, $t1, finish
	sll $t4, $t3, 2
	add $t5, $t0, $t4 # address of the current element
	lw  $t6, 0($t5)
	
	# compare with max value
	ble $t6, $t2, skip
	add $t2, $zero, $t6
	
skip:
	# move to the next iteration by incrementing the index
	addi $t3, $t3, 1
	j loop	
	
finish:
	# finish loop and print the result
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	li $v0, 10
	syscall
.data
	array: .word 1 2 3 4 5
	size: .word 5

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	li $t2, 0 # initial sum
	li $t3, 0 # index of the current element
	
sum_loop:
	# if index >= size, program is finished and the sum is printed
	bge $t3, $t1, done
	
	# load the current element
	lw $t4, 0($t0)
	
	# accumulate sum
	add $t2, $t2, $t4
	
	# move to the next element
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	
	# jump back to loop
	j sum_loop

done:
	# print sum
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# exit from program
	li $v0, 10
	syscall
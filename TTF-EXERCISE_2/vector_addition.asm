.data
	vector1: .word 1 2 3 4 5
	vector2: .word 6 7 8 9 10
	vector3: .word 0 0 0 0 0
	vector_size: .word 5
	space: .asciiz " "

.text
main:
	la $t0, vector1 # base address of first array
	la $t1, vector2 # base address of second array
	la $t2, vector3 # base address of third array
	lw $t3, vector_size # array size
	
	li $t4, 0 # array loop counter

add_vectors:
	bge $t4, $t3, reset
	
	# load current element from first and second vector
	lw $t5, 0($t0) # load current element from first vector
	lw $t6, 0($t1) # load current element from second vector
	
	# add numbers from first and second vectors
	add $t7, $t5, $t6 # calculate sum 
	
	sw $t7, 0($t2) # store sums in third vector
		
	addi $t0, $t0, 4 # move to the next element in first vector
	addi $t1, $t1, 4 # move to the next element in second vector
	addi $t2, $t2, 4 # move to the next position in third vector
	addi $t4, $t4, 1 # increment loop counter
	
	j add_vectors # repeat loop

reset:
	li $t4, 0 # reset loop counter
	la $t2, vector3 # rest base address of third vector
	
print_vector:
	bge $t4, $t3, exit
	
	lw $t5, 0($t2) # load current element from vector3
	
	# print current element
	li $v0, 1
	move $a0, $t5
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t2, $t2, 4 # move to the next element
	addi $t4, $t4, 1 # increment loop counter
	
	j print_vector # repeat loop

exit:
	# exit from program
	li $v0, 10
	syscall

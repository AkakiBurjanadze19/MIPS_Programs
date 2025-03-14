.data
	array: .word 10 25 14 7 30 18
	size: .word 6
	largest: .word 0
	secondLargest: .word 0

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	li $t2, 0 # loop counter
	li $t3, 0 # initial largest number
	li $t4, 0 # initial second largest number
	
find_second_largest:
	bge $t2, $t1, exit # if counter >= size, exit the loop
	
	lw $t5, 0($t0) # load the current array element
	
	bgt $t5, $t3, update_largest # if current > largest, update largest number
	bgt $t5, $t4, update_second_largest # if current > second largest, update second largest number
	
	j get_next_element # move to the next element

update_largest:
	move $t4, $t3 # move current largest to second largest
	move $t3, $t5 # update largest with current array element
	
	j get_next_element # move to the next element

update_second_largest:
	move $t4, $t5 # update second largest with the current array element

get_next_element:
	addi $t0, $t0, 4 # move to the next array element
	addi $t2, $t2, 1 # increment loop counter
	
	j find_second_largest # jump back to find_second_largest loop
									
exit:
	sw $t3, largest # store largest number
	sw $t4, secondLargest # store second largest number
	
	# print result
	li $v0, 1
	move $a0, $t4
	syscall
	
	# exit program
	li $v0, 10
	syscall
.data
	array: .word 3 6 9 12 15 18
	size: .word 6
	firstIndex: .word 0
	lastIndex: .word 5
	space: .asciiz " "

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	lw $t3, firstIndex # left pointer
	lw $t4, lastIndex # right pointer
	
reverse_array:
	# if left >= right, exit the loop
	bge $t3, $t4, print_array
	
	# addresses of the elements to swap
	sll $t5, $t3, 2 # left index * 4
	add $t5, $t0, $t5 # address of array[left]
	sll $t6, $t4, 2 # right index * 4
	add $t6, $t0, $t6 # address of array[right]
	
	# swap elements at left and right positions
	lw $t7, 0($t5) # array[left]
	lw $t8, 0($t6) # array[right]
	sw $t8, 0($t5) # array[right] = array[left]
	sw $t7, 0($t6) # array[left] = array[right]
	
	addi $t3, $t3, 1 # increment left pointer
	subi $t4, $t4, 1 # decrement right pointer
	
	# repeat loop
	j reverse_array
	
print_array:
	li $t2, 0 # reset loop counter
	la $t0, array # reset base address of an array
	
print_array_loop:
	bge $t2, $t1, exit
	
	# load current array element
	lw $t3, 0($t0)
	
	# print current element
	li $v0, 1
	move $a0, $t3
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 4 # move to the next element
	addi $t2, $t2, 1 # increment counter
	
	# repeat loop
	j print_array_loop

exit:
	# exit from program
	li $v0, 10
	syscall
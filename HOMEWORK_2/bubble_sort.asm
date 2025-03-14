.data
	array: .word 10 5 3 8 6 2
	size: .word 6
	space: .asciiz " "

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	li $t2, 0 # outer loop (i)
	li $t3, 0 # inner loop (j)
	
outer_loop:
	bge $t2, $t1, sort_done # if i >= size, exit the loop
	li $t3, 0 # reset inner loop (j) counter to 0
	
inner_loop:
	sub $t4, $t1, $t2 # $t4 = n - i
	subi $t4, $t4, 1 # $t4 = (n - i) - 1
	
	bge $t3, $t4, next_outer # if j >= (n - i) - 1, exit the inner loop 
	
	# load the current and next element
	sll $t5, $t3, 2 # j * 4
	add $t5, $t0, $t5 # address of array[j]
	lw $t6, 0($t5) # load array[j]
	lw $t7, 4($t5) # load array[j + 1]
	
	# compare array[j] and array[j + 1]
	ble $t6, $t7, no_swap # if array[j] <= array[j + 1], no swap is needed
	
	# swap elements
	sw $t7, 0($t5) # array[j + 1] = array[j]
	sw $t6, 4($t5) # array[j] = array[j + 1]
	
no_swap:
	addi $t3, $t3, 1 # increment inner loop (j) counter
	j inner_loop # jump back to inner loop	
	
next_outer:
	addi $t2, $t2, 1 # increment outer loop (i) counter
	j outer_loop # jump back to outer loop
	
sort_done:
	la $t0, array # reset base address of an array
	li $t2, 2 # reset outer loop (i) counter
	
array_print:
	bgt $t2, $t1, exit # if counter (i) >= size, exit the loop
	
	lw $t8, 0($t0) # load the current array element
	
	# print current array element
	li $v0, 1
	move $a0, $t8
	syscall
	
	# print space
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 4 # move to the next element in an array
	addi $t2, $t2, 1 # increment array loop counter
	
	j array_print # repeat loop
	
exit:
	# exit from program
	li $v0, 10
	syscall
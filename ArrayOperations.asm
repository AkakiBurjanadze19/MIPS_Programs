# Program purpose: load the third element of integers array, add 5 to it, store it back and print the result

.data
	arr: 5, 10, 15, 20, 25
	
.text
main:
  # load third element from an array
	la $t0, arr
	li $t1, 2
	sll $t2, $t1, 2
	add $t3, $t0, $t2
	lw $t4, 0($t3)
	
	# add 5 to it and store it back
	li $t5, 5
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	
	# print the updated number
	li $v0, 1
	add $a0, $zero $t4
	syscall
	
	# exit from the program
	li $v0, 10
	syscall
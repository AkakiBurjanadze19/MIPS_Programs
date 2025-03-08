.data
	array: .word 30, 25, 20, 15, 10
	size: .word 5
	message: .asciiz "Minimum: "
	newline: .asciiz "\n"

.text
main:
	la $t0, array # base address of an array
	lw $t1, size # size of an array
	lw $t2, 0($t0) # initial min
	add $t3, $t0, 4 # start from the second element
	li $t4, 1 # start loop from the second element (index)
	
loop:
	# if index >= size, done
	bge $t4, $t1, done
	
	# load the current element
	lw $t5, 0($t3)
	
	# if current >= min, skip
	bge $t5, $t2, skip
	
	# update min value
	add $t2, $zero, $t5

skip:
	# move to the next element
	addi $t3, $t3, 4
	addi $t4, $t4, 1
	
	# jump back to loop
	j loop

done:
	# print "Minimum: "
	li $v0, 4
	la $a0, message
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print min value
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# exit from program
	li $v0, 10
	syscall
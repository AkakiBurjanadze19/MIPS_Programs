.data
	array: .word 10, 15, 20, 25, 30
	size: .word 5
	newline: .asciiz "\n"

.text
main:
	la $t0, array # load base address of an array
	lw $t1, size # load size of an array
	li $t2, 0 # array index
	
loop:
	bge $t2, $t1, exit
	
	# load the first element
	lw $t3, 0($t0)
	
	# print element
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# move to the next element
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	
	# jump back to loop
	j loop

exit:
	# exit from program
	li $v0, 10
	syscall
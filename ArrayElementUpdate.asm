.data
	array: .word 10, 15, 20, 25, 30
	newline: .asciiz "\n"

.text
main:
	la $t0, array # base address of an array
	lw $t1, 8($t0) # third element of an array
	
	# add 5 to third element and store it back
	addi $t1, $t1, 5
	sw $t1, 8($t0)
	
	li $v0, 1
	lw $t2, 8($t0)
	add $a0, $zero, $t2
	syscall
	
	# exit from program
	li $v0, 10
	syscall
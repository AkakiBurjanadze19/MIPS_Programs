.data
	message: .asciiz "Hello"
	size: .word 5
	newline: .asciiz "\n"
	
.text
main:
	la $t0, message # base address of string message
	lw $t1, size # size of a string
	li $t2, 0 # loop counter
	
print_chars:
	# if counter > t1, exit the loop
	bgt $t2, $t1, exit
	
	# load current char
	lb $t3, 0($t0)
	
	# print current char
	li $v0, 11
	move $a0, $t3
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	addi $t0, $t0, 1 # move to the next char
	addi $t2, $t2, 1 # increment loop counter
	
	# repeat loop
	j print_chars
	
exit:
	# exit from program
	li $v0, 10
	syscall
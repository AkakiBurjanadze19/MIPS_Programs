.data
	message: .asciiz "Hello"
	newline: .asciiz "\n"

.text
main:
	la $t0, message # base address of string message
	lb $t1, 0($t0) # first character in a string
	lb $t2, 1($t0) # second character in a string
	
	# print first character
	li $v0, 11
	move $a0, $t1
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print second character
	li $v0, 11
	move $a0, $t2
	syscall
	
	# exit from program
	li $v0, 10
	syscall
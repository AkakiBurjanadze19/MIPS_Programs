.data
	message: .asciiz "Half-Life"
	
.text
main:
	la $t0, message # base address of string message
	li $t1, 0 # string length counter
	
str_length:
	lb $t2, 0($t0) # load current char
	beqz $t2, exit # if we encounter \0, exit the loop
	addi $t0, $t0, 1 # move to the next char
	addi $t1, $t1, 1 # increment length counter
	
	# repeat loop
	j str_length
	
exit:
	# print string length
	li $v0, 1
	move $a0, $t1
	syscall

	# exit from program
	li $v0, 10
	syscall
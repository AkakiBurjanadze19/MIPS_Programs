.data
	source_string: .asciiz "Half-Life"
	destination_string: .space 100

.text
main:
	la $t0, source_string # base address of source string
	la $t1, destination_string # base address of destination string
	
str_copy:
	lb $t2, 0($t0) # load current char in source string
	sb $t2, 0($t1) # store current char in destination string
	
	beqz $t2, exit # if \0 is seen, exit the loop
	
	addi $t0, $t0, 1 # move to the next char in source string
	addi $t1, $t1, 1 # move to the next char in destination string
	
	j str_copy # repeat loop	
	
exit:
	# print copied string
	li $v0, 4
	la $a0, destination_string
	syscall

	# exit from program
	li $v0, 10
	syscall
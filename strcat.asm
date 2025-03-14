.data
	str1: .asciiz "Hello, "
	str2: .asciiz "World!"
	result: .space 100
	
.text
main:
	la $t0, str1 # base address of str1
	la $t1, result # base address of result string

strcat_str1_loop:
	lb $t2, 0($t0) # load current char from str1
	sb $t2, 0($t1) # store current char in result string
	
	beqz $t2, strcat_str2 # at the end of the string move to the second string
	
	addi $t0, $t0, 1 # move to the next char in str1
	addi $t1, $t1, 1 # move to the next position in result string
	
	j strcat_str1_loop # repeat loop

strcat_str2:
	la $t0, str2 # reset base address to str2

strcat_str2_loop:
	lb $t2, 0($t0) # load current char in str2
	sb $t2, 0($t1) # store current char in result string
	
	beqz $t2, exit # if \0 is seen, exit the loop
	
	addi $t0, $t0, 1 # move to the next char in str1
	addi $t1, $t1, 1 # move to the next position in result string
	
	j strcat_str2_loop # repeat loop

exit:	
	# print concatenated string
	li $v0, 4
	la $a0, result
	syscall

	# exit from program
	li $v0, 10
	syscall
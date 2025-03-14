.data
	prompt: .asciiz "Enter a string: "
	buffer: .space 500

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# ask user for a string
	li $v0, 8
	la $a0, buffer # base address of buffer
	li $a1, 500 # max number of chars to read
	syscall

	la $t0, buffer # base address of a string
	
convert_to_uppercase:
	lb $t1, 0($t0) # load current char from a string
	
	beqz $t1, exit # if \0 is seen, exit the loop
	
	blt $t1, 97, skip # if it's below a, skip
	bgt $t1, 122, skip # it it's above z, skip
	
	addi $t1, $t1, -32 # convert char to uppercase
	sb $t1, 0($t0) # store char back in buffer
	
	j convert_to_uppercase # repeat loop
		
skip:
	addi $t0, $t0, 1 # move to the next char in a string
	j convert_to_uppercase # jump back to loop

exit:
	# print result
	li $v0, 4
	la $a0, buffer
	syscall

	# exit from program
	li $v0, 10
	syscall
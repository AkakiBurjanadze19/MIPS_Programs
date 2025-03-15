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
	
	la $t0, buffer # base address of inputted string
	li $t1, 0 # count of vowels
	
count_vowels:
	lb $t2, 0($t0) # load current char from a string
	
	beqz $t2, exit # if \0 is seen, exit the loop and print the result
	
	beq $t2, 'a', inc_vowels # increment vowels count
	beq $t2, 'e', inc_vowels # increment vowels count
	beq $t2, 'i', inc_vowels # increment vowels count
	beq $t2, 'o', inc_vowels # increment vowels count
	beq $t2, 'u', inc_vowels # increment vowels count
	
	addi $t0, $t0, 1 # move to the next char in a string
	
	j count_vowels # repeat loop

inc_vowels:
	addi $t1, $t1, 1 # increment number of vowels
	addi $t0, $t0, 1 # move to the next char in a string	
	j count_vowels # jump back to loop
	
exit:
	# print count of vowels
	li $v0, 1
	move $a0, $t1
	syscall

	# exit from program
	li $v0, 10
	syscall
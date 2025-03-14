.data
	prompt: .asciiz "Enter a string: "
	buffer: .space 500
	space: .asciiz " " 
		
.text
main:	
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# ask user for a string
	li $v0, 8
	la $a0, buffer # load address of buffer
	li $a1, 200 # max number of chars to read
	syscall
	
	la $t0, buffer # base address of a string
	li $t1, ' ' # empty space: ' '
	li $t2, 0 # number of words
	li $t3, 0 # flag to check whether we are in a word or not
	
count_words:
	lb $t4, 0($t0) # load current char from a string
	beqz $t4, stop_count # if \0 is seen, stop looping
	
	beq $t4, $t1, handle_space # handle a space
	
	# if not space, we are inside a word
	li $t3, 1 # update flag to indicate we are inside a word
	j next_char # move to the next char in a string
	
handle_space:
	beqz $t3, next_char # if outside a word, skip
	addi $t2, $t2, 1 # increment word counter
	li $t3, 0 # update flag to indicate we are outisde a word
	
next_char:
	addi $t0, $t0, 1 # move to the next char in a string
	j count_words	# jump back to count_words loop
	
stop_count:
	bnez $t3, count_last_word
	j print_result
	
count_last_word:
	addi $t2, $t2, 1 # increment word counter for the last word

print_result:
	# print the number of words
	li $v0, 1
	move $a0, $t2
	syscall
	
	# exit from program
	li $v0, 10
	syscall
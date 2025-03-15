.data
	prompt: .asciiz "Enter a string: "
	buffer: .space 500
	palindromeMsg: .asciiz "Palindrome"
	notPalindromeMsg: .asciiz "Not a palindrome"

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# ask user for a string
	li $v0, 8
	la $a0, buffer # base address of buffer
	la $a1, 500 # max number of chars to read
	syscall
	
	la $t0, buffer # base address of string
	la $t1, buffer # base address of string
	
find_end:
	lb $t2, 0($t1) # load current char in a string
	beqz $t2, get_last_position # if \0 is seen, it's end of the string	
	beq $t2, '\n', get_last_position # if newline char found, it's end of the string
	addi $t1, $t1, 1 # move to the next char in a string
	j find_end # repeat loop

get_last_position:
	subi $t1, $t1, 1 # last char position
	
check_palindrome:
	bge $t0, $t1, show_palindrome_message # if left >= right, exit the loop
	
	lb $t2, 0($t0) # load char at left position
	lb $t3, 0($t1) # load char at right position
	
	bne $t2, $t3, show_not_palindrome_message
	
	addi $t0, $t0, 1 # increment left pointer
	subi $t1, $t1, 1 # decrement right pointer
	
	j check_palindrome # repeat loop

show_palindrome_message:
	# display "Palindrome"
	li $v0, 4
	la $a0, palindromeMsg
	syscall
	j exit

show_not_palindrome_message:
	# display "Not a palindrome"
	li $v0, 4
	la $a0, notPalindromeMsg
	syscall
	j exit

exit:
	# exit from program
	li $v0, 10
	syscall

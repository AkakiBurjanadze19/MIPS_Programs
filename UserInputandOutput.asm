# Program purpose: ask user for a number and display it

.data
	enter: .asciiz "Enter a number:\n"
	message: .asciiz "You entered:\n"
	
.text
main:
	# display prompt
	li $v0, 4
	la $a0, enter
	syscall
	
	# ask user for a number
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	
	# display the message
	li $v0, 4
	la $a0, message
	syscall
	
	# print the number
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	# exit from the program
	li $v0, 10
	syscall
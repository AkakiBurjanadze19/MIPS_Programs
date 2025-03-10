.data
	prompt: .asciiz "Enter a number: "
	message: .asciiz "You entered: "
	newline: .asciiz "\n"

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall

	# ask the user to enter a number
	li $v0, 5
	syscall
	move $t0, $v0
	
	# print the message
	li $v0, 4
	la $a0, message
	syscall
	
	# print the user entered number
	li $v0, 1
	move $a0, $t0
	syscall
	
	# exit from program
	li $v0, 10
	syscall
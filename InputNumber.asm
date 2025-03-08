.data
	prompt: .asciiz "Enter a number: "
	message: .asciiz "You entered: "
	newline: .asciiz "\n"

.text
main:
	# print "Enter a number: "
	li $v0, 4
	la $a0, prompt
	syscall
	
	# get input from a user
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	
	# print "You entered: "
	li $v0, 4
	la $a0, message
	syscall
	
	# print user entered number
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	# exit from program
	li $v0, 10
	syscall
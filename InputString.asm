.data
	prompt: .asciiz "Enter your name: "
	greeting: .asciiz "Hello, "
	buffer: .space 20
	newline: .asciiz "\n"

.text
main:
	# print "Enter your name: "
	li $v0, 4
	la $a0, prompt
	syscall
	
	# get input from a user
	li $v0, 8
	la $a0, buffer
	li $a1, 20 # max length (including null terminator)
	syscall
	
	# print "Hello, "
	li $v0, 4
	la $a0, greeting
	syscall
	
	# print result
	li $v0, 4
	la $a0, buffer
	syscall
	
	# exit from program
	li $v0, 10
	syscall
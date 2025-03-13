.data
	prompt1: .asciiz "First number: "
	prompt2: .asciiz "Second number: "

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# ask user for an input
	li $v0, 5
	syscall
	move $t0, $v0 # first number
	
	# display prompt again
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# ask user for an input again
	li $v0, 5
	syscall
	move $t1, $v0 # second number
	
	# print the largest number
	bgt $t0, $t1, print_first
	blt $t0, $t1, print_second
	
	# exit from program
	j exit
	
print_first:
	# print the first number
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit
	
print_second:
	# print the second number:
	li $v0, 1
	move $a0, $t1
	syscall
	
	j exit
	
exit:
	# exit from program
	li $v0, 10
	syscall
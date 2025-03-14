.data
	prompt1: .asciiz "Enter a first number: "
	prompt2: .asciiz "Enter a second number: "

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# ask user for a first number
	li $v0, 5
	syscall
	move $t0, $v0
	
	# display prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# ask user for a second number
	li $v0, 5
	syscall
	move $t1, $v0
	
gcd_loop:
	beqz $t1, exit # if second number is 0, exit the loop
	
	div $t0, $t1 # divide first number by the second number
	
	mfhi $t2 # get the remainder
	
	move $t0, $t1 # move second number to $t0
	move $t1, $t2	# move remainder to $t1
	
	j gcd_loop # repeat loop
	
exit:
	# print result
	li $v0, 1
	move $a0, $t0
	syscall

	# exit from program
	li $v0, 10
	syscall
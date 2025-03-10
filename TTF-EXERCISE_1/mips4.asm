.data
	prompt: .asciiz "Enter a number: "
	evenMessage: .asciiz "Even"
	oddMessage: .asciiz "Odd"
	newline: .asciiz "\n"

.text
main:
	# display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# get a number from the user
	li $v0, 5
	syscall
	move $t0, $v0
	
	# divide number by 2 and store the remainder
	li $t1, 2
	div $t0, $t1
	mfhi $t2
	
	# display the corresponding message
	beq $t2, $zero, print_even
	bne $t2, $zero, print_odd
	
	# exit from program
	j exit
	
print_even:
	# print "Even"
	li $v0, 4
	la $a0, evenMessage
	syscall
	j exit
	
print_odd:
	# print "Odd"
	li $v0, 4
	la $a0, oddMessage
	syscall
	j exit
	
exit:
	# exit from program
	li $v0, 10
	syscall
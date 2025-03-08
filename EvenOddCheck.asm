.data
	prompt: .asciiz "Enter a number: "
	evenMessage: .asciiz "Number is even\n"
	oddMessage: .asciiz "Number is odd"

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
	
	# divide number by 2 and get the remainder
	li $t1, 2
	div $t0, $t1
	mfhi $t2
	
	# print the corresponding message
	beq $t2, $zero, print_even_message
	bne $t2, $zero, print_odd_message
	
	j exit
	
print_even_message:
	# print "Number is even"
	li $v0, 4
	la $a0, evenMessage
	syscall
	j exit
	
print_odd_message:
	# print "Number is odd"
	li $v0, 4
	la $a0, oddMessage
	syscall
	j exit
	
exit:
	# exit from program
	li $v0, 10
	syscall
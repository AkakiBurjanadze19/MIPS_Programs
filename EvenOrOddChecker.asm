# Program purpose: check if user entered number is even or odd

.data
	enter: .asciiz "Enter a number\n"
	evenMessage: .asciiz "Even\n"
	oddMessage: .asciiz "Odd\n"
	
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
	
	# divide user entered number by two and store the remainder
	li $t1, 2
	div $t2, $t0, $t1
	mfhi $t1
	
	# print the corresponding message based on the number's parity
	beq $t1, $zero, print_even
	j print_odd
	
print_even:
	# print "Even"
	li $v0, 4
	la $a0, evenMessage
	syscall
	j program_exit
	
print_odd:
	# print "Odd"
	li $v0, 4
	la $a0, oddMessage
	syscall
	j program_exit

program_exit:
	# exit from the program
	li $v0, 10
	syscall	
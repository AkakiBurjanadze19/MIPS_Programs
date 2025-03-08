.data
	num1: .word 5
	message1: .asciiz "a is positive\n"
	message2: .asciiz "a is negative\n"
	message3: .asciiz "a is equal to 0\n"

.text
main:
	lw $t0, num1
	
	# check if $t0 is positive
	bgt $t0, $zero, print_pos_message
	# check if $t0 is negative
	blt $t0, $zero, print_neg_message
	# check if $t0 is equal to 0
	beq $t0, $zero, print_equal_message
	
	j exit

print_pos_message:
	# print "a is positive"
	li $v0, 4
	la $a0, message1
	syscall
	j exit
	
print_neg_message:
	# print "a is negative"
	li $v0, 4
	la $a0, message2
	syscall
	j exit

print_equal_message:
	# print "a is equal to 0"
	li $v0, 4
	la $a0, message3
	syscall
	j exit

exit:
	# exit from program
	li $v0, 10
	syscall
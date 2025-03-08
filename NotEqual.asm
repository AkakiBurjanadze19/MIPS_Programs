.data
	num1: .word 5
	num2: .word 10
	message: .asciiz "Not Equal\n"

.text
main:
	lw $t0, num1
	lw $t1, num2
	
	# check if $t0 == $t1
	bne $t0, $t1, print_msg
	
	j exit
	
print_msg:
	# print "Not Equal"
	li $v0, 4
	la $a0, message
	syscall

exit:
	# exit from program
	li $v0, 10
	syscall
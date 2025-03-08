.data
	num1: .word 5
	num2: .word 5
	message: .asciiz "Equal\n"

.text
main:
	lw $t0, num1
	lw $t1, num2
	
	# check if $t0 == $t1
	beq $t0, $t1, print_msg
	
	j exit
		
print_msg:
	# print "Equal"
	li $v0, 4
	la $a0, message
	syscall

exit:
	# exit from program
	li $v0, 10
	syscall
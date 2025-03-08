.data
	num1: .word 10
	num2: .word 10
	message: .asciiz "Less than or equal\n"

.text
main:
	lw $t0, num1
	lw $t1, num2
	
	# check if $t0 <= $t1
	ble $t0, $t1, print_msg
	
	j exit

print_msg:
	# print "Less than or equal"
	li $v0, 4
	la $a0, message
	syscall

exit:
	# exit from program
	li $v0, 10
	syscall
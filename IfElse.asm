.data
	num1: .word 5
	num2: .word 10
	message1: .asciiz "a is smaller than b\n"
	message2: .asciiz "a is greater or equal to b\n"
	
.text
main:
	lw $t0, num1
	lw $t1, num2
	
	# if case
	blt $t0, $t1, print_message1
	
	# else case
	li $v0, 4
	la $a0, message2
	syscall
	
	j exit
	
print_message1:
	# print "a is smaller than b"
	li $v0, 4
	la $a0, message1
	syscall
	
exit:
	# exit from program
	li $v0, 10
	syscall
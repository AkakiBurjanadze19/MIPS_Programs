.data
	num1: .word 10
	num2: .word 20
	newline: .asciiz "\n"

.text
main:
	# load numbers
	lw $t1, num1
	lw $t2, num2
	
	add $t3, $t1, $t2 # t3 = $t1 + $t2
	sub $t4, $t1, $t2 # t4 = $t1 - $t2
	mul $t5, $t1, $t2 # t5 = $t1 * $t2
	
	# print addition result
	li $v0, 1
	move $a0, $t3
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print subtraction result
	li $v0, 1
	move $a0, $t4
	syscall
	
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print multiplication result
	li $v0, 1
	move $a0, $t5
	syscall
	
	# exit from program
	li $v0, 10
	syscall
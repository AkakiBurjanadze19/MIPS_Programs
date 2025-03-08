# 4 bytes (32 bits) = 1 word

.data
	array: .word 10, 15, 20, 25, 30
	newline: .asciiz "\n"

.text
main:
	# load base address of array into t0
	la $t0, array
	
	# get first element
	lw $t1, 0($t0)
	
	# get second element
	lw $t2, 4($t0)
	
	# get third element
	lw $t3, 8($t0)
	
	# get fourth element
	lw $t4, 12($t0)
	
	# get fifth element
	lw $t5, 16($t0)
	
	# print first element
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# print second element
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# print third element
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# print fourth element
	li $v0, 1
	add $a0, $zero, $t4
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	# print fifth element
	li $v0, 1
	add $a0, $zero, $t5
	syscall
	
	li $v0, 10
	syscall
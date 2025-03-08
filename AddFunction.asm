# Program purpose: define a function which adds two numbers and returns the result

.text
main:
	# load numbers to add
	li $t0, 10
	li $t1, 15
	# store numbers in $a0 and $a1 (they will be used as function arguments)
	add $a0, $zero, $t0
	add $a1, $zero, $t1
	# call add function with the arguments we have defined
	jal add
	add $t2, $zero, $v0
	
	# print result
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# exit from the program
	li $v0, 10
	syscall

add:
	# store the result (addition of two numbers) in $v0 and return it
	add $v0, $a0, $a1
	jr $ra
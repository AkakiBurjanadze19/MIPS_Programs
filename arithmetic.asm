.text
main:
 # add two numbers
 li $v0, 1
 li $t1, 20
 li $t2, 30
 add $t0, $t1, $t2
 move $a0, $t0
 syscall
 
 # print newline
 li $v0, 11
 li $a0, 10
 syscall
 
 # subtract two numbers
 li $v0, 1
 li $t1, 10
 li $t2, 5
 sub $t0, $t1, $t2
 move $a0, $t0
 syscall
 
 # print newline
 li $v0, 11
 li $a0, 10
 syscall
 
 # add immediate
 li $v0, 1
 li $t1, 10
 addi $t0, $t1, 1
 move $a0, $t0,
 syscall
 
 # exit from program
 li $v0 10
 syscall
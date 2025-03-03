.data
 firstName: .asciiz "Akaki"
 lastName: .asciiz "Burjanadze"
 
.text
main:
 # print first name
 li $v0, 4
 la $a0, firstName
 syscall
 
 # print space
 li $v0, 11
 li $a0, 32
 syscall
 
 # print last name
 li $v0, 4
 la $a0, lastName
 syscall
 
 # exit from program
 li $v0, 10
 syscall
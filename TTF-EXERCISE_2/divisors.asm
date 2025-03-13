.data
    prompt: .asciiz "Enter a number: "

.text
main:
    # Display prompt
    li $v0, 4              # syscall for print_string
    la $a0, prompt         # load address of the prompt
    syscall

    # Ask user for an input
    li $v0, 5              # syscall for read_int
    syscall
    move $t0, $v0          # store the input number in $t0

    # Initialize counters
    li $t1, 1              # loop counter (starts from 1)
    li $t2, 0              # divisors counter

divisors_count:
    bgt $t1, $t0, exit     # if $t1 > $t0, exit the loop

    div $t0, $t1           # divide $t0 by $t1
    mfhi $t3               # store the remainder in $t3

    beq $t3, $zero, inc_divisors  # if remainder == 0, increment divisors counter

    addi $t1, $t1, 1       # increment loop counter
    j divisors_count       # repeat the loop

inc_divisors:
    addi $t2, $t2, 1 
    addi $t1, $t1, 1  
    j divisors_count 

exit:
    # Print the number of divisors
    li $v0, 1         
    move $a0, $t2         
    syscall

    # Exit the program
    li $v0, 10    
    syscall
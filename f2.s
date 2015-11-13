# Author: Gonçalo Sampaio
# Creation date: 11/12/2015
# Function f2 (hw5 comp331)

# Define data to be used in the ".data" section.

	.data

promptm:    .asciiz "\n Enter m:"        #input prompt
promptn:    .asciiz "\n Enter n:"        #input prompt
result:    .asciiz "\n f2(m,n): "  #result prompt


	.text


main:	
        li    $v0, 4           #Prompt user for input
        la    $a0, promptm
        syscall
        li    $v0, 5           #Read inputm to $v0
        syscall
        nop

        add   $t0, $v0, $zero  #store inputm in $t0 procedure arg

        li    $v0, 4           #Prompt user for input
        la    $a0, promptn
        syscall
        li    $v0, 5           #Read inputn to $v0
        syscall
        nop

        add   $t1, $v0, $zero  #store inputn in $a1 procedure arg

        add $a0, $zero, $t0
        add $a1, $zero, $t1

        ####### $a0 is m, $a1 is n

        jal   f2               #call recursive f1
        add   $s0, $v0, $zero  #store result in $s0

        li    $v0, 4           #Print result
        la    $a0, result
        syscall
        li    $v0, 1
        add   $a0, $s0, $zero
        syscall
        li    $v0, 10          #exit
        syscall


f2:
        addi $t0, $zero, 1
        beq  $a1, $zero, L1       # branch (n == 0)
        beq  $a0, $zero, L1     # branch (m == 0)
        beq  $a0, $t0, L2     # branch (m == 1)

        addi $sp, $sp, -8      #store called value, $s1 and return address
        sw   $ra  4($sp)        #on stack
        sw   $a0, 0($sp)        # $a0 is m

        addi $a1, $a1, -1       # a1 = n-1

        jal  f2               # f2(m, n-1)

        add $a1, $v0, $zero    #store returned value in $a1

        lw   $a0, 0($sp)       #restore $a0 = m
        addi $a0, $a0, -1 	   # $a0 = m-1

        jal f2                 # $v0 = f2(m−1, f2(m, n-1)
        
        lw   $ra, 4($sp)       #restore return address
        addi $sp, $sp, 8      #restore stack pointer

        jr   $ra               #return to caller (return $v0)



L1:     # (n == 0) or (m == 0), return 1
        add $v0, $zero, $t0
        jr   $ra               #return to caller



L2:     # (m == 1), return 2n
        add $v0, $a1, $a1
        jr   $ra               #return to caller
.data

outputMsg: .asciiz "unlucky percentage = "

minutes:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14

hours:    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3

.text

main:

     add $s0, $0, $0 # int unluckytimes = 0;
     add $s1, $0, $0 # int totalminutes = 0;

     la   $s4, minutes   # base address for minutes
     la   $s5, hours     # base address for hours

     addi $t7, $0, 13

     add  $s2, $0, $0 # for loop from 0 to 59
     addi $t0, $0, 60

forloop1:
     beq  $s2, $t0, done1

     add  $s3, $0, $0 # for loop from 1 to 12
     addi $t1, $0, 12

     forloop2:
          beq  $s3, $t1, done2


               add $t2, $s2, $s2
               add $t3, $s3, $s3

               add $t2, $t2, $t2
               add $t3, $t3, $t3

               add $t8, $t2, $s4
               add $t9, $t3, $s5

               lw $t4, 0($t8)
               lw $t5, 0($t9)

               add $t6, $t4, $t5
               bne $t6, $t7, L1
               addi $s0, $s0, 1    # increment 1 to unluckyminutes
          L1:
               addi $s1, $s1, 1    # increment 1 to totalminutes


          addi $s3, $s3, 1
          j forloop2

     done2:

     addi $s2, $s2, 1
     j forloop1

done1:

mul $s6, $s0, 100
div $s7, $s6, $s1

# Display result.
# First display output string, then value.

     la $a0, outputMsg # load outputMsg
     li $v0, 4 # 4 = code for print null terminated string
     syscall 

     add $a0, $s7, $zero #load result
     li $v0, 1 # 1 = code for print integer
     syscall 


# Done, terminate program.
     li $v0, 10 # 10 = code for terminate
     syscall 
.end main
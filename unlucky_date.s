.data

outputMsg: .asciiz "unlucky percentage = "

days:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 3, 4

months:    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3

.text

main:

     add $s0, $0, $0     # int unluckydays = 0;
     add $s1, $0, $0     # int totaldays = 0;

     la  $s2, days       # base address for days
     la  $s3, months     # base address for months

     addi $s4, $0, 13    # value 13

     add  $t0, $0, $0
     addi $s5, $0, 12    # for loop from 1 to 12

forloop1:                # counter of months is t0, limit is s5
     beq  $t0, $s5, done1


     addi $t1, $0, 1     # check if month is february
     bne $t0, $t1, L1    # check if month is february

     ####### CODE FOR 28 DAYS LOOP #######

     add  $t2, $0, $0
     addi $s6, $0, 28    # for loop from 1 to 28

     forloop2:           # counter of months is t2, limit is s6
          beq  $t2, $s6, done2

               add $t3, $t0, $t0   # duplicate first counter
               add $t4, $t2, $t2   # duplicate second counter 

               add $t3, $t3, $t3   # 4x first counter (months)
               add $t4, $t4, $t4   # 4x second counter (days)

               add $t5, $t3, $s3   # add counter to array address for days
               add $t6, $t4, $s2   # add counter to array address for months

               lw $t7, 0($t5)
               lw $t8, 0($t6)

               add $t9, $t7, $t8
               bne $t9, $s4, else1
               addi $s0, $s0, 1    # increment 1 to unluckyminutes
          else1:
               addi $s1, $s1, 1    # increment 1 to totalminutes


          addi $t2, $t2, 1
          j forloop2

     done2:

     j done

     #####################################


     L1:  # check if month has 30 days

     addi $t1, $0, 3     # check if month is april
     beq $t0, $t1, L2
     addi $t1, $0, 5     # check if month is june
     beq $t0, $t1, L2
     addi $t1, $0, 8     # check if month is september
     beq $t0, $t1, L2
     addi $t1, $0, 10     # check if month is november
     beq $t0, $t1, L2

     j L3

     L2: 

     ####### CODE FOR 30 DAYS LOOP #######

     add  $t2, $0, $0
     addi $s6, $0, 30    # for loop from 1 to 30

     forloop3:           # counter of months is t2, limit is s6
          beq  $t2, $s6, done3

               add $t3, $t0, $t0   # duplicate first counter
               add $t4, $t2, $t2   # duplicate second counter 

               add $t3, $t3, $t3   # 4x first counter (months)
               add $t4, $t4, $t4   # 4x second counter (days)

               add $t5, $t3, $s3   # add counter to array address for days
               add $t6, $t4, $s2   # add counter to array address for months

               lw $t7, 0($t5)
               lw $t8, 0($t6)

               add $t9, $t7, $t8
               bne $t9, $s4, else2
               addi $s0, $s0, 1    # increment 1 to unluckyminutes
          else2:
               addi $s1, $s1, 1    # increment 1 to totalminutes


          addi $t2, $t2, 1
          j forloop3

     done3:

     j done

     #####################################


     L3: 

     ####### CODE FOR 31 DAYS LOOP #######

     add  $t2, $0, $0
     addi $s6, $0, 31    # for loop from 1 to 31

     forloop4:           # counter of months is t2, limit is s6
          beq  $t2, $s6, done4

               add $t3, $t0, $t0   # duplicate first counter
               add $t4, $t2, $t2   # duplicate second counter 

               add $t3, $t3, $t3   # 4x first counter (months)
               add $t4, $t4, $t4   # 4x second counter (days)

               add $t5, $t3, $s3   # add counter to array address for days
               add $t6, $t4, $s2   # add counter to array address for months

               lw $t7, 0($t5)
               lw $t8, 0($t6)

               add $t9, $t7, $t8
               bne $t9, $s4, else3
               addi $s0, $s0, 1    # increment 1 to unluckyminutes
          else3:
               addi $s1, $s1, 1    # increment 1 to totalminutes


          addi $t2, $t2, 1
          j forloop4

     done4:

     #####################################


     done:
     


     addi $t0, $t0, 1
     j forloop1

done1:



     mul $t0, $s0, 100
     div $t1, $t0, $s1 # calculate percentage

# Display result.
# First display output string, then value.

     la $a0, outputMsg # load outputMsg
     li $v0, 4 # 4 = code for print null terminated string
     syscall 

     add $a0, $t1, $zero #load result
     li $v0, 1 # 1 = code for print integer
     syscall 


# Done, terminate program.
     li $v0, 10 # 10 = code for terminate
     syscall 
.end main
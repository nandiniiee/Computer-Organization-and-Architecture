.data
Array: .word 5,2,9,1,3,6
n: .word 6

.text
.global main

main:
la t0,Array
lw t1,n              # value of n in t1
li t2,0              # i equal to 0 in t2
addi t3,t1,-1         # t3 has n-1 stored in it

outer: 
   beq t2,t3, end
   li t4,0           # j equal to 0 in t4
   sub t5,t3,t2      #t5 has n-1-i value
inner: 
   beq t4,t5,increment1
   lw t6,0(t0)       # load value of Array[j] to t6
   lw s1,4(t0)       # load value of Array[j+1] in s1
   blt t6,s1,increment2
   mv s2,t6          # load value of Array[j] to s2 i.e temp
   mv t6,s1          # load value of s1 to t6, i.e Array[j]= Array[j+1]
   mv s1,s2          # s1 contains temp value now
   sw t6,0(t0)       # store value of Array[j+1] at 0(t0) because Array[j+1]<Array[j]
   sw s1,4(t0)       # store Array[j] at next address
   addi t0,t0,4      #increment the address   
   addi t4,t4,1      # increment value of j after one sorting iteration is done
   j inner
increment1:
    addi t2,t2,1
    la t0,Array
    j outer
increment2:
   addi t4,t4,1
   addi t0,t0,4
   j inner
end:
   li a7, 93
   ecall

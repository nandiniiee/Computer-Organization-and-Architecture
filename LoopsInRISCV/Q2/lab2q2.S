.data
A: .word 1,2,3,4,5,6,7,8,9
B: .word 2,4,6,8,10,12,14,16,18
result: .word 0,0,0,0,0,0,0,0,0
n: .word 3

.text
.global main

main:
la t0,A      # A base element address in t0
la t1,B      # B base element address in t1
la t2,result       # result matrix addressed in s2
lw t3,n            #value of n equal to 3 in t3
li t4,0            # i equal to 0 in t4

outer:
    beq t4,t3,end
    li t5,0        # j equal to 0 in t5
inner:
    beq t5,t3,increment_i
    lw t6,0(t2)    # load value in result matrix to t6
    li s0,0        # k equal to 0 in s0
innermost:
    beq s0,t3,increment_j
    mul s1,t4,t3
    add s1,s1,s0
    li s2,4
    mul s1,s1,s2
    add s1,s1,t0   # address of A[i][k]
    lw s3,0(s1)    # load value from address s1 into register s2
    mul s4,s0,t3
    add s4,s4,t5
    mul s4,s4,s2
    add s4,s4,t1
    lw s5,0(s4)   # load value from address s4 into register s5
    mul s6, s3,s5 # Have A[i][k] X B[k][j] stored in s6
    add t6,t6,s6  # c[i][j]+=A[i][k] X B[k][j]
    sw t6,0(t2)
    add s0,s0,1
    j innermost

increment_j:
    addi t5,t5,1
    add t2,t2,4
    j inner
increment_i:
    addi t4,t4,1  
    j outer
end:
   li a7,93
   ecall


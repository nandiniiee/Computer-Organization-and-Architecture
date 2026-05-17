.section .data
N: .word 2
buffer: .space 21

.section .text
.global printParens
.global main

main: 
    la t0,N             # stores the address of N    
    lw a0,0(t0)         # value of N loaded in a0
    lw t1,0(t0)         # open = N
    lw t2,0(t0)         # close = N
    li a2,0             # idx = 0
    la t4,buffer        # store the base address of buffer
    jal ra,printParens
    j end

printParens:
    addi sp,sp,-24    
    sd ra,16(sp)       
    sd a0,8(sp)         # store n
    beq t1,x0,close_check
    bgt t1,x0,open_case
    bgt t2,t1,close_case

open_case:
    li t5,'('             # store open bracket
    sw t5,a0(t4)
    addi t1,t1,-1
    addi t2,t2,0
    addi a0,a0,1
    jal ra,printParens

close_case:
    li t5, ')'
    sw t5, a0(t4)
    addi t1,t1,0
    addi t2,t2,-1
    addi a2,a2,1
    jal ra, printParens

close_check:
    beq t2,x0,base_case

base_case:
    li t5,'\0'
    sw t5,a2(t4)
    ld ra, 16(sp)
    add sp,sp,24
    ret
    
end:
    li a7, 93
    ecall
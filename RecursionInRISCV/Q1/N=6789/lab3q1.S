.section .data
result: .word 0
highest_sp: .word 0
lowest_sp: .word 0

.section .text
.global main
.global sumDigits

main: 
    li a0,6789            # n=1 to compute sumDigits(n)
    la t2,highest_sp     # t2 contains address of high sp
    la t4,lowest_sp      # t4 contains address of low sp
    sw sp,0(t2)          # store the inital value of sp at address of high sp
    sw sp,0(t4)          # store the initial value of sp at address of low sp
    jal ra,sumDigits

    la t3,result         # t3 contains address of result
    sw a0,0(t3)          # store the value of a0 in address of result
    lw t5,0(t2)          # load value of final high sp to t5
    lw t6,0(t4)          # load value of final low sp to t6
    sub a1,t6,t5         # subtract to find stack usage and store in s1
    j end

sumDigits:
    addi sp,sp,-16
    sw sp,0(t4)         # store the new stack pointer value at low sp address
    sd ra,8(sp)         # return address stored in 16(sp)    
    sd a0,0(sp)         # value of n stored in 8(sp)
    li t0,10            
    blt a0,t0,base_case
    rem t1,a0,t0        # t1= a0 % 10 which is n mod 10
    div a0,a0,t0        # a0= a0 / 10 which is N div 10
    jal ra,sumDigits
    sd a0,0(sp)         # a0 has value of n/10 currently
    add a0,a0,t1        # n mode 10 + value in a0 saved in a0
    ld ra,8(sp)
    addi sp,sp,16
    ret

base_case:
    mv a0,a0
    ld ra,8(sp)
    addi sp,sp,16
    ret 
end:
   li a7,93
   ecall
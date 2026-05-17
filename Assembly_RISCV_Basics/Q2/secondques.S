.data
array: .word 10,10,10,10,10
size: .word 5

.text
.global main

main:
la t0, array
lw t1, size
li t2, 0 # value of i in t2

loop:
  beq t2, t1, end
  li t5, 2
  rem t3, t2, t5
  beqz t3, a
  bnez t3, b

a:
  lw t4, 0(t0)
  addi t4, t4, 1
  sw t4, 0(t0)
  addi t2,t2,1
  addi t0, t0, 4
  j loop

b:
 lw t4, 0(t0)
 addi t4, t4, -1
 sw t4, 0(t0)
 addi t2, t2, 1
 addi t0, t0, 4
 j loop

end:
li a7, 93
ecall 


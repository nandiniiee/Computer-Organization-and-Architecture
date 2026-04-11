.data
A: .word 10
B: .word 20
sum: .word 0
diff: .word 0
andresult: .word 0
orresult: .word 0
xorresult: .word 0

.text
.global main

main:

lw t1, A
lw t2, B
la t0,sum
add t3, t1, t2 
sw t3,0(t0)
sub t4, t1, t2 
la t0, diff
sw t4, 0(t0)
and t5, t1, t2 
la t0, andresult
sw t5, 0(t0)
or t6, t1, t2 
la t0, orresult
sw t6, 0(t0)
not a0, t1 
xor a1, a0, t2
la t0, xorresult
sw a1, 0(t0)

li a7,93
ecall



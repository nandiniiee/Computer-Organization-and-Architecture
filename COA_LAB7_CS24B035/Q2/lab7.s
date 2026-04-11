.section .data
.global ans 
    ans: .space 40

.section .text

.global decrypt 
decrypt:
    lw t0,cipher_text
    la t1,ans
    la t2,substitution
    li t6,26
    cipher:
       lb t3,0(t0)                   # load characters of the cipher text
       li a1,0
       beq t3,a1,done                  # if the character is \0 then done
       li t4,0
    search:
       add t5,t2,t4
       lb t5,0(t5)
       beq t5,t3,foundMatch
       addi t4,t4,1
       j search

    foundMatch:
       li a0, 'a'
       add a0, a0, t4
       sb a0,0(t1)
       addi t0,t0,1
       addi t1,t1,1
       j cipher

    done:   
        ret
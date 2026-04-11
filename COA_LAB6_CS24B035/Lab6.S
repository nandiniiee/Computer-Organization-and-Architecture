.section .text
.global main

# We start with machine mode and configure csrs
main:
    li t0,(1<<8)                    # Put the value 256 in t0 to configure medeleg in next step
    csrw medeleg,t0                 # Now the medelg contains the value 256 to delegate user ecalls to supervisor
    la t0,mtrap_handler             # storing the address of machine trap in t0
    csrw mtvec,t0                   # mtvec now contains the address of mtrap_handler
    la t0,strap_handler             # storing address of supervisor trap in t0  
    csrw stvec,t0                   # supervisor trap address stored in stvec
    la t0,ucode                     # address of user mode code in t0
    csrw mepc,t0                    
    csrr t1,mstatus                 # t1 contains value that was there in mstatus
    li t2,(3<<11)                   # sets the bits 11 and 12 as 1 1
    not t2,t2                       # all the bits are inverted and 11 and 12 bits now contains 00 and others contain 1
    and t1,t1,t2 
    csrw mstatus,t1                 # MPP is now set to 00 (for user mode)
    mret 

.align 4
mtrap_handler:
    mul a1,a1,a2                    # a1=a1*a2
    csrr t6,mstatus                 # to take the screenshot to check the privilege mode
    li a0,0                         # flag flipped so that user mode executed next
    la t0,strap_handler
    csrw mepc,t0                    # mepc contains address of supervisor trap 
    mret                            # returns to the address stored in mepc

scode:
    la t0,ucode1
    csrw sepc,t0
    sret                            # sret returns to the address stored in sepc

.align 4
strap_handler:
    csrr t6,sstatus                 # to check the privilege mode
    beqz a0,ucode1_transition       # if a0==0, then jump to execute user mode work
    ecall

ucode1_transition:
    j scode
     
ucode:
    li a1,1                          # a1==1
    li a2,2                          # a2==2
    li a0,0                          # initially a0==0 so that user mode 
    ecall                            

ucode1:
    add a1,a1,a2                     # a1=a1+a2
    li a0,1                          # flips the value of a0 so that machine mode work excuted in next iteration
ecall

.section .text.init
.global _start
_start:
    la t0,_stack_low                # Stack Pointer Initialized
    mv sp,t0
    la t0,mtrap_handler
    csrw mtvec,t0                   # Trap Vectors setup
    la t0,ucode
    csrw mepc,t0                    # set up mepc to address of ucode to execute mret later
    csrr t1,mstatus
    li t2,(3<<11)
    not t2,t2
    and t1,t1,t2
    csrw mstatus,t1                 # mstatus now has 11 and 12 bit as 00 to jump to user mode
    mret                            # mret now jumps to user mode

.section .text
.align 4

mtrap_handler:
    addi sp,sp,-64                  # saving all registers
    sd t0,0(sp)
    sd t1,8(sp)
    sd t2,16(sp)
    sd t3,24(sp)
    sd t4,32(sp)
    sd t5,40(sp)
    sd t6,48(sp)
    sd a0,56(sp)

    csrr t0,mcause                  # reading the value of mcause
    csrr t1,mepc
    csrr t2,mtval

    li t3,2                         # if mcause 2, then illegal instruction
    beq t0,t3,Illegal_Instructions    
    li t3,3                         # if mcause 3, then breakpoint
    beq t0,t3,Breakpoint
    li t3,4                         # if mcause 4, then loads are misaligned
    beq t0,t3,Misaligned_Loads
    li t3,5                         # if mcause 5, then access fault
    beq t0,t3,Access_Faults
    li t3,8                         # if mcause 8, then user mode ecall
    beq t0,t3,Ecall
    j restore

ucode:
    # Sequence of Exception Tests 
    .word 0x00000000                # Illegal instruction
    ebreak                          # Breakpoint
    .align 2
    la t0,8000003                   # Load Misaligned
    ld t0,0(t0)                     
    li t0,0x0                       # Load Access fault
    ld t1,0(t0)
    ecall                           # User Mode ecall
    li t3,0
    addi t3,t3,0

Ecall:
     li a0,0xFEED                   # load the value in a0
     csrr t4,mepc
     addi t4,t4,4
     csrw mepc,t4                   # mepc=mepc+4
     j restore

Breakpoint:
     li a0,0XBEEF                   # load the value in a0
     csrr t4,mepc
     addi t4,t4,4
     csrw mepc,t4                   # mepc=mepc+4
     j restore

Illegal_Instructions:
     csrr s9,mtval                  # read value of mtval to s9
     csrr t4,mepc
     addi t4,t4,4
     csrw mepc,t4                   # mepc=mepc+4
     j restore

Misaligned_Loads:
     csrr s10,mtval                 # read value of mtval in s10
     csrr t4,mepc
     addi t4,t4,4
     csrw mepc,t4                   # mepc=mepc+4
     j restore
    
Access_Faults:
     csrr s11,mtval                 # read value of mtval in s11
     csrr t4,mepc
     addi t4,t4,4
     csrw mepc,t4                   # mepc=mepc+4
     j restore

restore:
    ld t0,0(sp)
    ld t1,8(sp)
    ld t2,16(sp)
    ld t3,24(sp)
    ld t4,32(sp)
    ld t5,40(sp)
    ld t6,48(sp)
    ld a0,56(sp)
    addi sp,sp,64
    mret

.section .bss
.align 16
_stack_low:
.space 4096
_stack_top:
.section .text
.global main

main:

    la t0, mtrap_handler   # address of mtrap handler in t0
    csrw mtvec, t0
    la t0, strap_handler   # address of strap handler in t0
    csrw stvec, t0
    la t0, supervisor      # address of label supervisor
    csrw mepc, t0          # setting up mepc
    li t0, (3 << 11)       # mask for both MPP bits to clear later
    csrc mstatus, t0       # clear MPP entirely so that we can set up for supervisor
    li t0, (1 << 11)       # MPP = 01 now so that it goes to supervisor
    csrs mstatus, t0
    mret                         

mtrap_handler:
    csrr t0, mcause        # setting up trap handlers so that we could configure the m mode register
    j mtrap_handler

strap_handler:
    csrr t0, scause
    j strap_handler


supervisor:
################ Initialize your page tables here ################

    # Level 3 index 0 pointing to L2 page table
    la t0, l3_pageTable
    la t1, l2_pageTable
    srli t1, t1, 12
    slli t1, t1, 10
    ori t1, t1, 0x01
    sd t1, 0(t0)

    # L2 index 0 pointing to L1_user
    la t0, l2_pageTable
    la t1, l1_user
    srli t1, t1, 12
    slli t1, t1, 10
    ori t1, t1, 0x01
    sd t1, 0(t0)               # index 0, offset = 0

    # L2 index 0 to pointing L1_identity
    la t1, l1_identity
    srli t1, t1, 12
    slli t1, t1, 10
    ori t1, t1, 0x01
    sd t1, 16(t0)              # index 2, offset = 2*8 = 16

    # li_user index 0 ponting to l0_user
    la t0, l1_user
    la t1, l0_user
    srli t1, t1, 12
    slli t1, t1, 10
    ori t1, t1, 0x01
    sd t1, 0(t0)

    # offset here would be 2240
    la t0, l1_identity
    la t1, l0_identity
    srli t1, t1, 12
    slli t1, t1, 10
    ori t1, t1, 0x01
    li t2, 2240
    add t0, t0, t2
    sd t1, 0(t0)

    # L0_id index 0 pointing to Physical address 0xA3000
    la t0, l0_identity
    li t1, 0xA3000
    slli t1, t1, 10
    li t2, 0xCF                
    or t1, t1, t2
    sd t1, 0(t0)               

    # l0_user[0] Physical Address 0xA3001000  
    la t0, l0_user
    li t1, 0xA3001
    slli t1, t1, 10
    li t2, 0xDF                
    or t1, t1, t2
    sd t1, 0(t0)               

    li t3, 1                   # loop counter i = 1
data_map:
    li t1, 0xA3001             # base PPN = 0xA3001
    add t1, t1, t3              
    slli t1, t1, 10
    li t2, 0xDF
    or t1, t1, t2
    slli t4, t3, 3               # byte offset = i * 8
    la t0, l0_user
    add t0, t0, t4
    sd t1, 0(t0)               
    addi t3, t3, 1
    li t5, 2
    blt t3, t5, data_map        

    la t0, l3_pageTable
    srli t0, t0, 12              
    li t1, 9
    slli t1, t1, 60              
    or t0, t0, t1
    la t1, satp_config
    sd t0, 0(t1)

####################################################################
    # jump to user mode
    li t0, (1 << 8)
    csrc sstatus, t0


################ DO NOT MODIFY THESE INSTRUCTIONS ################
    la t1, satp_config
    ld t2, 0(t1)
    sfence.vma zero, zero
    csrrw zero, satp, t2            # Sv48 paging ACTIVE
    sfence.vma zero, zero
    # PC is at VA 0x8C000xxx, identity-mapped via l0_id[0]. No fault.

    li t4, 0
    csrrw zero, sepc, t4            # sepc = VA 0x00000000 (user_code)
    sret                            # -> User mode, PC = VA 0x00000000
####################################################################


.org 0x1000
user_code:
    la t0, var1
    ld t1, 0(t0)               # t1 = 1
    la t0, var2
    ld t2, 0(t0)               # t2 = 2
    la t0, var3
    ld t3, 0(t0)               # t3 = 3
    la t0, var4
    ld t4, 0(t0)               # t4 = 4

loop:
    j loop

.section .data
# vars and satp_config live on their own page (0x8C008000)
.align 3
var1: .dword 1
var2: .dword 2
var3: .dword 3
var4: .dword 4

.align 3
satp_config: .dword 0

.align 12

l3_pageTable:      .zero 4096
.align 12
l2_pageTable:      .zero 4096
.align 12
l1_identity:      .zero 4096
.align 12
l1_user:     .zero 4096
.align 12
l0_identity:      .zero 4096
.align 12
l0_user:     .zero 4096
.align 12




.section .text
.global main



main:
    # Prepare jump to super mode
    li t1, 1
    slli t1, t1, 11   #mpp_mask
    csrs mstatus, t1
    
    la t4, supervisor       #load address of user-space code
    csrrw zero, mepc, t4    #set mepc to user code
    
    la t5, page_fault_handler
    csrw mtvec, t5
   
    mret

supervisor:
################## Setting up page tables ##############
    # Set value in PTE2 (Initial Mapping)
    li a0,0x81000000
    li a1, 0x82000
    slli a1, a1, 0xa
    ori a1, a1, 0x01 # | - | - | - |V
    sd a1, 16(a0)

    # To set V.A 0x0 -> P.A 0x0
    li a1, 0x82001
    slli a1, a1, 0xa
    ori a1, a1, 0x01 # | - | - | - |V
    sd a1, 0(a0)

    # Set value in PTE1 (Initial Mapping)
    li a0,0x82000000
    li a1, 0x83000
    slli a1, a1, 0xa
    ori a1, a1, 0x01 # | - | - | - |V
    sd a1, 0(a0)

    # Set Frame number in PTE0 (Initial Mapping)
    li a0,0x83000000
    li a1, 0x80000
    slli a1, a1, 0xa
    ori a1, a1, 0xef # D | A | G | - | X | W | R |V
    sd a1, 0(a0)

    li a1, 0x80001
    slli a1, a1, 0xa
    ori a1, a1, 0xef # D | A | G | - | X | W | R |V
    sd a1, 8(a0)

    # Set value in PTE1 (Code Mapping)
    li a0,0x82001000
    li a1, 0x83001
    slli a1, a1, 0xa
    ori a1, a1, 0x01 # | - | - | - |V
    sd a1, 0(a0)

    # Set value in PTE0 (Code Mapping)
    li a0,0x83001000
    li a1, 0x80001
    slli a1, a1, 0xa
    ori a1, a1, 0xfb # D | A | G | U | X | - | R |V
    sd a1, 0(a0)

    # Data Mapping
    li a1, 0x80002
    slli a1, a1, 0xa
    ori a1, a1, 0xf7 # D | A | G | U | - | W | R |V
    sd a1, 8(a0)
    

####################################################################

    # Prepare jump to user mode
    li t1, 0
    slli t1, t1, 8   #spp_mask
    csrs sstatus, t1

    # Configure satp
    la t1, satp_config 
    ld t2, 0(t1)
    sfence.vma zero, zero
    csrrw zero, satp, t2
    sfence.vma zero, zero

    li t4, 0       # load VA address of user-space code
    csrrw zero, sepc, t4    # set sepc to user code
    
    sret



###################################################################
##################### ADD CODE ONLY HERE  #########################
###################################################################
.align 4
page_fault_handler:
    # Save execution context to physical memory
    # Machine mode operates in physical memory, thus we can directly access trap_save
    la t0, trap_save
    sd t1, 0(t0)
    sd t2, 8(t0)
    sd t3, 16(t0)
    sd t4, 24(t0)
    sd t5, 32(t0)
    sd t6, 40(t0)
    sd a0, 48(t0)
    sd a1, 56(t0)
    sd a2, 64(t0)
    sd a3, 72(t0)
    sd a4, 80(t0)

    # Determine the cause of the trap
    csrr t1, mcause
    li t2, 12                      # Instruction Page Fault corresponds to exception code number 12
    beq t1, t2, interrupt_handler

    li t2, 13                      # Load Page fault corresponds to exception code number 13
    beq t1, t2, interrupt_handler

    li t2, 15                      # Store page fault corresponds to excpetion code number 15
    beq t1, t2, interrupt_handler

    j done_handler                 # If another trap, then exit safely
    
interrupt_handler:
    csrr a0, mtval                 # Get the faulting Virtual Address

    # Level-2 Table Walk
    li t1, 0x81000000             # Base of Level-2 Root Table
    srli t2, a0, 30               # Extract Virtual page number 2 (Bits 30-38)
    li t3, 0x1FF
    and t2, t2, t3
    slli t2, t2, 3                # Multiply by 8
    add t1, t1, t2                # Address of Level 2 page table entry
    ld t2, 0(t1)                  # Load Level 2 page table entry

    # Level-1 Table Walk
    srli t2, t2, 10               # Extract Physical Page number
    slli t2, t2, 12               # Calculate physical base of Level 1 Table
    srli t3, a0, 21               # Extract Virtual Page number 1 (Bits 21-29)
    li t4, 0x1FF
    and t3, t3, t4
    slli t3, t3, 3                # Multiply by 8
    add t3, t2, t3                # Address of Level 1 page table entry
    ld t4, 0(t3)                  # Load Level 1 page table entry

    # Checking if L1 PTE is valid bit or not (Bit 0)
    andi t5, t4, 1
    bnez t5, valid_l1             # If it is Valid, then we skip allocation

    # Allocate a new Level-0 Page Table
    la t5, next_free_page
    ld t6, 0(t5)                 # t6 is now equal to the New 4KB physical page address
    li t0, 0x1000
    add a1, t6, t0
    sd a1, 0(t5)                 

    # Write directory pointer into L1 PTE
    srli a1, t6, 12              # Extract Physical page number of new table
    slli a1, a1, 10
    ori a1, a1, 1                # Valid Flag (V=1)
    sd a1, 0(t3)
    mv t4, a1                    # Update t4 to hold the new valid page table entry

valid_l1:
    # Level-0 Table Walk
    srli t4, t4, 10        # Extract PPN
    slli t4, t4, 12        # Calculate physical base of L0 Table
    srli t5, a0, 12        # Extract Virtual page number 0 (Bits 12-20)
    li t6, 0x1FF
    and t5, t5, t6
    slli t5, t5, 3         # Multiply by 8
    add t5, t4, t5         # Address of L0 Leaf page table entry slot

    # Branch logic based on Fault Type
    csrr t1, mcauseclear
    li t2, 12
    beq t1, t2, inst_page_mapping

data_page_mapping:
    # Handle Load/Store data Fault by Mapping directly to the existing User Data page at 0x80002000
    li a1, 0x80002000
    srli a1, a1, 12
    slli a1, a1, 10
    ori a1, a1, 0xF7       
    sd a1, 0(t5)           # Store leaf PTE into L0 slot
    j done_handler

inst_page_mapping:
    # Handle Instruction Fault
    # Allocate a new physical page for the swapped code
    la t6, next_free_page
    ld a1, 0(t6)           # a1 is equal to the New physical page address
    li t0, 0x1000
    add a2, a1, t0
    sd a2, 0(t6)          

    # Copy the user code from 0x80001000 into the new page
    li a2, 0x80001000      # Source Address
    li a3, 0x1000          # Total bytes to copy is 4096
    mv a4, a1              # Destination Address

copy_loop:
    ld t6, 0(a2)           # we are reading 8 bytes
    sd t6, 0(a4)           # we are writing 8 bytes
    addi a2, a2, 8         
    addi a4, a4, 8
    addi a3, a3, -8        
    bnez a3, copy_loop

    # Map the new page into the L0 table
    srli a1, a1, 12
    slli a1, a1, 10
    ori a1, a1, 0xFB       
    sd a1, 0(t5)           # Store leaf PTE into L0 slot


done_handler:
    # Flush the TLB since the page tables have been modified
    sfence.vma zero, zero

    # Restore context
    la t0, trap_save
    ld t1, 0(t0)
    ld t2, 8(t0)
    ld t3, 16(t0)
    ld t4, 24(t0)
    ld t5, 32(t0)
    ld t6, 40(t0)
    ld a0, 48(t0)
    ld a1, 56(t0)
    ld a2, 64(t0)
    ld a3, 72(t0)
    ld a4, 80(t0)
    
    mret          # return to the faulting instruction to try again

###################################################################
###################################################################



.align 12
user_code:
    la t1,var_count
    lw t2, 0(t1)
    addi t2, t2, 1
    sw t2, 0(t1)

    la t5, code_jump_position
    lw t3, 0(t5)
    li t4, 0x2000
    add t3, t3, t4
    sw t3, 0(t5)
    
    jalr x0, t3


.data
.align 12
var_count:  .word  0
code_jump_position: .word 0x0000


.align 8
# Value to set in satp
satp_config: .dword 0x8000000000081000

.align 8
next_free_page: .dword 0x80003000   # Tracks the next available 4KB physical page
trap_save:      .zero 128           # Pre-allocated physical memory to save registers safely

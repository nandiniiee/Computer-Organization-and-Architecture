	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #2
	b.ge	LBB0_2
	b	LBB0_1
LBB0_1:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldur	x8, [x29, #-16]
	ldr	x8, [x8]
	mov	x9, sp
	str	x8, [x9]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	bl	_fprintf
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_9
LBB0_2:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	bl	_atoi
	stur	w0, [x29, #-20]
	ldur	w8, [x29, #-20]
	subs	w8, w8, #0
	b.gt	LBB0_4
	b	LBB0_3
LBB0_3:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	bl	_fprintf
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_9
LBB0_4:
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-20]
	mul	x0, x8, x9
	mov	x1, #8                          ; =0x8
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	bl	_calloc
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	stur	x0, [x29, #-32]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-20]
	mul	x0, x8, x9
	bl	_calloc
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	str	x0, [sp, #40]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-20]
	mul	x0, x8, x9
	bl	_calloc
	str	x0, [sp, #32]
	ldur	x8, [x29, #-32]
	cbz	x8, LBB0_7
	b	LBB0_5
LBB0_5:
	ldr	x8, [sp, #40]
	cbz	x8, LBB0_7
	b	LBB0_6
LBB0_6:
	ldr	x8, [sp, #32]
	cbnz	x8, LBB0_8
	b	LBB0_7
LBB0_7:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldur	w8, [x29, #-20]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
	ldur	x0, [x29, #-32]
	bl	_free
	ldr	x0, [sp, #40]
	bl	_free
	ldr	x0, [sp, #32]
	bl	_free
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_9
LBB0_8:
	ldur	w0, [x29, #-20]
	ldur	x1, [x29, #-32]
	fmov	d0, #1.00000000
	bl	_init_matrix
	ldur	w0, [x29, #-20]
	ldr	x1, [sp, #40]
	fmov	d0, #0.50000000
	bl	_init_matrix
	bl	_read_tsc
	str	x0, [sp, #24]
	ldur	w0, [x29, #-20]
	ldur	x1, [x29, #-32]
	ldr	x2, [sp, #40]
	ldr	x3, [sp, #32]
	bl	_matmul
	bl	_read_tsc
	str	x0, [sp, #16]
	ldur	w0, [x29, #-20]
	ldr	x1, [sp, #32]
	bl	_checksum
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-32]
	bl	_free
	ldr	x0, [sp, #40]
	bl	_free
	ldr	x0, [sp, #32]
	bl	_free
	stur	wzr, [x29, #-4]
	b	LBB0_9
LBB0_9:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function init_matrix
_init_matrix:                           ; @init_matrix
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	d0, [sp, #8]
	str	wzr, [sp, #4]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	ldr	w9, [sp, #28]
	ldr	w10, [sp, #28]
	mul	w9, w9, w10
	subs	w8, w8, w9
	b.ge	LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	d0, [sp, #8]
	ldr	w8, [sp, #4]
	mov	w10, #17                        ; =0x11
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	add	w8, w8, #1
	scvtf	d1, w8
	fmul	d0, d0, d1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #4]
	str	d0, [x8, x9, lsl #3]
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB1_1
LBB1_4:
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function read_tsc
_read_tsc:                              ; @read_tsc
	.cfi_startproc
; %bb.0:
	mov	x0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function matmul
_matmul:                                ; @matmul
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	str	w0, [sp, #60]
	str	x1, [sp, #48]
	str	x2, [sp, #40]
	str	x3, [sp, #32]
	str	wzr, [sp, #28]
	b	LBB3_1
LBB3_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_3 Depth 2
                                        ;       Child Loop BB3_5 Depth 3
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #60]
	subs	w8, w8, w9
	b.ge	LBB3_12
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	str	wzr, [sp, #24]
	b	LBB3_3
LBB3_3:                                 ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_5 Depth 3
	ldr	w8, [sp, #24]
	ldr	w9, [sp, #60]
	subs	w8, w8, w9
	b.ge	LBB3_10
	b	LBB3_4
LBB3_4:                                 ;   in Loop: Header=BB3_3 Depth=2
	movi	d0, #0000000000000000
	str	d0, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB3_5
LBB3_5:                                 ;   Parent Loop BB3_1 Depth=1
                                        ;     Parent Loop BB3_3 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #60]
	subs	w8, w8, w9
	b.ge	LBB3_8
	b	LBB3_6
LBB3_6:                                 ;   in Loop: Header=BB3_5 Depth=3
	ldr	x8, [sp, #48]
	ldr	w9, [sp, #28]
	ldr	w10, [sp, #60]
	mul	w9, w9, w10
	ldr	w10, [sp, #12]
	add	w9, w9, w10
	ldr	d0, [x8, w9, sxtw #3]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #60]
	mul	w9, w9, w10
	ldr	w10, [sp, #24]
	add	w9, w9, w10
	ldr	d1, [x8, w9, sxtw #3]
	ldr	d2, [sp, #16]
	fmadd	d0, d0, d1, d2
	str	d0, [sp, #16]
	b	LBB3_7
LBB3_7:                                 ;   in Loop: Header=BB3_5 Depth=3
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB3_5
LBB3_8:                                 ;   in Loop: Header=BB3_3 Depth=2
	ldr	d0, [sp, #16]
	ldr	x8, [sp, #32]
	ldr	w9, [sp, #28]
	ldr	w10, [sp, #60]
	mul	w9, w9, w10
	ldr	w10, [sp, #24]
	add	w9, w9, w10
	str	d0, [x8, w9, sxtw #3]
	b	LBB3_9
LBB3_9:                                 ;   in Loop: Header=BB3_3 Depth=2
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB3_3
LBB3_10:                                ;   in Loop: Header=BB3_1 Depth=1
	b	LBB3_11
LBB3_11:                                ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB3_1
LBB3_12:
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function checksum
_checksum:                              ; @checksum
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	movi	d0, #0000000000000000
	str	d0, [sp, #8]
	str	wzr, [sp, #4]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	ldr	w9, [sp, #28]
	ldr	w10, [sp, #28]
	mul	w9, w9, w10
	subs	w8, w8, w9
	b.ge	LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #4]
	ldr	d1, [x8, x9, lsl #3]
	ldr	d0, [sp, #8]
	fadd	d0, d0, d1
	str	d0, [sp, #8]
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB4_1
LBB4_4:
	ldr	d0, [sp, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"usage: %s <N>\n"

l_.str.1:                               ; @.str.1
	.asciz	"N must be positive\n"

l_.str.2:                               ; @.str.2
	.asciz	"allocation failed for N=%d\n"

l_.str.3:                               ; @.str.3
	.asciz	"checksum=%f\n"

l_.str.4:                               ; @.str.4
	.asciz	"cycles=%llu\n"

.subsections_via_symbols

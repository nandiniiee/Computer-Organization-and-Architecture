	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cmp	w0, #1
	b.gt	LBB0_2
; %bb.1:
Lloh0:
	adrp	x8, ___stderrp@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh2:
	ldr	x0, [x8]
	ldr	x8, [x1]
	str	x8, [sp]
Lloh3:
	adrp	x1, l_.str@PAGE
Lloh4:
	add	x1, x1, l_.str@PAGEOFF
	bl	_fprintf
	b	LBB0_5
LBB0_2:
	ldr	x0, [x1, #8]
	bl	_atoi
	cmp	w0, #1
	b.lt	LBB0_6
; %bb.3:
	mov	x21, x0
	umull	x19, w0, w0
	mov	x0, x19
	mov	w1, #8                          ; =0x8
	bl	_calloc
	mov	x20, x0
	mov	x0, x19
	mov	w1, #8                          ; =0x8
	bl	_calloc
	mov	x19, x0
	cmp	x20, #0
	ccmp	x0, #0, #4, ne
	b.ne	LBB0_7
; %bb.4:
Lloh5:
	adrp	x8, ___stderrp@GOTPAGE
Lloh6:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh7:
	ldr	x0, [x8]
	str	x21, [sp]
Lloh8:
	adrp	x1, l_.str.2@PAGE
Lloh9:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
LBB0_5:
	mov	w19, #1                         ; =0x1
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB0_6:
Lloh10:
	adrp	x8, ___stderrp@GOTPAGE
Lloh11:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh12:
	ldr	x3, [x8]
Lloh13:
	adrp	x0, l_.str.1@PAGE
Lloh14:
	add	x0, x0, l_.str.1@PAGEOFF
	mov	w19, #1                         ; =0x1
	mov	w1, #19                         ; =0x13
	mov	w2, #1                          ; =0x1
	bl	_fwrite
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB0_7:
	mov	w10, w21
	mul	w9, w21, w21
	cmp	w9, #1
	csinc	w8, w9, wzr, hi
	cmp	w9, #4
	b.hs	LBB0_9
; %bb.8:
	mov	x11, #0                         ; =0x0
	b	LBB0_12
LBB0_9:
	mov	w12, #0                         ; =0x0
	and	x11, x8, #0xfffffffc
	add	x13, x20, #16
	mov	w14, #1                         ; =0x1
	mov	w15, #2                         ; =0x2
	mov	w16, #3                         ; =0x3
	mov	w17, #4                         ; =0x4
	mov	w0, #61681                      ; =0xf0f1
	movk	w0, #61680, lsl #16
	mov	x1, x11
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	umull	x2, w12, w0
	lsr	x2, x2, #36
	add	w2, w2, w2, lsl #4
	sub	w2, w14, w2
	umull	x3, w14, w0
	lsr	x3, x3, #36
	add	w3, w3, w3, lsl #4
	sub	w3, w15, w3
	umull	x4, w15, w0
	lsr	x4, x4, #36
	add	w4, w4, w4, lsl #4
	sub	w4, w16, w4
	umull	x5, w16, w0
	lsr	x5, x5, #36
	add	w5, w5, w5, lsl #4
	sub	w5, w17, w5
	ucvtf	d0, w2
	ucvtf	d1, w3
	ucvtf	d2, w4
	ucvtf	d3, w5
	stp	d0, d1, [x13, #-16]
	add	w14, w14, #4
	add	w12, w12, #4
	add	w15, w15, #4
	stp	d2, d3, [x13], #32
	add	w16, w16, #4
	add	w17, w17, #4
	subs	x1, x1, #4
	b.ne	LBB0_10
; %bb.11:
	cmp	x11, x8
	b.eq	LBB0_14
LBB0_12:
	sub	x12, x8, x11
	add	w13, w11, #1
	mov	w14, #61681                     ; =0xf0f1
	movk	w14, #61680, lsl #16
	add	x15, x20, x11, lsl #3
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	umull	x16, w11, w14
	lsr	x16, x16, #36
	add	w16, w16, w16, lsl #4
	sub	w16, w13, w16
	ucvtf	d0, w16
	str	d0, [x15], #8
	add	w13, w13, #1
	add	w11, w11, #1
	subs	x12, x12, #1
	b.ne	LBB0_13
LBB0_14:
	cmp	w21, #4
	b.hs	LBB0_21
; %bb.15:
	mov	x11, #0                         ; =0x0
	lsl	x12, x10, #3
	mov	x13, x20
	mov	x14, x19
LBB0_16:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_17 Depth 2
	mov	x15, x13
	mov	x16, x14
	mov	x17, x10
LBB0_17:                                ;   Parent Loop BB0_16 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x15], #8
	str	d0, [x16]
	add	x16, x16, x12
	subs	x17, x17, #1
	b.ne	LBB0_17
; %bb.18:                               ;   in Loop: Header=BB0_16 Depth=1
	add	x11, x11, #1
	add	x14, x14, #8
	add	x13, x13, x12
	cmp	x11, x10
	b.ne	LBB0_16
LBB0_19:
	cmp	w9, #8
	b.hs	LBB0_28
; %bb.20:
	mov	x9, #0                          ; =0x0
	movi	d0, #0000000000000000
	b	LBB0_31
LBB0_21:
	mov	x11, #0                         ; =0x0
	and	x12, x10, #0x7ffffffc
	add	x13, x10, x10, lsl #1
	lsl	x13, x13, #3
	lsl	x14, x10, #5
	lsl	x15, x10, #4
	add	x16, x20, #16
	lsl	x17, x10, #3
	sub	x0, x10, x12
	ubfx	x2, x10, #2, #29
	umull	x1, w10, w2
	add	x1, x19, x1, lsl #5
	add	x2, x20, x2, lsl #5
	mov	x3, x19
	b	LBB0_23
LBB0_22:                                ;   in Loop: Header=BB0_23 Depth=1
	add	x11, x11, #1
	add	x3, x3, #8
	add	x16, x16, x17
	add	x1, x1, #8
	add	x2, x2, x17
	cmp	x11, x10
	b.eq	LBB0_19
LBB0_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_24 Depth 2
                                        ;     Child Loop BB0_27 Depth 2
	mov	x4, x16
	mov	x5, x3
	mov	x6, x12
LBB0_24:                                ;   Parent Loop BB0_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	d0, d1, [x4, #-16]
	ldp	d2, d3, [x4], #32
	str	d1, [x5, x17]
	str	d2, [x5, x15]
	str	d0, [x5]
	str	d3, [x5, x13]
	add	x5, x5, x14
	subs	x6, x6, #4
	b.ne	LBB0_24
; %bb.25:                               ;   in Loop: Header=BB0_23 Depth=1
	cmp	x10, x12
	b.eq	LBB0_22
; %bb.26:                               ;   in Loop: Header=BB0_23 Depth=1
	mov	x4, x2
	mov	x5, x1
	mov	x6, x0
LBB0_27:                                ;   Parent Loop BB0_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x4], #8
	str	d0, [x5]
	add	x5, x5, x17
	subs	x6, x6, #1
	b.ne	LBB0_27
	b	LBB0_22
LBB0_28:
	and	x9, x8, #0xfffffff8
	add	x10, x19, #32
	movi	d0, #0000000000000000
	mov	x11, x9
LBB0_29:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x10, #-32]
	mov	d3, v1[1]
	mov	d4, v2[1]
	ldp	q5, q6, [x10], #64
	mov	d7, v5[1]
	mov	d16, v6[1]
	fadd	d0, d0, d1
	fadd	d0, d0, d3
	fadd	d0, d0, d2
	fadd	d0, d0, d4
	fadd	d0, d0, d5
	fadd	d0, d0, d7
	fadd	d0, d0, d6
	fadd	d0, d0, d16
	subs	x11, x11, #8
	b.ne	LBB0_29
; %bb.30:
	cmp	x9, x8
	b.eq	LBB0_33
LBB0_31:
	sub	x8, x8, x9
	add	x9, x19, x9, lsl #3
LBB0_32:                                ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x9], #8
	fadd	d0, d0, d1
	subs	x8, x8, #1
	b.ne	LBB0_32
LBB0_33:
	str	d0, [sp]
Lloh15:
	adrp	x0, l_.str.3@PAGE
Lloh16:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	mov	w19, #0                         ; =0x0
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh10, Lloh11, Lloh12
	.loh AdrpAdd	Lloh15, Lloh16
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

.subsections_via_symbols

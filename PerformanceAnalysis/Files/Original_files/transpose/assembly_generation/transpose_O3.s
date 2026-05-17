	.file	"transpose.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"usage: %s <N>\n"
.LC3:
	.string	"N must be positive\n"
.LC4:
	.string	"allocation failed for N=%d\n"
.LC8:
	.string	"checksum=%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$1, %edi
	jle	.L25
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	movq	%rax, %rbp
	testl	%eax, %eax
	jle	.L26
	movslq	%eax, %rcx
	movl	$8, %esi
	movl	%eax, 12(%rsp)
	movq	%rcx, %r12
	movq	%rcx, (%rsp)
	imulq	%rcx, %r12
	movq	%r12, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	calloc@PLT
	testq	%rbx, %rbx
	movl	12(%rsp), %r9d
	movq	%rax, %r8
	je	.L6
	testq	%rax, %rax
	je	.L6
	movl	%ebp, %r10d
	movq	(%rsp), %rcx
	imull	%ebp, %r10d
	leal	-1(%r10), %eax
	cmpl	$2, %eax
	jbe	.L17
	movdqa	.LC5(%rip), %xmm3
	movl	%r10d, %edx
	movdqa	.LC0(%rip), %xmm2
	movq	%rbx, %rax
	shrl	$2, %edx
	movdqa	.LC6(%rip), %xmm6
	movdqa	.LC7(%rip), %xmm5
	salq	$5, %rdx
	movdqa	%xmm3, %xmm4
	addq	%rbx, %rdx
	psrad	$31, %xmm4
	.p2align 4
	.p2align 3
.L8:
	movdqa	%xmm2, %xmm1
	movdqa	%xmm4, %xmm7
	movdqa	%xmm2, %xmm0
	addq	$32, %rax
	psrad	$31, %xmm1
	pmuludq	%xmm2, %xmm7
	movdqa	%xmm4, %xmm8
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm3, %xmm0
	paddq	%xmm7, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	psrlq	$32, %xmm1
	movdqa	%xmm1, %xmm7
	pmuludq	%xmm1, %xmm8
	psrad	$31, %xmm7
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm3, %xmm7
	paddq	%xmm8, %xmm7
	psllq	$32, %xmm7
	paddq	%xmm7, %xmm1
	shufps	$221, %xmm1, %xmm0
	pshufd	$216, %xmm0, %xmm0
	psrad	$3, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$4, %xmm1
	paddd	%xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	paddd	%xmm5, %xmm2
	psubd	%xmm1, %xmm0
	paddd	%xmm6, %xmm0
	cvtdq2pd	%xmm0, %xmm1
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm1, -32(%rax)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L8
	movl	%r10d, %esi
	andl	$-4, %esi
	testb	$3, %r10b
	je	.L9
.L7:
	movl	%esi, %eax
	movl	$17, %edi
	pxor	%xmm0, %xmm0
	movslq	%esi, %r11
	cltd
	idivl	%edi
	leal	1(%rsi), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, (%rbx,%r11,8)
	cmpl	%eax, %r10d
	jle	.L9
	cltd
	pxor	%xmm0, %xmm0
	idivl	%edi
	leal	2(%rsi), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 8(%rbx,%r11,8)
	cmpl	%r10d, %eax
	jge	.L9
	cltd
	pxor	%xmm0, %xmm0
	idivl	%edi
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 16(%rbx,%r11,8)
.L9:
	leal	-1(%rbp), %eax
	movq	$-8, %r12
	movq	%r8, %rdi
	movq	%r8, %rbp
	salq	$3, %rax
	leaq	0(,%rcx,8), %rsi
	xorl	%r11d, %r11d
	leaq	8(%rbx,%rax), %rcx
	subq	%rax, %r12
	.p2align 4
	.p2align 3
.L11:
	leaq	(%r12,%rcx), %rax
	movq	%rbp, %rdx
	.p2align 5
	.p2align 4
	.p2align 3
.L12:
	movsd	(%rax), %xmm0
	addq	$8, %rax
	movsd	%xmm0, (%rdx)
	addq	%rsi, %rdx
	cmpq	%rcx, %rax
	jne	.L12
	addl	$1, %r11d
	addq	$8, %rbp
	leaq	(%rax,%rsi), %rcx
	cmpl	%r11d, %r9d
	jne	.L11
	cmpl	$1, %r10d
	je	.L18
	movl	%r10d, %eax
	pxor	%xmm0, %xmm0
	shrl	%eax
	salq	$4, %rax
	addq	%r8, %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L15:
	addsd	(%rdi), %xmm0
	addq	$16, %rdi
	addsd	-8(%rdi), %xmm0
	cmpq	%rdi, %rax
	jne	.L15
	movl	%r10d, %eax
	andl	$-2, %eax
	andb	$1, %r10b
	je	.L16
.L14:
	cltq
	addsd	(%r8,%rax,8), %xmm0
.L16:
	leaq	.LC8(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	movq	%r8, (%rsp)
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L17:
	xorl	%esi, %esi
	jmp	.L7
.L26:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L18:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L14
.L6:
	movq	stderr(%rip), %rdi
	movl	%r9d, %ecx
	xorl	%eax, %eax
	movq	%r8, (%rsp)
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	jmp	.L3
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC5:
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.align 16
.LC6:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

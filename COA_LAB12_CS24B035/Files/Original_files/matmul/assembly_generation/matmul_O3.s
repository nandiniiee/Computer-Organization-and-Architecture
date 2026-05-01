	.file	"matmul.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"usage: %s <N>\n"
.LC3:
	.string	"N must be positive\n"
.LC4:
	.string	"allocation failed for N=%d\n"
.LC10:
	.string	"checksum=%f\n"
.LC11:
	.string	"cycles=%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7502:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$1, %edi
	jle	.L50
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	jle	.L51
	movslq	%eax, %r8
	movl	$8, %esi
	movq	%rax, 16(%rsp)
	movq	%r8, %r12
	movq	%r8, 8(%rsp)
	imulq	%r8, %r12
	movq	%r12, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	movq	%rax, %r14
	movq	%rax, (%rsp)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	calloc@PLT
	testq	%r14, %r14
	movq	%rax, 32(%rsp)
	movq	%rax, %rsi
	sete	%al
	testq	%rbx, %rbx
	sete	%dl
	orb	%dl, %al
	jne	.L6
	testq	%rsi, %rsi
	je	.L6
	movq	16(%rsp), %r10
	movq	8(%rsp), %r8
	movl	%r10d, %r9d
	imull	%r10d, %r9d
	leal	-1(%r9), %esi
	cmpl	$2, %esi
	jbe	.L28
	movdqa	.LC5(%rip), %xmm4
	movl	%r9d, %edx
	movdqa	.LC0(%rip), %xmm1
	movq	%r14, %rax
	shrl	$2, %edx
	movdqa	.LC6(%rip), %xmm7
	movdqa	.LC7(%rip), %xmm6
	salq	$5, %rdx
	movdqa	%xmm4, %xmm5
	movdqa	%xmm1, %xmm3
	addq	%r14, %rdx
	psrad	$31, %xmm5
	.p2align 4
	.p2align 3
.L8:
	movdqa	%xmm3, %xmm2
	movdqa	%xmm5, %xmm8
	movdqa	%xmm3, %xmm0
	addq	$32, %rax
	psrad	$31, %xmm2
	pmuludq	%xmm3, %xmm8
	movdqa	%xmm5, %xmm9
	pmuludq	%xmm4, %xmm2
	pmuludq	%xmm4, %xmm0
	paddq	%xmm8, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	psrlq	$32, %xmm2
	movdqa	%xmm2, %xmm8
	pmuludq	%xmm2, %xmm9
	psrad	$31, %xmm8
	pmuludq	%xmm4, %xmm2
	pmuludq	%xmm4, %xmm8
	paddq	%xmm9, %xmm8
	psllq	$32, %xmm8
	paddq	%xmm8, %xmm2
	shufps	$221, %xmm2, %xmm0
	pshufd	$216, %xmm0, %xmm0
	psrad	$3, %xmm0
	movdqa	%xmm0, %xmm2
	pslld	$4, %xmm2
	paddd	%xmm0, %xmm2
	movdqa	%xmm3, %xmm0
	paddd	%xmm6, %xmm3
	psubd	%xmm2, %xmm0
	paddd	%xmm7, %xmm0
	cvtdq2pd	%xmm0, %xmm2
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm2, -32(%rax)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L8
	movl	%r9d, %ecx
	andl	$-4, %ecx
	testb	$3, %r9b
	je	.L27
.L7:
	movl	%ecx, %eax
	movl	$17, %edi
	movq	(%rsp), %r14
	movslq	%ecx, %r11
	cltd
	pxor	%xmm0, %xmm0
	idivl	%edi
	leal	1(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, (%r14,%r11,8)
	cmpl	%r9d, %eax
	jge	.L10
	cltd
	pxor	%xmm0, %xmm0
	idivl	%edi
	leal	2(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 8(%r14,%r11,8)
	cmpl	%r9d, %eax
	jge	.L48
	cltd
	pxor	%xmm0, %xmm0
	movdqa	.LC0(%rip), %xmm1
	idivl	%edi
	movq	(%rsp), %rax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 16(%rax,%r11,8)
.L27:
	movdqa	.LC5(%rip), %xmm2
	movl	%r9d, %edx
	movsd	.LC9(%rip), %xmm4
	movq	%rbx, %rax
	shrl	$2, %edx
	movdqa	.LC6(%rip), %xmm6
	movdqa	.LC7(%rip), %xmm5
	salq	$5, %rdx
	movdqa	%xmm2, %xmm3
	unpcklpd	%xmm4, %xmm4
	addq	%rbx, %rdx
	psrad	$31, %xmm3
	.p2align 4
	.p2align 3
.L13:
	movdqa	%xmm1, %xmm7
	movdqa	%xmm3, %xmm8
	movdqa	%xmm1, %xmm0
	addq	$32, %rax
	psrad	$31, %xmm7
	pmuludq	%xmm1, %xmm8
	movdqa	%xmm3, %xmm9
	pmuludq	%xmm2, %xmm7
	pmuludq	%xmm2, %xmm0
	paddq	%xmm8, %xmm7
	psllq	$32, %xmm7
	paddq	%xmm7, %xmm0
	movdqa	%xmm1, %xmm7
	psrlq	$32, %xmm7
	movdqa	%xmm7, %xmm8
	pmuludq	%xmm7, %xmm9
	psrad	$31, %xmm8
	pmuludq	%xmm2, %xmm7
	pmuludq	%xmm2, %xmm8
	paddq	%xmm9, %xmm8
	psllq	$32, %xmm8
	paddq	%xmm8, %xmm7
	shufps	$221, %xmm7, %xmm0
	pshufd	$216, %xmm0, %xmm0
	psrad	$3, %xmm0
	movdqa	%xmm0, %xmm7
	pslld	$4, %xmm7
	paddd	%xmm0, %xmm7
	movdqa	%xmm1, %xmm0
	paddd	%xmm5, %xmm1
	psubd	%xmm7, %xmm0
	paddd	%xmm6, %xmm0
	cvtdq2pd	%xmm0, %xmm7
	mulpd	%xmm4, %xmm7
	pshufd	$238, %xmm0, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm4, %xmm0
	movups	%xmm7, -32(%rax)
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L13
	testb	$3, %r9b
	je	.L14
	movl	%r9d, %ecx
	movl	$17, %esi
	movsd	.LC9(%rip), %xmm1
	pxor	%xmm0, %xmm0
	andl	$-4, %ecx
	movl	%ecx, %eax
	movslq	%ecx, %rdi
	cltd
	idivl	%esi
	leal	1(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rbx,%rdi,8)
	cmpl	%r9d, %eax
	jge	.L14
	cltd
	pxor	%xmm0, %xmm0
	idivl	%esi
	leal	2(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rbx,%rdi,8)
	cmpl	%r9d, %eax
	jge	.L14
	cltd
	pxor	%xmm0, %xmm0
	idivl	%esi
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rbx,%rdi,8)
.L14:
	rdtsc
	xorl	%ecx, %ecx
	movq	32(%rsp), %r13
	movq	(%rsp), %r12
	salq	$32, %rdx
	movl	%r9d, 52(%rsp)
	movq	%r8, %rsi
	movl	%r10d, %r14d
	orq	%rdx, %rax
	movq	%r13, 56(%rsp)
	salq	$4, %rsi
	xorl	%edx, %edx
	movq	%rax, 40(%rsp)
	movl	%r10d, %eax
	leaq	0(,%r8,8), %r15
	shrl	%eax
	salq	$4, %rax
	movq	%rax, 24(%rsp)
	.p2align 4
	.p2align 3
.L15:
	movq	24(%rsp), %rax
	movl	%ecx, 8(%rsp)
	movq	%rbx, %r11
	xorl	%r9d, %r9d
	movq	%r15, 16(%rsp)
	leaq	(%rax,%r12), %rdi
	.p2align 4
	.p2align 3
.L17:
	movl	%r9d, %r15d
	cmpl	$1, %r10d
	je	.L29
.L21:
	movq	%r12, %rcx
	movq	%r11, %rax
	pxor	%xmm1, %xmm1
	.p2align 6
	.p2align 4
	.p2align 3
.L19:
	movupd	(%rcx), %xmm6
	movsd	(%rax), %xmm0
	movhpd	(%rax,%r8,8), %xmm0
	addq	$16, %rcx
	addq	%rsi, %rax
	mulpd	%xmm6, %xmm0
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rcx, %rdi
	jne	.L19
	testb	$1, %r10b
	je	.L16
	movl	%r10d, %eax
	andl	$-2, %eax
.L22:
	movl	%ebp, %ecx
	addq	$8, %r11
	imull	%eax, %ecx
	addl	%edx, %eax
	cltq
	addl	%r15d, %ecx
	movslq	%ecx, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	movq	(%rsp), %rcx
	mulsd	(%rcx,%rax,8), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 0(%r13,%r9,8)
	addq	$1, %r9
	cmpq	%r9, %r14
	jne	.L17
.L46:
	movl	8(%rsp), %ecx
	movq	16(%rsp), %r15
	addl	%r10d, %edx
	addl	$1, %ecx
	addq	%r15, %r13
	addq	%r15, %r12
	cmpl	%ecx, %ebp
	jne	.L15
	movl	52(%rsp), %r9d
	movq	56(%rsp), %rdi
	rdtsc
	movq	%rax, %rbp
	salq	$32, %rdx
	orq	%rdx, %rbp
	cmpl	$1, %r9d
	je	.L30
	movl	%r9d, %eax
	pxor	%xmm0, %xmm0
	shrl	%eax
	salq	$4, %rax
	addq	32(%rsp), %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L25:
	addsd	(%rdi), %xmm0
	addq	$16, %rdi
	addsd	-8(%rdi), %xmm0
	cmpq	%rax, %rdi
	jne	.L25
	testb	$1, %r9b
	je	.L26
	movl	%r9d, %eax
	andl	$-2, %eax
.L24:
	movq	32(%rsp), %rdx
	cltq
	addsd	(%rdx,%rax,8), %xmm0
.L26:
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$2, %edi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	subq	40(%rsp), %rdx
	leaq	.LC11(%rip), %rsi
	call	__printf_chk@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movsd	%xmm1, 0(%r13,%r9,8)
	addq	$1, %r9
	cmpq	%r9, %r14
	je	.L46
	addq	$8, %r11
	movl	%r9d, %r15d
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L29:
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	jmp	.L22
.L50:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L48:
	movdqa	.LC0(%rip), %xmm1
	jmp	.L27
.L28:
	xorl	%ecx, %ecx
	jmp	.L7
.L51:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L10:
	cmpl	$2, %esi
	ja	.L48
	movq	.LC9(%rip), %rax
	movq	%rax, (%rbx)
	jmp	.L14
.L30:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L24
.L6:
	movq	stderr(%rip), %rdi
	movl	%ebp, %ecx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	jmp	.L3
	.cfi_endproc
.LFE7502:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	0
	.long	1071644672
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

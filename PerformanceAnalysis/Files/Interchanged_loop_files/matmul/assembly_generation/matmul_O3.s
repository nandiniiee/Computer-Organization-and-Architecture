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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	cmpl	$1, %edi
	jle	.L59
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	movq	%rax, %r11
	movl	%eax, %r15d
	testl	%eax, %eax
	jle	.L60
	cltq
	movl	$8, %esi
	movq	%r11, 8(%rsp)
	movq	%rax, %rbp
	movq	%rax, 64(%rsp)
	imulq	%rax, %rbp
	movq	%rbp, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, %r14
	movq	%rax, 24(%rsp)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
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
	movq	8(%rsp), %r11
	movl	%r11d, %edi
	imull	%r11d, %edi
	leal	-1(%rdi), %esi
	cmpl	$2, %esi
	jbe	.L35
	movdqa	.LC5(%rip), %xmm4
	movl	%edi, %edx
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
	movl	%edi, %ecx
	andl	$-4, %ecx
	testb	$3, %dil
	je	.L34
.L7:
	movl	%ecx, %eax
	movl	$17, %r8d
	movq	24(%rsp), %r14
	movslq	%ecx, %r9
	cltd
	pxor	%xmm0, %xmm0
	idivl	%r8d
	leal	1(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, (%r14,%r9,8)
	cmpl	%eax, %edi
	jle	.L10
	cltd
	pxor	%xmm0, %xmm0
	idivl	%r8d
	leal	2(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 8(%r14,%r9,8)
	cmpl	%eax, %edi
	jle	.L57
	cltd
	pxor	%xmm0, %xmm0
	movdqa	.LC0(%rip), %xmm1
	idivl	%r8d
	movq	24(%rsp), %rax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 16(%rax,%r9,8)
.L34:
	movdqa	.LC5(%rip), %xmm2
	movl	%edi, %edx
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
	cmpq	%rax, %rdx
	jne	.L13
	testb	$3, %dil
	je	.L14
	movl	%edi, %ecx
	movl	$17, %esi
	movsd	.LC9(%rip), %xmm1
	pxor	%xmm0, %xmm0
	andl	$-4, %ecx
	movl	%ecx, %eax
	movslq	%ecx, %r8
	cltd
	idivl	%esi
	leal	1(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rbx,%r8,8)
	cmpl	%eax, %edi
	jle	.L14
	cltd
	pxor	%xmm0, %xmm0
	idivl	%esi
	leal	2(%rcx), %eax
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rbx,%r8,8)
	cmpl	%edi, %eax
	jge	.L14
	cltd
	pxor	%xmm0, %xmm0
	idivl	%esi
	addl	$1, %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rbx,%r8,8)
.L14:
	rdtsc
	xorl	%ecx, %ecx
	movq	24(%rsp), %rbp
	movq	%rax, %r12
	movq	64(%rsp), %rax
	leal	(%r11,%r11), %r14d
	salq	$32, %rdx
	orq	%rdx, %r12
	movq	32(%rsp), %rdx
	movl	%r11d, %esi
	movl	%ecx, 44(%rsp)
	salq	$3, %rax
	movl	%edi, 76(%rsp)
	shrl	%esi
	movq	%rax, 56(%rsp)
	movslq	%r14d, %rax
	salq	$4, %rsi
	leaq	0(,%rax,8), %r8
	xorl	%eax, %eax
	movq	%rdx, 80(%rsp)
	movq	%rax, 48(%rsp)
	leal	-3(%r11), %eax
	shrl	%eax
	movq	%r12, 88(%rsp)
	addl	$2, %eax
	movl	%r15d, 40(%rsp)
	movq	%r8, %r15
	addq	%rax, %rax
	movq	%rax, 16(%rsp)
	.p2align 4
	.p2align 3
.L15:
	movl	48(%rsp), %eax
	xorl	%r9d, %r9d
	movl	%eax, 72(%rsp)
	cmpl	$2, 40(%rsp)
	jle	.L20
	movl	%r11d, %edi
	movl	%eax, %r9d
	movq	32(%rsp), %r12
	movq	%rbx, %rcx
	andl	$-2, %edi
	xorl	%r10d, %r10d
	movl	$2, %eax
	leal	(%r9,%rdi), %r8d
	movslq	%r8d, %r8
	leaq	(%r12,%r8,8), %r12
	leal	-1(%r9), %r8d
	.p2align 4
	.p2align 3
.L19:
	movl	%edi, 8(%rsp)
	movsd	-16(%rbp,%rax,8), %xmm4
	movq	%rax, %r9
.L18:
	movsd	-8(%rbp,%r9,8), %xmm2
	leal	(%r10,%r11), %r13d
	movapd	%xmm4, %xmm3
	movslq	%r13d, %rax
	unpcklpd	%xmm3, %xmm3
	leaq	(%rbx,%rax,8), %rdi
	unpcklpd	%xmm2, %xmm2
	xorl	%eax, %eax
	.p2align 6
	.p2align 4
	.p2align 3
.L27:
	movupd	(%rcx,%rax), %xmm0
	movupd	(%rdi,%rax), %xmm1
	movupd	(%rdx,%rax), %xmm6
	mulpd	%xmm3, %xmm0
	mulpd	%xmm2, %xmm1
	addpd	%xmm6, %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rsi
	jne	.L27
	testb	$1, %r11b
	je	.L61
	movl	8(%rsp), %edi
	leal	(%r8,%r9), %eax
	movsd	(%r12), %xmm1
	addq	%r15, %rcx
	cltq
	addl	%edi, %r13d
	movslq	%r13d, %r13
	movq	%r13, 8(%rsp)
	movq	24(%rsp), %r13
	movsd	0(%r13,%rax,8), %xmm0
	movq	8(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm0
	leal	(%r10,%rdi), %eax
	addl	%r14d, %r10d
	cltq
	mulsd	(%rbx,%rax,8), %xmm4
	leaq	2(%r9), %rax
	addsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%r12)
	cmpq	%rax, 16(%rsp)
	jne	.L19
.L20:
	movslq	%r9d, %r8
	imull	40(%rsp), %r9d
	movq	24(%rsp), %rdi
	movl	72(%rsp), %r10d
	movslq	%r9d, %rax
	leaq	(%rbx,%rax,8), %rcx
	movq	48(%rsp), %rax
	salq	$3, %rax
	leaq	(%rdi,%rax), %r12
	addq	32(%rsp), %rax
	movq	%rax, 8(%rsp)
.L26:
	movsd	(%r12,%r8,8), %xmm2
	cmpl	$1, %r11d
	je	.L36
	movq	8(%rsp), %rax
.L25:
	movapd	%xmm2, %xmm1
	xorl	%edi, %edi
	unpcklpd	%xmm1, %xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L22:
	movupd	(%rcx,%rdi), %xmm0
	movupd	(%rax,%rdi), %xmm5
	mulpd	%xmm1, %xmm0
	addpd	%xmm5, %xmm0
	movups	%xmm0, (%rax,%rdi)
	addq	$16, %rdi
	cmpq	%rsi, %rdi
	jne	.L22
	testb	$1, %r11b
	je	.L23
	movq	%rax, 8(%rsp)
	movl	%r11d, %edi
	andl	$-2, %edi
.L21:
	leal	(%r10,%rdi), %r13d
	addl	%r9d, %edi
	movq	32(%rsp), %rax
	addl	%r11d, %r9d
	movslq	%edi, %rdi
	movslq	%r13d, %r13
	addq	$1, %r8
	addq	56(%rsp), %rcx
	mulsd	(%rbx,%rdi,8), %xmm2
	addsd	(%rax,%r13,8), %xmm2
	movsd	%xmm2, (%rax,%r13,8)
	cmpl	%r8d, 40(%rsp)
	jg	.L26
.L24:
	movq	56(%rsp), %rcx
	addl	$1, 44(%rsp)
	movq	64(%rsp), %rdi
	movl	44(%rsp), %eax
	addq	%rdi, 48(%rsp)
	addq	%rcx, %rdx
	addq	%rcx, %rbp
	cmpl	%eax, 40(%rsp)
	jne	.L15
	movl	76(%rsp), %edi
	movq	80(%rsp), %rcx
	movq	88(%rsp), %r12
	rdtsc
	movq	%rax, %rbp
	salq	$32, %rdx
	orq	%rdx, %rbp
	cmpl	$1, %edi
	je	.L37
	movl	%edi, %eax
	pxor	%xmm0, %xmm0
	shrl	%eax
	salq	$4, %rax
	addq	32(%rsp), %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L32:
	addsd	(%rcx), %xmm0
	addq	$16, %rcx
	addsd	-8(%rcx), %xmm0
	cmpq	%rax, %rcx
	jne	.L32
	testb	$1, %dil
	je	.L33
	movl	%edi, %eax
	andl	$-2, %eax
.L31:
	movq	32(%rsp), %rsi
	cltq
	addsd	(%rsi,%rax,8), %xmm0
.L33:
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	subq	%r12, %rdx
	leaq	.LC11(%rip), %rsi
	call	__printf_chk@PLT
	movq	24(%rsp), %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	32(%rsp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$104, %rsp
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
.L61:
	.cfi_restore_state
	leaq	2(%r9), %rax
	cmpq	%rax, 16(%rsp)
	je	.L20
	movsd	-16(%rbp,%rax,8), %xmm4
	addl	%r14d, %r10d
	addq	%r15, %rcx
	movq	%rax, %r9
	jmp	.L18
.L23:
	addq	$1, %r8
	cmpl	%r8d, 40(%rsp)
	jle	.L24
	movsd	(%r12,%r8,8), %xmm2
	addl	%r11d, %r9d
	addq	56(%rsp), %rcx
	jmp	.L25
.L36:
	xorl	%edi, %edi
	jmp	.L21
.L59:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L57:
	movdqa	.LC0(%rip), %xmm1
	jmp	.L34
.L35:
	xorl	%ecx, %ecx
	jmp	.L7
.L60:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L10:
	cmpl	$2, %esi
	ja	.L57
	movq	.LC9(%rip), %rax
	movq	%rax, (%rbx)
	jmp	.L14
.L37:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L31
.L6:
	movq	stderr(%rip), %rdi
	movl	%r15d, %ecx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	24(%rsp), %rdi
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

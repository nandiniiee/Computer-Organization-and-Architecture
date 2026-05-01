	.file	"transpose.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"usage: %s <N>\n"
.LC3:
	.string	"N must be positive\n"
.LC4:
	.string	"allocation failed for N=%d\n"
.LC11:
	.string	"checksum=%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$32, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpl	$1, %edi
	jle	.L44
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	testl	%eax, %eax
	jle	.L45
	movslq	%eax, %r8
	movl	$8, %esi
	movl	%eax, -72(%rbp)
	movq	%r8, %r12
	movq	%r8, -56(%rbp)
	imulq	%r8, %r12
	movq	%rax, -64(%rbp)
	movq	%r12, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	calloc@PLT
	testq	%rbx, %rbx
	movl	-72(%rbp), %r11d
	movq	%rax, %r10
	je	.L6
	testq	%rax, %rax
	je	.L6
	movq	-64(%rbp), %r9
	movq	-56(%rbp), %r8
	movl	%r9d, %ecx
	imull	%r9d, %ecx
	leal	-1(%rcx), %eax
	cmpl	$6, %eax
	movl	%eax, -76(%rbp)
	jbe	.L24
	movl	%ecx, %edx
	vmovdqa	.LC0(%rip), %ymm2
	vmovdqa	.LC8(%rip), %ymm3
	movq	%rbx, %rax
	shrl	$3, %edx
	vmovdqa	.LC9(%rip), %ymm5
	vmovdqa	.LC10(%rip), %ymm4
	salq	$6, %rdx
	addq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	vpmuldq	%ymm3, %ymm2, %ymm0
	vpsrlq	$32, %ymm2, %ymm1
	addq	$64, %rax
	vpmuldq	%ymm3, %ymm1, %ymm1
	vpshufd	$245, %ymm0, %ymm0
	vpblendd	$85, %ymm0, %ymm1, %ymm1
	vpsrad	$3, %ymm1, %ymm1
	vpslld	$4, %ymm1, %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vpsubd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm4, %ymm2, %ymm2
	vpaddd	%ymm5, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vmovupd	%ymm1, -64(%rax)
	vcvtdq2pd	%xmm0, %ymm0
	vmovupd	%ymm0, -32(%rax)
	cmpq	%rdx, %rax
	jne	.L8
	movl	%ecx, %esi
	andl	$-8, %esi
	cmpl	%esi, %ecx
	movl	%esi, %edx
	je	.L46
	vzeroupper
.L7:
	movl	%ecx, %eax
	subl	%edx, %eax
	leal	-1(%rax), %edi
	cmpl	$2, %edi
	jbe	.L10
	vmovd	%esi, %xmm6
	vmovdqa	.LC6(%rip), %xmm3
	testb	$3, %al
	vpbroadcastd	%xmm6, %xmm0
	vpaddd	.LC5(%rip), %xmm0, %xmm0
	vpmuldq	%xmm3, %xmm0, %xmm2
	vpsrlq	$32, %xmm0, %xmm1
	vpmuldq	%xmm3, %xmm1, %xmm1
	vpshufd	$245, %xmm2, %xmm2
	vpblendd	$5, %xmm2, %xmm1, %xmm1
	vpsrad	$3, %xmm1, %xmm1
	vpslld	$4, %xmm1, %xmm2
	vpaddd	%xmm1, %xmm2, %xmm1
	vpsubd	%xmm1, %xmm0, %xmm0
	vpaddd	.LC7(%rip), %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm1
	vpshufd	$238, %xmm0, %xmm0
	vmovupd	%xmm1, (%rbx,%rdx,8)
	vcvtdq2pd	%xmm0, %xmm0
	vmovupd	%xmm0, 16(%rbx,%rdx,8)
	je	.L9
	andl	$-4, %eax
	addl	%eax, %esi
.L10:
	movl	%esi, %eax
	movl	$17, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	movslq	%esi, %r12
	cltd
	idivl	%edi
	leal	1(%rsi), %eax
	addl	$1, %edx
	cmpl	%ecx, %eax
	vcvtsi2sdl	%edx, %xmm0, %xmm1
	vmovlpd	%xmm1, (%rbx,%r12,8)
	jge	.L9
	cltd
	idivl	%edi
	leal	2(%rsi), %eax
	addl	$1, %edx
	cmpl	%ecx, %eax
	vcvtsi2sdl	%edx, %xmm0, %xmm1
	vmovlpd	%xmm1, 8(%rbx,%r12,8)
	jge	.L9
	cltd
	idivl	%edi
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vmovlpd	%xmm0, 16(%rbx,%r12,8)
.L9:
	movl	%r9d, %eax
	movl	%ecx, -64(%rbp)
	movq	%r8, %rsi
	movq	%rbx, %r13
	shrl	%eax
	movq	%r10, -72(%rbp)
	salq	$4, %rsi
	movq	%r10, %rdi
	salq	$4, %rax
	leaq	0(,%r8,8), %r15
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movq	%rax, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L13:
	cmpl	$1, %r9d
	je	.L25
.L19:
	movq	-56(%rbp), %rax
	movq	%rdi, %rdx
	leaq	(%rax,%rdi), %rcx
	movq	%r13, %rax
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L16:
	vmovsd	(%rax), %xmm0
	addq	$16, %rdx
	vmovhpd	(%rax,%r8,8), %xmm0, %xmm0
	addq	%rsi, %rax
	vmovupd	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L16
	testb	$1, %r9b
	je	.L14
	movl	%r9d, %eax
	andl	$-2, %eax
.L20:
	leal	(%rax,%r14), %edx
	addq	$8, %r13
	addl	%r9d, %r14d
	addq	%r15, %rdi
	imull	%r11d, %eax
	movslq	%edx, %rdx
	addl	%r12d, %eax
	addl	$1, %r12d
	cltq
	cmpl	%r12d, %r11d
	vmovsd	(%rbx,%rax,8), %xmm0
	vmovsd	%xmm0, (%r10,%rdx,8)
	jne	.L13
	cmpl	$2, -76(%rbp)
	movl	-64(%rbp), %ecx
	movq	-72(%rbp), %rdx
	jbe	.L21
.L18:
	movl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	shrl	$2, %eax
	salq	$5, %rax
	addq	%r10, %rax
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L22:
	vaddsd	(%rdx), %xmm0, %xmm0
	addq	$32, %rdx
	vaddsd	-24(%rdx), %xmm0, %xmm0
	vaddsd	-16(%rdx), %xmm0, %xmm0
	vaddsd	-8(%rdx), %xmm0, %xmm0
	cmpq	%rdx, %rax
	jne	.L22
	testb	$3, %cl
	je	.L23
	movl	%ecx, %eax
	andl	$-4, %eax
	leal	1(%rax), %esi
	movslq	%eax, %rdx
	cmpl	%ecx, %esi
	vaddsd	(%r10,%rdx,8), %xmm0, %xmm0
	jge	.L23
	addl	$2, %eax
	vaddsd	8(%r10,%rdx,8), %xmm0, %xmm0
	cmpl	%eax, %ecx
	jle	.L23
	vaddsd	16(%r10,%rdx,8), %xmm0, %xmm0
.L23:
	leaq	.LC11(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	movq	%r10, -56(%rbp)
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	-56(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$32, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	addl	$1, %r12d
	cmpl	%r12d, %r11d
	je	.L39
	addl	%r9d, %r14d
	addq	$8, %r13
	addq	%r15, %rdi
	jmp	.L19
.L25:
	xorl	%eax, %eax
	jmp	.L20
.L44:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L24:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L7
.L45:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L39:
	movl	-64(%rbp), %ecx
	movq	-72(%rbp), %rdx
	jmp	.L18
.L46:
	vzeroupper
	jmp	.L9
.L21:
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	jmp	.L23
.L6:
	movq	stderr(%rip), %rdi
	movl	%r11d, %ecx
	xorl	%eax, %eax
	movq	%r10, -56(%rbp)
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	-56(%rbp), %rdi
	call	free@PLT
	jmp	.L3
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.set	.LC5,.LC0
	.set	.LC6,.LC8
	.set	.LC7,.LC9
	.align 32
.LC8:
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.long	2021161081
	.align 32
.LC9:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.align 32
.LC10:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
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

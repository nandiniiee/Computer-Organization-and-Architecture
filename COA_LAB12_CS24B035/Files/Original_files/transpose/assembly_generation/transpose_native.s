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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	pushq	%rbx
	subq	$40, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	cmpl	$1, %edi
	jle	.L33
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	testl	%eax, %eax
	movq	%rax, %r12
	jle	.L34
	movslq	%eax, %r14
	movl	$8, %esi
	movl	%eax, -56(%rbp)
	movq	%r14, %r13
	imulq	%r14, %r13
	movq	%r13, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, %rbx
	call	calloc@PLT
	testq	%rbx, %rbx
	movl	-56(%rbp), %r10d
	movq	%rax, %r8
	je	.L6
	testq	%rax, %rax
	je	.L6
	movl	%r12d, %edi
	imull	%r12d, %edi
	leal	-1(%rdi), %r11d
	cmpl	$6, %r11d
	jbe	.L19
	movl	%edi, %edx
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
	movl	%edi, %esi
	andl	$-8, %esi
	cmpl	%esi, %edi
	movl	%esi, %edx
	je	.L35
	vzeroupper
.L7:
	movl	%edi, %eax
	subl	%edx, %eax
	leal	-1(%rax), %r9d
	cmpl	$2, %r9d
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
	movl	$17, %r9d
	vxorps	%xmm0, %xmm0, %xmm0
	movslq	%esi, %r13
	cltd
	idivl	%r9d
	leal	1(%rsi), %eax
	addl	$1, %edx
	cmpl	%eax, %edi
	vcvtsi2sdl	%edx, %xmm0, %xmm1
	vmovlpd	%xmm1, (%rbx,%r13,8)
	jle	.L9
	cltd
	idivl	%r9d
	leal	2(%rsi), %eax
	addl	$1, %edx
	cmpl	%edi, %eax
	vcvtsi2sdl	%edx, %xmm0, %xmm1
	vmovlpd	%xmm1, 8(%rbx,%r13,8)
	jge	.L9
	cltd
	idivl	%r9d
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vmovlpd	%xmm0, 16(%rbx,%r13,8)
.L9:
	leal	-1(%r12), %eax
	movq	%r8, %r9
	movq	%r8, %r13
	xorl	%r12d, %r12d
	salq	$3, %rax
	leaq	0(,%r14,8), %rsi
	movq	$-8, %r14
	leaq	8(%rbx,%rax), %rcx
	subq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L13:
	leaq	(%r14,%rcx), %rax
	movq	%r13, %rdx
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L14:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vmovsd	%xmm0, (%rdx)
	addq	%rsi, %rdx
	cmpq	%rax, %rcx
	jne	.L14
	addl	$1, %r12d
	addq	$8, %r13
	addq	%rsi, %rcx
	cmpl	%r12d, %r10d
	jne	.L13
	cmpl	$2, %r11d
	jbe	.L16
	movl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	shrl	$2, %eax
	salq	$5, %rax
	addq	%r8, %rax
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L17:
	vaddsd	(%r9), %xmm0, %xmm0
	addq	$32, %r9
	vaddsd	-24(%r9), %xmm0, %xmm0
	vaddsd	-16(%r9), %xmm0, %xmm0
	vaddsd	-8(%r9), %xmm0, %xmm0
	cmpq	%r9, %rax
	jne	.L17
	testb	$3, %dil
	je	.L18
	movl	%edi, %eax
	andl	$-4, %eax
	leal	1(%rax), %ecx
	movslq	%eax, %rdx
	cmpl	%edi, %ecx
	vaddsd	(%r8,%rdx,8), %xmm0, %xmm0
	jge	.L18
	addl	$2, %eax
	vaddsd	8(%r8,%rdx,8), %xmm0, %xmm0
	cmpl	%eax, %edi
	jle	.L18
	vaddsd	16(%r8,%rdx,8), %xmm0, %xmm0
.L18:
	leaq	.LC11(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	movq	%r8, -56(%rbp)
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	-56(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L33:
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
.L19:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L7
.L34:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L35:
	vzeroupper
	jmp	.L9
.L16:
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	(%r8), %xmm0, %xmm0
	jmp	.L18
.L6:
	movq	stderr(%rip), %rdi
	movl	%r10d, %ecx
	xorl	%eax, %eax
	movq	%r8, -56(%rbp)
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

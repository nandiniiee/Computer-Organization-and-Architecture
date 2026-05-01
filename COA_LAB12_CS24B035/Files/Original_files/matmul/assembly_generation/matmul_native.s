	.file	"matmul.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"usage: %s <N>\n"
.LC3:
	.string	"N must be positive\n"
.LC4:
	.string	"allocation failed for N=%d\n"
.LC14:
	.string	"checksum=%f\n"
.LC15:
	.string	"cycles=%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7502:
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
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpl	$1, %edi
	jle	.L52
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	testl	%eax, %eax
	movl	%eax, %ebx
	jle	.L53
	movslq	%eax, %r8
	movl	$8, %esi
	movq	%rax, -80(%rbp)
	movq	%r8, %r12
	movq	%r8, -56(%rbp)
	imulq	%r8, %r12
	movq	%r12, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	movq	%rax, %r14
	movq	%rax, -72(%rbp)
	call	calloc@PLT
	movq	%r12, %rdi
	movl	$8, %esi
	movq	%rax, %r15
	movq	%rax, -64(%rbp)
	call	calloc@PLT
	testq	%r14, %r14
	movq	%rax, -104(%rbp)
	movq	%rax, %rdi
	sete	%al
	testq	%r15, %r15
	sete	%dl
	orb	%dl, %al
	jne	.L6
	testq	%rdi, %rdi
	je	.L6
	movq	-80(%rbp), %r10
	movq	-56(%rbp), %r8
	vxorps	%xmm2, %xmm2, %xmm2
	movl	%r10d, %r9d
	imull	%r10d, %r9d
	leal	-1(%r9), %ecx
	cmpl	$6, %ecx
	jbe	.L30
	movl	%r9d, %edx
	vmovdqa	.LC0(%rip), %ymm3
	vmovdqa	.LC8(%rip), %ymm5
	movq	%r14, %rax
	shrl	$3, %edx
	vmovdqa	.LC9(%rip), %ymm7
	vmovdqa	.LC10(%rip), %ymm6
	salq	$6, %rdx
	vmovdqa	%ymm3, %ymm4
	addq	%r14, %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	vpmuldq	%ymm5, %ymm4, %ymm0
	vpsrlq	$32, %ymm4, %ymm1
	addq	$64, %rax
	vpmuldq	%ymm5, %ymm1, %ymm1
	vpshufd	$245, %ymm0, %ymm0
	vpblendd	$85, %ymm0, %ymm1, %ymm1
	vpsrad	$3, %ymm1, %ymm1
	vpslld	$4, %ymm1, %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vpsubd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm6, %ymm4, %ymm4
	vpaddd	%ymm7, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vmovupd	%ymm1, -64(%rax)
	vcvtdq2pd	%xmm0, %ymm0
	vmovupd	%ymm0, -32(%rax)
	cmpq	%rdx, %rax
	jne	.L8
	movl	%r9d, %esi
	andl	$-8, %esi
	cmpl	%esi, %r9d
	movl	%esi, %edx
	je	.L9
.L7:
	movl	%r9d, %eax
	subl	%edx, %eax
	leal	-1(%rax), %edi
	cmpl	$2, %edi
	jbe	.L10
	vmovd	%esi, %xmm7
	vmovdqa	.LC6(%rip), %xmm4
	movq	-72(%rbp), %rdi
	testb	$3, %al
	vpbroadcastd	%xmm7, %xmm0
	vpaddd	.LC5(%rip), %xmm0, %xmm0
	vpmuldq	%xmm4, %xmm0, %xmm3
	vpsrlq	$32, %xmm0, %xmm1
	vpmuldq	%xmm4, %xmm1, %xmm1
	vpshufd	$245, %xmm3, %xmm3
	vpblendd	$5, %xmm3, %xmm1, %xmm1
	vpsrad	$3, %xmm1, %xmm1
	vpslld	$4, %xmm1, %xmm3
	vpaddd	%xmm1, %xmm3, %xmm1
	vpsubd	%xmm1, %xmm0, %xmm0
	vpaddd	.LC7(%rip), %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm1
	vpshufd	$238, %xmm0, %xmm0
	vmovupd	%xmm1, (%rdi,%rdx,8)
	vcvtdq2pd	%xmm0, %xmm0
	vmovupd	%xmm0, 16(%rdi,%rdx,8)
	je	.L11
	andl	$-4, %eax
	addl	%eax, %esi
.L10:
	movl	%esi, %eax
	movl	$17, %r11d
	movq	-72(%rbp), %r14
	movslq	%esi, %rdi
	cltd
	idivl	%r11d
	leal	1(%rsi), %eax
	addl	$1, %edx
	cmpl	%r9d, %eax
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, (%r14,%rdi,8)
	jge	.L11
	cltd
	idivl	%r11d
	leal	2(%rsi), %eax
	addl	$1, %edx
	cmpl	%r9d, %eax
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, 8(%r14,%rdi,8)
	jge	.L11
	cltd
	idivl	%r11d
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, 16(%r14,%rdi,8)
.L11:
	cmpl	$6, %ecx
	jbe	.L31
	vmovdqa	.LC0(%rip), %ymm3
.L9:
	movl	%r9d, %edx
	movq	-64(%rbp), %rsi
	vbroadcastsd	.LC12(%rip), %ymm5
	shrl	$3, %edx
	vmovdqa	.LC8(%rip), %ymm4
	vmovdqa	.LC9(%rip), %ymm7
	salq	$6, %rdx
	vmovdqa	.LC10(%rip), %ymm6
	movq	%rsi, %rax
	addq	%rsi, %rdx
	.p2align 4,,10
	.p2align 3
.L14:
	vpmuldq	%ymm4, %ymm3, %ymm0
	vpsrlq	$32, %ymm3, %ymm1
	addq	$64, %rax
	vpmuldq	%ymm4, %ymm1, %ymm1
	vpshufd	$245, %ymm0, %ymm0
	vpblendd	$85, %ymm0, %ymm1, %ymm1
	vpsrad	$3, %ymm1, %ymm1
	vpslld	$4, %ymm1, %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vpsubd	%ymm0, %ymm3, %ymm0
	vpaddd	%ymm6, %ymm3, %ymm3
	vpaddd	%ymm7, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm1
	vmulpd	%ymm5, %ymm1, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vmulpd	%ymm5, %ymm0, %ymm0
	vmovupd	%ymm1, -64(%rax)
	vmovupd	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L14
	movl	%r9d, %esi
	andl	$-8, %esi
	cmpl	%r9d, %esi
	movl	%esi, %edx
	je	.L15
.L13:
	movl	%r9d, %eax
	subl	%edx, %eax
	leal	-1(%rax), %edi
	cmpl	$2, %edi
	jbe	.L16
	vmovd	%esi, %xmm7
	vmovdqa	.LC6(%rip), %xmm4
	movq	-64(%rbp), %rdi
	testb	$3, %al
	vpbroadcastd	%xmm7, %xmm0
	vpaddd	.LC5(%rip), %xmm0, %xmm0
	vpmuldq	%xmm4, %xmm0, %xmm3
	vpsrlq	$32, %xmm0, %xmm1
	vpmuldq	%xmm4, %xmm1, %xmm1
	vpshufd	$245, %xmm3, %xmm3
	vpblendd	$5, %xmm3, %xmm1, %xmm1
	vpsrad	$3, %xmm1, %xmm1
	vpslld	$4, %xmm1, %xmm3
	vpaddd	%xmm1, %xmm3, %xmm1
	vmovddup	.LC12(%rip), %xmm3
	vpsubd	%xmm1, %xmm0, %xmm0
	vpaddd	.LC7(%rip), %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vpshufd	$238, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm1, (%rdi,%rdx,8)
	vmovupd	%xmm0, 16(%rdi,%rdx,8)
	je	.L15
	andl	$-4, %eax
	addl	%eax, %esi
.L16:
	movl	%esi, %eax
	movl	$17, %r11d
	movq	-64(%rbp), %r14
	movslq	%esi, %rdi
	cltd
	vmovsd	.LC12(%rip), %xmm1
	idivl	%r11d
	leal	1(%rsi), %eax
	addl	$1, %edx
	cmpl	%eax, %r9d
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdi,8)
	jle	.L15
	cltd
	idivl	%r11d
	leal	2(%rsi), %eax
	addl	$1, %edx
	cmpl	%eax, %r9d
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r14,%rdi,8)
	jle	.L15
	cltd
	idivl	%r11d
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, 16(%r14,%rdi,8)
.L15:
	rdtsc
	movq	-104(%rbp), %r13
	movq	-72(%rbp), %r12
	salq	$32, %rdx
	movl	%r9d, -116(%rbp)
	movq	%r8, %rsi
	movl	%r10d, %r14d
	orq	%rdx, %rax
	movq	%r13, -128(%rbp)
	salq	$4, %rsi
	xorl	%edx, %edx
	movq	%rax, -112(%rbp)
	movl	%r10d, %eax
	leaq	0(,%r8,8), %r15
	shrl	%eax
	movl	%ecx, -120(%rbp)
	xorl	%ecx, %ecx
	salq	$4, %rax
	movq	%rax, -96(%rbp)
	.p2align 4,,10
	.p2align 3
.L18:
	movq	-96(%rbp), %rax
	movq	-64(%rbp), %r11
	movl	%ecx, -80(%rbp)
	xorl	%r9d, %r9d
	movq	%r15, -88(%rbp)
	leaq	(%rax,%r12), %rdi
	movq	%rdi, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L20:
	cmpl	$1, %r10d
	movl	%r9d, %r15d
	je	.L32
	movq	-56(%rbp), %rdi
.L24:
	movq	%r12, %rcx
	movq	%r11, %rax
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L22:
	vmovsd	(%rax), %xmm0
	vmovhpd	(%rax,%r8,8), %xmm0, %xmm0
	vmulpd	(%rcx), %xmm0, %xmm0
	addq	%rsi, %rax
	addq	$16, %rcx
	cmpq	%rcx, %rdi
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	jne	.L22
	testb	$1, %r10b
	je	.L19
	movq	%rdi, -56(%rbp)
	movl	%r10d, %eax
	andl	$-2, %eax
.L25:
	movl	%ebx, %ecx
	movq	-72(%rbp), %rdi
	addq	$8, %r11
	imull	%eax, %ecx
	addl	%edx, %eax
	cltq
	addl	%r15d, %ecx
	movq	-64(%rbp), %r15
	movslq	%ecx, %rcx
	vmovsd	(%r15,%rcx,8), %xmm6
	vfmadd231sd	(%rdi,%rax,8), %xmm6, %xmm1
	vmovsd	%xmm1, 0(%r13,%r9,8)
	addq	$1, %r9
	cmpq	%r14, %r9
	jne	.L20
.L49:
	movl	-80(%rbp), %ecx
	movq	-88(%rbp), %r15
	addl	%r10d, %edx
	addl	$1, %ecx
	addq	%r15, %r13
	addq	%r15, %r12
	cmpl	%ecx, %ebx
	jne	.L18
	movl	-116(%rbp), %r9d
	movq	-128(%rbp), %rdi
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	cmpl	$2, -120(%rbp)
	jbe	.L27
	movl	%r9d, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	shrl	$2, %eax
	salq	$5, %rax
	addq	-104(%rbp), %rax
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L28:
	vaddsd	(%rdi), %xmm0, %xmm0
	addq	$32, %rdi
	vaddsd	-24(%rdi), %xmm0, %xmm0
	vaddsd	-16(%rdi), %xmm0, %xmm0
	vaddsd	-8(%rdi), %xmm0, %xmm0
	cmpq	%rdi, %rax
	jne	.L28
	testb	$3, %r9b
	je	.L29
	movl	%r9d, %eax
	movq	-104(%rbp), %rsi
	andl	$-4, %eax
	leal	1(%rax), %ecx
	movslq	%eax, %rdx
	cmpl	%r9d, %ecx
	vaddsd	(%rsi,%rdx,8), %xmm0, %xmm0
	jge	.L29
	addl	$2, %eax
	vaddsd	8(%rsi,%rdx,8), %xmm0, %xmm0
	cmpl	%r9d, %eax
	jge	.L29
	vaddsd	16(%rsi,%rdx,8), %xmm0, %xmm0
.L29:
	leaq	.LC14(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	vzeroupper
	call	__printf_chk@PLT
	subq	-112(%rbp), %rbx
	movl	$2, %edi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	leaq	.LC15(%rip), %rsi
	call	__printf_chk@PLT
	movq	-72(%rbp), %rdi
	call	free@PLT
	movq	-64(%rbp), %rdi
	call	free@PLT
	movq	-104(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	addq	$96, %rsp
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
.L19:
	.cfi_restore_state
	vmovsd	%xmm1, 0(%r13,%r9,8)
	addq	$1, %r9
	cmpq	%r14, %r9
	je	.L49
	addq	$8, %r11
	movl	%r9d, %r15d
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L32:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	jmp	.L25
.L52:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L30:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L7
.L53:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L27:
	movq	-104(%rbp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	jmp	.L29
.L31:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L13
.L6:
	movq	stderr(%rip), %rdi
	movl	%ebx, %ecx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	-72(%rbp), %rdi
	call	free@PLT
	movq	-64(%rbp), %rdi
	call	free@PLT
	movq	-104(%rbp), %rdi
	call	free@PLT
	jmp	.L3
	.cfi_endproc
.LFE7502:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
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

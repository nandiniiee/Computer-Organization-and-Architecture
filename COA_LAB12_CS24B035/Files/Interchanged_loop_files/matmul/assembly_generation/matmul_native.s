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
	addq	$-128, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpl	$1, %edi
	jle	.L76
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	__isoc23_strtol@PLT
	testl	%eax, %eax
	movq	%rax, %r13
	movl	%eax, %r12d
	jle	.L77
	movslq	%eax, %rbx
	movl	$8, %esi
	movq	%rbx, -136(%rbp)
	imulq	%rbx, %rbx
	movq	%rbx, %rdi
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	movq	%rax, -80(%rbp)
	call	calloc@PLT
	movq	%rbx, %rdi
	movl	$8, %esi
	movq	%rax, %r14
	call	calloc@PLT
	testq	%r15, %r15
	movq	%rax, -64(%rbp)
	movq	%rax, %rdi
	sete	%al
	testq	%r14, %r14
	sete	%dl
	orb	%dl, %al
	jne	.L6
	testq	%rdi, %rdi
	je	.L6
	movl	%r13d, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	imull	%r13d, %esi
	leal	-1(%rsi), %edi
	cmpl	$6, %edi
	jbe	.L42
	movl	%esi, %edx
	vmovdqa	.LC0(%rip), %ymm3
	vmovdqa	.LC8(%rip), %ymm5
	movq	%r15, %rax
	shrl	$3, %edx
	vmovdqa	.LC9(%rip), %ymm7
	vmovdqa	.LC10(%rip), %ymm6
	salq	$6, %rdx
	vmovdqa	%ymm3, %ymm4
	addq	%r15, %rdx
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
	movl	%esi, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %esi
	movl	%ecx, %edx
	je	.L9
.L7:
	movl	%esi, %eax
	subl	%edx, %eax
	leal	-1(%rax), %r8d
	cmpl	$2, %r8d
	jbe	.L10
	vmovd	%ecx, %xmm7
	vmovdqa	.LC6(%rip), %xmm4
	movq	-80(%rbp), %rbx
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
	vmovupd	%xmm1, (%rbx,%rdx,8)
	vcvtdq2pd	%xmm0, %xmm0
	vmovupd	%xmm0, 16(%rbx,%rdx,8)
	je	.L11
	andl	$-4, %eax
	addl	%eax, %ecx
.L10:
	movl	%ecx, %eax
	movl	$17, %r9d
	movq	-80(%rbp), %rbx
	movslq	%ecx, %r8
	cltd
	idivl	%r9d
	leal	1(%rcx), %eax
	addl	$1, %edx
	cmpl	%eax, %esi
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, (%rbx,%r8,8)
	jle	.L11
	cltd
	idivl	%r9d
	leal	2(%rcx), %eax
	addl	$1, %edx
	cmpl	%eax, %esi
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, 8(%rbx,%r8,8)
	jle	.L11
	cltd
	idivl	%r9d
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmovlpd	%xmm0, 16(%rbx,%r8,8)
.L11:
	cmpl	$6, %edi
	jbe	.L43
	vmovdqa	.LC0(%rip), %ymm3
.L9:
	movl	%esi, %edx
	vmovdqa	.LC8(%rip), %ymm4
	movq	%r14, %rax
	vbroadcastsd	.LC12(%rip), %ymm5
	shrl	$3, %edx
	vmovdqa	.LC9(%rip), %ymm7
	vmovdqa	.LC10(%rip), %ymm6
	salq	$6, %rdx
	addq	%r14, %rdx
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
	cmpq	%rdx, %rax
	jne	.L14
	movl	%esi, %ecx
	andl	$-8, %ecx
	cmpl	%esi, %ecx
	movl	%ecx, %edx
	je	.L15
.L13:
	movl	%esi, %eax
	subl	%edx, %eax
	leal	-1(%rax), %r8d
	cmpl	$2, %r8d
	jbe	.L16
	vmovd	%ecx, %xmm7
	vmovdqa	.LC6(%rip), %xmm4
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
	vmovupd	%xmm1, (%r14,%rdx,8)
	vmovupd	%xmm0, 16(%r14,%rdx,8)
	je	.L15
	andl	$-4, %eax
	addl	%eax, %ecx
.L16:
	movl	%ecx, %eax
	movl	$17, %r9d
	vmovsd	.LC12(%rip), %xmm1
	movslq	%ecx, %r8
	cltd
	idivl	%r9d
	leal	1(%rcx), %eax
	addl	$1, %edx
	cmpl	%eax, %esi
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%r8,8)
	jle	.L15
	cltd
	idivl	%r9d
	leal	2(%rcx), %eax
	addl	$1, %edx
	cmpl	%esi, %eax
	vcvtsi2sdl	%edx, %xmm2, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r14,%r8,8)
	jge	.L15
	cltd
	idivl	%r9d
	addl	$1, %edx
	vcvtsi2sdl	%edx, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm0
	vmovsd	%xmm0, 16(%r14,%r8,8)
.L15:
	rdtsc
	xorl	%r8d, %r8d
	movq	%rax, %rbx
	salq	$32, %rdx
	movl	%r8d, -128(%rbp)
	movq	-136(%rbp), %rax
	orq	%rdx, %rbx
	movq	-64(%rbp), %rdx
	movl	%esi, -144(%rbp)
	leaq	0(,%rax,8), %r11
	leal	(%r13,%r13), %eax
	movl	%edi, -164(%rbp)
	cltq
	movq	%rdx, %rcx
	movq	%rbx, -176(%rbp)
	movq	%rax, -120(%rbp)
	leal	-1(%r13), %eax
	movl	%eax, -100(%rbp)
	movq	-80(%rbp), %rax
	movq	%rcx, -160(%rbp)
	movq	%rax, -56(%rbp)
	movq	%rdx, %rax
	xorl	%edx, %edx
	movq	%rdx, -88(%rbp)
	leal	-3(%r13), %edx
	shrl	%edx
	addl	$2, %edx
	addq	%rdx, %rdx
	movq	%rdx, -112(%rbp)
	movl	%r13d, %edx
	shrl	$2, %edx
	salq	$5, %rdx
	movq	%rdx, %r15
	.p2align 4,,10
	.p2align 3
.L18:
	movl	-88(%rbp), %edi
	xorl	%esi, %esi
	cmpl	$2, %r12d
	movl	%edi, -104(%rbp)
	jle	.L25
	movl	%r13d, %ecx
	movl	%r12d, -140(%rbp)
	leal	1(%rdi), %r10d
	xorl	%edi, %edi
	andl	$3, %ecx
	movq	%r11, -152(%rbp)
	movl	$2, %edx
	movl	%ecx, -124(%rbp)
	.p2align 4,,10
	.p2align 3
.L24:
	movq	-56(%rbp), %rbx
	cmpl	$2, -100(%rbp)
	movl	%edi, -72(%rbp)
	movl	%edi, %ecx
	vmovsd	-16(%rbx,%rdx,8), %xmm3
	jbe	.L47
.L21:
	movq	-56(%rbp), %rbx
	addl	%r13d, %ecx
	vbroadcastsd	%xmm3, %ymm2
	leaq	(%r14,%rdi,8), %r9
	movslq	%ecx, %rsi
	vbroadcastsd	-8(%rbx,%rdx,8), %ymm1
	leaq	(%r14,%rsi,8), %r8
	xorl	%esi, %esi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L35:
	vmovupd	(%r9,%rsi), %ymm0
	vfmadd213pd	(%rax,%rsi), %ymm2, %ymm0
	vfmadd231pd	(%r8,%rsi), %ymm1, %ymm0
	vmovupd	%ymm0, (%rax,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r15
	jne	.L35
	testb	$3, %r13b
	je	.L78
	movl	-124(%rbp), %ebx
	movl	%r13d, %esi
	andl	$-4, %esi
	cmpl	$1, %ebx
	movl	%esi, %r8d
	movl	%ebx, %r9d
	je	.L79
.L34:
	movq	-88(%rbp), %rbx
	vmovddup	%xmm3, %xmm0
	movslq	%r10d, %r12
	leaq	(%rbx,%rsi), %r11
	movq	-64(%rbp), %rbx
	leaq	(%rbx,%r11,8), %rbx
	movslq	%ecx, %r11
	addq	%rsi, %r11
	addq	%rdi, %rsi
	vmovupd	(%rbx), %xmm6
	testb	$1, %r9b
	vfmadd132pd	(%r14,%rsi,8), %xmm6, %xmm0
	movq	%r11, -96(%rbp)
	movq	-80(%rbp), %r11
	movq	-96(%rbp), %rsi
	vmovddup	(%r11,%r12,8), %xmm1
	vfmadd231pd	(%r14,%rsi,8), %xmm1, %xmm0
	movq	%rdx, %rsi
	vmovupd	%xmm0, (%rbx)
	je	.L23
	andl	$-2, %r9d
	addl	%r9d, %r8d
.L22:
	movl	-104(%rbp), %ebx
	addl	%r8d, %ecx
	movslq	%ecx, %rcx
	leal	(%rbx,%r8), %r9d
	movq	-64(%rbp), %rbx
	movslq	%r9d, %r9
	leaq	(%rbx,%r9,8), %r9
	movl	-72(%rbp), %ebx
	vmovsd	(%r9), %xmm7
	addl	%ebx, %r8d
	movq	-80(%rbp), %rbx
	movslq	%r8d, %r8
	vfmadd132sd	(%r14,%r8,8), %xmm7, %xmm3
	vmovsd	(%rbx,%r12,8), %xmm5
	vfmadd231sd	(%r14,%rcx,8), %xmm5, %xmm3
	vmovsd	%xmm3, (%r9)
.L23:
	addq	$2, %rdx
	addl	$2, %r10d
	addq	-120(%rbp), %rdi
	cmpq	%rdx, -112(%rbp)
	jne	.L24
	movl	-140(%rbp), %r12d
	movq	-152(%rbp), %r11
.L25:
	movq	-88(%rbp), %rcx
	movq	-80(%rbp), %rbx
	movslq	%esi, %rdi
	imull	%r12d, %esi
	movq	%rax, -96(%rbp)
	salq	$3, %rcx
	addq	%rcx, %rbx
	addq	-64(%rbp), %rcx
	movslq	%esi, %rdx
	movq	%rcx, -72(%rbp)
.L33:
	cmpl	$2, -100(%rbp)
	vmovsd	(%rbx,%rdi,8), %xmm2
	movl	%edx, %eax
	jbe	.L46
	movq	-72(%rbp), %rcx
.L30:
	vbroadcastsd	%xmm2, %ymm1
	leaq	(%r14,%rdx,8), %r8
	xorl	%esi, %esi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L27:
	vmovupd	(%r8,%rsi), %ymm0
	vfmadd213pd	(%rcx,%rsi), %ymm1, %ymm0
	vmovupd	%ymm0, (%rcx,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r15
	jne	.L27
	testb	$3, %r13b
	je	.L28
	movl	%r13d, %esi
	movq	%rcx, -72(%rbp)
	andl	$-4, %esi
	movl	%esi, %r9d
.L26:
	movl	%r13d, %r8d
	subl	%esi, %r8d
	cmpl	$1, %r8d
	je	.L31
	movq	-88(%rbp), %r10
	movq	-64(%rbp), %rcx
	vmovddup	%xmm2, %xmm0
	addq	%rsi, %r10
	addq	%rdx, %rsi
	testb	$1, %r8b
	vmovupd	(%rcx,%r10,8), %xmm4
	vfmadd132pd	(%r14,%rsi,8), %xmm4, %xmm0
	vmovupd	%xmm0, (%rcx,%r10,8)
	je	.L32
	andl	$-2, %r8d
	addl	%r8d, %r9d
.L31:
	movl	-104(%rbp), %ecx
	leal	(%rax,%r9), %r8d
	movslq	%r8d, %r8
	leal	(%rcx,%r9), %esi
	movq	-64(%rbp), %rcx
	movslq	%esi, %rsi
	vmovsd	(%rcx,%rsi,8), %xmm4
	vfmadd132sd	(%r14,%r8,8), %xmm4, %xmm2
	vmovsd	%xmm2, (%rcx,%rsi,8)
.L32:
	addq	$1, %rdi
	addq	-136(%rbp), %rdx
	cmpl	%edi, %r12d
	jg	.L33
.L73:
	addl	$1, -128(%rbp)
	movq	-96(%rbp), %rax
	movl	-128(%rbp), %edi
	addq	%r11, -56(%rbp)
	movq	-136(%rbp), %rcx
	addq	%r11, %rax
	addq	%rcx, -88(%rbp)
	cmpl	%edi, %r12d
	jne	.L18
	movl	-144(%rbp), %esi
	movq	-160(%rbp), %rcx
	movq	-176(%rbp), %rbx
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r12
	orq	%rdx, %r12
	cmpl	$2, -164(%rbp)
	jbe	.L39
	movl	%esi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	shrl	$2, %eax
	salq	$5, %rax
	addq	-64(%rbp), %rax
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L40:
	vaddsd	(%rcx), %xmm0, %xmm0
	addq	$32, %rcx
	vaddsd	-24(%rcx), %xmm0, %xmm0
	vaddsd	-16(%rcx), %xmm0, %xmm0
	vaddsd	-8(%rcx), %xmm0, %xmm0
	cmpq	%rcx, %rax
	jne	.L40
	testb	$3, %sil
	je	.L41
	movl	%esi, %eax
	movq	-64(%rbp), %rdi
	andl	$-4, %eax
	leal	1(%rax), %ecx
	movslq	%eax, %rdx
	cmpl	%esi, %ecx
	vaddsd	(%rdi,%rdx,8), %xmm0, %xmm0
	jge	.L41
	addl	$2, %eax
	vaddsd	8(%rdi,%rdx,8), %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L41
	vaddsd	16(%rdi,%rdx,8), %xmm0, %xmm0
.L41:
	leaq	.LC14(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	vzeroupper
	call	__printf_chk@PLT
	movq	%r12, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	subq	%rbx, %rdx
	leaq	.LC15(%rip), %rsi
	call	__printf_chk@PLT
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	-64(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	subq	$-128, %rsp
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
.L78:
	.cfi_restore_state
	leaq	2(%rdx), %rsi
	cmpq	%rsi, -112(%rbp)
	je	.L20
	movq	-56(%rbp), %rdx
	addq	-120(%rbp), %rdi
	addl	$2, %r10d
	movl	%edi, -72(%rbp)
	movl	%edi, %ecx
	vmovsd	-16(%rdx,%rsi,8), %xmm3
	movq	%rsi, %rdx
	jmp	.L21
.L47:
	movl	$3, %r9d
	xorl	%esi, %esi
	leal	(%rdi,%r13), %ecx
	xorl	%r8d, %r8d
	jmp	.L34
.L79:
	movq	%rdx, %rsi
	movslq	%r10d, %r12
	jmp	.L22
.L28:
	addq	$1, %rdi
	cmpl	%edi, %r12d
	jle	.L73
	addq	-136(%rbp), %rdx
	vmovsd	(%rbx,%rdi,8), %xmm2
	movl	%edx, %eax
	jmp	.L30
.L20:
	movl	-140(%rbp), %r12d
	movq	-152(%rbp), %r11
	movl	%edx, %esi
	jmp	.L25
.L46:
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	jmp	.L26
.L76:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L42:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	.L7
.L77:
	movq	stderr(%rip), %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L3
.L39:
	movq	-64(%rbp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	jmp	.L41
.L43:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	.L13
.L6:
	movq	stderr(%rip), %rdi
	movl	%r12d, %ecx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	-64(%rbp), %rdi
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

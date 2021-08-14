.data

STR:	.string "Modulo="

.text

	li a7,6		#ecall para read float
	ecall
	fmv.s fs0,fa0	#primeiro float em fs0
	ecall
	fmv.s fs1,fa0	#segundo float em fs1
	
	fmul.s ft0,fs0,fs0	#ft0 = primeiro float ** 2
	fmul.s ft1,fs1,fs1	#ft1 = segundo float ** 2
	
	fadd.s ft0,ft0,ft1	#ft0 = ft0 + ft1
	
	fsqrt.s ft0,ft0
	
	li a7,4
	la a0,STR
	ecall
	
	li a7,2
	fmv.s fa0,ft0
	ecall
	
	li a7,10
	ecall
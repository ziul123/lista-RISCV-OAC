.text

	li a7, 5	#ecall para read int
	ecall
	
	slli a0, a0, 1	#a0 = 2*a0
	
	li a7, 1	#ecall para print int
	ecall
	
	li a7, 10	#ecall para exit
	ecall
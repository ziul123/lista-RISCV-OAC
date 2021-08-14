.text

	li a7, 5	#ecall para read int
	ecall
	mv t0, a0
	
	li a7, 5	#ecall para read int
	ecall
	
	mul a0, a0, t0
	
	li a7, 1	#ecall para print int
	ecall
	
	li a7, 10	#ecall para exit
	ecall
.data
STR1:	.string "Primo("
STR2:	.string ")="

.text
	
	li a7,5			#ecall para read int
	ecall
	mv s0,a0
	bltz a0,END
	
	li t0,2			#numero a ser incrementado
	li t1,1			#contador de primos
	li t2,1
	beq s0,t2,PRINT
	
	addi t0,t0,1
	li s1,3


LOOP:
	jal EH_PRIMO	#checa se o numero eh primo. se for, incrementa o contador
	beq s0,t1,PRINT	#se for o n-esimo primo, vai printar
	addi t0,t0,2	#proximo numero impar
	j LOOP
	
	
PRINT:
	la a0,STR1		#
	li a7,4			#printa Primo(
	ecall			#

	mv a0,s0		#
	li a7,1			#printa o n
	ecall			#

	la a0,STR2		#
	li a7,4			#printa )=
	ecall			#
	
	mv a0,t0		#
	li a7,1			#printa o primo
	ecall			#
	
END:	
	li a7,10		#ecall para exit
	ecall
	

EH_PRIMO:
	srai t3,t0,1	#tem que checar ate numero/2
	li t4,3

LOOP2:
	beq t0,s1,S_PRIMO	#se for 3 eh primo
	rem t5,t0,t4	#
	beqz t5,N_PRIMO	#se o resto da divisao for 0, nao eh primo
	addi t4,t4,2	#ignora numeros pares
	blt t4,t3,LOOP2	#
	
S_PRIMO:
	addi t1,t1,1

	
N_PRIMO:
	ret

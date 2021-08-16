.data

vetor:	.space 40
esp:	.string " "
n:		.string "\n"
.text
	
	li a7,5			#ecall para read int
	la t0,vetor
	li t1,10		#tamanho do vetor
	li t2,0			#contador
read:
	ecall
	sw, a0,0(t0)	#vetor[t2] = a0
	addi t2,t2,1	#t2++
	addi t0,t0,4
	blt t2,t1,read

	la a0,vetor
	call sort
	mv t0,a0
	li t1,9			#tamanho do vetor
	li t2,0			#contador
	
write:
	lw a0,0(t0)
	li a7,1			#ecall para print int
	ecall
	la a0,esp		
	li a7,4			#ecall para print str
	ecall
	addi t2,t2,1	#t2++
	addi t0,t0,4
	blt t2,t1,write	#while(t2<length(vetor))
	
	lw a0,0(t0)
	li a7,1
	ecall
	
	la a0,n
	li a7,4
	ecall
	
	li a7,10		#ecall para exit
	ecall
	

#############################
#ordena um vetor: a0 = vetor#
#ret: a0 = vetor ordenado	#
#############################
sort:
	mv t0,a0
	li t1,9			#length(vetor)
	li t2,0			#contador

loop:
	lw t3,0(t0)		#t3 = vetor[t2]
	lw t4,4(t0)		#t4 = vetor[t2+1]
	bgt t3,t4,swap	#se t3>t4, troque
	addi t2,t2,1	#t2++
	addi t0,t0,4
	blt t2,t1,loop	#while(t2<length(vetor)-1)



check:
	mv t0,a0
	li t1,9			#length(vetor)
	li t2,0			#contador
cloop:
	lw t3,0(t0)		#t3 = vetor[t2]
	lw t4,4(t0)		#t4 = vetor[t2+1]
	bgt t3,t4,sort	#se nao ordenado, volta ao comeco
	addi t2,t2,1	#t2++
	addi t0,t0,4
	blt t2,t1,cloop	#while(t2<length(vetor)-1)
	ret

swap:
	sw t4,0(t0)		#vetor[i] = vetor[i+1]
	sw t3,4(t0)		#vetor[i+1] = vetor[i]
	j loop

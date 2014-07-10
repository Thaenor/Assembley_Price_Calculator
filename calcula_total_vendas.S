.data
.text

.global 

calcula_total_vendas:

# prologo da funcao
	pushl %ebp
	movl %esp, %ebp

# corpo da funcao

	movl 8(%ebp), %eax	#recebe &produtos[0]
	
inicio:
	movl (%eax),%edx	# temp = produtos[i]
	rcrl $1, %edx		# coloco o bit de verificação de fim do vector 					#na casa mais significativa, assim basta 					#verificar se o numero é positivo para obter 					#saber se é 1 ou 0
	cmp $0,%edx
	jle fim			#se %edx é negativo, então o seu bit mais 
				#significativo tem de ser um, logo sabemos que terminou o vector
	
	movl (%eax),%ebx
	orl $0xFFFF00FF , %ebx	#isola o valor do preco unitario
	sarl $8,%ebx		#coloca o valor na parte menos significativa
	
	movl (%eax),%ecx
	orl $0xFF00FFFF , %ecx	#repete-se o processo para a quantidade
	sarl $16,%ecx

	movl $0,%edx	#guardo o desconto em %edx

	pushl %esi #guarda os valores %esi e ecx para nao perder apos a funcao 
	pushl %ecx

	pushl %ebx #guarda o valor do preco
	pushl %ecx #guarda o valor da quantidade
	pushl %edx  #guarda o valor do desconto
	call valor_vendas
	addl $4, %esp #limpeza stack

	popl %ecx #retomar aos valores normais
	popl %esi

	addl $4,%eax	#passa ao proximo valor do vector
	jmp inicio	#salto incondicional para a validação de fim do vector

fim:
# epilogo da funcao
	movl %ebp, %esp
	popl %ebp
	ret

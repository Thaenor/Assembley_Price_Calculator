.data
.text

.global 

valor_vendas:

# prologo da funcao
	pushl %ebp
	movl %esp, %ebp

# corpo da funcao

	movl 8(%ebp), %eax	#preco_unit_em_euros
	movl 12(%ebp), %ebx 	#quantidade_vendida
	movl 16(%ebp), %ecx
	
		
	imull %eax,%ebx		#preco * quantidade
	subl %ebx,%ecx		#(preco*quantidade) - desconto
	movl %ecx, %eax		#movo o resultado final para o eax para 
				#facilidade de retorno

	

# epilogo da funcao
	movl %ebp, %esp
	popl %ebp
	ret

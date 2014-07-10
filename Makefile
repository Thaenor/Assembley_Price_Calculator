main : main.c calcula_total_vendas.h valor_vendas.h
	gcc -c -g calcula_total_vendas.S -o calcula_total_vendas.o
	gcc -c -g valor_vendas.S -o valor_vendas.o
	gcc -c main.c -o main.o
	gcc main.o calcula_total_vendas.o calcula_total_vendas.o

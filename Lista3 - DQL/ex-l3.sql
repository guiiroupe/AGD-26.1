use cinema_sql_simples;

#A)
select Titulo, Ano_Lancamento from filmes
where (Ano_lancamento = 2010);

#B)
select Titulo, Genero, Classificacao_Indicativa from filmes
where (Genero = "Ação") and Classificacao_Indicativa = "PG-13";

#c)
select Titulo, Receita, Ano_Lancamento from filmes
where Receita > 1000000000
order by Ano_Lancamento desc;

#D)
select Titulo, Pontuacao_IMDB, Pais_Origem, Receita from filmes
where (Pais_Origem = "EUA") and (Pontuacao_IMDB > 7.5)
order by Receita desc;

#E)
select Titulo, Orçamento, Duracao, Data_Lancamento from filmes
where ((Orçamento between 50000000 and 200000000) and Classificacao_Indicativa = "PG-13")
order by Data_Lancamento desc;

#F)
select Titulo, Formato_Exibicao from filmes
where Formato_Exibicao = "IMAX";

#G)
select Titulo, Ator_Principal from filmes
where Ator_Principal = "Leonardo DiCaprio";

#H)
select Titulo, Diretor from filmes
where Diretor = "Christopher Nolan";

#I)
select Titulo, Pais_Origem from filmes
where Pais_Origem = "EUA";

#J)
select Titulo, Genero, Receita from filmes
where (Genero = "Ação") and (Receita > 500000000);

#K)
select Titulo, Genero, Data_Lancamento from filmes
where (Genero = "Comédia") and (Ano_Lancamento > 2010);

#L)
select Titulo, Pontuacao_IMDB, Quantidade_de_Oscars from filmes
where (Pontuacao_IMDB > 8.0) and (Quantidade_de_Oscars > 3);

#M)
select Ano_Lancamento, count(Ano_Lancamento) as Quantidade_por_ano from filmes
group by Ano_Lancamento
order by Ano_Lancamento asc;

#N)
select Genero, sum(Orçamento) as Soma_do_Orçamento from filmes 
group by Genero
order by Soma_do_Orçamento desc;

#O)
select Diretor, count(Diretor) as Num_Filmes_Dir from filmes
group by Diretor
having  Num_Filmes_Dir > 3
order by Num_Filmes_Dir desc;

#P)
select Pais_Origem, sum(Receita) as Soma_das_Receitas from filmes
group by Pais_Origem
having Soma_das_Receitas > 1000000000
order by Soma_das_Receitas desc;

#Q)
select Genero, Ano_Lancamento, avg(Pontuacao_IMDB) as Media_IMDB from filmes
group by Genero, Ano_Lancamento
order by Ano_Lancamento asc, Media_IMDB desc;

#R)
select Formato_Exibicao, count(ID) as Qtd_Filmes from filmes
group by Formato_Exibicao
order by Qtd_Filmes desc;

#S)
select Ator_Principal, sum(Receita) as Soma_Receita from filmes
group by Ator_Principal
having Soma_Receita > 500000000
order by Soma_Receita desc;

#T)
select Genero, avg(Pontuacao_IMDB) as Media_IMDB from filmes
group by Genero
order by Media_IMDB desc;

#U)
select Diretor, count(ID) as Filmes_Dirigidos from filmes
group by Diretor
having Filmes_Dirigidos > 2
order by Filmes_Dirigidos desc;

#V)
select Genero, Ano_Lancamento, sum(Receita) as Soma_Receita from filmes
group by Genero, Ano_Lancamento
order by Ano_Lancamento desc , Soma_Receita desc;

#W)
select Genero, sum(Orçamento) as Orçamento_Total from filmes
group by Genero
having Orçamento_Total > 500000000
order by Orçamento_Total desc;

#X)
select Diretor, count(ID) as Filmes_Dirigidos, sum(Receita) as Soma_Receita from filmes
group by Diretor
order by Filmes_Dirigidos desc;

#Y)
select Formato_Exibicao, avg(Orçamento) as Media_Orçamento from filmes
group by Formato_Exibicao
order by Media_Orçamento asc;

#Z)
select Genero, avg(Pontuacao_IMDB) as Media_IMDB from filmes
group by Genero
order by Media_IMDB desc;
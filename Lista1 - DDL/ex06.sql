drop schema if exists exercicio05;
create schema exercicio05;
use exercicio05;

create table EDITORA(
Nome varchar(30) not null,
Endereco varchar(50),
Telefone varchar(11) not null,
primary key (Nome)
);

create table CATEGORIA(
Cod_categoria varchar(2) not null,
Nome_categoria varchar(30) not null,
primary key (Cod_categoria)
);

create table LIVRO(
Cod_livro varchar(4),
Titulo varchar(30),
Nome_editora varchar(30),
#Categoria varchar(2),
primary key (Cod_livro),
foreign key (Nome_editora) references EDITORA(Nome)
#foreign key (Categoria) references Categoria(Cod_categoria) 
);

alter table LIVRO
add Categoria varchar(2) not null,
add foreign key (Categoria) references Categoria(Cod_categoria);

create table LIVRO_AUTOR(
Cod_livro varchar(4) not null,
Nome_autor varchar(30) not null,
primary key (Cod_livro, Nome_autor),
foreign key (Cod_livro) references LIVRO(Cod_livro)
);

create table UNIDADE_BIBLIOTECA(
Cod_unidade varchar(4) not null,
Nome_unidade varchar(30) not null,
Endereco varchar(50) not null,
primary key (Cod_unidade)
);

create table LIVRO_COPIAS(
Cod_livro varchar(4) not null,
Cod_unidade varchar(4) not null,
Qt_copia smallint,
primary key (Cod_livro, Cod_unidade),
foreign key (Cod_livro) references LIVRO(Cod_livro),
foreign key (Cod_unidade) references UNIDADE_BIBLIOTECA(Cod_unidade)
);

create table USUARIO(
Num_cartao char(16) not null,
Nome varchar(50) not null,
Endereco varchar(50) not null,
Telefone char(11) not null,
primary key (Num_cartao)
);

create table FUNCIONARIO(
Cod_funcionario char(10),
Nome varchar (50),
Setor varchar(15),
primary key (Cod_funcionario)
);

create table LIVRO_EMPRESTIMO(
Cod_livro varchar(4) not null,
Cod_unidade varchar(4) not null,
Nr_cartao char(16) not null,
Data_emprestimo date not null,
Data_devolucao date not null,
/*Cod_funcionario char(10),*/
primary key (Cod_livro, Cod_unidade, Nr_cartao),
foreign key (Cod_livro) references LIVRO(Cod_livro),
foreign key (Cod_unidade) references UNIDADE_BIBLIOTECA(Cod_unidade),
/*foreign key (Cod_funcionario) references FUNCIONARIO(Cod_funcionario), */
foreign key (Nr_cartao) references USUARIO(Num_cartao)
);

alter table LIVRO_EMPRESTIMO
add Cod_funcionario char(10),
add foreign key (Cod_funcionario) references FUNCIONARIO(Cod_funcionario),
drop primary key,
add primary key (Cod_livro, Cod_unidade, Nr_cartao, Cod_funcionario);

#6.1
drop table LIVRO_AUTOR;

#6.2

#show create table LIVRO_EMPRESTIMO;
#show create table LIVRO_COPIAS;

alter table LIVRO_EMPRESTIMO
drop foreign key livro_emprestimo_ibfk_2,
drop primary key,
add primary key (Cod_livro, Nr_cartao, Cod_funcionario),
modify column Cod_unidade varchar(4);

alter table LIVRO_COPIAS
drop foreign key livro_copias_ibfk_2,
drop primary key,
modify column Cod_unidade varchar(4),
add primary key (Cod_livro);

drop table UNIDADE_BIBLIOTECA;
drop schema if exists exercicio04;
create schema exercicio04;
use exercicio04;

create table EDITORA(
Nome varchar(30) not null,
Endereco varchar(50),
Telefone varchar(11) not null,
primary key (Nome)
);

create table LIVRO(
Cod_livro varchar(4),
Titulo varchar(30),
Nome_editora varchar(30),
primary key (Cod_livro),
foreign key (Nome_editora) references EDITORA(Nome)
);

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

create table LIVRO_EMPRESTIMO(
Cod_livro varchar(4) not null,
Cod_unidade varchar(4) not null,
Nr_cartao char(16) not null,
Data_emprestimo date not null,
Data_devolucao date not null,
primary key (Cod_livro, Cod_unidade, Nr_cartao),
foreign key (Cod_livro) references LIVRO(Cod_livro),
foreign key (Cod_unidade) references UNIDADE_BIBLIOTECA(Cod_unidade),
foreign key (Nr_cartao) references USUARIO(Num_cartao)
);
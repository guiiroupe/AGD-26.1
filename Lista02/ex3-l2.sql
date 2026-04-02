drop schema if exists exercicio03list2;
create schema exercicio03list2;
use exercicio03list2;

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

#Começando os Inserts

alter table EDITORA
modify column Endereco varchar(255);

insert into EDITORA values ('Editora 1', 'Av Paulo Pereira, Cabo Frio', '22987478856');
insert into EDITORA values ('Editora 2', 'Av Joao Silva, Araruama', '22981478856');
insert into EDITORA values ('Editora 3', 'Rua Lisboa, Angra dos Reis', '24987578856');
insert into EDITORA values ('Editora 4', 'Rua Acre, Rio de Janeiro', '21987373856');
insert into EDITORA values ('Editora 5', 'Rua Barcelona, Buzios', '22987478856');

insert into LIVRO values ('1984','1984','Editora 1');
insert into LIVRO values ('2934','A História do Brasil','Editora 2');
insert into LIVRO values ('1224','O Pequeno Principe','Editora 3');
insert into LIVRO values ('1354','A Revolução dos Bichos','Editora 4');
insert into LIVRO values ('1897','A Garota do Lago','Editora 5');

insert into LIVRO_AUTOR values ('1984','G.Orwell');
insert into LIVRO_AUTOR values ('2934','Gabriel de Castro');
insert into LIVRO_AUTOR values ('1224','Antonie de Saint-Exupery');
insert into LIVRO_AUTOR values ('1354','G.Orwell');
insert into LIVRO_AUTOR values ('1897','Charlie Donlea');

alter table UNIDADE_BIBLIOTECA
modify column Endereco varchar(255),
modify column Nome_unidade varchar(255);

insert UNIDADE_BIBLIOTECA values ('12','Biblioteca de Caxias','Av Gov. Leonel de Moura Brizola, 56, Duque de Caxias');
insert UNIDADE_BIBLIOTECA values ('34','Biblioteca de Niteroi','Av Amaral Peixoto, 50, Niteroi');
insert UNIDADE_BIBLIOTECA values ('56','Biblioteca de Queimados','Rua João Amaral, 30, Queimados');
insert UNIDADE_BIBLIOTECA values ('78','Biblioteca de Buzios','Rua das Pedras, 158, Buzios');
insert UNIDADE_BIBLIOTECA values ('91','Biblioteca Zé Garoto','Av São Gonçalo, 45, São Gonçalo');

insert into LIVRO_COPIAS values ('1984','12', 98);
insert into LIVRO_COPIAS values ('2934','34', 140);
insert into LIVRO_COPIAS values ('1224','56', 200);
insert into LIVRO_COPIAS values ('1354','78', 35);
insert into LIVRO_COPIAS values ('1897','91', 20);

alter table USUARIO
modify column Endereco varchar(255);

insert into USUARIO values ('1259847613265984', 'Guilherme','Rua Jamari, 55, Duque de Caxias','21986544450');
insert into USUARIO values ('5259887683265984', 'Bruna','Rua Carlos Macedo, 455, Niteroi','21986555450');
insert into USUARIO values ('6259847613265984', 'Maria','Rua Joao Pereira, 5, Rio de Janeiro','21998544450');
insert into USUARIO values ('9289847613265984', 'Gustavo','Rua Vicente de Carvalho, 155, Belford Roxo','21986587450');
insert into USUARIO values ('8259847613265984', 'Gabriel','Rua das Pedras, 20, Buzios','21986547850');

insert into LIVRO_EMPRESTIMO  values ('1984','12','1259847613265984','2026-03-10','2026-03-29');
insert into LIVRO_EMPRESTIMO  values ('2934','34','5259887683265984','2026-03-11','2026-04-10');
insert into LIVRO_EMPRESTIMO  values ('2934','34','6259847613265984','2026-03-12','2026-03-25');
insert into LIVRO_EMPRESTIMO  values ('2934','34','9289847613265984','2026-03-13','2026-04-11');
insert into LIVRO_EMPRESTIMO  values ('1984','12','8259847613265984','2026-03-14','2026-03-27');

#Select para visualizar
#select * from LIVRO_EMPRESTIMO;
#select * from USUARIO;
#select * from UNIDADE_BIBLIOTECA;

#Realizando os update

update LIVRO_EMPRESTIMO
set Data_devolucao ='2026-04-01'
where (Cod_livro = '1984') and (Cod_unidade = '12') and (Nr_Cartao = '1259847613265984');

update USUARIO
set Nome = 'Guilherme Roupe'
where Num_cartao = '1259847613265984';

update UNIDADE_BIBLIOTECA
set Nome_unidade = 'Biblioteca Municipal de Duque de Caxias'
where Cod_unidade = '12';

#Select para visualizar
#select * from LIVRO_EMPRESTIMO;
#select * from USUARIO;
#select * from UNIDADE_BIBLIOTECA;

#Criando os Delete

delete from LIVRO_EMPRESTIMO
where (Cod_livro ='1984') and (Cod_unidade = '12') and (Nr_cartao = '8259847613265984');

delete from USUARIO
where Num_cartao = '8259847613265984';

delete from LIVRO_COPIAS
where (Cod_livro = '1354') and (Cod_unidade = '78');

#select para visualizar as mudanças
#select * from LIVRO_EMPRESTIMO;
#select * from USUARIO;
#select * from LIVRO_COPIAS;





drop schema if exists exercicio02;
create schema exercicio02;
use exercicio02;

create table AEROPORTO(
Codigo_aeroporto char(3) not null,
Nome varchar(50) ,
Cidade varchar(25),
Estado char(2),
primary key(Codigo_aeroporto)
);

create table VOO(
Numero_voo char(5) not null,
Companhia_aerea varchar(25) not null,
Dias_da_semana varchar(73),
primary key (Numero_voo)
);

create table TRECHO_VOO(
Numero_voo char(5) not null, 
Numero_trecho int not null,
Codigo_aeroporto_partida char(3) not null,
Codigo_aeroporto_chegada char(3) not null,
Horario_partida_previsto time(0) not null,
Horario_chegada_previsto time(0) not null,
primary key(Numero_voo, Numero_trecho),
foreign key (Numero_voo) references VOO(Numero_voo),
foreign key(Codigo_aeroporto_chegada) references AEROPORTO(Codigo_aeroporto),
foreign key(Codigo_aeroporto_partida) references AEROPORTO(Codigo_aeroporto)
);

create table INSTANCIA_TRECHO(
Numero_voo char(5) not null,
Numero_trecho int not null,
Data date not null,
Numero_assentos_disponiveis int,
Codigo_aeronave char(4) not null,
Codigo_aeroporto_partida char(3) not null,
Horario_partida time(0) not null,
Codigo_aeroporto_chegada char(3) not null,
Horario_chegada time(0),
primary key(Numero_voo, Numero_trecho, Data),
foreign key (Numero_voo, Numero_trecho) references TRECHO_VOO(Numero_voo, Numero_trecho)
);

create table TARIFA(
Numero_voo char(5) not null,
Codigo_tarifa char(4) not null,
Quantidade smallint,
Restricoes varchar(100),
primary key (Numero_voo, Codigo_tarifa),
foreign key (Numero_voo) references VOO(Numero_voo)
);

create table TIPO_AERONAVE(
Nome_tipo_aeronave varchar(50) not null,
Qtd_max_assentos smallint,
Companhia varchar(25),
primary key(Nome_tipo_aeronave)
);

create table PODE_POUSAR(
Nome_tipo_aeronave varchar(50) not null,
Codigo_aeroporto char(3) not null,
foreign key (Nome_tipo_aeronave) references TIPO_AERONAVE(Nome_tipo_aeronave),
foreign key (Codigo_aeroporto) references AEROPORTO(Codigo_aeroporto),
primary key (Nome_tipo_aeronave, Codigo_aeroporto)
); 

create table AERONAVE(
Codigo_aeronave char(5) not null,
Numero_total_assentos smallint not null,
Tipo_aeronave varchar(30) not null,
primary key (Codigo_aeronave)
);

create table RESERVA_ASSENTO(
Numero_voo char(5) not null,
Numero_trecho int not null,
Data date not null,
Numero_assento smallint not null,
Nome_cliente varchar(30),
Telefone_cliente char(11),
foreign key (Numero_voo, Numero_trecho, Data) references INSTANCIA_TRECHO(Numero_voo, Numero_trecho, Data),
primary key (Numero_voo, Numero_trecho, Data, Numero_assento)
);

drop schema if exists exercicio02list2;
create schema exercicio02list2;
use exercicio02list2;

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

#Realizando inclusão

insert into AEROPORTO values ('ACX', 'Aeroporto de Caxias', 'Duque de Caxias', 'RJ');
insert into AEROPORTO values ('AMS', 'Aeroporto de Manaus', 'Manaus', 'AM');
insert into AEROPORTO values ('GIG', 'Aeroporto do Galeão', 'Rio de Janeiro', 'RJ');
insert into AEROPORTO values ('NKT', 'Aeroporto Arariboia', 'Niteroi', 'RJ');
insert into AEROPORTO values ('ABZ', 'Aeroporto de Buzios', 'Buzios', 'RJ');

insert into VOO values ('1287', 'Aero Caxias', 'Quinta-feira');
insert into VOO values ('1547', 'Fly Manaus', 'Segunda-feira');
insert into VOO values ('1794', 'Gol', 'Terça-feira');
insert into VOO values ('3547', '1001 Aviacoes', 'Sexta-feira');
insert into VOO values ('7951', 'Voe Buzios', 'Sábado');

insert into TRECHO_VOO values ('1287','1', 'ACX', 'AMS', '08:00:00', '13:00:00');
insert into TRECHO_VOO values ('1547', '2', 'AMS','GIG','13:00:00','18:00:00');
insert into TRECHO_VOO values ('1794', '3', 'GIG','NKT','18:00:00','18:30:00' );
insert into TRECHO_VOO values ('3547', '4', 'NKT', 'ABZ', '18:30:00', '19:30:00');
insert into TRECHO_VOO values ('7951', '5', 'ABZ', 'ACX', '19:30:00', '20:30:00');

insert into INSTANCIA_TRECHO values('1287','1','2026-03-19', '150', '001', 'ACX', '08:00:00','AMS','13:00:00');
insert into INSTANCIA_TRECHO values('1547', '2','2026-03-19','250', '002','AMS', '13:00:00','GIG','18:00:00');
insert into INSTANCIA_TRECHO values('1794', '3','2026-03-19','150', '003','GIG', '18:00:00','NKT','18:30:00');
insert into INSTANCIA_TRECHO values('3547', '4','2026-03-19','150', '004','NKT', '18:30:00','ABZ','19:30:00');
insert into INSTANCIA_TRECHO values('7951', '5','2026-03-19','250', '005','ABZ', '19:30:00','ACX','20:30:00');

insert into TARIFA (Numero_voo, Codigo_tarifa, Quantidade) values('1287','123', '150');
insert into TARIFA (Numero_voo, Codigo_tarifa, Quantidade) values('1547','456', '250');
insert into TARIFA (Numero_voo, Codigo_tarifa, Quantidade) values('1794','789', '150');
insert into TARIFA (Numero_voo, Codigo_tarifa, Quantidade) values('3547','101', '150');
insert into TARIFA (Numero_voo, Codigo_tarifa, Quantidade) values('7951','102', '250');

insert into TIPO_AERONAVE values('Airbus A320', 150, 'Aero Caxias');
insert into TIPO_AERONAVE values('Boeing 777',250,'Fly Manaus');
insert into TIPO_AERONAVE values('Airbus A321', 150,'Gol');
insert into TIPO_AERONAVE values('Airbus A322', 150,'1001 Aviacoes');
insert into TIPO_AERONAVE values('Airbus A323', 250,'Voe Buzios');

insert into PODE_POUSAR values ('Airbus A320', 'AMS');
insert into PODE_POUSAR values ('Boeing 777', 'GIG');
insert into PODE_POUSAR values ('Airbus A321', 'NKT');
insert into PODE_POUSAR values ('Airbus A322', 'ABZ');
insert into PODE_POUSAR values ('Airbus A323', 'ACX');

insert into AERONAVE values ('001',150,'Airbus A320');
insert into AERONAVE values ('002',250,'Boeing 777');
insert into AERONAVE values ('003',150,'Airbus A321');
insert into AERONAVE values ('004',150,'Airbus A322');
insert into AERONAVE values ('005',250,'Airbus A323');

insert into RESERVA_ASSENTO values ('1287','1','2026-03-19', 10, 'Gabriel', '21987548820' );
insert into RESERVA_ASSENTO values ('1547','2','2026-03-19', 45, 'Juan', '21987548120' );
insert into RESERVA_ASSENTO values ('1794','3','2026-03-19', 87, 'Daniel', '21983548820' );
insert into RESERVA_ASSENTO values ('3547','4','2026-03-19', 12, 'Cris', '21987848820' );
insert into RESERVA_ASSENTO values ('7951','5','2026-03-19', 33, 'João', '21982548820' );

#Updates

update RESERVA_ASSENTO 
set Nome_cliente = 'Guilherme'
where Numero_voo = '1287';

update AERONAVE
set Numero_total_assentos = 200
where Codigo_aeronave = '001';

update TARIFA
set Quantidade = 200
where Codigo_tarifa = '123' and Numero_voo = '1287';

#Exclusões

delete from RESERVA_ASSENTO
where (Numero_voo = '1287') and (Numero_trecho = '1') and (Data = '2026-03-19') and (Numero_assento = 10);

delete from AERONAVE
where Codigo_aeronave = '001';

delete from PODE_POUSAR
where (Nome_tipo_aeronave = 'Airbus A320') and (Codigo_aeroporto = 'AMS');

#Apenas para conferir as mudanças
#select * from RESERVA_ASSENTO;
#select * from AERONAVE;
#select * from PODE_POUSAR;
#select * from TARIFA;
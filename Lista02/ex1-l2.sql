drop schema if exists exercicio01list2;
create schema exercicio01list2;
use exercicio01list2;

create table ALUNO(
Nome varchar(50),
Numero_aluno smallint primary key not null,
Tipo_aluno tinyint,
Curso varchar(5)
);

create table DISCIPLINA(
Nome_disciplina varchar(50),
Numero_disciplina varchar(9) primary key not null,
Creditos tinyint,
Departamento varchar(5)
);

create table TURMA(
Identificacao_turma smallint primary key not null,
Numero_disciplina varchar(9),
Semestre varchar(8),
Ano tinyint unsigned,
Professor varchar(15),
foreign key (Numero_disciplina) references DISCIPLINA(Numero_disciplina)
);

create table HISTORICO_ESCOLAR(
Numero_aluno smallint not null,
Identificacao_turma smallint not null,
Nota char(1),
primary key (Numero_aluno, Identificacao_turma),
foreign key (Numero_aluno) references ALUNO(Numero_aluno),
foreign key (Identificacao_turma) references TURMA(Identificacao_turma)
);

create table PRE_REQUISITO(
Numero_disciplina varchar(9) not null,
Numero_pre_requisito varchar(9) primary key not null,
foreign key (Numero_disciplina) references DISCIPLINA(Numero_disciplina)
);

#Começando os inserts

insert into ALUNO values('Silva', 17, 1, 'CC');
insert into ALUNO values ('Braga', 8, 2, 'CC');

insert into DISCIPLINA values ('Introd. à ciência da computação', 'CC1310', 4, 'CC');
insert into DISCIPLINA values ('Estruturas de dados', 'CC3320', 4, 'CC');
insert into DISCIPLINA values ('Matematica discreta', 'MAT2410', 3, 'MAT');
insert into DISCIPLINA values ('Banco de dados', 'CC3380', 3, 'CC');

insert into TURMA values (85, 'MAT2410', 'Segundo', 07, 'Kleber');
insert into TURMA values (92, 'CC1310', 'Segundo', 07, 'Anderson');
insert into TURMA values (102, 'CC3320', 'Primeiro', 08, 'Carlos');
insert into TURMA values (112, 'MAT2410', 'Segundo', 08, 'Chang');
insert into TURMA values (119, 'CC1310', 'Segundo', 08, 'Anderson');
insert into TURMA values (135, 'CC3380', 'Segundo', 08, 'Santos');

insert into HISTORICO_ESCOLAR values (17,112,'B');
insert into HISTORICO_ESCOLAR values (17, 119, 'C');
insert into HISTORICO_ESCOLAR values (8,85,'A');
insert into HISTORICO_ESCOLAR values (8,92,'A');
insert into HISTORICO_ESCOLAR values (8,102,'B');
insert into HISTORICO_ESCOLAR values (8,135,'A');

insert into PRE_REQUISITO values ('CC3380', 'CC3320');
insert into PRE_REQUISITO values ('CC3380', 'MAT2410');
insert into PRE_REQUISITO values ('CC3320', 'CC1310');




	



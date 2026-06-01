drop schema if exists exercicio01;
create schema exercicio01;
use exercicio01;

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
Numero_aluno smallint primary key not null,
Identificacao_turma smallint not null,
Nota char(1),
foreign key (Numero_aluno) references ALUNO(Numero_aluno),
foreign key (Identificacao_turma) references TURMA(Identificacao_turma)
);

create table PRE_REQUISITO(
Numero_disciplina varchar(9) not null,
Numero_pre_requisito varchar(9) primary key not null,
foreign key (Numero_disciplina) references DISCIPLINA(Numero_disciplina)
);

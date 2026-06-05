use DBMercado;

#1) 

create table log(
id int auto_increment primary key,
operacao varchar(30),
tabela varchar(30),
data_hora time);

drop trigger after_vendas; 

DELIMITER $$
create trigger after_vendas after insert
on itensvenda
for each row
begin
insert into log  (operacao, tabela, data_hora) 
values ('Insert', 'itensvenda', now());
end$$
DELIMITER ;

drop trigger after_vendas_delete

DELIMITER $$
create trigger after_vendas_delete after delete
on itensvenda
for each row
begin
insert into log  (operacao, tabela, data_hora) 
values ('Delete', 'itensvenda', now());
end$$
DELIMITER ;

drop trigger after_vendas_update

DELIMITER $$
create trigger after_vendas_update after update
on itensvenda
for each row
begin
insert into log (operacao, tabela, data_hora)
values ('Update','itensvenda',now());
end$$
DELIMITER ;

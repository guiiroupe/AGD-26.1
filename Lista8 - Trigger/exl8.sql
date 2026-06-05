USE `mercado`;

#1) 

create table log(
id int auto_increment primary key,
operacao varchar(30),
tabela varchar(30),
data_hora datetime);

DELIMITER $$
create trigger after_vendas_insert after insert
on itensvenda
for each row
begin
insert into log  (operacao, tabela, data_hora) 
values ('Insert', 'itensvenda', now());
end$$
DELIMITER ;

DELIMITER $$
create trigger after_vendas_delete after delete
on itensvenda
for each row
begin
insert into log  (operacao, tabela, data_hora) 
values ('Delete', 'itensvenda', now());
end$$
DELIMITER ;

DELIMITER $$
create trigger after_vendas_update after update
on itensvenda
for each row
begin
insert into log (operacao, tabela, data_hora)
values ('Update','itensvenda',now());
end$$
DELIMITER ;

DELIMITER $$
create trigger after_produtos_insert after insert
on produtos
for each row
begin
insert into log (operacao, tabela, data_hora)
values ("Insert", "Produtos", now());
end$$
DELIMITER ;

DELIMITER $$
create trigger after_produtos_delete after delete
on produtos
for each row
begin
insert into log (operacao, tabela, data_hora)
values ("Delete","Produtos",now());
end$$
DELIMITER ;

DELIMITER $$
create trigger after_produtos_update after update
on produtos
for each row
begin
insert into log (operacao, tabela, data_hora)
values("Update","Produtos",now());
end$$
DELIMITER ;
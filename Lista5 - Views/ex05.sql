#Exercício 005 - TPBD: Views
#Aluno: Guilherme Roupe

USE `world`;

#1) Criação de view estática

#a)

create view viewDadosPessoais as
select
'Guilherme Roupe' as Nome,
'15749993701' as CPF,
'Rua Leverger' as Endereco,
'Duque de Caxias' as Cidades,
'Rio de Janeiro' as Estado,
'Brasil' as Pais,
'25036-190' as CEP,
'guiroupe@gmail.com' as Email,
'21 973405580' as Telefone;

select * from viewDadosPessoais;

#b)

create view viewCarroFavorito as
select
'BYD King' as Modelo,
'2026' as Ano,
'GS' as Serie,
'BYD' as Montadora,
'191.900' as Valor;

select * from viewCarroFavorito;

#c)

create view viewComputadorSonhos as 
select
'128 GB DDR5 8000 MHz RGB' as Memoria,
'SSD NVMe Gen5 4 TB' as Armazenamento,
'NVIDIA GeForce RTX 5090 — 32 GB GDDR7' as Video,
'AMD Ryzen 9 9950X3D' as Processador,
'Sound Blaster AE-9' as Som;

select * from viewComputadorSonhos; 

#2)Criação Views Dinâmicas

#a) 

create view viewPaisesExpectativa as
select LifeExpectancy, Name from country
where LifeExpectancy > 77; 

select * from viewPaisesExpectativa;

#b) 

create view viewPaisesJAPCHIN as 
select c.Name, cl.Percentage, cl.Language from country c
join countrylanguage cl
on c.Code = cl.CountryCode
where (cl.Language = 'Japanese') or (cl.Language = 'Chinese');

select * from viewPaisesJAPCHIN;

#c)Crie uma view para mostrar as cidades paulistas e cariocas com menos de 100000 habitantes.

create view viewCidadesRJSP as
select Name, Population from city
where ((District = 'Rio de Janeiro') or (District = 'São Paulo')) and Population < 100000;

select * from viewCidadesRJSP;

#d)

create view viewPaisCapital as
select c.Name, ci.Name as 'Nome capital', ci.District, ci.Population from country c
join city ci
on c.Capital = ci.ID;

select * from viewPaisCapital;

#e)

create view viewLinguaOficial as
select c.Name, cl.Language, cl.Percentage from country c
join countrylanguage cl
on c.Code = cl.CountryCode
where cl.IsOfficial = 'T';

select * from viewLinguaOficial;

#f)

create view viewPaisLingua as
select cl.Language, count(c.Code) as 'Quantidade de Países' from country c
join countrylanguage cl
on c.Code = cl.CountryCode
group by cl.language
order by cl.Language asc;


select * from viewPaisLingua;

#g)

create view viewPaisesRegime as
select GovernmentForm, count(Code) as 'Quantidade de países' from country
group by GovernmentForm;

select * from viewPaisesRegime;

#h)

create view viewPopMundial as
select sum(Population) as 'Soma População Mundial' from country;

select * from viewPopMundial;

#i)

create view viewPaisesTerritorio as 
select Name, SurfaceArea from country;

select * from viewPaisesTerritorio;

#j)

create view viewSUMFalantes as
select sum(c.SurfaceArea) as 'Soma da área total', cl.Language, round(sum((c.Population * cl.Percentage)/100)) as 'Quantidade de falantes' from country c
join countrylanguage cl
on c.Code = cl.CountryCode
group by cl.Language;

select * from viewSUMFalantes;

#k) 

create view viewSUMFalantes2 as
select sum(c.SurfaceArea) as 'Soma da área total', cl.Language, round(sum((c.Population * cl.Percentage)/100)) as 'Quantidade de falantes' from country c
join countrylanguage cl
on c.Code = cl.CountryCode
group by cl.Language
having round(sum((c.Population * cl.Percentage)/100)) < 10000;

select * from viewSUMFalantes2;
use employees;
-- 1)

-- a)
DELIMITER $$ 
create procedure incluir_emp(p_emp_no int, p_birth_date date, p_first_name varchar(14), p_last_name varchar(16), p_gender enum('M', 'F'), p_hire_date date)
begin
insert into employees 
values (p_emp_no, p_birth_date, p_first_name, p_last_name, p_gender, p_hire_date);
end $$

DELIMITER ;

-- b)

DELIMITER $$

create procedure incluir_emp2(p_birth_date date, p_first_name varchar(14), p_last_name varchar(16), p_gender enum('M', 'F'), p_hire_date date)
begin
 declare num_emp int;
 
 select count(emp_no) + 1
 into num_emp
 from employees;
 
 insert into employees
 values (num_emp, p_birth_date, p_first_name, p_last_name, p_gender, p_hire_date);
 
 end $$
 
 DELIMITER ;
 
 CALL incluir_emp2('2002-07-06', 'Guilherme', 'Roupe', 'M', '2026-05-11');
 
 -- c)
 
 DELIMITER $$
 
 create procedure incluir_emp3(p_dept_name varchar(40), p_first_name varchar(14), p_last_name varchar(16))
 begin
 declare v_emp_no int; 
 declare v_dept_no char(4);
 
select emp_no 
into v_emp_no
from employees
where (p_first_name = first_name) and  (p_last_name = last_name);

select dept_no
into v_dept_no
from departments
where p_dept_name = dept_name;

insert into dept_emp
values (v_emp_no, v_dept_no, CURDATE(), '9999-01-01');

end $$

DELIMITER ;

/* teste
CALL incluir_emp3('Sales', 'Guilherme', 'Roupe');

select * from dept_emp
where from_date = CURDATE(); */

-- d)

DELIMITER $$

create procedure incluir_reg(p_first_name varchar(14), p_last_name varchar(16), p_title varchar(50))
begin
declare v_emp_no int;

select emp_no
into v_emp_no
from employees
where (p_first_name = first_name) and (p_last_name = last_name);

insert into titles
values (v_emp_no, p_title, CURDATE(), '9999-01-01');
end $$

DELIMITER ;

-- e)

DELIMITER $$

create procedure incluir_salaries(p_first_name varchar(14), p_last_name varchar(16))
begin
declare v_emp_no int;

select emp_no 
into v_emp_no
from employees
where (p_first_name = first_name) and (p_last_name = last_name);

insert into salaries
values (v_emp_no, 0, curdate(), '9999-01-01');

end $$

DELIMITER ;

-- f)

-- refazendo o e
DELIMITER $$
create procedure incluir_salaries_check(p_first_name varchar(14), p_last_name varchar(16))
begin
	declare v_emp_no int;

	if((p_first_name != '') and (p_last_name != '')) then
		select emp_no 
		into v_emp_no
		from employees
		where (p_first_name = first_name) and (p_last_name = last_name);
		insert into salaries
		values (v_emp_no, 0, curdate(), '9999-01-01');

	else
		select('Insira os dados corretamente!');
	end if;
end $$
DELIMITER ;


-- refazendo o d
DELIMITER $$
create procedure incluir_reg_check(p_first_name varchar(14), p_last_name varchar(16), p_title varchar(50))
begin
	declare v_emp_no int;
	
    if ((p_first_name is not null) and (p_last_name is not null) and (p_title is not null)) then
		select emp_no
		into v_emp_no
		from employees
		where (p_first_name = first_name) and (p_last_name = last_name);

		insert into titles
		values (v_emp_no, p_title, CURDATE(), '9999-01-01');
        
	else
		select('Ensira os dados corretamente!');
        
	end if;
end $$
DELIMITER ;

-- refazendo o c 

 DELIMITER $$
 create procedure incluir_emp3_check(p_dept_name varchar(40), p_first_name varchar(14), p_last_name varchar(16))
 begin
	 declare v_emp_no int; 
	 declare v_dept_no char(4);
     
     if ((p_dept_name is not null) and (p_first_name is not null) and (p_last_name is not null)) then 
		select emp_no 
		into v_emp_no
		from employees
		where (p_first_name = first_name) and  (p_last_name = last_name);

		select dept_no
		into v_dept_no
		from departments
		where p_dept_name = dept_name;

		insert into dept_emp
		values (v_emp_no, v_dept_no, CURDATE(), '9999-01-01');
	else
		select('Ensira os dados corretamente!');
	end if;
end $$
DELIMITER ;

-- refazendo o b

DELIMITER $$

create procedure incluir_emp2_check(p_birth_date date, p_first_name varchar(14), p_last_name varchar(16), p_gender enum('M', 'F'), p_hire_date date)
begin
 declare num_emp int;
 
 if((p_birth_date is not null) and (p_first_name is not null) and (p_last_name is not null) and (p_gender is not null) and (p_hire_date is not null)) then
	 select count(emp_no) + 1
	 into num_emp
	 from employees;
	 
	 insert into employees
	 values (num_emp, p_birth_date, p_first_name, p_last_name, p_gender, p_hire_date);
 else
 
	select('Ensira os dados corretamente!');
 
 end if;
 end $$
 DELIMITER ;
 
 -- refazendo o a 

DELIMITER $$ 
create procedure incluir_emp_check(p_emp_no int, p_birth_date date, p_first_name varchar(14), p_last_name varchar(16), p_gender enum('M', 'F'), p_hire_date date)
begin
if((p_emp_no is not null) and (p_birth_date is not null) and (p_first_name is not null) and (p_last_name is not null) and (p_gender is not null) and (p_hire_date is not null)) then
	insert into employees 
	values (p_emp_no, p_birth_date, p_first_name, p_last_name, p_gender, p_hire_date);
else
	select('Ensira os dados corretamente!');
end if;
end $$
DELIMITER ;

-- g)

DELIMITER $$
create procedure alterar_salario ()
begin
update salaries s
join titles t 
on t.emp_no = s.emp_no
set salary = salary * 1.10
where t.tile = 'Desenvolvedor';
end $$

DELIMITER ;

-- h)

DELIMITER $$
create procedure alterar_salario_todos()
begin
update salaries s
set salary = salary * 1.10
where s.salaries = '9999-01-01';
end $$

DELIMITER ;

-- i)

DELIMITER $$
create procedure alt_title()
begin
update titles
set title = 'Engenheiro'
where title = 'Desenvolvedor';
end $$
DELIMITER ;

-- j)

DELIMITER $$
create procedure despedir()
begin
delete from employees
where TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 55;
end $$
DELIMITER ;

-- k)
DELIMITER $$
create procedure alterar_salario(p_first_name varchar(14), p_last_name varchar (16), p_salary int)
begin
declare v_emp_no int;

select emp_no
into v_emp_no
from employees
where ((first_name = p_first_name) and (last_name = p_last_name))
limit 1;

update salaries
set salary = p_salary
where emp_no = v_emp_no and to_date = '9999-01-01';
end $$
DELIMITER ;

-- l) até o f já foi feito a validação, então irei fazer nos outros exercicios

-- refazendo o k pois é o único após o f que recebe parametro na chamada da procedure

DELIMITER $$
create procedure alterar_salario_check(p_first_name varchar(14), p_last_name varchar (16), p_salary int)
begin
declare v_emp_no int;

if((p_first_name is not null) and (p_last_name is not null) and (p_salary > 0)) then

	select emp_no
	into v_emp_no
	from employees
	where ((first_name = p_first_name) and (last_name = p_last_name))
	limit 1;

	update salaries
	set salary = p_salary
	where emp_no = v_emp_no and to_date = '9999-01-01';
    
else
	select('Ensira valores válidos!');
end if;
end $$
DELIMITER ;
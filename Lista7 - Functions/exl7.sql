use employees;

-- 1 a)

DELIMITER $$

create function media_salario(p_title varchar (50)) 
returns decimal(10,2)
reads sql data

begin

declare v_media decimal(10,2);

select avg(salary)
into v_media
from salaries s
join titles t
on (s.emp_no = t.emp_no)
where(t.to_date = '9999-01-01') and (s.to_date = '9999-01-01') and (p_title = t.title);

return v_media;

end $$

DELIMITER ;

SELECT media_salario('Engineer') AS media_salarial_engenheiros;

-- b) 

DELIMITER $$

create function qtd_func(p_title varchar(50))
returns int
reads sql data

begin

declare qtd_funcionario int;

select count(e.emp_no)
into qtd_funcionario
from employees e
join titles t
on (e.emp_no = t.emp_no)
where (p_title = t.title) and (t.to_date = '9999-01-01');

return qtd_funcionario;

end $$

DELIMITER ;

SELECT qtd_func('Engineer') AS quantidade_engenheiros;

-- c)

DELIMITER $$
create function qtd_func_dept(p_dept_name varchar(40))
returns int
reads sql data

begin

declare v_qtd_func int;
declare v_dept_no char(4);

select dept_no 
into v_dept_no
from departments d
where (p_dept_name = d.dept_name);

select count(e.emp_no)
into v_qtd_func
from employees e
join dept_emp de
on (e.emp_no = de.emp_no) and (de.dept_no = v_dept_no)
where de.to_date = '9999-01-01';

return v_qtd_func;

end $$

DELIMITER ;

SELECT qtd_func_dept('Sales') AS qtd_funcionarios;

-- d) 

DELIMITER $$
create function mais_velho(p_dept_name varchar(40))
returns varchar(100)
reads sql data

begin

declare v_nome_completo varchar(100);

select concat(e.first_name, ' ', e.last_name)
into v_nome_completo
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where (d.dept_name = p_dept_name) and (de.to_date = '9999-01-01')
order by e.birth_date asc
limit 1;

return v_nome_completo;

end $$

DELIMITER ;

SELECT mais_velho('Sales') AS id_funcionario_mais_velho;

-- e) 

DELIMITER $$
create function encontrar_gerente(p_dept_name varchar(40))
returns varchar(100)
reads sql data

begin

declare v_nome_gerente varchar(100);

select concat(e.first_name, ' ', e.last_name)
into v_nome_gerente
from employees e
join dept_manager dm
on e.emp_no = dm.emp_no
join departments d
on dm.dept_no = d.dept_no
where (d.dept_name = p_dept_name) and (dm.to_date = '9999-01-01');

return v_nome_gerente;
end $$

DELIMITER ;

SELECT encontrar_gerente('Sales') AS gerente_vendas;

-- f) 

DELIMITER $$
create function maior_salario(p_dept_name varchar(40))
returns varchar(100)
reads sql data

begin

declare v_nome_completo varchar(100);

select concat(e.first_name, ' ', e.last_name)
into v_nome_completo
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d 
on de.dept_no = d.dept_no
join salaries s 
on e.emp_no = s.emp_no
where (s.to_date = '9999-01-01') and (d.dept_name = p_dept_name) and (de.to_date = '9999-01-01')
order by s.salary desc
limit 1;

return v_nome_completo;

end $$

DELIMITER ;

SELECT maior_salario('Sales') AS funcionario_maior_salario;

-- g) 

DELIMITER $$

create function menor_salario(p_title varchar(50))
returns varchar(100)
reads sql data

begin

declare v_nome_func varchar(100);

select concat(e.first_name, ' ', e.last_name)
into v_nome_func
from employees e
join titles t
on e.emp_no = t.emp_no
join salaries s
on t.emp_no = s.emp_no
where (t.to_date = '9999-01-01') and (s.to_date = '9999-01-01') and (t.title = p_title)
order by salary asc
limit 1;

return v_nome_func;

end $$

DELIMITER ;

SELECT menor_salario('Staff') AS funcionario_menor_salario;
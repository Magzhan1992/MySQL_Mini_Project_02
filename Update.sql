#Вывести hire_date в годах, и количество сотрудников, 
#которых наняли в эти года.
select*from employees;

select year(hire_date) as hire_year,
count(*) As employee_count
from employees
group by hire_year
order by hire_year;

#Вывести dept_no и рядом количество сотрудников, 
#которые когда-либо работали в этих департаментах.

select dept_no, count(distinct emp_no) As employee_count 
from dept_emp
group by dept_no;

#Вывести birth_date и количество сотрудников, которые родились в эти дни. 
#тфильтровать birth_date не равен 1952-02-13 и вывести только те дни, 
#где количество сотрудников > 60. Отсортировать по убыванию (по количеству сотрудников), 
#и далее показать только топ 20 birth_date (по количеству сотрудников)

select birth_date, count(*) As employee_count
from employees
where birth_date!='1952-02-13'
group by birth_date
having employee_count>60
order by employee_count Desc
limit 20;

#Вывести имена (которые начинается на А) и количество сотрудников с этим именем в компании. 
#Отфильтровать имена, у которых количество сотрудников с этим именем больше 250, 
#отсортировать по количеству сотрудников и показать только топ 10 first_name (по количеству сотрудников).

select first_name,count(*) As employee_count
from employees
where first_name like 'A%'
group by first_name
having employee_count>250
order by employee_count Desc
limit 10;

#Создать копию таблицы employees, где имена начинается на B. 
#Удалить строки в employees, где имена начинаются на B, далее из копии нашей таблицы вставить обратно эти строки. 
#Удалить все строки из копии нашей таблицы, далее дропнуть эту таблицу.

CREATE TABLE employees_2 AS
SELECT * FROM employees
WHERE first_name LIKE 'B%';
SET SQL_SAFE_UPDATES = 0;

DELETE FROM employees WHERE first_name LIKE 'B%';
INSERT INTO employees SELECT * FROM employees_2;

DELETE FROM employees_2;

DROP TABLE employees_2;
SET SQL_SAFE_UPDATES = 1;






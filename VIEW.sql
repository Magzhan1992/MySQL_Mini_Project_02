#Напишите SQL-запрос для создания представления (View), 
#которое отображает имена и фамилии всех сотрудников.

create view v_emp_ as
select*from employees
where gender= 'M';

select*from v_emp_ m;

#View с JOIN: Создайте представление, которое объединяет таблицы employees и salaries, 
#показывая идентификатор сотрудника, его имя, фамилию и текущую зарплату.

create view salary_employee as
select e.emp_no, e.first_name, e.last_name,s.salary
from employees e
join salaries s 
on s.emp_no=e.emp_no
where s.to_date= '9999-01-01';

select*from salary_employee;

#View для агрегированных данных: Создайте представление, 
#которое показывает среднюю зарплату по каждому отделу.

create view avg_salary_dep as
select d.dept_no, avg(s.salary) 
from dept_emp d
join salaries s
on d.emp_no=s.emp_no
group by d.dept_no;

select*from avg_salary_dep;

#Комбинированный View с JOIN и WHERE: Создайте представление,
# которое отображает информацию о сотрудниках, работающих в отделе 'Sales'

create view sales_emp as
select e.emp_no, e.first_name, e.last_name,dp.dept_name from employees e
join dept_emp d
on d.emp_no=e.emp_no
join departments dp
on dp.dept_no=d.dept_no
where dp.dept_name='sales';

select*from sales_emp;

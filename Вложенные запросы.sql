#. Найдите всех сотрудников, которые работали как минимум в 2 департаментах. 
#Вывести их имя и фамилию. Показать записи в порядке возрастания.

select first_name, last_name from employees
where emp_no in(
select emp_no
from dept_emp
group by emp_no
having count(dept_no)>=2
order by count(dept_no) desc);

#Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.

select first_name, last_name, s.salary
from employees e
join salaries s
on e.emp_no=s.emp_no
where s.salary=
(select max(salary) from salaries);

# Создайте запрос, который выбирает названия всех отделов,
# в которых работает более 100 сотрудников.

select dept_name from departments 
where dept_no in(
select dept_no
from dept_emp
group by dept_no
having avg(emp_no)>100);

#Напишите запрос, который находит имена и фамилии всех сотрудников, 
#которые никогда не были менеджерами.

select first_name, last_name from employees 
where emp_no not in(
select emp_no from dept_manager);

#Создайте запрос, который для каждого отдела выводит сотрудников, 
#получающих наибольшую зарплату в этом отделе.

select e.first_name, e.last_name,e.emp_no ,d.dept_no,s.salary 
from dept_emp d
join employees e
on d.emp_no =e.emp_no
join salaries s
on e.emp_no =s.emp_no

where(d.dept_no,s.salary) in(
select d.dept_no, max(s.salary)
from dept_emp d
join salaries s
on d.emp_no=s.emp_no
group by d.dept_no)
order by dept_no;

#Напишите запрос, который выбирает названия отделов, 
#где средняя зарплата выше общей средней зарплаты по компании.

select dept_name, avg(salary)
from departments d
join dept_emp de
on d.dept_no=de.dept_no
join salaries s
on s.emp_no=de.emp_no
group by dept_name
having avg(s.salary)>(
select avg(salary) from salaries);





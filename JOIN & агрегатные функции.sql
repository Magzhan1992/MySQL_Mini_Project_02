# Выведите список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента,
# который они курируют, и дату найма в компанию. (именно менеджером, то есть подсказка dept_manager)

select e.first_name,e.last_name,e.emp_no,e.hire_date,d.dept_no
from employees e
join dept_manager d
on e.emp_no=d.emp_no;

# Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента.
# Может быть таких сотрудников несколько? (именно менеджером,  dept_manager)

select e.last_name,e.first_name,d.dept_no
from employees e
join dept_manager d
on e.emp_no=d.emp_no
where e.last_name='Markovitch';

#Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, 
#у которых имя начинается на М, а фамилия заканчивается на H.

select e.first_name,e.last_name,e.hire_date,t.title
from employees e
join titles t
on e.emp_no=t.emp_no
where e.first_name like 'M%' and last_name like '%N';

#Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная и минимальная зарплата за весь период работы в компании. 
#Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, 
#их имена/фамилии, и их мин/макс зарплат.

create temporary table salaries_temp
select emp_no, min(salary) as min_salary, max(salary) as max_salary
from salaries
group by emp_no;

select*from salaries_temp;

select e.emp_no, e.first_name,e.last_name,s.min_salary,s.max_salary
from employees e
join salaries_temp s
on s.emp_no=e.emp_no;













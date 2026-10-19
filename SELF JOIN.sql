#Найдите количество сотрудников мужского пола (M) и женского пола (F) и 
#выведите записи в порядке убывания по количеству сотрудников.

select gender, count(*) as num_employees
from employees
group by gender
order by num_employees desc;

#Найдите среднюю зарплату в разрезе должностей сотрудников (title), 
#округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.

select title, round(Avg(salary),2) as avg_salary
from salaries s
join titles t on s.emp_no=t.emp_no
where s.to_date='9999-01-01' and t.to_date='9999-01-01'
group by title
order by avg_salary desc;

#Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.

select month(hire_date) as hire_month,
count(*) as num_hired
from employees
group by hire_month
order by hire_month;

#Сформируйте запрос, который соединяет employees, dept_emp, departments и titles, 
#чтобы показать имена и фамилии сотрудников, названия их отделов и их текущие должности 
#(именно текущие должности, то есть фильтр по таблице titles, столбец to_date)

select e.first_name, e.last_name, d.dept_name,t.title
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments  d on de.dept_no=d.dept_no
join titles t on e.emp_no=t.emp_no
where de.to_date='9999-01-01' and t.to_date='9999-01-01';

#Используйте Self JOIN в таблице employees, чтобы найти пары сотрудников с одинаковыми фамилиями. 
#Отобразите их имена и фамилии.

select e1.first_name as first_name1,
e1.last_name as last_name,e2.first_name as first_name2
from employees e1
join employees e2 on e1.last_name=e2.last_name and e1.emp_no < e2.emp_no;



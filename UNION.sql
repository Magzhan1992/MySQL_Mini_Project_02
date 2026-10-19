#Напишите запрос, который использует UNION для объединения списка всех сотрудников (мужчин) 
#и всех менеджеров (только идентификаторы сотрудников emp_no).

SELECT emp_no FROM employees
WHERE gender = 'M'
UNION
SELECT emp_no FROM dept_manager ;

#Список уникальных должностей и отделов: Создайте запрос, который объединяет уникальные названия должностей из таблицы titles
# и названия отделов из departments.

SELECT DISTINCT(title) 
FROM TITLES
union
SELECT DISTINCT(dept_name)
FROM DEPARTMENTS;

#Напишите запрос, который использует UNION для объединения двух списков: сотрудников с зарплатой выше 60.000 долларов
# и сотрудников с зарплатой ниже 40.000 долларов (используйте имя и зарплату)

select emp_no, salary
from salaries
where salary>60000

union

select emp_no, salary
from salaries
where salary<40000;

#Объединение текущих и бывших сотрудников: Используйте UNION для создания списка сотрудников, которые в настоящее время работают в компании, и тех, 
#кто уже ушел (используйте имя, фамилию и статус 'Текущий' или 'Бывший' , то есть first_name, last_name, 
#'Текущий' AS status, 'Бывший' AS status ).

select emp_no, first_name,last_name,
'Текущий' as status
from employees
where emp_no in(
select emp_no from dept_emp where to_date='9999-01-01'
)

union

select emp_no, first_name,last_name,
'Бывший' as status
from employees
where emp_no not in(
select emp_no from dept_emp where to_date='9999-01-01'
);

#Создайте запрос с использованием UNION, чтобы сравнить средние зарплаты менеджеров 
#и обычных сотрудников (выведите тип сотрудника, либо Менеджер, либо Обычный сотрудник их среднюю зарплату,
# то есть 'Менеджер' AS type, 'Обычный сотрудник' AS type, AVG(salary) AS avg_salary ).

SELECT ROUND(AVG(salary),2) AS avg_salary, 'Менеджер' AS type
FROM salaries
WHERE emp_no IN (SELECT emp_no FROM dept_manager)
UNION
SELECT ROUND(AVG(salary),2) AS avg_salary, 'Обычный сотрудник' AS type
FROM salaries
WHERE emp_no not IN (SELECT emp_no FROM dept_manager);





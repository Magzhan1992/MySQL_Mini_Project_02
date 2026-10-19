#Необходимо выбрать всех сотрудников из таблицы employees и вывести их номер сотрудника , 
#имя и статус сотрудника. Если сотрудник работает более 30 лет, 
#его статус будет "Veteran Employee", в противном случае - "New Employee".

select emp_no,first_name,
if(year(curdate())-year(hire_date)>30, 'Veteran Employee','New Employee') as status
from employees;

#Необходимо выбрать всех сотрудников из таблицы employees и вывести их возраст.
# Если возраст сотрудника превышает 63 года,
# вместо числового значения возраста выводится статус "Пенсионер", в противном случае - "Активный сотрудник".

select emp_no,birth_date,
if(year(curdate())-year(birth_date)>63, 'Пенсионер','Активный сотрудник') as status
from employees;

#Создайте запрос, который классифицирует сотрудников по возрасту, используя таблицу employees. 
#Предполагается, что "молодой" - младше 30 лет, "средний" - от 30 до 50 лет, "старший" - старше 50 лет

select emp_no,first_name,birth_date,
Case
When year(curdate())-year(birth_date)>50 then 'старший'
When year(curdate())-year(birth_date)>=30 and year(curdate())-year(birth_date)<=50 then 'средний'
else 'молодой'
end as 'Возраст'
from employees;

#Найдите всех сотрудников, чьи имена начинаются на букву 'A' или 'B' в таблице employees.
select*from employees
where first_name Regexp '^A|^B';

#Отобразите список всех сотрудников с именами, отделами и зарплатами. 
#Для сотрудников, у которых не указана зарплата (salary равно NULL), 
#нужно отобразить значение зарплаты как 'Unknown'. 

select first_name,department_id,salary,
ifnull(salary,'Unknown') as new_salary
from employees;

#В таблице Employees могут быть сотрудники, у которых зарплата (salary) не указана. 
#В таком случае необходимо проверить другой столбец, default_salary, 
#который добавили в таблицу для новых сотрудников или стажеров (этот столбец также может содержать NULL). 
#В случае, если и salary, и default_salary равны NULL, тогда присвоить зарплату 25000.

select first_name,department_id,salary,default_salary,
coalesce(salary, default_salary,'25000') as new_salary
from employees;




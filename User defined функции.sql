 #Процедура: сотрудники с зарплатой выше заданной и из определённого департамента
 
DELIMITER //

CREATE PROCEDURE get_employees_by_salary_dept (     #Создал ПРОЦЕДУРУ  get_employees_by_salary_dept (
    IN p_salary DECIMAL(10,2),                      #В ДЕСЯТИЧНОЙ СИСТЕМЕ СЧИСЛЕНИЯ(10,2),
    IN p_dept VARCHAR(50)                           #В ПЕРЕМЕННОЙ p_dept(50)
)
BEGIN                                                 #Начать
    SELECT e.emp_no, e.first_name, e.gender         #Выбрать e.emp_no, e.first_name, e.gender 
    FROM employees e                                #ИЗ списка сотрудников e
    JOIN salaries s ON e.emp_no = s.emp_no          #Указать зарплаты В e.emp_no = s.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no        #Указать отдел emp_no В e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no     #Объединить отделы d В de.dept_no = d.dept_no
    GROUP BY e.emp_no                                #Группировать по e.emp_no
    HAVING AVG(s.salary) > p_salary AND               #Указать СРЕДНЮЮ зарплату(s.salary) > p_salary И
           SUM(d.dept_name = p_dept) > 0;             # СУММУ(d.dept_name = p_dept) > 0;
END;                                                  # Конец
//



DELIMITER ;                                       # Ограничитель

CALL get_employees_by_salary_dept(50000, 'Sales'); # Вызвать get_employees_by_salary_dept(50000, "Продажи");

#2. Функция: максимальная зарплата по имени
DELIMITER //

CREATE FUNCTION get_max_salary_by_name(f_name VARCHAR(50)) #Создал ФУНКЦИЮ get_max_salary_by_name(f_name VARCHAR(50))
RETURNS DECIMAL(10,2)                                      #ВОЗВРАЩАЕТ ДЕСЯТИЧНОЕ ЧИСЛО(10,2)
DETERMINISTIC                                              #ДЕТЕРМИНИРОВАННЫЙ
BEGIN
    DECLARE max_salary DECIMAL(10,2);                      #ОБЪЯВИТЬ ДЕСЯТИЧНУЮ ВЕЛИЧИНУ max_salary(10,2)
    SELECT MAX(s.salary)                                   # ВЫБРАТЬ MAX(s.salary)
    INTO max_salary                                        # В max_salary
    FROM employees e                                       #ОТ сотрудников e
    JOIN salaries s ON e.emp_no = s.emp_no                 #ОБЪЕДИНИТЬ зарплаты s В e.emp_no = s.emp_no
    WHERE e.first_name = f_name;                           #ГДЕ e.first_name = f_name;
    RETURN max_salary;                                     #ВОЗВРАЩАЕТ максимальную зарплату;
END;
//

DELIMITER ;

SELECT get_max_salary_by_name('John'); #ВЫБЕРИТЕ get_max_salary_by_name('Джон');


#1. Количество городов в странах, где год независимости = 1991

SELECT country.Name, COUNT(city.ID) AS city_count  #ВЫБЕРИТЕ country.Name, СТРАНУ(город.ИДЕНТИФИКАТОР) В КАЧЕСТВЕ city_count
FROM country                                      # ИЗ страны
JOIN city ON country.Code = city.CountryCode      #ПРИСОЕДИНИТЕ город К стране.Код = город.Код страны
WHERE country.IndepYear = 1991                    #ГДЕ страна.Год независимости = 1991
GROUP BY country.Name;                            #Группировать ПО country.Name;

# 2. Население и средняя продолжительность жизни в Аргентине

SELECT Name, Population, LifeExpectancy  #ВЫБЕРИТЕ название, численность населения, ожидаемую продолжительность жизни  
FROM country                             #ИЗ страны 
WHERE Code = 'ARG';                      #ГДЕ код = 'ARG';

#3. Страна с самой высокой продолжительностью жизни

SELECT Name, LifeExpectancy         #ВЫБЕРИТЕ имя, ожидаемую продолжительность жизни
FROM country                        #ИЗ страны 
WHERE LifeExpectancy IS NOT NULL    #ГДЕ ожидаемая продолжительность жизни НЕ РАВНА 0
ORDER BY LifeExpectancy DESC        #ПОРЯДОК ПО ожидаемой продолжительности жизни, НИЖЕ
LIMIT 1;                            #ПРЕДЕЛ 1;

#- 4. Все языки, на которых говорят в регионе Southeast Asia

SELECT DISTINCT Language                                    #ВЫБЕРИТЕ ОТДЕЛЬНЫЙ язык
FROM countrylanguage                                        #С языка страны
JOIN country ON country.Code = countrylanguage.CountryCode  #ПРИСОЕДИНЯЙТЕСЬ К другим странам.Код = язык страны.Код страны
WHERE country.Region = 'Southeast Asia';                    #ГДЕ country.Region = "Юго-Восточная Азия";

 #.5Сумма SurfaceArea по континентам
 
SELECT Continent, SUM(SurfaceArea) AS total_surface   # ВЫБЕРИТЕ континент, СУММУ(площадь поверхности) В КАЧЕСТВЕ total_surface
FROM country                                        #ИЗ страны   
GROUP BY Continent;                                 #ГРУППИРОВКА ПО континентам;






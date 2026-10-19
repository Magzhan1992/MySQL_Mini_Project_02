#Создайте в MySQL новую базу данных users_adverts.

create database mini_project;

create table USERS
(DATE date,
user_id varchar(40),
view_advers int);

select*from users;

#1 Напишите запрос SQL, выводящий одним числом количество уникальных пользователей 
#в этой таблице в период с 2023-11-07 по 2023-11-15.

select count(distinct user_id)
from users
where date between '2023-11-07' and '2023-11-15';

#2 Определите пользователя, который за весь период посмотрел наибольшее количество объявлений. 

select user_id, sum(view_advers) as sum_adv
from users
group by user_id
order by sum_adv desc
limit 1;

#3 Определите день с наибольшим средним количеством просмотренных рекламных объявлений на пользователя, 
#но учитывайте только дни с более,чем 500 уникальными пользователями.

select date, avg(view_advers), count(distinct user_id)
from users
group by date
having count(distinct user_id)>500
order by avg(view_advers) desc
limit 1;

#4 Напишите запрос возвращающий LT (продолжительность присутствия пользователя на сайте) 
#по каждому пользователю. Отсортировать LT по убыванию.

select user_id, count(distinct date) as LT
from users
group by user_id
order by LT desc;

#5Для каждого пользователя подсчитайте среднее количество просмотренной рекламы за день, 
#а затем выясните, у кого самый высокий средний показатель среди тех, 
#кто был активен как минимум в 5 разных дней.

select  user_id, avg(view_advers), count(distinct date)
from users
group by user_id
having count(distinct date)>=5
order by avg(view_advers) desc
limit 1;














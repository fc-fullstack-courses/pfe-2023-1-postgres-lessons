-- команда на отримання даних з бази даних (БД)
-- повернути всі дані з таблиці користувачів
SELECT *
FROM users;
-- повернути дані зі стовпчиків id, first_name, last_name
SELECT id, first_name, last_name
FROM users;
-- повернути дані зі стовпчиків id, first_name, last_name
-- і дані з balance але помножені на 40
SELECT id, first_name, last_name "Last Name",balance AS "USD balance", balance * 40 AS "UAH balance"
FROM users;
-- повернути всіх чоловіків
SELECT *
FROM users
WHERE is_male = true;
-- або
SELECT *
FROM users
WHERE is_male;
-- для жінок
SELECT *
FROM users
WHERE NOT is_male;
-- знайти користувача певного віку 
SELECT *
FROM workers
WHERE
EXTRACT(years from AGE(birthday)) = 23;
-- користувачі з повним ім'ям менше ніж 15 символів
SELECT id, first_name || ' ' || last_name AS full_name, email
FROM users
WHERE length(first_name || ' ' || last_name) < 16;
-- aбо
SELECT id, CONCAT (first_name, ' ', last_name) AS full_name, email,
length(CONCAT (first_name, ' ', last_name)) name_length
FROM users
WHERE length(CONCAT (first_name, ' ', last_name)) < 16;
-- підзапит
SELECT *
FROM (
  SELECT *, CONCAT (first_name, ' ', last_name) AS full_name
  FROM users
) AS "new_table"
WHERE length (full_name) < 16;
-- підзапити WITH
WITH new_table AS (
  SELECT *, CONCAT (first_name, ' ', last_name) AS full_name
  FROM users
), new_table_2 AS (
  SELECT * FROM new_table
)
SELECT * FROM new_table;
-- Пагінація у СУБД
SELECT * FROM users
WHERE balance > 0
-- кількість записів (аналог results у параметрах URL)
LIMIT 5
-- зсув (скільки записів пропустити)
OFFSET 5;
-- Агрегатні функції
/*
  avg - середне значення
  max - максимальне значення
  min - мінімальне значення
  sum - аналог reduce з js (акомулятор)
  count - кількість кортежів / рядків у запиті
*/
-- середній зріст користувачів
SELECT AVG(height) FROM users;
-- найбільший зріст користувача
SELECT MAX(height) FROM users;
-- мінімальний зріст
SELECT MIN(height) FROM users;
-- загальна кількість коштів на рахунках користувачів
SELECT SUM(balance) FROM users;
-- кількість користувачів які вищі ніж 1.6
SELECT COUNT(height)
FROM users
WHERE height > 1.6;
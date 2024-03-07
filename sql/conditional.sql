SELECT * FROM users WHERE is_male IS NULL;
-- CASE
/*

CASE
  WHEN умова THEN результат
  WHEN умова2 THEN результат2
  WHEN умова3 THEN результат3
  ELSE результат4
END

*/
SELECT id, first_name, last_name,
CASE
  WHEN is_male = true THEN 'male'
  WHEN is_male = false THEN 'female'
  ELSE 'not specified'
END AS "gender",
is_male
FROM users;
-- порахувати кількість користувачів існуючих статей
SELECT CASE 
  WHEN is_male = true THEN 'male'
  WHEN is_male = false THEN 'female'
  ELSE 'not specified'
END AS "gender",
count (*) "amount of users"
FROM users
GROUP BY "gender";
-- CASE (світчовий варінт)
-- місяць народження користувачів
SELECT id, first_name, last_name,
CASE extract(month FROM birthday)
  WHEN 1 THEN 'січень'
  WHEN 2 THEN 'лютий'
  WHEN 3 THEN 'березень'
  WHEN 4 THEN 'квітень'
  WHEN 5 THEN 'травень'
  WHEN 6 THEN 'червень'
  WHEN 7 THEN 'липень'
  WHEN 8 THEN 'серпень'
  WHEN 9 THEN 'вересень'
  WHEN 10 THEN 'жовтень'
  WHEN 11 THEN 'листопад'
  WHEN 12 THEN 'грудень'
  ELSE 'такого не існує'
END "місяць народження",
birthday
FROM users;
-- порахувати скільки користувачів у нас знаходяться в різних вікових категоріях
/*
  <30 - молоді
  > 30 < 60 - середній вік
  > 60 - старі
*/
SELECT CASE
  WHEN EXTRACT(YEAR FROM AGE (birthday)) < 30 THEN 'молода'
  WHEN EXTRACT(YEAR FROM AGE (birthday)) < 60 THEN 'середня'
  WHEN EXTRACT(YEAR FROM AGE (birthday)) >= 60 THEN 'похила'
END "вікова категорія",
count(*) "кількість"
FROM users
GROUP BY "вікова категорія";
/*
  за допомогою CASE
  повернути у селекті стовпчик "бренд"
    Для Google -> Alphabet
    Для Samsung -> Щось на корейскій
    Для інших -> всі інші
*/
SELECT CASE manufacturer
  WHEN 'Google' THEN 'Alphabet'
  WHEN 'Samsung' THEN 'Щось на корейскій'
  ELSE 'всі інші'
END "бренд"
FROM products;
--
SELECT CASE 
  WHEN manufacturer = 'Google' THEN 'Alphabet'
  WHEN manufacturer = 'Samsung' THEN 'Щось на корейскій'
  ELSE 'всі інші'
END "бренд"
FROM products;
-- COALESCE (arg1, arg2 ) - повертає перший НЕ NULL arg
SELECT id, "description", COALESCE ("description", 'lorem description')
FROM products;

-- UPDATE products
-- SET description = NULL
-- WHERE id BETWEEN 5 AND 50;
-- NULLIF (val1 , val2) - повертае NULL якщо val1 = val2, інакше повертає val1
SELECT NULLIF(10, 15); -- 10
SELECT NULLIF(500, 500); -- NULL
SELECT NULLIF(NULL, 500); -- NULL
SELECT NULLIF('test', 'text'); -- test

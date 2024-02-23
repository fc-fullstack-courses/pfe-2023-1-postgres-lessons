-- оновлення даних запису
-- оновлення даних для всіх записів
UPDATE users
SET first_name = 'John';
-- оновлення конкретних записів
UPDATE users
SET first_name = 'User'
WHERE id = 7;
-- 
UPDATE users
SET is_male = false
WHERE id = 10;
-- встановити користувачам з непарним id
-- balance в 3333
UPDATE users
SET balance = 3333
WHERE id % 2 != 0;
-- змінити записи з певними значеннями id 7 або 10
UPDATE users
SET last_name = 'NewLastName'
WHERE id = 7 OR id = 10;
-- 
UPDATE users
SET last_name = 'NewLastName 23'
WHERE id IN (7,10, 11);
-- оновлення багатьох стовпчиків
UPDATE users
SET first_name = 'NEW_FIRST_NAME', last_name = 'NEW_LAST_NAME'
WHERE id = 10;
-- зміна значень на основі попередніх даних
UPDATE users
SET balance = balance + 300
WHERE id = 10;

/*
  Створення таблиці
*/
/*
  текстові типи даних:
  TEXT = string у JS (необмежено про розмірам)
  BPCHAR -> необмежено про розмірам але видаляються пробіли

  CHAR (n) -> рядок фіксованої довжини до n символів
    CHAR (6)
      'test12' -> 'test12'
      'test1234' -> 'test12'
      'te' -> 'te    '
  VARCHAR (n) -> рядок фіксованої змінної довжини до n символів
    VARCHAR (6)
      'test12' -> 'test12'
      'test1234' -> 'test12'
      'te' -> 'te'


  INT === INTEGER

  точність - загальна кількість цифр у числі
  масштаб - кількість цифр після крапки в числі
  NUMERIC (точність, масштаб)
  NUMERIC === DECIMAL
*/
CREATE TABLE users(
  -- опис структури таблиці
  -- uuid - специфічна варіація айдішника
  -- id UUID DEFAULT gen_random_uuid(),
  id SERIAL,
  first_name VARCHAR(80),
  last_name VARCHAR(80),
  balance NUMERIC(13,2) DEFAULT 0.00,
  is_male BOOLEAN,
  birthday DATE,
  created_at TIMESTAMP DEFAULT current_timestamp,
  updated_at TIMESTAMP DEFAULT current_timestamp
);

INSERT INTO users 
(first_name, balance)
VALUES
('second', 1500),
('third', DEFAULT);

/*

  15
  0
  3234.11
  0.5
  1000.00000000000000000001

*/
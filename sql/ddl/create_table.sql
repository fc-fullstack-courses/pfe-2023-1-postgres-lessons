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
  id SERIAL NOT NULL UNIQUE,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  -- не дозволяє встановлювати у стовпчик значення NULL
  -- обмеження стовпчика UNIQUE
  -- email VARCHAR(160) NOT NULL UNIQUE,
  email VARCHAR(160) NOT NULL,
  balance NUMERIC(13,2) NOT NULL DEFAULT 0.00,
  is_male BOOLEAN,
  birthday DATE NOT NULL,
  created_at TIMESTAMP DEFAULT current_timestamp,
  updated_at TIMESTAMP DEFAULT current_timestamp,
  -- обмеження таблиці
  UNIQUE (email)
);

INSERT INTO users 
(first_name, last_name, email, is_male, balance, birthday)
VALUES
( 'second', 'last', 'mail@mail.com', true,-150000000,'2005-12-28' ),
( '', '', 'test@test.com', true,1500,'2005-12-28' ),
( 'second', 'last', '',true,1500, '1567-12-28' ),
( 'second', 'last', 'mail@mail.com', true,1500,'2005-12-28' );
/*

  15
  0
  3234.11
  0.5
  1000.00000000000000000001

*/

CREATE TABLE test (
  a TEXT,
  b TEXT,
  -- унікальна група стовпчиків
  UNIQUE (a, b)
);

INSERT INTO test
(a, b)
VALUES
('1234','lorem');
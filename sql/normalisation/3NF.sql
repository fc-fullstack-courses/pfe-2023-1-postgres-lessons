-- 3 Нормальна форма ( 3NF )
-- жоден неключовий атриут не знаходится у транзитивній залежності від ключа
/*
  нормальна функціональна залежність:
    id > attr1
    id > attr2
  Транзитівна функціональна залежність:
    id > attr1 > attr2
    id > departament > departament_phone_number
*/
-- не в 3NF 
CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  position TEXT,
  departament TEXT,
  departament_phone_number TEXT
);

INSERT INTO workers
(name, departament , departament_phone_number)
VALUES
('User 1', 'IT', '0123456789'),
('User 2', 'HR', '9876543210'),
('User 3', 'Marketing', '4565489456'),
('User 4', 'IT', '4565489456');
-- 3NF
CREATE TABLE departaments (
  id SERIAL PRIMARY KEY,
  name TEXT,
  departament_phone_number TEXT
);

CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  position TEXT,
  departament_id INT REFERENCES departaments
);

INSERT INTO departaments
(name, departament_phone_number)
VALUES
('IT', '0123456789'),
('HR', '9876543210'),
('Marketing', '4565489456');


INSERT INTO workers
(name, departament_id )
VALUES
('User 1', 1),
('User 2', 2),
('User 3', 3),
('User 4', 1);
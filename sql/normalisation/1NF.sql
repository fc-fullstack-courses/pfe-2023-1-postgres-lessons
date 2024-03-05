-- Перша нормальна форма (1 Normal Form NF)
-- таблиця знаходится у 1НФ якщо її можна назвати відношенням
-- НЕ 1 НФ
CREATE TABLE cars (
  model TEXT,
  model_year INT
);

INSERT INTO cars
(model, model_year)
VALUES
('Test', 2024),
('Test', 2024),
('Test', 2024),
('Test', 2024);
-- 1 НФ
CREATE TABLE cars (
  id SERIAL PRIMARY KEY,
  model TEXT,
  model_year INT
);

INSERT INTO cars
(model, model_year)
VALUES
('Test', 2024),
('Test', 2024),
('Test', 2024),
('Test', 2024);
-- 4 Нормальна форма ( 4NF )
/*
  Багатозначна залежність
  X ->-> Y
  для одного Х є багато Y
*/
/*
  є:
    - служби доставки
    - види їжі
    - райони міста кудм можна здійснити доставку
*/
CREATE TABLE delivery_services (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  "address" TEXT
);
--
CREATE TABLE product_type (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  price NUMERIC (5,2)
);
--
CREATE TABLE delivery_services_to_product_types (
  service_id INT REFERENCES delivery_services,
  product_id INT REFERENCES product_type,
  location TEXT,
  PRIMARY KEY (service_id, product_id, location)
);
--
INSERT INTO delivery_services
(name, address)
VALUES
('GLOVO', 'десь у Запоріжжі'),
('Raketa', 'десь у Запоріжжі 2');
--
INSERT INTO product_type
(name, price)
VALUES 
('pizza', 250),
('sushi', 370),
('fish', 120);
--
INSERT INTO delivery_services_to_product_types
(service_id, product_id, location)
VALUES
(1, 1, 'Шевченківський'),
(1, 2, 'Шевченківський'),
(1, 3, 'Шевченківський'),
(1, 1, 'Космічний'),
(1, 2, 'Космічний'),
(1, 3, 'Космічний');

-- 4 NF
CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  "name" TEXT
);

CREATE TABLE delivery_services (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  "address" TEXT
);
--
CREATE TABLE product_type (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  price NUMERIC (5,2)
);

CREATE TABLE delivery_services_to_product_types (
  service_id INT REFERENCES delivery_services,
  product_id INT REFERENCES product_type,
  PRIMARY KEY (service_id, product_id)
);

CREATE TABLE delivery_services_to_locations (
  service_id INT REFERENCES delivery_services,
  location_id INT REFERENCES locations,
  PRIMARY KEY (service_id, location_id)
);
--
INSERT INTO delivery_services
(name, address)
VALUES
('GLOVO', 'десь у Запоріжжі'),
('Raketa', 'десь у Запоріжжі 2');
--
INSERT INTO product_type
(name, price)
VALUES 
('pizza', 250),
('sushi', 370),
('fish', 120);
--
INSERT INTO locations
(name)
VALUES
('Шевченківський'),
('Космічний'),
('Олексамдрівський');
--
INSERT INTO delivery_services_to_product_types
(service_id, product_id)
(1,1),
(1,2),
(1,3),
(2,1),
(2,3);
--
INSERT INTO delivery_services_to_locations
(service_id, location_id)
VALUES
(1, 1),
(1,2),
(2,1),
(2,2),
(2,3);

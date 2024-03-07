-- 1
SELECT p.name,
  p.price,
  pto.quantity,
  p.category,
  p.manufacturer
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
WHERE order_id = 1;
-- 2
SELECT sum(pto.quantity)
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
WHERE order_id = 2 AND p.category = 'food';
-- 3
SELECT re.user_id,
  count(re.rating_id)
FROM reviews "re"
  JOIN ratings "ra" ON ra.id = re.rating_id
WHERE ra.rating > 3
GROUP BY re.user_id
ORDER BY re.user_id;
-- 4
SELECT o.id,  SUM(p.price*pto.quantity), o.status
FROM orders "o"
  JOIN products_to_orders "pto" ON o.id = pto.order_id
  JOIN products "p" ON pto.product_id = p.id
WHERE o.status = 'finished' AND user_id = 2
GROUP BY (o.id)
ORDER BY o.id;
-- 5
SELECT COUNT(o.id) "number of orders", p.id, p.name, p.category, p.price 
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
GROUP BY p.id
ORDER BY COUNT(o.id) DESC
LIMIT 1
;
/*
  Всі замовлення з ціною вище за середню
*/
-- 1. вартість всіх замовлень
SELECT order_id, sum(pto.quantity * p.price) "order_price"
FROM products "p"
JOIN products_to_orders "pto" ON p.id = pto.product_id
JOIN orders "o" ON pto.order_id = o.id
GROUP BY order_id
ORDER BY "order_price" ASC;
-- 2. середне значення замовлення
SELECT avg(order_price) "avg_price"
FROM (
  SELECT order_id, sum(pto.quantity * p.price) "order_price"
  FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
  GROUP BY order_id
);
-- 3  v1
SELECT orders_with_price.order_id
FROM (
  SELECT order_id, sum(pto.quantity * p.price) "order_price"
FROM products "p"
JOIN products_to_orders "pto" ON p.id = pto.product_id
JOIN orders "o" ON pto.order_id = o.id
GROUP BY order_id
ORDER BY "order_price" ASC
) "orders_with_price"
WHERE "order_price" > (SELECT avg(order_price) "avg_price"
FROM (
  SELECT order_id, sum(pto.quantity * p.price) "order_price"
  FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
  GROUP BY order_id
));
-- 3 v2
WITH orders_with_price AS (
  SELECT order_id, sum(pto.quantity * p.price) "order_price"
  FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
  GROUP BY order_id
  ORDER BY "order_price" ASC
),
avg_order_price AS (
  SELECT avg(order_price) "avg_price"
  FROM orders_with_price
)
SELECT orders_with_price.order_id
FROM orders_with_price
WHERE order_price > (SELECT * FROM avg_order_price);

/*
  1
    100 * 5 = 500
    2000 * 1 = 2000
      2500
  2
    10000 * 5 = 50000
      50000

  52500 / 2 = 26250
  (500 + 2000 + 50000) / 3
*/

-- Create keyspace
CREATE KEYSPACE sql_store_nosql WITH replication = { 'class': 'SimpleStrategy',
'replication_factor': 1 };
USE sql_store_nosql;
-- =======================================
-- Create Tables
-- =======================================
CREATE TABLE IF NOT EXISTS orders_by_customer (
  customer_id INT,
  customer_name TEXT,
  order_id INT,
  order_date DATE,
  status TEXT,
  shipper_name TEXT,
  product_id INT,
  product_name TEXT,
  quantity INT,
  unit_price DECIMAL,
  PRIMARY KEY (customer_id, order_id, product_id)
);
CREATE TABLE IF NOT EXISTS orders_by_product (
  product_id INT,
  product_name TEXT,
  order_id INT,
  order_date DATE,
  customer_id INT,
  customer_name TEXT,
  quantity INT,
  unit_price DECIMAL,
  PRIMARY KEY (product_id, order_id, customer_id)
);
-- =======================================
-- Insert Orders by Customer
-- =======================================
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    6,
    'Elka Twiddell',
    1,
    '2019-01-30',
    'Processed',
    null,
    4,
    'Brocolinni - Gaylan, Chinese',
    4,
    3.74
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    7,
    'Ilene Dowson',
    2,
    '2018-08-02',
    'Shipped',
    'Mraz, Renner and Nolan',
    1,
    'Foam Dinner Plate',
    2,
    9.10
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    7,
    'Ilene Dowson',
    2,
    '2018-08-02',
    'Shipped',
    'Mraz, Renner and Nolan',
    4,
    'Brocolinni - Gaylan, Chinese',
    4,
    1.66
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    7,
    'Ilene Dowson',
    2,
    '2018-08-02',
    'Shipped',
    'Mraz, Renner and Nolan',
    6,
    'Petit Baguette',
    2,
    2.94
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    10,
    'Levy Mynett',
    6,
    '2018-11-18',
    'Processed',
    null,
    1,
    'Foam Dinner Plate',
    4,
    8.65
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    10,
    'Levy Mynett',
    6,
    '2018-11-18',
    'Processed',
    null,
    2,
    'Pork - Bacon,back Peameal',
    4,
    3.28
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    10,
    'Levy Mynett',
    6,
    '2018-11-18',
    'Processed',
    null,
    3,
    'Lettuce - Romaine, Heart',
    4,
    7.46
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    10,
    'Levy Mynett',
    6,
    '2018-11-18',
    'Processed',
    null,
    5,
    'Sauce - Ranch Dressing',
    1,
    3.45
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    8,
    'Samir Patel',
    7,
    '2019-02-15',
    'Delivered',
    'Acme Shippers',
    2,
    'Pork - Bacon,back Peameal',
    3,
    3.50
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    8,
    'Samir Patel',
    7,
    '2019-02-15',
    'Delivered',
    'Acme Shippers',
    5,
    'Sauce - Ranch Dressing',
    2,
    3.45
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    9,
    'Maria Gomez',
    8,
    '2019-03-10',
    'Processed',
    null,
    3,
    'Lettuce - Romaine, Heart',
    1,
    7.46
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    9,
    'Maria Gomez',
    8,
    '2019-03-10',
    'Processed',
    null,
    6,
    'Petit Baguette',
    5,
    2.94
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    11,
    'Nina Berg',
    9,
    '2019-04-12',
    'Shipped',
    'Global Shippers',
    7,
    'Cheese - Brie',
    2,
    5.20
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    11,
    'Nina Berg',
    9,
    '2019-04-12',
    'Shipped',
    'Global Shippers',
    8,
    'Tomatoes - Cherry',
    6,
    2.10
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    12,
    'Omar Hassan',
    10,
    '2019-05-01',
    'Processed',
    null,
    9,
    'Chicken - Whole',
    3,
    7.80
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    12,
    'Omar Hassan',
    10,
    '2019-05-01',
    'Processed',
    null,
    10,
    'Bread - Rye',
    2,
    3.00
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    13,
    'Linda Wu',
    11,
    '2019-05-15',
    'Delivered',
    'Speedy Express',
    7,
    'Cheese - Brie',
    1,
    5.20
  );
INSERT INTO orders_by_customer (
    customer_id,
    customer_name,
    order_id,
    order_date,
    status,
    shipper_name,
    product_id,
    product_name,
    quantity,
    unit_price
  )
VALUES (
    13,
    'Linda Wu',
    11,
    '2019-05-15',
    'Delivered',
    'Speedy Express',
    3,
    'Lettuce - Romaine, Heart',
    2,
    7.46
  );
-- =======================================
-- Insert Orders by Product
-- =======================================
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    4,
    'Brocolinni - Gaylan, Chinese',
    1,
    '2019-01-30',
    6,
    'Elka Twiddell',
    4,
    3.74
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    1,
    'Foam Dinner Plate',
    2,
    '2018-08-02',
    7,
    'Ilene Dowson',
    2,
    9.10
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    4,
    'Brocolinni - Gaylan, Chinese',
    2,
    '2018-08-02',
    7,
    'Ilene Dowson',
    4,
    1.66
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    6,
    'Petit Baguette',
    2,
    '2018-08-02',
    7,
    'Ilene Dowson',
    2,
    2.94
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    1,
    'Foam Dinner Plate',
    6,
    '2018-11-18',
    10,
    'Levy Mynett',
    4,
    8.65
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    2,
    'Pork - Bacon,back Peameal',
    6,
    '2018-11-18',
    10,
    'Levy Mynett',
    4,
    3.28
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    3,
    'Lettuce - Romaine, Heart',
    6,
    '2018-11-18',
    10,
    'Levy Mynett',
    4,
    7.46
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    5,
    'Sauce - Ranch Dressing',
    6,
    '2018-11-18',
    10,
    'Levy Mynett',
    1,
    3.45
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    2,
    'Pork - Bacon,back Peameal',
    7,
    '2019-02-15',
    8,
    'Samir Patel',
    3,
    3.50
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    5,
    'Sauce - Ranch Dressing',
    7,
    '2019-02-15',
    8,
    'Samir Patel',
    2,
    3.45
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    3,
    'Lettuce - Romaine, Heart',
    8,
    '2019-03-10',
    9,
    'Maria Gomez',
    1,
    7.46
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    6,
    'Petit Baguette',
    8,
    '2019-03-10',
    9,
    'Maria Gomez',
    5,
    2.94
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    7,
    'Cheese - Brie',
    9,
    '2019-04-12',
    11,
    'Nina Berg',
    2,
    5.20
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    8,
    'Tomatoes - Cherry',
    9,
    '2019-04-12',
    11,
    'Nina Berg',
    6,
    2.10
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    9,
    'Chicken - Whole',
    10,
    '2019-05-01',
    12,
    'Omar Hassan',
    3,
    7.80
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    10,
    'Bread - Rye',
    10,
    '2019-05-01',
    12,
    'Omar Hassan',
    2,
    3.00
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    7,
    'Cheese - Brie',
    11,
    '2019-05-15',
    13,
    'Linda Wu',
    1,
    5.20
  );
INSERT INTO orders_by_product (
    product_id,
    product_name,
    order_id,
    order_date,
    customer_id,
    customer_name,
    quantity,
    unit_price
  )
VALUES (
    3,
    'Lettuce - Romaine, Heart',
    11,
    '2019-05-15',
    13,
    'Linda Wu',
    2,
    7.46
  );
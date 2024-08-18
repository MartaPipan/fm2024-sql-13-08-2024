DROP TABLE IF EXISTS "products";

CREATE TABLE IF NOT EXISTS "products"(
  "name" varchar(64) NOT NULL UNIQUE CHECK("name"!=''),
  "price" numeric(6,2) NOT NULL CHECK ("price">0 AND "price"<=10000),
  "manufacture date" DATE CHECK("manufacture date"<=CURRENT_DATE),
  "quantity" SMALLINT CHECK("quantity">=0 AND "quantity"<=1000) DEFAULT 0,
  "currency" CHAR(3) DEFAULT 'UAH',
  "is sale" BOOLEAN DEFAULT false
);

INSERT INTO "products" VALUES
('iPhone 13', 490.99, '2023-12-30', 58, 'EUR', false),
('Samsung Galaxy S22', 350.50, '2023-03-20', 83, 'EUR', true),
('Xiaomi Redmi Note 11', 7499.99, '2022-11-11', 100, 'UAH', false),
('Samsung Galaxy A52', 7000.00, '2023-01-10', 45, 'UAH', false),
('Samsung Galaxy Z Fold 3', 640.99, '2022-08-25', 20, 'USD', true),
('Samsung Galaxy S21 FE', 8500.00, '2023-02-14', 25, 'UAH', false);

INSERT INTO "products"("price", "currency", "name", "quantity","is sale","manufacture date") VALUES
(1299.00, 'USD', 'Apple iPhone 15 Pro Max', 5, false, '2023-12-31'); 


INSERT INTO "products"("price", "currency", "name", "quantity") VALUES
(1400.00, 'USD', 'Apple iPhone 16', 3); 

DROP TABLE IF EXISTS "products";

CREATE TABLE IF NOT EXISTS "products"(
  "id" serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK("name"!=''),
  "category" varchar(256) NOT NULL CHECK("category"!=''),
  "price" decimal(16,2) NOT NULL CHECK("price">0),
  "quantity" smallint NOT NULL CHECK("quantity">=0 AND "quantity"<=1000),
  CONSTRAINT "unique_pair_name_category" UNIQUE ("name", "category")
);
INSERT INTO products ("name", "category", "price", "quantity")
VALUES 
('egg','eggs', 3.4, 500), 
('milk','milk_products', 35.12, 150),
('cheese','milk_products', 289.79, 325),
('beef','meat', 356.70, 80),
('pork','meat', 168.20, 135);

DROP TABLE IF EXISTS "orders";

CREATE TABLE IF NOT EXISTS "orders"(
  "id" bigserial PRIMARY KEY,
  "userId" int REFERENCES "users" ("id"),
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);
INSERT INTO "orders"("userId") VALUES (1), (2), (1);



DROP TABLE IF EXISTS "products_to_orders";

CREATE TABLE IF NOT EXISTS "products_to_orders"(
  "productId" int REFERENCES "products" ("id"),
  "orderId" bigint REFERENCES "orders" ("id"),
  "quantity" smallint NOT NULL CHECK("quantity">0) DEFAULT 1,
  PRIMARY KEY ("productId", "orderId")
);

INSERT INTO "products_to_orders" ("productId", "orderId", "quantity") VALUES(1,1,20), (2,1,1), (1,2,10), (5,2,1), (3,3,1), (4,3,1);INSERT INTO products_to_orders (productId, productId, orderId, orderId, quantity)
VALUES (
    productId:integerINSERT INTO products_to_orders (productId, productId, orderId, orderId, quantity)
    VALUES (
        productId:integerINSERT INTO products (id, name, category, price, quantity)
        VALUES (
            id:integerINSERT INTO messages (body, author_id, created_at, is_read)
            VALUES (
                'body:character varying',
                'author_id:character varying',
                'created_at:timestamp without time zone',
                is_read:boolean
              );,
            'name:character varying',
            'category:character varying',
            price:numeric,
            'quantity:smallint'
          );,
        productId:integer,
        'orderId:bigint',
        'orderId:bigint',
        'quantity:smallint'
      );,
    productId:integer,
    'orderId:bigint',
    'orderId:bigint',
    'quantity:smallint'
  );
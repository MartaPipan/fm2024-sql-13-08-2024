
DROP TABLE IF EXISTS "users";

CREATE TABLE IF NOT EXISTS "users"(
    "first name" varchar(32) NOT NULL CHECK("first name"!= ''),
    "last name" varchar(32) NOT NULL CHECK(length("last name")>=2 AND length("last name")<=32),
    "email" varchar(256) NOT NULL CHECK ("email"!='') UNIQUE,
    "height" smallint NOT NULL CHECK ("height">=100 AND "height"<=250),
    "weight" numeric(5,2) NOT NULL CHECK("weight">=20 AND "weight"<=250),   --123.45
    "birthday" date NOT NULL,
    "isMale" boolean NOT NULL
);

INSERT INTO "users" VALUES
('Brad', 'Pit', 'brad@gmail.com', 188, 82.53, '1963-12-18',true),
('Ana', 'Pitt', 'ana@gmail.com', 168, 62.31, '1978-11-11',false),
('Tom', 'Rot', 'tom@gmail.com', 174, 69.71, '1977-09-23',true);

INSERT INTO "users" VALUES
('Oz', 'Bu', 'bu@gmail.com', 143, 103.53, '1969-01-08',true);


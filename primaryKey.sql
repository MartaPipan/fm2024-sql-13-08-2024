
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


DROP TABLE IF EXISTS "messages";

CREATE TABLE IF NOT EXISTS "messages"(
    "id" uuid PRIMARY KEY DEFAULT uuid_generate_v1(),
    "body" varchar(2048) NOT NULL CHECK("body"!=''),
    "author" varchar(32) NOT NULL CHECK("author"!=''),
    "created_at" timestamp NOT NULL DEFAULT current_timestamp,
    "is_read" boolean DEFAULT false
);

INSERT INTO "messages"("body", "author") 
VALUES
('hi','Tom'),
('hi','Tom'),
('hello', 'Alex');
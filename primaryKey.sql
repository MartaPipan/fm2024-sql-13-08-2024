
DROP TABLE IF EXISTS "messages";

CREATE TABLE IF NOT EXISTS "messages"(
    "id" bigserial PRIMARY KEY,
    "body" varchar(2048) NOT NULL CHECK("body"!=''),
    "author_id" int REFERENCES "users"("id"),
    "created_at" timestamp NOT NULL DEFAULT current_timestamp,
    "is_read" boolean DEFAULT false
);

INSERT INTO "messages"("body", "author_id") 
VALUES
('hi', 3),
('hi', 1),
('hello', 2);
DROP TABLE IF EXISTS "reactions_to_comments" CASCADE;
DROP TABLE IF EXISTS "comments" CASCADE;
DROP TABLE IF EXISTS "reactions" CASCADE;
DROP TABLE IF EXISTS "contents" CASCADE;


CREATE TABLE IF NOT EXISTS "contents" (
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK("name" != ''),
    "description" varchar(256) NOT NULL CHECK("description" != ''),
    "created_by" int REFERENCES "users"("id") ON DELETE CASCADE,
    "created_at" timestamp NOT NULL DEFAULT current_timestamp
);


CREATE TABLE IF NOT EXISTS "reactions" (
    "id" serial PRIMARY KEY,
    "content_id" int REFERENCES "contents"("id") ON DELETE CASCADE,
    "user_id" int REFERENCES "users"("id") ON DELETE CASCADE,
    "is_liked" boolean NOT NULL DEFAULT false,
    "created_at" timestamp NOT NULL DEFAULT current_timestamp,
    CONSTRAINT "unique_pair_content_id_user_id" UNIQUE("content_id", "user_id")
);


CREATE TABLE IF NOT EXISTS "comments" (
    "id" serial PRIMARY KEY,
    "body" text NOT NULL CHECK("body" != ''),
    "user_id" int REFERENCES "users"("id") ON DELETE CASCADE,
    "content_id" int REFERENCES "contents"("id") ON DELETE CASCADE,
    "created_at" timestamp NOT NULL DEFAULT current_timestamp
);


CREATE TABLE IF NOT EXISTS "reactions_to_comments"(
    "reaction_id" int REFERENCES "reactions"("id") ON DELETE CASCADE,
    "comment_id" int REFERENCES "comments"("id") ON DELETE CASCADE,
    "quantity" smallint NOT NULL CHECK("quantity" > 0),
    PRIMARY KEY ("reaction_id", "comment_id")
);


INSERT INTO "contents" ("name", "description", "created_by") 
VALUES 
('First Content', 'This is the description of the first content', 1),
('Second Content', 'This is the description of the second content', 2);


INSERT INTO "reactions" ("content_id", "user_id", "is_liked")
VALUES 
(1, 1, true),
(1, 2, false),
(2, 3, true);


INSERT INTO "comments" ("body", "user_id", "content_id")
VALUES 
('Great content!', 1, 1),
('Not so good', 2, 1),
('Interesting', 3, 2);


INSERT INTO "reactions_to_comments" ("reaction_id", "comment_id", "quantity")
VALUES 
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);

DROP TABLE IF EXISTS "chats";
CREATE TABLE IF NOT EXISTS "chats"(
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK("name" != ''),
    "owner_id" int REFERENCES "users"("id") ON DELETE CASCADE,
    "created_at" timestamp NOT NULL DEFAULT current_timestamp
);
INSERT INTO "chats"("name","owner_id") VALUES ('fm2024-1',1),('save',4),('about',6);

DROP TABLE IF EXISTS "users_to_chats";
CREATE TABLE IF NOT EXISTS "users_to_chats"(
    "userId" int REFERENCES "users"("id"),
    "chatId" int REFERENCES "chats"("id"),
    "created_at" timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY ("userId", "chatId")
);
INSERT INTO "users_to_chats"("userId", "chatId") VALUES (2,1),(3,2),(5,1),(3,3),(4,2),(1,3);
INSERT INTO "users_to_chats"("userId", "chatId") VALUES (1,1),(6,3);


DROP TABLE IF EXISTS "messages";
CREATE TABLE IF NOT EXISTS "messages"(
    "id" bigserial PRIMARY KEY,
    "body" varchar(2048) NOT NULL CHECK("body" != ''),
    "author_id" int,
    "chat_id" int,
    "created_at" timestamp NOT NULL DEFAULT current_timestamp,
    "is_read" boolean DEFAULT false,
    FOREIGN KEY ("author_id", "chat_id") REFERENCES "users_to_chats"("userId", "chatId")
);


INSERT INTO "messages"("body", "author_id","chat_id") 
VALUES
('hi', 2,1),('hi', 3,2),('hello', 5,1),('ola', 3,3),('here!!!',4,2),(')))',1,3),('Goog morning', 1,1),('Hello!',6,3);

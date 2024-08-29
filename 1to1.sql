DROP TABLE IF EXISTS "coaches" CASCADE;
DROP TABLE IF EXISTS "teams" CASCADE;

CREATE TABLE IF NOT EXISTS "coaches"(
    "id" serial PRIMARY KEY,
    "name" varchar(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS "teams"(
    "id" serial PRIMARY KEY,
    "name" varchar(32) NOT NULL
);

ALTER TABLE "coaches" 
ADD FOREIGN KEY ("id") REFERENCES "teams"("id")
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "teams" 
ADD FOREIGN KEY ("id") REFERENCES "coaches"("id")
DEFERRABLE INITIALLY DEFERRED;


INSERT INTO "coaches"("name", "id") VALUES('Tom',1);
INSERT INTO "teams"("name","id") VALUES('ALL',1);



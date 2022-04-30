CREATE TABLE "type"
(
    "id"          uuid PRIMARY KEY,
    "name"        varchar(32) NOT NULL,
    "description" varchar,
    "created_on"  timestamp   NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp   NOT NULL DEFAULT (current_timestamp)
);

ALTER TABLE "storehouse"
    ADD COLUMN "type" uuid;

ALTER TABLE "storehouse"
    ADD FOREIGN KEY ("type") REFERENCES "type" ("id");

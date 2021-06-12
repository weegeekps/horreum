CREATE TABLE "group"
(
    "id"          uuid PRIMARY KEY,
    "name"        varchar  NOT NULL,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp)
);

CREATE TABLE "user"
(
    "id"          uuid PRIMARY KEY,
    "name"        varchar  NOT NULL,
    "password"    varchar  NOT NULL,
    "enabled"     boolean  NOT NULL DEFAULT true,
    "admin"       boolean  NOT NULL DEFAULT false,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp)
);

CREATE TABLE "user_group"
(
    "user_id"  uuid UNIQUE,
    "group_id" uuid UNIQUE,
    PRIMARY KEY ("user_id", "group_id")
);

CREATE TABLE "storehouse"
(
    "id"          uuid PRIMARY KEY,
    "data"        jsonb    NOT NULL,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp),
    "owner"       uuid
);

ALTER TABLE "storehouse"
    ADD FOREIGN KEY ("owner") REFERENCES "group" ("id");

ALTER TABLE "user"
    ADD FOREIGN KEY ("id") REFERENCES "user_group" ("user_id");

ALTER TABLE "group"
    ADD FOREIGN KEY ("id") REFERENCES "user_group" ("group_id");

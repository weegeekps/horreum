PRAGMA foreign_keys= on;

CREATE TABLE "group"
(
    "id"          text PRIMARY KEY,
    "name"        text      NOT NULL,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp),
    CONSTRAINT fk_groups_users
        FOREIGN KEY ("id") REFERENCES "user_group" ("group_id")
);

CREATE TABLE "user"
(
    "id"          text PRIMARY KEY,
    "name"        text      NOT NULL,
    "password"    text      NOT NULL,
    "enabled"     boolean   NOT NULL DEFAULT true,
    "admin"       boolean   NOT NULL DEFAULT false,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp),
    CONSTRAINT fk_users_groups
        FOREIGN KEY ("id") REFERENCES "user_group" ("user_id")
);

CREATE TABLE "user_group"
(
    "user_id"  text UNIQUE,
    "group_id" text UNIQUE,
    PRIMARY KEY ("user_id", "group_id")
);

CREATE TABLE "type"
(
    "id"          text PRIMARY KEY,
    "name"        text      NOT NULL,
    "description" text,
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp)
);

CREATE TABLE "storehouse"
(
    "id"          text PRIMARY KEY,
    "data"        text      NOT NULL, -- json
    "created_on"  timestamp NOT NULL DEFAULT (current_timestamp),
    "modified_on" timestamp NOT NULL DEFAULT (current_timestamp),
    "owner"       text,
    "type"        text,
    CONSTRAINT fk_owners
        FOREIGN KEY ("owner")
            REFERENCES "group" ("id"),
    CONSTRAINT fk_type
        FOREIGN KEY ("type")
            REFERENCES "type" ("id")
);

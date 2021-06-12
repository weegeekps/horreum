table! {
    group (id) {
        id -> Uuid,
        name -> Varchar,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    storehouse (id) {
        id -> Uuid,
        data -> Jsonb,
        created_on -> Timestamp,
        modified_on -> Timestamp,
        owner -> Nullable<Uuid>,
        #[sql_name = "type"]
        type_ -> Nullable<Uuid>,
    }
}

table! {
    type (id) {
        id -> Uuid,
        name -> Varchar,
        description -> Nullable<Varchar>,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    user (id) {
        id -> Uuid,
        name -> Varchar,
        password -> Varchar,
        enabled -> Bool,
        admin -> Bool,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    user_group (user_id, group_id) {
        user_id -> Uuid,
        group_id -> Uuid,
    }
}

joinable!(storehouse -> group (owner));
joinable!(storehouse -> type (type));

allow_tables_to_appear_in_same_query!(
    group,
    storehouse,
    type,
    user,
    user_group,
);

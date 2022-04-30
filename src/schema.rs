table! {
    group (id) {
        id -> Nullable<Text>,
        name -> Text,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    storehouse (id) {
        id -> Nullable<Text>,
        data -> Text,
        created_on -> Timestamp,
        modified_on -> Timestamp,
        owner -> Nullable<Text>,
        #[sql_name = "type"]
        type_ -> Nullable<Text>,
    }
}

table! {
    type (id) {
        id -> Nullable<Text>,
        name -> Text,
        description -> Nullable<Text>,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    user (id) {
        id -> Nullable<Text>,
        name -> Text,
        password -> Text,
        enabled -> Bool,
        admin -> Bool,
        created_on -> Timestamp,
        modified_on -> Timestamp,
    }
}

table! {
    user_group (user_id, group_id) {
        user_id -> Nullable<Text>,
        group_id -> Nullable<Text>,
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

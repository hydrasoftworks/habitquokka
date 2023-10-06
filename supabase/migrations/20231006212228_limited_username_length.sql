alter table "public"."profiles" add constraint "profiles_username_check" CHECK ((length(username) <= 20)) not valid;

alter table "public"."profiles" validate constraint "profiles_username_check";
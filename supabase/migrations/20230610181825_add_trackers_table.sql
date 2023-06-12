create table "public"."trackers" (
    "id" uuid not null default gen_random_uuid(),
    "owner_id" uuid not null,
    "short_name" text not null,
    "name" text,
    "image" json not null,
    "rows" smallint not null,
    "columns" smallint not null,
    "seed_color" bigint not null,
    "randomize_numbers" boolean not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


alter table "public"."trackers" enable row level security;

CREATE UNIQUE INDEX trackers_id_key ON public.trackers USING btree (id);

CREATE UNIQUE INDEX trackers_pkey ON public.trackers USING btree (id);

alter table "public"."trackers" add constraint "trackers_pkey" PRIMARY KEY using index "trackers_pkey";

alter table "public"."trackers" add constraint "trackers_id_key" UNIQUE using index "trackers_id_key";

alter table "public"."trackers" add constraint "trackers_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."trackers" validate constraint "trackers_owner_id_fkey";

create policy "Trackers can be viewed and changed only by their owners."
on "public"."trackers"
as permissive
for all
to authenticated
using ((auth.uid() = owner_id))
with check ((auth.uid() = owner_id));

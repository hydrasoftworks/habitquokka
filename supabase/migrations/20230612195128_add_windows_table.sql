create table "public"."windows" (
    "tracker_id" uuid not null,
    "opened" text[] not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


alter table "public"."windows" enable row level security;

CREATE UNIQUE INDEX windows_pkey ON public.windows USING btree (tracker_id);

CREATE UNIQUE INDEX windows_tracker_id_key ON public.windows USING btree (tracker_id);

alter table "public"."windows" add constraint "windows_pkey" PRIMARY KEY using index "windows_pkey";

alter table "public"."windows" add constraint "windows_tracker_id_fkey" FOREIGN KEY (tracker_id) REFERENCES trackers(id) ON DELETE CASCADE not valid;

alter table "public"."windows" validate constraint "windows_tracker_id_fkey";

alter table "public"."windows" add constraint "windows_tracker_id_key" UNIQUE using index "windows_tracker_id_key";

create policy "Windows can be viewed and changed only by their owners."
on "public"."windows"
as permissive
for all
to authenticated
using ((auth.uid() IN ( SELECT trackers.owner_id
   FROM trackers
  WHERE (windows.tracker_id = trackers.id))))
with check ((auth.uid() IN ( SELECT trackers.owner_id
   FROM trackers
  WHERE (windows.tracker_id = trackers.id))));
  
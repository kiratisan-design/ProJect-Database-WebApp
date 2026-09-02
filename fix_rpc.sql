-- รันใน Supabase SQL Editor (Dashboard > SQL Editor > New query)

create or replace function update_measurement(
  p_id bigint,
  p_height numeric,
  p_girth numeric,
  p_date_id bigint
) returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update "การวัด"
  set "ความสูง" = p_height,
      "เส้นรอบวง" = p_girth,
      "รหัสวันที่" = p_date_id
  where "รหัสการวัด" = p_id;
end;
$$;

create or replace function delete_measurement(p_id bigint) returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  delete from "การวัด" where "รหัสการวัด" = p_id;
end;
$$;

grant execute on function update_measurement(bigint, numeric, numeric, bigint) to authenticated, anon;
grant execute on function delete_measurement(bigint) to authenticated, anon;

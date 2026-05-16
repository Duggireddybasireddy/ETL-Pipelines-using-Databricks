with raw_data as(
    select s_store_sk, s_store_id, s_store_name, s_city, s_state, s_country, s_zip from project.raw.store
    where s_store_sk is not null
)

MERGE INTO project.std.{table}  tgt
USING raw_data
ON tgt.s_store_sk=raw_data.s_store_sk
WHEN NOT MATCHED THEN INSERT *

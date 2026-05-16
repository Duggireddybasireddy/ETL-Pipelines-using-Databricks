with raw_data as(
    select d_date_sk ,d_date from project.raw.date_dim where d_date_sk is not null
)

MERGE INTO project.std.{table} da
USING raw_data
ON da.d_date_sk=raw_data.d_date_sk
WHEN NOT MATCHED THEN INSERT *
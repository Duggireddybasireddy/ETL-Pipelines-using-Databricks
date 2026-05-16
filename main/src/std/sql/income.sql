with raw_data as(
    select ib_income_band_sk, coalesce(ib_lower_bound, 0) ib_lower_bound, 
    nullif(ib_upper_bound, 0) ib_upper_bound
    from project.raw.income where ib_income_band_sk is not null and ib_lower_bound >= 0 and ib_upper_bound >= 0
)

MERGE INTO project.std.{table} std
USING raw_data ON 
std.ib_income_band_sk=raw_data.ib_income_band_sk
WHEN NOT MATCHED THEN INSERT *
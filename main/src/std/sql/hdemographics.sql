with raw_data as(
    select hd_demo_sk,hd_income_band_sk from project.raw.household_demographics where hd_demo_sk is not null
)

MERGE INTO project.std.{table} hdem
USING raw_data ON
hdem.hd_demo_sk=raw_data.hd_demo_sk
WHEN NOT MATCHED THEN insert *
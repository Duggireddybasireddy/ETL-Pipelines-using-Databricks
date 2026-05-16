with raw_data as(
    select ca_address_sk, ca_country, ca_state, ca_zip from project.raw.address where ca_address_sk is not null
)

MERGE INTO project.std.{table} cust_add
USING raw_data
ON cust_add.ca_address_sk=raw_data.ca_address_sk
WHEN NOT MATCHED THEN INSERT *
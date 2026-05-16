with raw_data as(
    select cd_demo_sk,cd_gender,cd_marital_status,cd_education_status,
    coalesce(cd_purchase_estimate, 0) cd_purchase_estimate, cd_credit_rating 
    from project.raw.customer_demographics where cd_demo_sk is not null and cd_purchase_estimate > 0
)

MERGE INTO project.std.{table} cdemo
USING raw_data ON 
cdemo.cd_demo_sk = raw_data.cd_demo_sk
WHEN NOT MATCHED THEN INSERT *


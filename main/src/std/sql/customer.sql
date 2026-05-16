with raw_data as (select c_customer_sk,c_customer_id,c_current_cdemo_sk,c_current_hdemo_sk,c_current_addr_sk,c_first_shipto_date_sk,
c_first_sales_date_sk, c_salutation,c_first_name,c_last_name,c_preferred_cust_flag,
to_date(concat(cast(lpad(c_birth_day,2,0) as string),'-', cast(lpad(c_birth_month,2,0) as string), '-',cast(c_birth_year as string)), 'dd-MM-yyyy')
Date_of_birth, c_birth_country, c_login, c_email_address,
c_last_review_date as c_last_review_date_sk from project.raw.customer
where c_customer_sk is not null and c_current_cdemo_sk is not null and c_current_hdemo_sk is not null and c_current_addr_sk is not null and 
c_first_shipto_date_sk is not null and c_first_sales_date_sk is not null)

merge into project.std.{table} std_cust
using raw_data
on std_cust.c_customer_sk = raw_data.c_customer_sk and
      std_cust.c_current_cdemo_sk=raw_data.c_current_cdemo_sk and
      std_cust.c_current_hdemo_sk=raw_data.c_current_hdemo_sk and
      std_cust.c_current_addr_sk=raw_data.c_current_addr_sk and
      std_cust.c_first_shipto_date_sk=raw_data.c_first_shipto_date_sk and
      std_cust.c_first_sales_date_sk=raw_data.c_first_sales_date_sk
when not matched then insert *
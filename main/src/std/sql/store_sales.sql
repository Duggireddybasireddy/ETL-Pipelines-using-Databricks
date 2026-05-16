with raw_data as(
    select ss_sold_date_sk,ss_item_sk,ss_customer_sk,ss_cdemo_sk,ss_hdemo_sk,ss_addr_sk,ss_store_sk,ss_promo_sk,ss_ticket_number, coalesce(ss_quantity, 0) ss_quantity, coalesce(ss_wholesale_cost, 0) ss_wholesale_cost,coalesce(ss_list_price, 0) ss_list_price, coalesce(ss_sales_price, 0) ss_sales_price,
    coalesce(ss_ext_discount_amt, 0) ss_ext_discount_amt, coalesce(ss_ext_sales_price, 0) ss_ext_sales_price,
    coalesce(ss_ext_wholesale_cost, 0) ss_ext_wholesale_cost, coalesce(ss_ext_list_price, 0) ss_ext_list_price,coalesce(ss_ext_tax,0) ss_ext_tax, coalesce(ss_coupon_amt, 0) ss_coupon_amt,
    coalesce(ss_net_paid, 0) ss_net_paid, coalesce(ss_net_paid_inc_tax, 0) ss_net_paid_inc_tax,
    coalesce(ss_net_profit, 0) ss_net_profit from project.raw.store_sales
    where ss_sold_date_sk is not null and ss_item_sk is not null and ss_customer_sk is not null and 
    ss_cdemo_sk is not null and ss_hdemo_sk is not null and ss_addr_sk is not null and ss_store_sk is not null 
    and ss_store_sk is not null and ss_promo_sk is not null
)

MERGE INTO project.std.{table} tgt
USING raw_data src
ON tgt.ss_sold_date_sk = src.ss_sold_date_sk and tgt.ss_item_sk = src.ss_item_sk and 
tgt.ss_customer_sk=src.ss_customer_sk and tgt.ss_cdemo_sk = src.ss_cdemo_sk and tgt.ss_hdemo_sk=src.ss_hdemo_sk
and tgt.ss_addr_sk = src.ss_addr_sk and tgt.ss_store_sk = src.ss_store_sk and tgt.ss_promo_sk = src.ss_promo_sk
WHEN NOT MATCHED THEN INSERT *;
with dist_data as(
    SELECT sales.ss_ticket_number as transaction_id,
    date_dim.d_date as sold_date,
    cust.c_customer_sk as customer_id,
    item.i_item_sk as item_id,
    store.s_store_sk as store_id,
    cust.c_first_name as first_name,
    cust.c_last_name as last_name,
    cdemo.cd_gender as gender,
    cdemo.cd_marital_status as marital_status,
    addr.ca_country as country,
    addr.ca_zip as zip,
    item.i_product_name as product_name,
    item.i_category as category,
    item.i_brand as brand,
    store.s_store_name as store_name,
    store.s_city as city,
    store.s_state as state,
    store.s_country as store_country,
    sales.ss_quantity as quantity,
    sales.ss_sales_price as sales_price,
    sales.ss_ext_sales_price as total_sales,
    sales.ss_ext_discount_amt as discount_amount,
    sales.ss_ext_tax as tax_amount,
    sales.ss_net_paid as net_paid,
    sales.ss_net_profit as net_profit
    
    FROM project.std.std_storesales sales
    LEFT join project.std.std_customer cust on sales.ss_customer_sk=cust.c_customer_sk
    LEFT JOIN project.std.std_item item ON sales.ss_item_sk = item.i_item_sk
    LEFT JOIN project.std.std_store store ON sales.ss_store_sk = store.s_store_sk
    LEFT JOIN project.std.std_date date_dim ON sales.ss_sold_date_sk = date_dim.d_date_sk
    LEFT JOIN project.std.std_address addr ON sales.ss_addr_sk = addr.ca_address_sk
    LEFT JOIN project.std.std_cdemographics cdemo ON sales.ss_cdemo_sk = cdemo.cd_demo_sk
    LEFT JOIN project.std.std_hdemographics hdemo ON sales.ss_hdemo_sk = hdemo.hd_demo_sk
)

INSERT INTO project.dist.{table}
(select * from dist_data
except
select * from project.dist.{table})


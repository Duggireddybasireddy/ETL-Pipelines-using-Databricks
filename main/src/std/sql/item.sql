with raw_data as(
    select i_item_sk, i_item_id, i_rec_start_date, i_rec_end_date, i_item_desc, i_current_price, i_wholesale_cost,
    i_brand_id, i_brand, i_class_id, i_class, i_category_id, i_category, i_manufact_id, i_manufact, i_size, i_formulation, i_color, i_units,
    i_container, i_manager_id, i_product_name from project.raw.item
    where i_item_sk is not null
)

merge into project.std.{table} tgt
using raw_data
on tgt.i_item_sk = raw_data.i_item_sk
WHEN NOT MATCHED THEN INSERT *
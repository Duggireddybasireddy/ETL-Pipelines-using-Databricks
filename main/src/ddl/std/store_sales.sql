CREATE TABLE IF NOT EXISTS project.std.std_storeSales(
    ss_sold_date_sk Int,
    ss_item_sk Int,
    ss_customer_sk Int,
    ss_cdemo_sk Int,
    ss_hdemo_sk Int,
    ss_addr_sk Int,
    ss_store_sk Int,
    ss_promo_sk Int,
    ss_ticket_number Int,
    ss_quantity Int,
    ss_wholesale_cost Decimal(7,2),
    ss_list_price Decimal(7,2),
    ss_sales_price Decimal(7,2),
    ss_ext_discount_amt Decimal(7,2),
    ss_ext_sales_price Decimal(7,2),
    ss_ext_wholesale_cost Decimal(7,2),
    ss_ext_list_price Decimal(7,2),
    ss_ext_tax Decimal(7,2),
    ss_coupon_amt Decimal(7,2),
    ss_net_paid Decimal(7,2),
    ss_net_paid_inc_tax Decimal(7,2),
    ss_net_profit Decimal(7,2)
)
USING delta
TBLPROPERTIES(
  'delta.checkpoint.writeStatsAsJson'='false',
  'delta.checkpoint.writeStatsAsStruct'='true',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd'
)
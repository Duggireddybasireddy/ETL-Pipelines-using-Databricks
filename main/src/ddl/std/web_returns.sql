CREATE TABLE IF NOT EXISTS project.std.std_webReturns(
    wr_returned_date_sk Int,
    wr_item_sk Int,
    wr_refunded_customer_sk Int,
    wr_refunded_cdemo_sk Int,
    wr_refunded_hdemo_sk Int,
    wr_refunded_addr_sk Int,
    wr_returning_customer_sk Int,
    wr_returning_cdemo_sk Int,
    wr_returning_hdemo_sk Int,
    wr_returning_addr_sk Int,
    wr_web_page_sk Int,
    wr_reason_sk Int,
    wr_order_number Int,
    wr_return_quantity Int,
    wr_return_amt Decimal(7,2),
    wr_return_tax Decimal(7,2),
    wr_return_amt_inc_tax Decimal(7,2),
    wr_fee Decimal(7,2),
    wr_return_ship_cost Decimal(7,2),
    wr_refunded_cash Decimal(7,2),
    wr_reversed_charge Decimal(7,2),
    wr_account_credit Decimal(7,2),
    wr_net_loss Decimal(7,2)
)
USING delta
TBLProperties(
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
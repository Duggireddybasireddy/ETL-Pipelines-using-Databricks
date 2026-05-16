CREATE TABLE IF NOT EXISTS project.std.std_storeReturns(
	sr_returned_date_sk Int,
	sr_item_sk Int,
	sr_customer_sk Int,
	sr_cdemo_sk Int,
	sr_hdemo_sk Int,
	sr_addr_sk Int,
	sr_store_sk Int,
	sr_reason_sk Int,
	sr_ticket_number Int,
	sr_return_quantity Int,
	sr_return_amt Decimal(7,2),
	sr_return_tax Decimal(7,2),
	sr_return_amt_inc_tax Decimal(7,2),
	sr_fee Decimal(7,2),
	sr_return_ship_cost Decimal(7,2),
	sr_refunded_cash Decimal(7,2),
	sr_reversed_charge Decimal(7,2),
	sr_store_credit Decimal(7,2),
	sr_net_loss Decimal(7,2)
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
CREATE TABLE IF NOT EXISTS project.dist.dist_webReturnData(
    return_date string,
	refunded_customer_id string,
	refunded_first_name string,
	refunded_last_name string,
	returning_customer_id string,
	returning_first_name string,
	returning_last_name string,
	item_id string,
	product_name string,
	category string,
	page_type string,
	return_reason string,
    refunded_country string,
	refunded_zip string,
	return_country string,
    return_zip string,
	order_number string,
	return_quantity int,
	return_amount decimal(7,2),
	return_tax decimal(7,2),
	net_loss decimal(7,2)
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
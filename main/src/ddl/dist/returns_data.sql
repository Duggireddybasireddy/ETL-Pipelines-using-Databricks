CREATE TABLE IF NOT EXISTS project.dist.dist_returnsData(
    return_date date,
	customer_id string,
	first_name string,
	last_name string,
	item_id string,
	product_name string,
	category string,
	store_name string,
	city string,
	state string,
	return_reason string,
	country string,
	zip string,
	ticket_number string,
	return_quantity Int,
	return_amount Decimal(7,2),
	return_tax Decimal(7,2),
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
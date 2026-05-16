CREATE TABLE IF NOT EXISTS project.std.std_item(
    i_item_sk string,
	i_item_id string,
	i_rec_start_date date,
	i_rec_end_date date,
	i_item_desc string,
	i_current_price decimal(7,2),
	i_wholesale_cost decimal(7,2),
	i_brand_id int,
	i_brand string,
	i_class_id int,
	i_class string,
	i_category_id int,
	i_category string,
	i_manufact_id int,
	i_manufact string,
    i_size string,
	i_formulation string,
	i_color string,
	i_units string,
	i_container string,
	i_manager_id int,
	i_product_name string
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
CREATE TABLE IF NOT EXISTS project.std.std_customer(
    c_customer_sk int,
	c_customer_id string,
	c_current_cdemo_sk int,
	c_current_hdemo_sk int,
	c_current_addr_sk int,
	c_first_shipto_date_sk int,
	c_first_sales_date_sk int,
	c_salutation string,
	c_first_name string,
	c_last_name string,
	c_preferred_cust_flag string,
	Date_of_birth date,  
	c_birth_country string,
	c_login string,
	c_email_address string,
	c_last_review_date_sk int
)
using delta
TBLPROPERTIES(
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd'
)

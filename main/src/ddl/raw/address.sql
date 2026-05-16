CREATE OR REPLACE TABLE project.raw.address (
  ca_address_sk INT,
  ca_address_id STRING,
  ca_street_number STRING,
  ca_street_name STRING,
  ca_street_type STRING,
  ca_suite_number STRING,
  ca_city STRING,
  ca_county STRING,
  ca_state STRING,
  ca_zip STRING,
  ca_country STRING,
  ca_gmt_offset DECIMAL(5,2),
  ca_location_type STRING)
USING delta
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd')
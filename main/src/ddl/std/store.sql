CREATE TABLE IF NOT EXISTS project.std.std_sales(
    s_store_sk INT,
    s_store_id STRING,
    s_store_name STRING,
    s_city STRING,
    s_state STRING,
    s_country STRING,
    s_zip STRING
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

CREATE TABLE IF NOT EXISTS project.std.std_reason(
    r_reason_sk Int,
    r_reason_id string,
    r_reason_desc string
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
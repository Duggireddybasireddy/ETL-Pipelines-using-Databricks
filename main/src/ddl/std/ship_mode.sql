CREATE TABLE IF NOT EXISTS project.std.std_shipmode(
    sm_ship_mode_sk INT,
	sm_ship_mode_id string,
	sm_type string,
	sm_code string,
	sm_carrier string,
	sm_contract string
)
USING delta
TBLPROPERTIES(
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd'
)
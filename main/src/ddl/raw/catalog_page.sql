CREATE OR REPLACE TABLE project.raw.catalog_page (
  cp_catalog_page_sk INT,
  cp_catalog_page_id STRING,
  cp_start_date_sk INT,
  cp_end_date_sk INT,
  cp_department STRING,
  cp_catalog_number INT,
  cp_catalog_page_number INT,
  cp_description STRING,
  cp_type STRING)
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
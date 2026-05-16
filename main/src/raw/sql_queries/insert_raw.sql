COPY INTO project.raw.{table_name}
FROM '/Volumes/project/default/input/{folder_name}'
FILEFORMAT=PARQUET
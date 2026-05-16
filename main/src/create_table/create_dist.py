from pyspark.sql import SparkSession
import time, os, logging

def call_center():
    start_time=time.time()
    log_path="/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/logs/create_table/dist.log"
    logger=get_logger("Table Creation", log_path)
    logger.info("Creating SparkSession..................")
    spark=SparkSession.builder.appName("call_center").getOrCreate()
    lst=["catalog_returndata", "catalog_salesdata", "returns_data", "sales_data", "web_returndata", "web_salesdata"]
    
    for file_name in lst:
        print(f"creating table for {file_name}")
        src_path=f"/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/src/ddl/dist/{file_name}.sql"
        logger.info(f"creating table {file_name}")
        with open(src_path, "r") as file:
            sql_queries=file.read()
        spark.sql(sql_queries)

    logger.info(f"Time take to run sql is {time.time() - start_time}")

def get_logger(name, log_path):
    logger=logging.getLogger(name)
    
    logging.basicConfig(filename=log_path,filemode="a", level=logging.INFO, format="%(asctime)s - %(name)s - %(message)s")
    return logger


if __name__=="__main__":
    call_center()
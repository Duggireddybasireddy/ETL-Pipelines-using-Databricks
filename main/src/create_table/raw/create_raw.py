from pyspark.sql import SparkSession
import time, os, logging

def call_center():
    start_time=time.time()
    log_path="/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/logs/create_table/create.log"
    logger=get_logger("Table Creation", log_path)
    logger.info("Creating SparkSession..................")
    spark=SparkSession.builder.appName("call_center").getOrCreate()
    lst=["call_center", "catalog_sales", "customer_demographics", "income",  "store",  
                "web_returns", "catalog_page", "customer", "date",  "reason", "store_returns", "warehouse", "web_sales", 
                "catalog_returns", "address", "household_demographics", "item", "ship_mode", "store_sales", "web_page",
                "web_site"]
    
    for file_name in lst:
        src_path=f"/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/src/ddl/raw/{file_name}.sql"
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
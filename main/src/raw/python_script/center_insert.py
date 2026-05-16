from pyspark.sql import SparkSession
import time, os, logging

def call_center_insert():
    start_time=time.time()
    log_path="/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/logs/raw/insert.log"
    logger=get_logger("Insert", log_path)
    logger.info('Creating SparkSession................')
    spark=SparkSession.builder.appName("call_center_insert").getOrCreate()
    lst={"call_center":"call_center", "catalog_sales":"catalog_sales", "customer_demographics":"customer_demographics", "income":"income",          
         "store":"store", "web_returns":"web_returns", "catalog_page":"catalog_page", "customer":"customer", "date_dim":"date_dim",  "reason":"reason", "store_returns":"store_returns", "warehouse":"warehouse", "web_sales":"web_sales", "catalog_returns":"catalog_returns", "address":"address", "household_demographics":"household_demographics", "item":"item", "ship_mode":"ship_mode", "store_sales":"store_sales", "web_page":"web_page","web_site":"website"}
    for table, data in lst.items():
        logger.info(f"Inserting data into {table} table")
        print(f"Inserting data into {table} table")
        with open("/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/src/raw/sql_queries/insert_raw.sql", "r") as file:
            query = file.read()
        insert_query=query.format(table_name=table, folder_name=data)
        spark.sql(insert_query)
    logger.info(f"Time taken to insert data into raw_layer is {round(time.time() - start_time, 2)} seconds")

def get_logger(name, log_path):
    logger=logging.getLogger(name)
    logging.basicConfig(filename=log_path, filemode="w", level=logging.INFO, format="%(asctime)s - %(name)s - %(message)s")
    return logger


if __name__=="__main__":
    call_center_insert()
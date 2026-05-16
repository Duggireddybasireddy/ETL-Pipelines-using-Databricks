from pyspark.sql import SparkSession
import time, os, logging

def insert_dist():
    start_time=time.time()
    log_path="/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/logs/dist/insert.log"
    logger=get_logger("Insert", log_path)
    logger.info('Creating SparkSession................')
    spark=SparkSession.builder.appName("Insert_Dist").getOrCreate()
    lst={"dist_salesdata": "storesales"}

    for table, query in lst.items():
        logger.info(f"Inserting data into {table} table")
        print(f"Inserting data into {table} table")
        with open(f"/Workspace/Users/bdr83175@gmail.com/ETL-Pipelines-using-Databricks/main/src/dist/sql/{query}.sql", "r") as file:
            I_query = file.read()
        insert_query=I_query.format(table=table)
        spark.sql(insert_query)
    logger.info(f"Time taken to insert data into raw_layer is {round(time.time() - start_time, 2)} seconds")

def get_logger(name, log_path):
    logger=logging.getLogger(name)
    logging.basicConfig(filename=log_path, filemode="w", level=logging.INFO, format="%(asctime)s - %(name)s - %(message)s")
    return logger


if __name__=="__main__":
    insert_dist()
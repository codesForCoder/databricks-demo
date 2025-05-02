-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Extract Data From the Returns SQL Table
-- MAGIC 1. Create Bronze Schema in Hive Metastore
-- MAGIC 1. Create External Table

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### 1. Create Bronze Schema in Hive Metastore

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS hive_metastore.bronze;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### 2. Create External Table

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS hive_metastore.bronze.refunds
USING JDBC
OPTIONS (
  url 'jdbc:postgresql://database-pg-dbx.c9k4iwagar2t.ap-south-1.rds.amazonaws.com:5432/postgres',
  dbtable 'refunds',
  user 'postgres',
  password 'postgres'
);  



-- COMMAND ----------

SELECT * FROM hive_metastore.bronze.refunds;

-- COMMAND ----------

DESC EXTENDED hive_metastore.bronze.refunds;

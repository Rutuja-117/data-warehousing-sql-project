SET GLOBAL local_infile = true;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

USE Bronze;

/* -------- batch timer -------- */
SET @batch_start = NOW();

/* ---------- crm_cust_info ---------- */
SET @start = NOW();
TRUNCATE TABLE crm_cust_info;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE crm_cust_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'crm_cust_info' AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* ---------- crm_prd_info ---------- */
SET @start = NOW();
TRUNCATE TABLE crm_prd_info;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'crm_prd_info'  AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* ---------- crm_sales_details ---------- */
SET @start = NOW();
TRUNCATE TABLE crm_sales_details;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'crm_sales_details' AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* ---------- erp_cust_az12 ---------- */
SET @start = NOW();
TRUNCATE TABLE erp_cust_az12;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE erp_cust_az12
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'erp_cust_az12' AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* ---------- erp_loc_a101 ---------- */
SET @start = NOW();
TRUNCATE TABLE erp_loc_a101;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
INTO TABLE erp_loc_a101
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'erp_loc_a101' AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* ---------- erp_px_cat_g1v2 ---------- */
SET @start = NOW();
TRUNCATE TABLE erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE 'C:/Users/Rutuja Navale/Documents/SQL_DataWarehousing/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE erp_px_cat_g1v2
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SET @end = NOW();
SELECT 'erp_px_cat_g1v2' AS table_name,
TIMESTAMPDIFF(SECOND,@start,@end) AS seconds_loaded;

/* -------- total batch duration -------- */
SET @batch_end = NOW();
SELECT 'TOTAL BATCH'  AS phase,
TIMESTAMPDIFF(SECOND,@batch_start,@batch_end) AS seconds_loaded;


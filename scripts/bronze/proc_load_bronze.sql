Stored Procedure: Load Bronze Layer (Source -> Bronze)
================================================================================

Script Purpose:

    This stored procedure loads data into the 'bronze' schema from external CSV files.

    It performs the following actions:

    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files to bronze tables.
    - Displays loading progress using PRINT statements.
    - Calculates the loading duration for each table.
    - Calculates the total Bronze Layer loading duration.
    - Handles errors using TRY...CATCH.

Parameters:

    None.

    This stored procedure does not accept any parameters or return any values.

Usage Example:

    EXEC bronze.load_bronze;

================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME,@end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
    BEGIN TRY
	SET @batch_start_time=GETDATE();
    PRINT '==============================';
    PRINT'LOADING BRONZE LAYER';
	PRINT '==============================';

	PRINT '------------------------------';
	PRINT 'LOADING CRM TABLES';
	PRINT '------------------------------';

	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.crm_cust_info';
	TRUNCATE table bronze.crm_cust_info;

	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_crm\cust_info.csv'
	WITH(
	firstrow=2,
	fieldterminator=',',
	TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';

	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.crm_prd_info';
	TRUNCATE table bronze.crm_prd_info;

	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_crm\prd_info.csv'
	WITH(
	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';

	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.crm_sales_details';
	TRUNCATE table bronze.crm_sales_details;

	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_crm\sales_details.csv'
	WITH(
	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';

	
	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.erp_cust_az12';
	TRUNCATE table bronze.erp_cust_az12;

	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.erp_cust_az12';
	BULK INSERT bronze.erp_cust_az12
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_erp\CUST_AZ12.csv'
	WITH(
	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';

	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.erp_loc_a101';
	TRUNCATE table bronze.erp_loc_a101;
    
	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.erp_loc_a101';
	BULK INSERT bronze.erp_loc_a101
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_erp\LOC_A101.csv'
	WITH(
	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';

	
	SET @start_time=GETDATE();
	PRINT '>> TRUNCATING bronze.erp_px_cat_g1v2';
	TRUNCATE table bronze.erp_px_cat_g1v2;

	PRINT '>> INSERTING DATA INTO:TRUNCATING bronze.erp_px_cat_g1v2';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'E:\data engineering\sql-data-warehouse-project-2025\sql-data-warehouse-project-2025\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH(
	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
		SET @end_time=GETDATE();
	PRINT '>>LOAD DURATION:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
	PRINT '---------------------------------------------';
	
	SET @batch_end_time=GETDATE();
	PRINT '========================================';
	PRINT 'LOADING BRONZE LAYER COMPLETED';
	PRINT '  -TOTAL DURATION: ' +CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR) + 'seconds';
	PRINT '=========================================';
	END TRY
	BEGIN CATCH
	PRINT '================================='
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	PRINT 'ERROR MESSAGE' +ERROR_MESSAGE();
	PRINT 'ERROR MESSAGE' +CAST (ERROR_NUMBER() AS NVARCHAR);
	PRINT 'ERROR MESSAGE' +CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '================================='
	END CATCH
END

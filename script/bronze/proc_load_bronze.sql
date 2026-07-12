/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
create or alter procedure bronze.load_bronze as 
begin
	declare @start_time datetime,@end_time datetime,@start_loading datetime,@end_loading datetime;
	print '=======================================';
	print 'Loading Bronze layer';
	print '=======================================';
	-- crm source:
	print '---------------------------------------';
	print 'Loading crm tables';
	print '---------------------------------------';

	set @start_loading=getdate();
	print'>>Trankating table : bronze.crm_cust_info ';
	truncate table bronze.crm_cust_info
	print'>>Inserting data into : bronze.crm_cust_info ';

	set @start_time=getdate();
	

	bulk insert bronze.crm_cust_info
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';

	print '-----------------------------------';

	print'>>Trankating table : bronze.crm_prd_info ';
	truncate table bronze.crm_prd_info
	print'>>Inserting data into : bronze.crm_prd_info ';
	set @start_time=getdate();
	bulk insert bronze.crm_prd_info
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';

	print '-----------------------------------';

	print'>>Trankating table : bronze.crm_sales_details ';
	truncate table bronze.crm_sales_details
	print'>>Inserting data into : bronze.crm_sales_details ';
	set @start_time=getdate();
	bulk insert bronze.crm_sales_details
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';
	print '-----------------------------------';


	--erp source:
	print '---------------------------------------';
	print 'Loading erp tables';
	print '---------------------------------------';

	print'>>Trankating table : bronze.erp_ust_az12 ';
	truncate table bronze.erp_ust_az12
	print'>>Inserting data into : bronze.erp_ust_az12 ';
	set @start_time=getdate();
	bulk insert bronze.erp_ust_az12
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';
	print '-----------------------------------';


	print'>>Trankating table : bronze.erp_loc_a101 ';
	truncate table bronze.erp_loc_a101
	print'>>Inserting data into : bronze.erp_loc_a101 ';
	set @start_time=getdate();
	bulk insert bronze.erp_loc_a101
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';
	print '-----------------------------------';


	print'>>Trankating table : bronze.erp_px_cat_g1v2 ';
	truncate table bronze.erp_px_cat_g1v2
	print'>>Inserting data into : bronze.erp_px_cat_g1v2 ';
	set @start_time=getdate();
	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\seyyi\OneDrive\Desktop\sql_DatawithBara\Projects\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with(
		firstrow=2,
		fieldterminator=',',
		tablock
	)
	set @end_time=getdate();
	print '>>Load duration: '+cast(datediff(second,@start_time,@end_time) as varchar)+' second';
	set @end_loading=getdate();

	print '===================================';
	print 'Duration of loading bronze layer = '+cast(datediff(second,@start_loading,@end_loading) as varchar)+' second';
end

create or alter procedure bronze.load_bronze as
begin
declare @start_time DATETIME , @end_time DATETIME;
declare @batch_start_time DATETIME ,@batch_end_time DATETIME;
begin try
PRINT '======================================================';
PRINT 'loading Bronze Layer' ;
PRINT '=======================================================';
PRINT '------------------------------------------------';
PRINT 'loading CRM Tables';
PRINT '------------------------------------------------';

set @start_time=getdate();
set @batch_start_time=getdate();
PRINT'>> Truncating Table:bronze.crm_cust_info'

TRUNCATE TABLE bronze.crm_cust_info
PRINT'>> Inserting Data Into:bronze.crm_cust_info'


BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\cust_info(1).csv'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @end_time=getdate();
print'>> Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';
print'>> ------------------------------------------------------';
SET @start_time=getdate();
PRINT'>> Truncating Table:bronze.crm_prd_info'
TRUNCATE TABLE bronze.crm_prd_info
PRINT'>> Inserting Data Into:bronze.crm_prd_info'
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\prd_info.csv'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @end_time=getdate();
print'>> Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';
print'>> ------------------------------------------------------';
PRINT'>> Truncating Table:bronze.crm_sales_details'
TRUNCATE TABLE bronze.crm_sales_details
PRINT'>> Inserting Data Into:bronze.crm_sales_details'
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\sales_details.csv'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @end_time=getdate();
print'>> Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';
print'>> ------------------------------------------------------';
PRINT '------------------------------------------------';
PRINT 'Loading ERP Tables';
PRINT '------------------------------------------------';

PRINT'>> Truncating Table:bronze.erp_loc_a101'

TRUNCATE TABLE bronze.erp_loc_a101
PRINT'>> Inserting Data Into:bronze.erp_loc_a101'
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\LOC_A101.CSV'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @end_time=getdate();
print'>> Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';
print'>> ------------------------------------------------------';
PRINT'>> Truncating Table:bronze.erp_cust_az12'
TRUNCATE TABLE bronze.erp_cust_az12
PRINT'>> Inserting Data Into:bronze.erp_cust_az12'
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\CUST_AZ12.CSV'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @end_time=getdate();
print'>> Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';
print'>> ------------------------------------------------------';
PRINT'>> Truncating Table:bronze.erp_px_cat_g1v2'

TRUNCATE TABLE bronze.erp_px_cat_g1v2
PRINT'>> Inserting Data Into:bronze.erp_cust_az12'

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\shruti\OneDrive\Desktop\sql\PX_CAT_G1V2.csv'
with(
firstrow=2,
FIELDTERMINATOR=',',
TABLOCK
);
set @batch_end_time=getdate();
print'>>batch Load Duration: '+CAST(DATEDIFF(second,@batch_start_time,@batch_end_time)AS NVARCHAR)+'seconds';
end try 
begin catch 
PRINT '========================================'
PRINT 'ERROR OCCURED'
PRINT '======================================='
End catch

end

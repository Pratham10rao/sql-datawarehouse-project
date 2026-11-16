
/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schema. It includes checks for:

    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.

===============================================================================
*/


-- ============================================================================
-- Checking 'silver.crm_cust_info'
-- ============================================================================

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


-- Check for Unwanted Spaces
-- Expectation: No Results

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);


-- Check Data Standardization and Consistency
-- Expectation: Only SINGLE, MARRIED, n/a

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;

-- Expectation: Only FEMALE, MALE, n/a

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;



-- ============================================================================
-- Checking 'silver.crm_prd_info'
-- ============================================================================

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT
    prd_id,
    COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;


-- Check for Unwanted Spaces in Product Name
-- Expectation: No Results

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);


-- Check for Negative or NULL Product Cost
-- Expectation: No Negative or NULL Values

SELECT *
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;


-- Check Data Standardization
-- Expectation: Mountain, Road, Other Sales, Touring, n/a

SELECT DISTINCT prd_line
FROM silver.crm_prd_info;


-- Check for Invalid Product Date Ranges
-- Expectation: No Results

SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;



-- ============================================================================
-- Checking 'silver.crm_sales_details'
-- ============================================================================

-- Check for NULL or Empty Order Numbers
-- Expectation: No Results

SELECT *
FROM silver.crm_sales_details
WHERE sls_ord_num IS NULL
   OR TRIM(sls_ord_num) = '';


-- Check for Invalid Order Dates
-- Expectation: No Results

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt IS NULL;


-- Check for Invalid Date Orders
-- Expectation: No Results

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;


-- Check Sales Consistency
-- Expectation: Sales = Quantity * Price

SELECT *
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL;



-- ============================================================================
-- Checking 'silver.erp_cust_az12'
-- ============================================================================

-- Check for NULL Customer IDs
-- Expectation: No Results

SELECT *
FROM silver.erp_cust_az12
WHERE cid IS NULL;


-- Check for Unwanted Spaces
-- Expectation: No Results

SELECT *
FROM silver.erp_cust_az12
WHERE cid != TRIM(cid);


-- Check for Invalid Birth Dates
-- Expectation: No Future Birth Dates

SELECT *
FROM silver.erp_cust_az12
WHERE bdate > GETDATE();


-- Check Data Standardization
-- Expectation: Female, Male, n/a

SELECT DISTINCT gen
FROM silver.erp_cust_az12;



-- ============================================================================
-- Checking 'silver.erp_loc_a101'
-- ============================================================================

-- Check for NULL Customer IDs
-- Expectation: No Results

SELECT *
FROM silver.erp_loc_a101
WHERE cid IS NULL;


-- Check for Unwanted Spaces
-- Expectation: No Results

SELECT *
FROM silver.erp_loc_a101
WHERE cid != TRIM(cid)
   OR cntry != TRIM(cntry);


-- Check Data Standardization
-- Review standardized country names

SELECT DISTINCT cntry
FROM silver.erp_loc_a101;



-- ============================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ============================================================================

-- Check for NULL Category IDs
-- Expectation: No Results

SELECT *
FROM silver.erp_px_cat_g1v2
WHERE id IS NULL;


-- Check for Unwanted Spaces
-- Expectation: No Results

SELECT *
FROM silver.erp_px_cat_g1v2
WHERE id != TRIM(id)
   OR cat != TRIM(cat)
   OR subcat != TRIM(subcat)
   OR maintenance != TRIM(maintenance);


-- Check Data Standardization
-- Review category, subcategory and maintenance values

SELECT DISTINCT cat
FROM silver.erp_px_cat_g1v2;

SELECT DISTINCT subcat
FROM silver.erp_px_cat_g1v2;

SELECT DISTINCT maintenance
FROM silver.erp_px_cat_g1v2;

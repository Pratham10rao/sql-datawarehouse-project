
/*
===============================================================================
DDL Script: Create Bronze Layer Tables
===============================================================================

Script Purpose:
    This script creates the tables required for the Bronze Layer
    in the DataWarehouse database.

    The Bronze Layer stores raw data directly from the source systems
    (CRM and ERP) without performing any transformations.

Tables Created:
    CRM:
        1. bronze.crm_cust_info
        2. bronze.crm_prd_info
        3. bronze.crm_sales_details

    ERP:
        4. bronze.erp_cust_az12
        5. bronze.erp_loc_a101
        6. bronze.erp_px_cat_g1v2

Important:
    - Checks whether each table already exists.
    - Drops the existing table before recreating it.
    - All existing data in these tables will be permanently deleted.
    - Run this script with caution.

===============================================================================
*/

USE DataWarehouse;
GO

-- ============================================================================
-- CRM TABLES
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Table: bronze.crm_cust_info
-- Purpose: Stores raw customer information from the CRM source system.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info
(
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);
GO


-- ----------------------------------------------------------------------------
-- Table: bronze.crm_prd_info
-- Purpose: Stores raw product information from the CRM source system.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info
(
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);
GO


-- ----------------------------------------------------------------------------
-- Table: bronze.crm_sales_details
-- Purpose: Stores raw sales transaction details from the CRM source system.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
GO


-- ============================================================================
-- ERP TABLES
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Table: bronze.erp_loc_a101
-- Purpose: Stores customer location and country information from ERP.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101
(
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);
GO


-- ----------------------------------------------------------------------------
-- Table: bronze.erp_cust_az12
-- Purpose: Stores additional customer information from ERP.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12
(
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);
GO


-- ----------------------------------------------------------------------------
-- Table: bronze.erp_px_cat_g1v2
-- Purpose: Stores product category and maintenance information from ERP.
-- ----------------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2
(
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
GO


-- ============================================================================
-- VALIDATION: Check whether all Bronze Layer tables were created successfully
-- ============================================================================

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'bronze'
ORDER BY TABLE_NAME;
GO

-- Switch to the master database
USE master;
GO

-- Check if the database 'DATAWAREHOUSE' exists
IF EXISTS(SELECT 1 FROM sys.databases WHERE name='DATAWAREHOUSE')
BEGIN 
    -- Set the database to SINGLE_USER mode and rollback any active transactions
    ALTER DATABASE DATAWAREHOUSE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the existing database
    DROP DATABASE DATAWAREHOUSE;
END;
GO

-- Create a new database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

-- Switch to the newly created database
USE DataWarehouse;
GO

-- Create schemas for data lakehouse layers
CREATE SCHEMA bronze;  -- Raw data layer
GO
CREATE SCHEMA silver;  -- Cleaned / curated data layer
GO
CREATE SCHEMA gold;    -- Business / aggregated data layer
GO

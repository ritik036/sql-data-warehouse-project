/*
============================================
Create Database and Schemas 
============================================
Script Purpose : 
	This script creates a new database named 'DataWarehouse' after checking if it already exists . 
	 If the database exists, it is dropped and recreated. additionally, the script sets up three schemas within the database : 'bronze', 'silver', 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists. 
All data in the database will be permanently deleted. Proceed with caution 
and ensure you have proper backups before running this script.
*/






USE master ;
GO

-- Disconnects all other user of Database at this instance with their updates rolling back and then drops and recreates the 'DataWarehouse' database 
IF EXISTS (SELECT 1 FROM SYS.DATABASES WHERE name = 'DataWarehouse'
BEGIN 
	ALTER DATABASE DataWarehouse 
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse 
END;
GO



-- create the 'DataWarehouse' database 
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO



-- Creates Schemas

CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO

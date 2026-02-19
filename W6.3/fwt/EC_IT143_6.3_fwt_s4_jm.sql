-- Script: EC_IT143_6.3_fwt_s4_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 4 - Create an AFTER UPDATE trigger for last_modified_date.
-- Source: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql

USE EC_IT143_DA;
GO

IF OBJECT_ID('dbo.tr_w3_customers_last_modified_date_jm', 'TR') IS NOT NULL
    DROP TRIGGER dbo.tr_w3_customers_last_modified_date_jm;
GO

CREATE TRIGGER dbo.tr_w3_customers_last_modified_date_jm
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update last_modified_date to current timestamp
    -- for every row that was just modified.
    -- The INSERTED pseudo-table contains the updated rows.
    UPDATE dbo.t_w3_schools_customers
    SET last_modified_date = GETDATE()
    WHERE CustomerID IN (SELECT CustomerID FROM INSERTED);
END;
GO

-- Script: EC_IT143_6.3_fwt_s5_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 5 - Test the after-update trigger.

USE EC_IT143_DA;
GO

-- Before update: verify last_modified_date is NULL
SELECT CustomerID, CustomerName, last_modified_date
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO

-- Trigger the trigger: update a row
UPDATE dbo.t_w3_schools_customers
SET City = 'Berlin'
WHERE CustomerID = 1;
GO

-- After update: last_modified_date should now have a timestamp
SELECT CustomerID, CustomerName, City, last_modified_date
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO
-- Expected: last_modified_date now shows the current date and time.

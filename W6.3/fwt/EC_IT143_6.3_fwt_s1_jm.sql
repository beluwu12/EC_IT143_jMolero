-- Script: EC_IT143_6.3_fwt_s1_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 1 - Start with a question.

USE EC_IT143_DA;
GO

-- Q: How do I automatically track when a record in t_w3_schools_customers was last modified?
-- Goal: Every time a row is updated, a column called last_modified_date
-- should automatically record the exact timestamp of that update.

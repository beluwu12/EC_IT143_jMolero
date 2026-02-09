-- Script: EC_IT143_W5.2_My_Community_Finc_JM.sql
-- Author: Jeremy Molero
-- Date: 02/09/2026
-- Description: Answers 4 key questions about the Personal Finance Community dataset.

USE EC_IT143_DA;
GO

-- Q1: Which expense category had the highest total spending in the last month?
-- Stakeholder: Head of Household
-- Author: Jeremy Molero
SELECT TOP 1
    category,
    SUM(amount) AS total_spent
FROM dbo.t_finance_transactions_jm
WHERE transaction_type = 'Expense'
  AND transaction_date >= DATEADD(month, -1, GETDATE())
GROUP BY category
ORDER BY total_spent DESC;
GO

-- Q2: What is the average weekly savings (Income - Expenses)?
-- Stakeholder: Savings Goal Planner
-- Author: Jeremy Molero
SELECT
    DATEPART(week, transaction_date) AS week_number,
    SUM(CASE WHEN transaction_type = 'Income' THEN amount ELSE 0 END) -
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS net_savings
FROM dbo.t_finance_transactions_jm
GROUP BY DATEPART(week, transaction_date)
ORDER BY week_number;
GO

-- Q3: Can you show in monthly amounts, the average amount a consumer saves money?
-- Stakeholder: Jennifer Mapa
-- Author: Jennifer Mapa
SELECT
    FORMAT(transaction_date, 'yyyy-MM') AS month_year,
    (SUM(CASE WHEN transaction_type = 'Income' THEN amount ELSE 0 END) -
     SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END)) AS monthly_savings
FROM dbo.t_finance_transactions_jm
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY month_year;
GO

-- Q4: Which spending categories exceed a hypothetical monthly budget limit of $500?
-- Stakeholder: Mark Borbor Wantoe
-- Author: Mark Borbor Wantoe
-- Note: Assuming a fixed budget limit of $500 since no Budget table exists.
SELECT
    category,
    SUM(amount) AS total_monthly_spent,
    500.00 AS budget_limit,
    (SUM(amount) - 500.00) AS over_budget_amount
FROM dbo.t_finance_transactions_jm
WHERE transaction_type = 'Expense'
GROUP BY category
HAVING SUM(amount) > 500.00;
GO

USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_finance_total_expenses_jm;
GO

CREATE VIEW dbo.v_finance_total_expenses_jm AS
    SELECT SUM(amount) AS total_expenses
    FROM dbo.finance_transactions_jm
    WHERE transaction_type = 'Expense';
GO

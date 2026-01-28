USE EC_IT143_DA;
GO

SELECT SUM(amount) AS total_expenses
FROM dbo.finance_transactions_jm
WHERE transaction_type = 'Expense';

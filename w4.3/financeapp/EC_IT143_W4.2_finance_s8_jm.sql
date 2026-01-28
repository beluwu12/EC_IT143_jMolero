USE EC_IT143_DA;
GO

EXEC dbo.usp_finance_total_expenses_load_jm;

SELECT * FROM dbo.t_finance_total_expenses_jm;

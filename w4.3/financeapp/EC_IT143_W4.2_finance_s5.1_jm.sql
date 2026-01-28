USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_finance_total_expenses_jm;
GO

SELECT *
INTO dbo.t_finance_total_expenses_jm
FROM dbo.v_finance_total_expenses_jm;
GO

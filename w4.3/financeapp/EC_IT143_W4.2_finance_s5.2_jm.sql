USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_finance_total_expenses_jm;
GO

CREATE TABLE dbo.t_finance_total_expenses_jm (
    total_expenses DECIMAL(10, 2),
    report_date DATETIME DEFAULT GETDATE()
);
GO

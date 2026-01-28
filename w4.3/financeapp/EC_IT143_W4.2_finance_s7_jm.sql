USE EC_IT143_DA;
GO

CREATE OR ALTER PROCEDURE dbo.usp_finance_total_expenses_load_jm
AS
BEGIN
    TRUNCATE TABLE dbo.t_finance_total_expenses_jm;

    INSERT INTO dbo.t_finance_total_expenses_jm (total_expenses)
    SELECT total_expenses
    FROM dbo.v_finance_total_expenses_jm;
END;
GO

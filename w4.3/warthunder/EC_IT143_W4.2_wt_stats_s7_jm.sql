USE EC_IT143_DA;
GO

CREATE OR ALTER PROCEDURE dbo.usp_wt_avg_speed_load_jm
AS
BEGIN
    TRUNCATE TABLE dbo.t_wt_avg_speed_jm;

    INSERT INTO dbo.t_wt_avg_speed_jm (avg_speed_kmh)
    SELECT avg_speed_kmh
    FROM dbo.v_wt_avg_speed_jm;
END;
GO

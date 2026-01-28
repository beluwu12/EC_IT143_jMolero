USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_wt_avg_speed_jm;
GO

SELECT *
INTO dbo.t_wt_avg_speed_jm
FROM dbo.v_wt_avg_speed_jm;
GO

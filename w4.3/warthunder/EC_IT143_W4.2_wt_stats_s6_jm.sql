USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.t_wt_avg_speed_jm;

INSERT INTO dbo.t_wt_avg_speed_jm (avg_speed_kmh)
SELECT avg_speed_kmh
FROM dbo.v_wt_avg_speed_jm;
GO

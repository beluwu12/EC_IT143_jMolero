USE EC_IT143_DA;
GO

EXEC dbo.usp_wt_avg_speed_load_jm;

SELECT * FROM dbo.t_wt_avg_speed_jm;

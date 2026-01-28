USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_wt_avg_speed_jm;
GO

CREATE VIEW dbo.v_wt_avg_speed_jm AS
    SELECT AVG(max_speed_kmh) AS avg_speed_kmh
    FROM dbo.wt_vehicles_data_jm;
GO

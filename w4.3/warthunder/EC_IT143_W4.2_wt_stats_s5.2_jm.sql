USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_wt_avg_speed_jm;
GO

CREATE TABLE dbo.t_wt_avg_speed_jm (
    avg_speed_kmh INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
GO

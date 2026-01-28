USE EC_IT143_DA;
GO

-- 1. table structure
DROP TABLE IF EXISTS dbo.wt_vehicles_data_jm;
GO

CREATE TABLE dbo.wt_vehicles_data_jm (
    vehicle_id INT IDENTITY(1,1) PRIMARY KEY,
    vehicle_name VARCHAR(50),
    country VARCHAR(50),
    vehicle_type VARCHAR(20),
    rank_tier VARCHAR(10),
    max_speed_kmh INT
);
GO

-- 2. real War Thunder data
INSERT INTO dbo.wt_vehicles_data_jm (vehicle_name, country, vehicle_type, rank_tier, max_speed_kmh)
VALUES 
('M1A2 Abrams', 'USA', 'Tank', 'VII', 67),
('Leopard 2A6', 'Germany', 'Tank', 'VII', 72),
('T-80BVM', 'USSR', 'Tank', 'VII', 70),
('Vextra 105', 'France', 'Tank', 'VI', 120),
('Freccia', 'Italy', 'Tank', 'VII', 108),
('F-16C Fighting Falcon', 'USA', 'Aircraft', 'VIII', 2414),
('MiG-29SMT', 'USSR', 'Aircraft', 'VIII', 2450),
('Spitfire Mk Ia', 'UK', 'Aircraft', 'II', 578);
GO

-- 3. Does it work?
SELECT * FROM dbo.wt_vehicles_data_jm;

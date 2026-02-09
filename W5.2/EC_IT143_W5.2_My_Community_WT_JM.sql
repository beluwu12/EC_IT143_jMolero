-- Script: EC_IT143_W5.2_My_Community_WT_JM.sql
-- Author: Jeremy Molero
-- Date: 02/09/2026
-- Description: Answers 4 key questions about the War Thunder Community dataset.

USE EC_IT143_DA;
GO

-- Q1: Which country has the highest average speed for Top-Tier vehicles (Rank VII and VIII)?
-- Stakeholder: Competitive Player
-- Author: Jeremy Molero
SELECT TOP 1
    nation,
    AVG(max_speed_kmh) AS avg_top_tier_speed
FROM dbo.t_wt_vehicles_jm
WHERE rank IN ('VII', 'VIII')
GROUP BY nation
ORDER BY avg_top_tier_speed DESC;
GO

-- Q2: What is the average repair cost per rank for each country?
-- Stakeholder: New Player
-- Author: Jeremy Molero
SELECT
    nation,
    rank,
    AVG(repair_cost_sl) AS avg_repair_cost
FROM dbo.t_wt_vehicles_jm
GROUP BY nation, rank
ORDER BY nation, rank;
GO

-- Q3: Which vehicles in the USA have a repair cost greater than 5,000 but a reload time of less than 10 seconds?
-- Stakeholder: Jorge Alberto Martinez Cea
-- Author: Jorge Alberto Martinez Cea
SELECT
    name AS vehicle_name,
    repair_cost_sl,
    reload_time_s
FROM dbo.t_wt_vehicles_jm
WHERE nation = 'USA'
  AND repair_cost_sl > 5000
  AND reload_time_s < 10.0;
GO

-- Q4: How does the average repair cost compare between Tanks vs Aircraft at higher ranks (Rank V+)?
-- Stakeholder: Giovanna Haminie de França Ferreira
-- Author: Giovanna Haminie de França Ferreira
SELECT
    vehicle_type,
    AVG(repair_cost_sl) AS avg_high_tier_repair_cost
FROM dbo.t_wt_vehicles_jm
WHERE rank IN ('V', 'VI', 'VII', 'VIII')
GROUP BY vehicle_type;
GO

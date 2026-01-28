-- Drop table to reset structural changes if needed
DROP TABLE IF EXISTS dbo.t_hello_world_jm;

-- Re-create table with specific constraints
CREATE TABLE dbo.t_hello_world_jm (
    my_message VARCHAR(25) NOT NULL
    , created_at DATETIME DEFAULT GETDATE()
);

CREATE PROCEDURE dbo.usp_hello_world_load_jm
AS
BEGIN
    -- Reload data
    TRUNCATE TABLE dbo.t_hello_world_jm;

    INSERT INTO dbo.t_hello_world_jm (my_message)
    SELECT my_message
    FROM dbo.v_hello_world_load_jm;
END;

-- Execute the procedure
EXEC dbo.usp_hello_world_load_jm;

-- Check results
SELECT * FROM dbo.t_hello_world_jm;

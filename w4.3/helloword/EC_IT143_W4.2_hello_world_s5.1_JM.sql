-- Q: How do I say hello to the world using SQL?
-- A: By selecting a string literal 'Hello World'.

-- Create table from view
SELECT *
INTO dbo.t_hello_world_jm
FROM dbo.v_hello_world_load_jm;

-- Q: How do I say hello to the world using SQL?
-- A: By selecting a string literal 'Hello World'.

CREATE VIEW dbo.v_hello_world_load_jm AS
    SELECT 'Hello World' AS my_message;

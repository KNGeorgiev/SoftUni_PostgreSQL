CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR
AS
$$
DECLARE
	difficulty_level VARCHAR;
BEGIN
	CASE
    WHEN level <= 40 THEN difficulty_level := 'Normal Difficulty';
    WHEN 40 < level AND level <= 60 THEN difficulty_level := 'Nightmare Difficulty';
    ELSE difficulty_level := 'Hell Difficulty';
    END CASE;
	RETURN difficulty_level;
END;
$$
LANGUAGE plpgsql;

SELECT
	user_id,
	level,
	cash,
	fn_difficulty_level(level)
FROM users_games
ORDER BY user_id ASC;
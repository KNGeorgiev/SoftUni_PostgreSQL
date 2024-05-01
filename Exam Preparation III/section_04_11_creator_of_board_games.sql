CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
	creator_name VARCHAR(30)
)
RETURNS INT
AS
$$
	DECLARE
		total_count INT;
	BEGIN
		SELECT
			COUNT(*) INTO total_count
		FROM creators AS c
			JOIN creators_board_games AS cbg
			ON cbg.creator_id = c.id
				JOIN board_games AS bg
				ON bg.id = cbg.board_game_id
		WHERE c.first_name = creator_name;
	RETURN total_count;
	END;
$$
LANGUAGE plpgsql;
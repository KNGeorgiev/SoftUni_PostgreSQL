SELECT 
	id,
	CONCAT_WS(' ', first_name, last_name) AS creator_name,
	c.email AS email
FROM creators AS c
	LEFT JOIN creators_board_games AS cbg
	ON cbg.creator_id = c.id
WHERE
	cbg.creator_id IS NULL;
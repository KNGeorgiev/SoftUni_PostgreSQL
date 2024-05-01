SELECT
	c.last_name AS last_name,
	CEIL(AVG(bg.rating)) AS average_rating,
	p.name AS publisher_name
FROM publishers AS p
	JOIN board_games AS bg
	ON bg.publisher_id = p.id
		JOIN creators_board_games AS cbg
		ON cbg.board_game_id = bg.id
			JOIN creators AS c
			ON c.id = cbg.creator_id
WHERE p.name = 'Stonemaier Games'
GROUP BY c.last_name, p.name
ORDER BY average_rating DESC;
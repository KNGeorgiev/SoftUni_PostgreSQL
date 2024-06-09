SELECT
	t.id AS team_id,
	t.name AS team_name,
	COUNT(p."id") AS player_count,
	fan_base
FROM
	teams AS t
LEFT JOIN
	players AS p
ON 
	p.team_id = t."id"
GROUP BY
	t."id"
HAVING
	fan_base > 30000
ORDER BY
	player_count DESC,
	fan_base DESC;
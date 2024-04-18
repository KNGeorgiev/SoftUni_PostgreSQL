SELECT
	r.start_point,
	r.end_point,
	r.leader_id,
	CONCAT_WS(' ', c.first_name, c.last_name)
FROM 
	routes AS r
JOIN
	campers AS c
ON
	c.id = r.leader_id;
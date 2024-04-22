SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM mountains AS m
	JOIN peaks as p
	ON m.id = p.mountain_id
		JOIN mountains_countries AS mc
		ON m.id = mc.mountain_id
WHERE 
	mc.country_code = 'BG'
	AND
	p.elevation > 2835
	
ORDER BY elevation DESC
UPDATE countries
SET country_name = 'Burma'
	WHERE country_name = 'Myanmar'
;

INSERT INTO monasteries(monastery_name, country_code)
VALUES
	('Hanga Abbey', 'TZ');

SELECT
	con.continent_name AS continent_name,
	cou.country_name AS country_name,
	COUNT(mon.monastery_name) AS monasteries_count
FROM continents AS con
	LEFT JOIN countries AS cou
	USING(continent_code)
		LEFT JOIN monasteries AS mon
		USING(country_code)
WHERE NOT cou.three_rivers OR cou.three_rivers IS NULL
GROUP BY country_name, continent_name
ORDER BY 
	monasteries_count DESC,
	country_name ASC;
SELECT
	a.name AS address,
	
	CASE
		WHEN EXTRACT(hour FROM crs.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	
	crs.bill,
	cts.full_name,
	cs.make,
	cs.model,
	cgs.name
	
FROM addresses AS a
	JOIN courses AS crs
	ON crs.from_address_id = a.id
	
	JOIN clients AS cts
	ON cts.id = crs.client_id

	JOIN cars AS cs
	ON crs.car_id = cs.id

	JOIN categories AS cgs
	ON cgs.id = cs.category_id

ORDER BY crs.id
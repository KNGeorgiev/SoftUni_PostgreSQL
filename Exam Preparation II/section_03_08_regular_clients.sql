SELECT
	clients.full_name,
	COUNT(courses.car_id) AS count_of_cars,
	SUM(courses.bill) AS total_sum
	
FROM courses
	JOIN clients
	ON clients.id = courses.client_id
	
GROUP BY 
	clients.full_name

HAVING 
	COUNT(courses.car_id) > 1
	AND
	SUBSTRING(clients.full_name, 2, 1) = 'a'
	
ORDER BY clients.full_name
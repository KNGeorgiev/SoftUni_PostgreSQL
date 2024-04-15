SELECT
	id,
	CONCAT_WS(' ', first_name, last_name),
	job_title
FROM
	employees
ORDER BY first_name ASC
LIMIT 50
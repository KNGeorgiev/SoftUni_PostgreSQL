SELECT
	title
FROM books
WHERE LIKE(title, 'The%')
ORDER BY id ASC
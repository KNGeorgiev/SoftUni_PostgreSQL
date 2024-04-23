CREATE PROCEDURE sp_increase_salaries(department_name VARCHAR)
AS
$$
BEGIN
	UPDATE employees
	SET salary = salary * 1.05
	WHERE department_id =
	(
	SELECT
		d.department_id
	FROM employees AS e
		JOIN departments AS d
		USING(department_id)
	WHERE name = department_name
	GROUP BY d.department_id
	);
END
$$
LANGUAGE plpgsql;
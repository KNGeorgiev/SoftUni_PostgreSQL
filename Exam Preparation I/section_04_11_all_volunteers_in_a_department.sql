CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(
	searched_volunteers_department VARCHAR(30)
)
RETURNS INT
AS
$$
	DECLARE 
		volunteer_count INT;
	BEGIN
		SELECT
			COUNT(v.id) INTO volunteer_count
		FROM
			volunteers_departments AS vd
		JOIN 
			volunteers AS v
		ON
			v.department_id = vd.id
		WHERE
			searched_volunteers_department = vd.department_name;
		RETURN
			volunteer_count;
	END;
$$
LANGUAGE plpgsql;
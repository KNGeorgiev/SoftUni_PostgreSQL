CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INTEGER
AS
$$
	DECLARE
		number_of_courses INT;
	BEGIN
	SELECT
		COUNT(*) INTO number_of_courses
	FROM courses AS crs
		JOIN clients AS cls
		ON crs.client_id = cls.id
	WHERE
		cls.phone_number = phone_num;
	RETURN
		number_of_courses;
	END;
$$
LANGUAGE plpgsql
CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR)
RETURNS INT AS
$$
	DECLARE
		city_count INT;
	BEGIN
		SELECT
			COUNT(*) INTO city_count
		FROM towns AS t
			JOIN addresses AS a
			USING(town_id)
				JOIN employees AS e
				USING(address_id)
		WHERE t.name = town_name;
		RETURN city_count;
	END;
$$
LANGUAGE plpgsql;
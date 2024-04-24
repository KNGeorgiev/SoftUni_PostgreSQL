CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS VARCHAR AS
$$
DECLARE 
	full_name VARCHAR(101);
BEGIN
	full_name := CONCAT_WS(' ', INITCAP(first_name), INITCAP(last_name));
	RETURN full_name;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
AS
$$
DECLARE
	holder_information RECORD;
BEGIN
	FOR holder_information IN
		SELECT
			CONCAT_WS(' ', first_name, last_name) AS full_name,
			SUM(balance) AS total_balance
		FROM account_holders AS ah
			JOIN accounts AS a
			ON  a.account_holder_id = ah.id
		GROUP BY full_name
		HAVING SUM(balance) > searched_balance
		ORDER BY full_name ASC
	LOOP
		RAISE NOTICE '% - %', holder_information.full_name, holder_information.total_balance;
	END LOOP;
END;
$$
LANGUAGE plpgsql;
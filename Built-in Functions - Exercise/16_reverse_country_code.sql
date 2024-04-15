UPDATE countries
SET country_code = LOWER(REVERSE(LEFT(country_code, 3)))
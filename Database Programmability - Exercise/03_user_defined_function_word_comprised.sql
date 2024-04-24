CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50), 
    word VARCHAR(50)
)
RETURNS BOOLEAN AS
$$
DECLARE 
    i INT := 1;
    current_char CHAR;
    letter_count INT;
BEGIN
    -- Convert both set_of_letters and word to lowercase
    set_of_letters := LOWER(set_of_letters);
    word := LOWER(word);
    
    -- Remove spaces and special characters from the word
    word := REGEXP_REPLACE(word, '[^a-z]', '', 'g');
    
    -- Initialize letter_count to 0
    letter_count := 0;

    -- Iterate through each character of the word
    WHILE i <= LENGTH(word) LOOP
        current_char := SUBSTRING(word FROM i FOR 1);
        
        -- Check if the current character exists in set_of_letters
        IF POSITION(current_char IN set_of_letters) > 0 THEN
            letter_count := letter_count + 1;
        END IF;
        
        -- Move to the next character
        i := i + 1;
    END LOOP;
    
    -- Check if the word can be composed from set_of_letters
    RETURN letter_count = LENGTH(word);
END;
$$
LANGUAGE plpgsql;

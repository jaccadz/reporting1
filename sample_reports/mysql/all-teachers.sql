-- All Teachers
-- This report lets you view all teachers that are registered.
-- VARIABLE: { 
--   name: "gender", 
--   display: "Gender just for the char", 
--   type: "select", 
--   options: ["male","female","all"] 
-- }



SELECT
    id as `Teacher Id`,
    CONCAT(first_name, " ", surname) as `Teacher Name`,
    accreditation_number as `Accreditation Number`,
    CONCAT(address_street, " ", address_city, " ", address_state, " ", address_postcode, " ", address_country) as `Address`,
    contact_number as `Contact Number`
FROM
    teacher
WHERE
    gender = "{{ gender }}"
GROUP BY
	first_name
LIMIT 1000
-- WHERE
--    created_at BETWEEN "{{ range.start }}" AND "{{ range.end }}"

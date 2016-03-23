-- All Schools
-- This report lets you view all school
-- VARIABLE: { 
--   name: "name", 
--   display: "Name of school"
-- }

SELECT
    school.id as `ID`,
    school.name as `School Name`,
    school.phone as `Contact Number`,
	school.email as `Email`,
    CONCAT(school.address_street, " ", school.address_city, " ", school.address_state, " ", school.address_postcode, " ", school.address_country) as `Address`
FROM
    school
WHERE
    name LIKE '%{{ name }}%'
LIMIT 1000
-- WHERE
--    created_at BETWEEN "{{ range.start }}" AND "{{ range.end }}"

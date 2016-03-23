-- Search Teacher
-- Enter Teacher ID
-- VARIABLE: { name: "id", display: "Teacher Id" }

SELECT
    id as `Teacher Id`,
    CONCAT(first_name, " ", surname) as `Teacher Name`,
    accreditation_number as `Accreditation Number`,
    CONCAT(address_street, " ", address_city, " ", address_state, " ", address_postcode, " ", address_country) as `Address`,
    contact_number as `Contact Number`
FROM
    teacher
WHERE
    id = "{{ id }}"
LIMIT 1000

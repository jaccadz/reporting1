-- Teacher Availability
-- This report lets you view all teachers that are available.
-- VARIABLE: { 
--      name: "date1", 
--      display: "Date",
--      type: "daterange", 
--      default: { start: "yesterday", end: "yesterday" }
-- }
-- FILTER: { 
--      column: "Customer Name", 
--      filter: "drilldown",
--      params: {
--          macros: { "id": { column: "Customer Id" } },
--          report: "drilldown/customer-orders.sql"
--      }
-- }


SELECT
    teacher.user_id as `Id`,
    CONCAT(teacher.first_name, " ", teacher.surname) as `Teacher Name`,
    teacher.accreditation_number as `Accreditation Number`,
    CONCAT(teacher.address_street, " ", teacher.address_city, " ", teacher.address_state, " ", teacher.address_postcode, " ", teacher.address_country) as `Address`,
    teacher.contact_number as `Contact Number`,
	teacher_availability.date as `Date`,
	teacher_availability.status_am as `AM`,
	teacher_availability.status_pm as `PM` 
FROM
    teacher_availability
INNER JOIN teacher ON teacher_availability.user_id = teacher.user_id
WHERE
    (teacher_availability.date BETWEEN "{{ date1.start }}" AND "{{ date1.end }}") AND teacher_availability.status_am = "available" 

LIMIT 1000
-- WHERE
--    created_at BETWEEN "{{ range.start }}" AND "{{ range.end }}"

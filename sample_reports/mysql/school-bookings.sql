-- School bookings
-- This report lets you view all teachers that are registered.
-- VARIABLE: { 
--   name: "name", 
--   display: "Name of school"
-- }
-- VARIABLE: { 
--      name: "date1", 
--      display: "Date",
--      type: "daterange", 
--      default: { start: "yesterday", end: "yesterday" }
-- }

SELECT DISTINCT
	school_bookings.school_id as `School ID`,
	school.`name` as `Name of School`,
	school.email as `Email`,
	Count(school_bookings.school_id) AS `No. of bookings`
FROM
	school_bookings
INNER JOIN school ON school.id = school_bookings.school_id
INNER JOIN school_bookings_dates ON school_bookings_dates.school_booking_id = school_bookings.id
WHERE
    school.name LIKE '%{{ name }}%' AND (school_bookings_dates.date BETWEEN "{{ date1.start }}" AND "{{ date1.end }}")
GROUP BY
	school.`name`
LIMIT 1000
-- WHERE
--    created_at BETWEEN "{{ range.start }}" AND "{{ range.end }}"

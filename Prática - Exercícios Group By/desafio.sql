SELECT
    s.name AS school,
    c.name AS course,
    COUNT(e."userId") AS "studentsCount"
FROM
    educations e
    JOIN schools s ON e."schoolId" = s.id
    JOIN courses c ON e."courseId" = c.id
WHERE
    e.status = 'ongoing'
    OR e.status = 'finished'
    GROUP BY s.name, c.name ORDER BY "studentsCount" DESC LIMIT 3;
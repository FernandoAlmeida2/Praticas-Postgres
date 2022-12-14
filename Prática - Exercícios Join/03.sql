SELECT
    educations."userId" AS id,
    users.name,
    courses.name AS course,
    schools.name AS school,
    educations."endDate"
FROM
    educations
    JOIN users ON educations."userId" = users.id
    JOIN courses ON educations."courseId" = courses.id
    JOIN schools ON educations."schoolId" = schools.id
WHERE
    educations.status = 'finished' AND educations."userId" = 30;
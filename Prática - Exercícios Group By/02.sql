SELECT
    "userId" AS id,
    COUNT(*) AS educations
FROM
    educations
WHERE
    status = 'finished'
GROUP BY
    "userId"
ORDER BY
    educations DESC;
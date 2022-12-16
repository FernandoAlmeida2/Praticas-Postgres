SELECT
    MAX(j.salary) AS "maximumSalary",
    r.name AS role
FROM
    jobs j
    JOIN roles r ON j."roleId" = r.id
WHERE
    j.active
GROUP BY
    r.name ORDER BY "maximumSalary";
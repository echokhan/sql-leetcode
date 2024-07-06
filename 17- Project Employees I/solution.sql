/* Write your T-SQL query statement below */
SELECT
    p.project_id, ROUND(AVG(CAST(experience_years AS DECIMAL(10,2))), 2)average_years
FROM
    Project p LEFT JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY 
    p.project_id;

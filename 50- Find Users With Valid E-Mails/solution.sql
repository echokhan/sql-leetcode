/* Write your T-SQL query statement below */
SELECT
    user_id, name, mail
FROM
    Users
WHERE
    LEFT(mail, CHARINDEX('@', mail)-1) NOT LIKE '%[^a-zA-Z0-9_.-]%' --ensures that email only contains allowed characters
    AND mail LIKE '[a-zA-Z]%' --ensure that email starts with alphabets
    AND RIGHT(mail, LEN(mail) - CHARINDEX('@', mail)) = 'leetcode.com' --ensure that email ends with leetcode.com
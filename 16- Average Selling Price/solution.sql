/* Write your T-SQL query statement below */
SELECT 
    p.product_id, 
    CASE WHEN SUM(units) IS NULL THEN 0 ELSE ROUND(CAST(SUM(price * COALESCE(units, 0)) AS DECIMAL(10,2))/SUM(COALESCE(units, 0)), 2) END AS average_price
FROM
    Prices p LEFT JOIN UnitsSold us
    ON p.product_id = us.product_id
    AND us.purchase_date >= p.start_date
    AND us.purchase_date <= p.end_date
GROUP BY p.product_id;
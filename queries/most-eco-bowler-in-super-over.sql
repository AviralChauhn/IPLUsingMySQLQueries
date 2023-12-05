USE IPL ;
SELECT
    bowler,
    ROUND(SUM(total_runs) / (COUNT(*) / 6), 2) AS economy
FROM
    deliveries
WHERE
    is_super_over = 1
GROUP BY
    bowler
ORDER BY
    economy
LIMIT 1;

USE IPL;
SELECT
    bowler,
    ROUND(SUM(total_runs) / (COUNT(*) / 6), 2) AS economy
FROM
    deliveries
JOIN
    matches ON deliveries.match_id = matches.id
WHERE
    matches.season = '2015'
GROUP BY
    bowler
ORDER BY
    economy
LIMIT 10;

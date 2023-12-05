use IPL;
SELECT
    m.season,
    d.batsman,
    ROUND(SUM(d.batsman_runs) * 100.0 / COUNT(d.ball), 2) AS strike_rate
FROM
    deliveries AS d
JOIN
    matches AS m ON d.match_id = m.id
WHERE
    d.batsman = 'V Kohli'
GROUP BY
    m.season, d.batsman
ORDER BY
    m.season;
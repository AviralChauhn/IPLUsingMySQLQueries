use IPL;
SELECT
    player_dismissed,
    bowler,
    COUNT(*) AS dismissal_count
FROM
    deliveries
WHERE
    player_dismissed !=""
GROUP BY
    player_dismissed, bowler
ORDER BY
    dismissal_count DESC
LIMIT 1;
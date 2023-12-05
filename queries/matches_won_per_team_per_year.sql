use IPL;
SELECT
    season AS year,
    team,
    COUNT(*) AS matches_won
FROM
    (
        SELECT
            season,
            winner AS team
        FROM
            matches
        WHERE
            winner IS NOT NULL

        UNION ALL

        SELECT
            season,
            team2 AS team
        FROM
            matches
        WHERE
            winner IS NULL AND team2 IS NOT NULL

        UNION ALL

        SELECT
            season,
            team1 AS team
        FROM
            matches
        WHERE
            winner IS NULL AND team1 IS NOT NULL
    ) AS subquery
GROUP BY
    season, team;

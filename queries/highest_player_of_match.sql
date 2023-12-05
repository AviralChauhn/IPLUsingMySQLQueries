use IPL;
SELECT
    season,
    player_of_match,
    COUNT(*) AS num_awards
FROM
    matches
GROUP BY
    season, player_of_match
HAVING
    COUNT(*) = (
        SELECT COUNT(*)
        FROM matches AS m2
        WHERE m2.season = matches.season
        GROUP BY player_of_match
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
ORDER BY num_awards DESC,season,player_of_match;

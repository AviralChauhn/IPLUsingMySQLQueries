USE IPL;

SELECT 
    team, 
    COUNT(*) AS toss_and_match_wins
FROM (
    SELECT 
        winner AS team
    FROM matches
    WHERE toss_winner = winner
) AS toss_and_match
GROUP BY team ;
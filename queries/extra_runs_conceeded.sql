USE IPL;

SELECT d.bowling_team,SUM(d.extra_runs) AS extra_runs_conceded
FROM deliveries d
JOIN matches m ON d.match_id = m.id
WHERE m.season = '2016'
GROUP BY d.bowling_team;

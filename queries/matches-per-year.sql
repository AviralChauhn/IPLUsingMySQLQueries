USE IPL;

SELECT season,COUNT(*) AS matches_played FROM matches GROUP BY season;
-- Выводит список команд с количеством забитых и пропущенных голов, отсортированных по забитым
SELECT 
    t.TeamID,
    t.Name AS TeamName,
    COALESCE(SUM(CASE WHEN t.TeamID = m.HomeTeamID THEN m.HomeScore 
                      WHEN t.TeamID = m.AwayTeamID THEN m.AwayScore END), 0) AS Goals_Scored,
    COALESCE(SUM(CASE WHEN t.TeamID = m.HomeTeamID THEN m.AwayScore 
                      WHEN t.TeamID = m.AwayTeamID THEN m.HomeScore END), 0) AS Goals_Conceded
FROM fantasy_league.Teams t
LEFT JOIN fantasy_league.Matches m 
    ON t.TeamID = m.HomeTeamID OR t.TeamID = m.AwayTeamID
GROUP BY t.TeamID, t.Name
ORDER BY Goals_Scored DESC;
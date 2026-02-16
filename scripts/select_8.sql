-- Строит турнирную таблицу: очки, игры, победы, ничьи и поражения для каждой команды
SELECT 
    t.TeamID,
    t.Name AS TeamName,
    COALESCE(SUM(points_table.Points), 0) AS Total_Points,
    COUNT(points_table.MatchID) AS Games_Played,
    SUM(CASE WHEN points_table.Result = 'Win' THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN points_table.Result = 'Draw' THEN 1 ELSE 0 END) AS Draws,
    SUM(CASE WHEN points_table.Result = 'Loss' THEN 1 ELSE 0 END) AS Losses
FROM fantasy_league.Teams t
LEFT JOIN (
    SELECT 
        MatchID,
        HomeTeamID AS TeamID,
        CASE 
            WHEN HomeScore > AwayScore THEN 3
            WHEN HomeScore = AwayScore THEN 1
            ELSE 0
        END AS Points,
        CASE 
            WHEN HomeScore > AwayScore THEN 'Win'
            WHEN HomeScore = AwayScore THEN 'Draw'
            ELSE 'Loss'
        END AS Result
    FROM fantasy_league.Matches

    UNION ALL

    SELECT 
        MatchID,
        AwayTeamID AS TeamID,
        CASE 
            WHEN AwayScore > HomeScore THEN 3
            WHEN AwayScore = HomeScore THEN 1
            ELSE 0
        END AS Points,
        CASE 
            WHEN AwayScore > HomeScore THEN 'Win'
            WHEN AwayScore = HomeScore THEN 'Draw'
            ELSE 'Loss'
        END AS Result
    FROM fantasy_league.Matches
) AS points_table ON t.TeamID = points_table.TeamID
GROUP BY t.TeamID, t.Name
ORDER BY Total_Points DESC, Wins DESC;
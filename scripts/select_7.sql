-- Показывает лучшего бомбардира в каждой команде (игрока с наибольшим количеством голов)
SELECT
    sub.TeamID,
    t.Name AS TeamName,
    sub.PlayerID,
    p.First_name,
    p.Last_name,
    sub.TotalGoals
FROM (
    SELECT 
        p.TeamID,
        s.PlayerID,
        SUM(s.Goals) AS TotalGoals,
        RANK() OVER (PARTITION BY p.TeamID ORDER BY SUM(s.Goals) DESC) AS rk
    FROM fantasy_league.Player_Stats s
    JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
    GROUP BY p.TeamID, s.PlayerID
) sub
JOIN fantasy_league.Players p ON sub.PlayerID = p.PlayerID
JOIN fantasy_league.Teams t ON sub.TeamID = t.TeamID
WHERE sub.rk = 1
ORDER BY sub.TeamID;
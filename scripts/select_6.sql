-- Выводит команды, у которых игроки получили хотя бы одну жёлтую карточку, отсортировано по убыванию
SELECT 
    t.TeamID,
    t.Name AS TeamName,
    SUM(s.YellowCards) AS Total_YellowCards
FROM fantasy_league.Player_Stats s
JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
JOIN fantasy_league.Teams t ON p.TeamID = t.TeamID
GROUP BY t.TeamID, t.Name
HAVING SUM(s.YellowCards) > 0
ORDER BY Total_YellowCards DESC;
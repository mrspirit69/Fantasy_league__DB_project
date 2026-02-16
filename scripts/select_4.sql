-- Показывает, сколько лет каждый игрок провёл в каждой команде
SELECT 
    p.First_name,
    p.Last_name,
    t.Name AS TeamName,
    SUM(EXTRACT(YEAR FROM AGE(h.End_contract, h.Start_contract))) AS TotalYears
FROM fantasy_league.Player_History h
JOIN fantasy_league.Players p ON h.PlayerID = p.PlayerID
JOIN fantasy_league.Teams t ON h.TeamID = t.TeamID
GROUP BY p.PlayerID, t.TeamID, p.First_name, p.Last_name, t.Name
ORDER BY p.Last_name, t.Name;
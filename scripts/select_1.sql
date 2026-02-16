-- Выводит топ-3 лучших бомбардиров по суммарному количеству голов
SELECT p.First_name, p.Last_name, SUM(s.Goals) AS Total_Goals
FROM fantasy_league.Player_Stats s
JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
GROUP BY p.PlayerID, p.First_name, p.Last_name
ORDER BY Total_Goals DESC
LIMIT 3;
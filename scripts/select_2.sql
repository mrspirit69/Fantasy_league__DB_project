-- Выводит топ-3 лучших ассистентов по суммарному количеству голевых передач
SELECT p.First_name, p.Last_name, SUM(s.Assists) AS Total_Assists
FROM fantasy_league.Player_Stats s
JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
GROUP BY p.PlayerID, p.First_name, p.Last_name
ORDER BY Total_Assists DESC
LIMIT 3;
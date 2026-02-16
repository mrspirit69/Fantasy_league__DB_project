-- Выводит топ-3 игроков, дольше всех игравших в лиге (по сумме лет в истории контрактов)
SELECT 
    p.First_name,
    p.Last_name,
    SUM(EXTRACT(YEAR FROM AGE(h.End_contract, h.Start_contract))) AS Total_Years
FROM fantasy_league.Player_History h
JOIN fantasy_league.Players p ON h.PlayerID = p.PlayerID
GROUP BY p.PlayerID, p.First_name, p.Last_name
ORDER BY Total_Years DESC
LIMIT 3;
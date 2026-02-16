-- Выводит самую дорогую команду по рыночной стоимости
SELECT 
    TeamID, 
    Name AS TeamName, 
    Networth
FROM fantasy_league.Teams
ORDER BY Networth DESC
LIMIT 1;
-- Выводит трёх самых молодых менеджеров и их возраста
SELECT 
    ManagerID,
    First_name,
    Last_name,
    Country,
    BirthDate,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, BirthDate)) AS Age
FROM fantasy_league.Managers
ORDER BY BirthDate DESC
LIMIT 3;
USE SportsDB;
GO

-- 1. Порожні імена спортсменів
SELECT * FROM Athlete WHERE FullName IS NULL;

-- 2. Спортсмени без команди
SELECT * FROM Athlete WHERE Team IS NULL OR Team = '';

-- 3. Нереалістичні результати
SELECT * FROM Result WHERE Score < 0 OR Score > 1000;

-- 4. Дати змагань у майбутньому
SELECT * FROM Result WHERE CompetitionDate > GETDATE();

-- 5. Кількість активних спортсменів
SELECT COUNT(*) AS ActiveCount FROM Athlete WHERE Status = 'Активний';

-- 6. Підрахунок результатів по кожному виду спорту
SELECT S.Name, COUNT(R.ResultID) AS ResultCount
FROM Sportsman S
LEFT JOIN Result R ON S.SportID = R.SportID
GROUP BY S.Name;

-- 7. Повторювані спортсмени
SELECT FullName, COUNT(*) AS duplicates
FROM Athlete
GROUP BY FullName
HAVING COUNT(*) > 1;

-- 8. Повторювані види спорту
SELECT Name, COUNT(*) AS duplicates
FROM Sportsman
GROUP BY Name
HAVING COUNT(*) > 1;

-- 9. Середній результат по кожному виду спорту
SELECT S.Name AS Sport, AVG(R.Score) AS AvgScore
FROM Result R
JOIN Sportsman S ON R.SportID = S.SportID
GROUP BY S.Name;

-- 10. Найкращий спортсмен (за середнім результатом)
SELECT TOP 1 A.FullName, AVG(R.Score) AS AvgScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
GROUP BY A.FullName
ORDER BY AvgScore DESC;

-- 11. Кількість змагань у кожному місті
SELECT Location, COUNT(DISTINCT CompetitionName) AS Competitions
FROM Result
GROUP BY Location;

USE SportsDB;
GO
  
SELECT * FROM Athlete WHERE FullName IS NULL;


SELECT * FROM Athlete WHERE Team IS NULL OR Team = '';


SELECT * FROM Result WHERE Score < 0 OR Score > 1000;


SELECT * FROM Result WHERE CompetitionDate > GETDATE();


SELECT COUNT(*) AS ActiveCount FROM Athlete WHERE Status = 'Àêòèâíèé';


SELECT S.Name, COUNT(R.ResultID) AS ResultCount
FROM Sportsman S
LEFT JOIN Result R ON S.SportID = R.SportID
GROUP BY S.Name;


SELECT FullName, COUNT(*) AS duplicates
FROM Athlete
GROUP BY FullName
HAVING COUNT(*) > 1;

SELECT Name, COUNT(*) AS duplicates
FROM Sportsman
GROUP BY Name
HAVING COUNT(*) > 1;

SELECT S.Name AS Sport, AVG(R.Score) AS AvgScore
FROM Result R
JOIN Sportsman S ON R.SportID = S.SportID
GROUP BY S.Name;


SELECT TOP 1 A.FullName, AVG(R.Score) AS AvgScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
GROUP BY A.FullName
ORDER BY AvgScore DESC;


SELECT Location, COUNT(DISTINCT CompetitionName) AS Competitions
FROM Result
GROUP BY Location;


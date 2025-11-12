USE SportsDB;
GO

INSERT INTO Sportsman (Name, Unit, WorldRecord, RecordDate)
VALUES
('100 ì ñïðèíò', 'ñåêóíäè', '9,58', '2009-08-16'),
('Ìàðàôîí', 'ãîäèíè', '2,01', '2018-09-16'),
('Ïîòð³éíèé ñòðèáîê', 'ìåòðè', '8,95', '1991-08-30'),
('Ñòðèáêè ó âèñîòó', 'ìåòðè', '2,45', '1993-07-27'),
('Ìåòàííÿ ÿäðà', 'ìåòðè', '23,12', '1990-05-20'),
('Ìåòàííÿ ñïèñà', 'ìåòðè', '98,48', '1996-05-26'),
('Øòîâõàííÿ øòàíãè', 'ìåòðè', '6,18', '2020-02-15'),
('Ìåòàííÿ äèñêà', 'ìåòðè', '74,08', '1986-05-20'),
('400 ì ç áàð''ºðàìè', 'ñåêóíäè', '46,78', '2021-07-05'),
('800 ì á³ã', 'ñåêóíäè', '101,91', '2012-08-09');
GO

INSERT INTO Athlete (FullName, BirthYear, Rank, Team, Status, Email)
VALUES
('²âàí Ïåòðîâ', 1990, 'Ì³æíàðîäíèé', 'Êîìàíäà À', 'Àêòèâíèé', 'ivan.petrov@example.com'),
('Îëåíà Êîâàëü', 1992, 'Íàö³îíàëüíèé', 'Êîìàíäà Á', 'Àêòèâíèé', 'olena.koval@example.com'),
('Ìèõàéëî Øåâ÷åíêî', 1988, 'Ì³æíàðîäíèé', 'Êîìàíäà Â', 'Àêòèâíèé', 'mykhailo.shevchenko@example.com'),
('Ìàð³ÿ ²âàíåíêî', 1995, 'Ðåã³îíàëüíèé', 'Êîìàíäà À', 'Àêòèâíèé', 'maria.ivanenko@example.com'),
('Òàðàñ Äîðîø', 1991, 'Íàö³îíàëüíèé', 'Êîìàíäà Á', 'Àêòèâíèé', 'taras.dorosh@example.com'),
('Ë³ë³ÿ Ìàðòèíþê', 1993, 'Ì³æíàðîäíèé', 'Êîìàíäà Â', 'Àêòèâíèé', 'liliya.martyniuk@example.com'),
('Þð³é Òêà÷', 1989, 'Íàö³îíàëüíèé', 'Êîìàíäà À', 'Àêòèâíèé', 'yuriy.tkach@example.com'),
('Ñîô³ÿ Àíäð³ºíêî', 1996, 'Ðåã³îíàëüíèé', 'Êîìàíäà Á', 'Àêòèâíèé', 'sofiya.andrienko@example.com'),
('Ðîáåðò Á³ëèê', 1990, 'Ì³æíàðîäíèé', 'Êîìàíäà Â', 'Àêòèâíèé', 'robert.bilyk@example.com'),
('Îëüãà Ìàðòèí', 1994, 'Íàö³îíàëüíèé', 'Êîìàíäà À', 'Àêòèâíèé', 'olga.martin@example.com');
GO

INSERT INTO Result (CompetitionName, CompetitionDate, Location, SportID, AthleteID, Score)
VALUES
('×åìï³îíàò ñâ³òó', '2023-07-12', 'Êè¿â', 1, 1, 9.58),
('ªâðîïåéñüê³ ³ãðè', '2023-08-05', 'Ëüâ³â', 2, 2, 2.01),
('Íàö³îíàëüí³ çìàãàííÿ', '2022-09-10', 'Îäåñà', 3, 3, 8.95),
('Ñâ³òîâèé êóáîê', '2023-06-18', 'Õàðê³â', 4, 4, 2.45),
('Ì³æíàðîäíèé òóðí³ð', '2022-11-21', 'Äí³ïðî', 5, 5, 23.12),
('Îë³ìï³éñüê³ ³ãðè', '2021-08-07', 'Òîê³î', 6, 6, 98.48),
('Êîíòèíåíòàëüí³ ³ãðè', '2020-09-15', 'Áóäàïåøò', 7, 7, 6.18),
('×åìï³îíàò ªâðîïè', '2023-05-20', 'Áåðë³í', 8, 8, 74.08),
('Íàö³îíàëüíèé ÷åìï³îíàò', '2021-07-09', 'Êè¿â', 9, 9, 46.78),
('Ðåã³îíàëüí³ çìàãàííÿ', '2022-08-11', 'Ëüâ³â', 10, 10, 101.91);
GO

UPDATE Athlete
SET Email = 'updated.email@example.com'
WHERE FullName = '²âàí Ïåòðîâ';

-- Ïåðåâ³ðêà çì³íè
SELECT * 
FROM Athlete
WHERE FullName = '²âàí Ïåòðîâ';
GO

DELETE FROM Athlete
WHERE AthleteID NOT IN (SELECT DISTINCT AthleteID FROM Result);

SELECT * 
FROM Athlete;
GO

SELECT CompetitionName, CONVERT(NVARCHAR(10), CompetitionDate, 103) AS CompetitionDateUK
FROM Result;

SELECT FullName, CAST(BirthYear AS NVARCHAR(4)) AS BirthYearText
FROM Athlete;

--- Âèêîíàííÿ ³íäèâ³äóàëüíèõ çàâäàíü (Âàð³àíò ¹11)
--- Çàâäàííÿ 1 Âèâåñòè òàáëèöþ ðîçïîä³ëó ì³ñöü ó çìàãàíí³ "â³äêðèòèé ÷åìï³îíàò" ó ì³ñò³ "Âàñþêè" ïî "øàõàì" ó 2000 ð.
SELECT R.CompetitionName, R.Location, S.Name AS Sport, A.FullName, R.Score
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE R.CompetitionName = 'Â³äêðèòèé ÷åìï³îíàò'
  AND R.Location = 'Âàñþêè'
  AND S.Name = 'Øàõè'
  AND YEAR(R.CompetitionDate) = 2000;

  SELECT R.CompetitionName, R.Location, S.Name AS Sport, A.FullName, R.Score
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE R.CompetitionName = '×åìï³îíàò ñâ³òó'
  AND R.Location = 'Êè¿â'
  AND S.Name = '100 ì ñïðèíò'
  AND YEAR(R.CompetitionDate) = 2023;

  --- Çàâäàííÿ 2 Âèçíà÷èòè ñïîðòñìåí³â, ÿê³ âèñòóïàþòü á³ëüø í³æ ó 3 âèäàõ ñïîðòó
  SELECT A.FullName, COUNT(DISTINCT R.SportID) AS SportCount
FROM Athlete A
JOIN Result R ON A.AthleteID = R.AthleteID
GROUP BY A.FullName
HAVING COUNT(DISTINCT R.SportID) > 3;

INSERT INTO Result (CompetitionName, CompetitionDate, Location, SportID, AthleteID, Score)
VALUES
('Ë³òí³é êóáîê', '2023-06-01', 'Êè¿â', 2, 1, 2.05),  
('Ë³òí³é êóáîê', '2023-06-02', 'Êè¿â', 3, 1, 8.80),  
('Ë³òí³é êóáîê', '2023-06-03', 'Êè¿â', 4, 1, 2.40); 

--- Çàâäàííÿ 3 Âèçíà÷èòè íàéêðàùèé ïîêàçíèê ñïîðòñìåíà "Êîðîâà¿â" ó âèãëÿä³ ñïîðòó "ñòðèáêè â äîâæèíó"
SELECT MAX(R.Score) AS BestScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE A.FullName = 'Êîðîâà¿â'
  AND S.Name = 'Ñòðèáêè â äîâæèíó';

  SELECT MAX(R.Score) AS BestScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE A.FullName = '²âàí Ïåòðîâ'
  AND S.Name = '100 ì ñïðèíò';

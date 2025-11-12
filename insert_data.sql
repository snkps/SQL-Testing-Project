USE SportsDB;
GO

INSERT INTO Sportsman (Name, Unit, WorldRecord, RecordDate)
VALUES
('100 м спринт', 'секунди', '9,58', '2009-08-16'),
('Марафон', 'години', '2,01', '2018-09-16'),
('Потрійний стрибок', 'метри', '8,95', '1991-08-30'),
('Стрибки у висоту', 'метри', '2,45', '1993-07-27'),
('Метання ядра', 'метри', '23,12', '1990-05-20'),
('Метання списа', 'метри', '98,48', '1996-05-26'),
('Штовхання штанги', 'метри', '6,18', '2020-02-15'),
('Метання диска', 'метри', '74,08', '1986-05-20'),
('400 м з бар''єрами', 'секунди', '46,78', '2021-07-05'),
('800 м біг', 'секунди', '101,91', '2012-08-09');
GO

INSERT INTO Athlete (FullName, BirthYear, Rank, Team, Status, Email)
VALUES
('Іван Петров', 1990, 'Міжнародний', 'Команда А', 'Активний', 'ivan.petrov@example.com'),
('Олена Коваль', 1992, 'Національний', 'Команда Б', 'Активний', 'olena.koval@example.com'),
('Михайло Шевченко', 1988, 'Міжнародний', 'Команда В', 'Активний', 'mykhailo.shevchenko@example.com'),
('Марія Іваненко', 1995, 'Регіональний', 'Команда А', 'Активний', 'maria.ivanenko@example.com'),
('Тарас Дорош', 1991, 'Національний', 'Команда Б', 'Активний', 'taras.dorosh@example.com'),
('Лілія Мартинюк', 1993, 'Міжнародний', 'Команда В', 'Активний', 'liliya.martyniuk@example.com'),
('Юрій Ткач', 1989, 'Національний', 'Команда А', 'Активний', 'yuriy.tkach@example.com'),
('Софія Андрієнко', 1996, 'Регіональний', 'Команда Б', 'Активний', 'sofiya.andrienko@example.com'),
('Роберт Білик', 1990, 'Міжнародний', 'Команда В', 'Активний', 'robert.bilyk@example.com'),
('Ольга Мартин', 1994, 'Національний', 'Команда А', 'Активний', 'olga.martin@example.com');
GO

INSERT INTO Result (CompetitionName, CompetitionDate, Location, SportID, AthleteID, Score)
VALUES
('Чемпіонат світу', '2023-07-12', 'Київ', 1, 1, 9.58),
('Європейські ігри', '2023-08-05', 'Львів', 2, 2, 2.01),
('Національні змагання', '2022-09-10', 'Одеса', 3, 3, 8.95),
('Світовий кубок', '2023-06-18', 'Харків', 4, 4, 2.45),
('Міжнародний турнір', '2022-11-21', 'Дніпро', 5, 5, 23.12),
('Олімпійські ігри', '2021-08-07', 'Токіо', 6, 6, 98.48),
('Континентальні ігри', '2020-09-15', 'Будапешт', 7, 7, 6.18),
('Чемпіонат Європи', '2023-05-20', 'Берлін', 8, 8, 74.08),
('Національний чемпіонат', '2021-07-09', 'Київ', 9, 9, 46.78),
('Регіональні змагання', '2022-08-11', 'Львів', 10, 10, 101.91);
GO

UPDATE Athlete
SET Email = 'updated.email@example.com'
WHERE FullName = 'Іван Петров';

-- Перевірка зміни
SELECT * 
FROM Athlete
WHERE FullName = 'Іван Петров';
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

--- Виконання індивідуальних завдань (Варіант №11)
--- Завдання 1 Вивести таблицю розподілу місць у змаганні "відкритий чемпіонат" у місті "Васюки" по "шахам" у 2000 р.
SELECT R.CompetitionName, R.Location, S.Name AS Sport, A.FullName, R.Score
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE R.CompetitionName = 'Відкритий чемпіонат'
  AND R.Location = 'Васюки'
  AND S.Name = 'Шахи'
  AND YEAR(R.CompetitionDate) = 2000;

  SELECT R.CompetitionName, R.Location, S.Name AS Sport, A.FullName, R.Score
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE R.CompetitionName = 'Чемпіонат світу'
  AND R.Location = 'Київ'
  AND S.Name = '100 м спринт'
  AND YEAR(R.CompetitionDate) = 2023;

  --- Завдання 2 Визначити спортсменів, які виступають більш ніж у 3 видах спорту
  SELECT A.FullName, COUNT(DISTINCT R.SportID) AS SportCount
FROM Athlete A
JOIN Result R ON A.AthleteID = R.AthleteID
GROUP BY A.FullName
HAVING COUNT(DISTINCT R.SportID) > 3;

INSERT INTO Result (CompetitionName, CompetitionDate, Location, SportID, AthleteID, Score)
VALUES
('Літній кубок', '2023-06-01', 'Київ', 2, 1, 2.05),  
('Літній кубок', '2023-06-02', 'Київ', 3, 1, 8.80),  
('Літній кубок', '2023-06-03', 'Київ', 4, 1, 2.40); 

--- Завдання 3 Визначити найкращий показник спортсмена "Короваїв" у вигляді спорту "стрибки в довжину"
SELECT MAX(R.Score) AS BestScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE A.FullName = 'Короваїв'
  AND S.Name = 'Стрибки в довжину';

  SELECT MAX(R.Score) AS BestScore
FROM Result R
JOIN Athlete A ON R.AthleteID = A.AthleteID
JOIN Sportsman S ON R.SportID = S.SportID
WHERE A.FullName = 'Іван Петров'
  AND S.Name = '100 м спринт';

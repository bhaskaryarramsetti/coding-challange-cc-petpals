-- Coding Challenge - PetPals, The Pet Adoption Platform
--Name: bhaskar yarramsetti

-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.
-- 1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”.
IF DB_ID('Petpals') IS NOT NULL
BEGIN
    Drop DATABASE Petpals;
END
Go

CREATE DATABASE PetPals;

USE PetPals;

-- 2. Create tables for pets, shelters, donations, adoption events, and participants.
-- 3. Define appropriate primary keys, foreign keys, and constraints.
CREATE TABLE  Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(99),
    Age INT,
    Breed VARCHAR(99),
    Type VARCHAR(99),
    AvailableForAdoption BIT
);

CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY,
    Name VARCHAR(99),
    Location VARCHAR(99)
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(99),
    DonationType VARCHAR(99),
    DonationAmount DECIMAL,
    DonationItem VARCHAR(99),
    DonationDate DATETIME
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(99),
    EventDate DATETIME,
    Location VARCHAR(99)
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(99),
    ParticipantType VARCHAR(99),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);

-- Insert 10 entries into Pets table
INSERT INTO Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption)
VALUES
  (1, 'puppy', 2, 'Labrador', 'Dog', 1),
    (2, 'Misty', 1, 'Persian', 'Cat', 1),
    (3, 'julie', 3, 'German Shepherd', 'Dog', 0),
    (4, 'Cherry', 1, 'Pomeranian', 'Dog', 1),
    (5, 'Whiskers', 2, 'Siamese', 'Cat', 1),
    (6, 'Tommy', 4, 'Beagle', 'Dog', 1),
    (7, 'Coco', 1, 'Dachshund', 'Dog', 0),
    (8, 'Milo', 2, 'Ragdoll', 'Cat', 1),
    (9, 'Bella', 1, 'Golden Retriever', 'Dog', 1),
    (10, 'Luna', 3, 'Maine Coon', 'Cat', 1);

-- Insert 10 entries into Shelters table
INSERT INTO Shelters (ShelterID, Name, Location)
VALUES
     (1, 'Paws Haven', 'Mumbai'),
    (2, 'Hearts Shelter', 'Guntur'),
    (3, 'Whisker Haven', 'Bangalore'),
    (4, 'Rainbow Shelter', 'Chennai'),
    (5, 'Hopeful Paws', 'vizag'),
    (6, 'Furry Friends Shelter', 'Hyderabad'),
    (7, 'Pet Paradise', 'Pune'),
    (8, 'Joyful Tails', 'Ahmedabad'),
    (9, 'Caring Souls Shelter', 'Jaipur, '),
    (10, 'Sunshine Shelter', 'Lucknow');

-- Insert 10 entries into Donations table
INSERT INTO Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate)
VALUES
     (1, 'ram', 'Cash', 100.00, NULL, '2023-01-15 10:30:00'),
    (2, 'Lanya', 'Item', NULL, 'Pet Food', '2023-02-02 15:45:00'),
    (3, 'Ramya', 'Cash', 150.00, NULL, '2023-03-10 08:20:00'),
    (4, 'Bhumika', 'Item', NULL, 'Pet Toys', '2023-04-05 12:10:00'),
    (5, 'Muskan', 'Cash', 175.00, NULL, '2023-05-20 14:55:00'),
    (6, 'Poojitha', 'Item', NULL, 'Pet Bed', '2023-06-18 09:30:00'),
    (7, 'Arjun', 'Cash', 150.00, NULL, '2023-07-03 11:40:00'),
    (8, 'Priya', 'Item', NULL, 'Cat Litter', '2023-08-22 16:15:00'),
    (9, 'Rohansai', 'Cash', 190.00, NULL, '2023-09-14 13:25:00'),
    (10, 'Sneha', 'Item', NULL, 'Dog Leash', '2023-10-30 07:50:00');

-- Insert 10 entries into AdoptionEvents table
INSERT INTO AdoptionEvents (EventID, EventName, EventDate, Location)
VALUES
    (1, 'PetPal Adoption Day', '2023-01-25 11:00:00', 'Paws Haven, Mumbai'),
    (2, 'Furry Friends Fair', '2023-03-15 14:30:00', 'Hyderabad Pet Park'),
    (3, 'Adopt-a-Pet Carnival', '2023-05-05 12:00:00', 'Hopeful Paws Shelter, Kolkata'),
    (4, 'Whisker Wonderland', '2023-07-10 10:00:00', 'Whisker Haven, Bangalore'),
    (5, 'Joyful Tails Adoption Fest', '2023-09-02 15:00:00', 'Joyful Tails Shelter, Ahmedabad'),
    (6, 'Paws for Love', '2023-10-18 13:45:00', 'Pet Paradise, Pune'),
    (7, 'Sunshine Pet Expo', '2023-12-01 09:30:00', 'Sunshine Shelter, Lucknow'),
    (8, 'Hearts Shelter Adoption Drive', '2024-02-08 11:20:00', 'Hearts Shelter, Delhi'),
    (9, 'Caring Souls Pet Affair', '2024-04-03 16:00:00', 'Caring Souls Shelter, Jaipur'),
    (10, 'Rainbow Adoption Event', '2024-06-22 10:45:00', 'Rainbow Shelter, Chennai');

-- Insert 10 entries into Participants table
INSERT INTO Participants (ParticipantID, ParticipantName, ParticipantType, EventID)
VALUES
    (1, 'Sam', 'Shelter', 1),
    (2, 'Virat Kohli', 'Adopter', 1),
    (3, 'Rahul', 'Adopter', 2),
    (4, 'Akshar', 'Shelter', 2),
    (5, 'Thakur', 'Adopter', 6),
    (6, 'Vince', 'Shelter', 3),
    (7, 'Ronit', 'Shelter', 4),
    (8, 'Preethi', 'Adopter', 4),
    (9, 'Akanksha', 'Shelter', 8),
    (10, 'Mahesh', 'Adopter', 5);

SELECT * FROM Pets;
SELECT * FROM Shelters;
SELECT * FROM Donations;
SELECT * FROM AdoptionEvents;
SELECT * FROM Participants;

--5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
--   from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
--   the query filters out pets that are not available for adoption.

SELECT Name, Age, Breed, Type
FROM Pets
WHERE AvailableForAdoption = 1;

--6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered 
--for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query 
--joins the necessary tables to retrieve the participant names and types.

DECLARE @EventID INT = 6;
SELECT P.ParticipantName, P.ParticipantType
FROM Participants P
JOIN AdoptionEvents A ON P.EventID = A.EventID
WHERE A.EventID = @EventID;

--7. Create a stored procedure in SQL that allows a shelter to update its information (name and 
--   location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information. 
--   Ensure that the procedure performs the update and handles potential errors, such as an invalid shelter ID

DECLARE @ShelterID INT
DECLARE @ShelterName VARCHAR(99)
DECLARE @ShelterLocation VARCHAR(99)
SET @ShelterID = 9
SET @ShelterName = 'iskon'
SET @ShelterLocation = 'Trivandrum'
UPDATE Shelters SET Name = @ShelterName, Location = @ShelterLocation WHERE ShelterID = @ShelterID
SELECT * FROM Shelters WHERE ShelterID=@ShelterID;

--8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by 
--   shelter name) from the "Donations" table. The result should include the shelter name and the 
--   total donation amount. Ensure that the query handles cases where a shelter has received no donations.

SELECT S.Name, COALESCE(SUM(D. DonationAmount),0) AS [Total Donation Amount] 
FROM Donations D
RIGHT JOIN Shelters S ON D.DonationID = S.ShelterID
GROUP BY S.Name;

--9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an 
--   owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result set.

ALTER TABLE Pets
ADD OwnerID INT NULL; 

UPDATE Pets SET OwnerID =101 WHERE PetID=1;
UPDATE Pets SET OwnerID =NULL WHERE PetID=2;
UPDATE Pets SET OwnerID =102 WHERE PetID=3;
UPDATE Pets SET OwnerID =NULL WHERE PetID=4;
UPDATE Pets SET OwnerID =103 WHERE PetID=5;
UPDATE Pets SET OwnerID =104 WHERE PetID=6;
UPDATE Pets SET OwnerID =NULL WHERE PetID=7;
UPDATE Pets SET OwnerID =105 WHERE PetID=8;
UPDATE Pets SET OwnerID =106 WHERE PetID=9;
UPDATE Pets SET OwnerID =NULl WHERE PetID=10;
SELECT * FROM Pets;

SELECT Name, Age, Breed, Type FROM Pets 
WHERE OwnerID IS NULL;

--10. Write an SQL query that retrieves the total donation amount for each month and year

SELECT FORMAT(DonationDate, 'MMMM yyyy') AS [Month and Year],
    COALESCE(SUM(DonationAmount), 0) 
	AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');

--11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or 
--older than 5 years.

SELECT DISTINCT Breed,Age
FROM Pets
WHERE (Age BETWEEN 1 AND 3) OR (Age > 5);

--12. Retrieve a list of pets and their respective shelters where the pets are currently available for 
--adoption.

SELECT P.Name AS [PET NAME], S. Name AS [ShelterName]
FROM Pets P
JOIN Shelters S ON P. PetID = S. ShelterID
WHERE AvailableForAdoption = 1;

--13. Find the total number of participants in events organized by shelters located in specific city

SELECT COUNT(DISTINCT P.ParticipantID) AS [Total Participants]
FROM Shelters S
JOIN AdoptionEvents E ON S.Location = E.Location
JOIN Participants P ON E.EventID = P.EventID
WHERE S.Location = 'Lucknow';

--14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years

SELECT DISTINCT Breed,Age
FROM Pets
WHERE Age BETWEEN 1 AND 5;

--15. Find the pets that have not been adopted by selecting their information from the 'Pet' table

SELECT PetID, Name, Age, Breed, Type  FROM Pets 
WHERE AvailableForAdoption = 1;

--16.Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and User' tables.

-- Create User table

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(99)
);

-- Create Adoption table

CREATE TABLE Adoptions (
    AdoptionID INT PRIMARY KEY,
    PetID INT,
    AdopterID INT,
    AdoptionDate DATETIME,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID),
    FOREIGN KEY (AdopterID) REFERENCES Users(UserID)
);

--Inserting 4 Entries into Users Table.

INSERT INTO Users (UserID, UserName) VALUES
(1, 'Rasool'),
(2, 'Kirshna'),
(3, 'Will'),
(4, 'miller');

--Inserting 4 Entries into Adoptions Table.

INSERT INTO Adoptions (AdoptionID, PetID, AdopterID, AdoptionDate) VALUES
(1, 1, 1, '2023-04-20'),
(2, 2, 2, '2023-12-04'),
(3, 3, 3, '2023-05-24'),
(4, 4, 4, '2023-11-27');

-- Retrieve names of adopted pets and adopters

SELECT P.Name AS [Name of Pets], U.UserName AS [Adopters Name]
FROM Pets AS P 
Join Adoptions AS A ON P.PetID = A.PetID 
Join Users U ON A.AdopterID = U.UserID;

--17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each 
--shelter.

SELECT S.ShelterID, S.Name AS [Shelter Name], COUNT(P.PetID) as [Pets Available from Shelter]
from Shelters S
LEFT JOIN Pets P ON S.ShelterID = P.PetID
WHERE P.AvailableForAdoption = 1
GROUP BY S.ShelterID, S.Name;

-- 18.Find pairs of pets from the same shelter that have the same breed.

ALTER TABLE Pets ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);

UPDATE Pets SET ShelterID = 1 WHERE PetID = 1;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 2;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 3;
UPDATE Pets SET ShelterID = 4 WHERE PetID = 4;
UPDATE Pets SET ShelterID = 5 WHERE PetID = 5;
UPDATE Pets SET ShelterID = 6 WHERE PetID = 6;
UPDATE Pets SET ShelterID = 7 WHERE PetID = 7;
UPDATE Pets SET ShelterID = 8 WHERE PetID = 8;
UPDATE Pets SET ShelterID = 10 WHERE PetID = 9;
UPDATE Pets SET ShelterID = 10 WHERE PetID = 10;

UPDATE Pets
SET Breed = 'PUG'
WHERE ShelterID = 2;

SELECT P1.PetID, P1.Name, P1.Breed, P1.ShelterID FROM Shelters S 
JOIN Pets P1 ON S.ShelterID = P1.ShelterID 
JOIN Pets P2 ON P1.Breed = P2.Breed AND P1.PetID <> P2.PetID;

--19. List all possible combinations of shelters and adoption events

SELECT
    S.ShelterID,
    S.Name,
    AE.EventID,
    AE.EventName,
    AE.EventDate,
    AE.Location
FROM
    Shelters S
CROSS JOIN
    AdoptionEvents AE;

--20.Determine the shelter that has the highest number of adopted pets

SELECT TOP 1 ShelterID, COUNT(PetID) AS [Number of Pets Adopted] FROM Pets
GROUP BY ShelterID ORDER BY [Number of Pets Adopted] DESC;
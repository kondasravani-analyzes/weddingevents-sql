USE weddingevents;

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    Venue VARCHAR(100)
);

CREATE TABLE Requirements (
    ReqID INT PRIMARY KEY,
    EventID INT,
    RequirementType VARCHAR(100),
    Quantity INT,
    Notes TEXT,
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);
INSERT INTO Events (EventID, EventName, EventDate, Venue)
VALUES
(1, 'Haldi Ceremony', '2026-07-11', 'Family Home'),
(2, 'Wedding Ceremony', '2026-07-18', 'Banquet Hall');

INSERT INTO Requirements (ReqID, EventID, RequirementType, Quantity, Notes)
VALUES
(101, 1, 'Turmeric Paste', 5, 'For Haldi ritual'),
(102, 1, 'Decorations', 10, 'Yellow theme'),
(103, 2, 'Chairs', 200, 'Banquet seating'),
(104, 2, 'Flowers', 50, 'Stage decoration');


use weddingevents;
select * from requirements;
select * from events;

INSERT INTO Requirements (ReqID, EventID, RequirementType, Quantity, Notes)
VALUES
(105, 1, 'Sound System', 2, 'For Haldi music'),
(106, 2, 'Drone', 1, 'Wedding aerial shots');

INSERT INTO Requirements (ReqID, EventID, RequirementType, Quantity, Notes)
VALUES
(105, 1, 'Sound System', 2, 'For Haldi music'),
(106, 2, 'Drone', 1, 'Wedding aerial shots');


use weddingevents;
drop  table requirements;
drop table events;

--creating new with auto increments 
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(100),
    EventDate DATE,
    Venue NVARCHAR(100)
);

CREATE TABLE Requirements (
    ReqID INT PRIMARY KEY IDENTITY(101,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    RequirementType NVARCHAR(100),
    Quantity INT,
    Notes NVARCHAR(200)
);
INSERT INTO Events (EventName, EventDate, Venue)
VALUES 
('Haldi Ceremony', '2026-07-11', 'Family Home'),
('Wedding Ceremony', '2026-07-18', 'Banquet Hall'),
('Reception Ceremony', '2026-07-19', 'Hotel Ballroom');

INSERT INTO Requirements (EventID, RequirementType, Quantity, Notes)
VALUES
(1, 'Turmeric Paste', 5, 'For Haldi ritual'),
(1, 'Decorations', 10, 'Yellow theme'),
(2, 'Chairs', 200, 'Banquet seating'),
(2, 'Flowers', 50, 'Stage decoration'),
(3, 'Lighting', 20, 'Stage and hall setup'),
(3, 'Sound System', 2, 'Reception music'),
(3, 'Drone', 1, 'Aerial wedding shots');

select * from events;
select * from requirements;

CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY IDENTITY(1,1),   -- auto‑increment
    VendorName NVARCHAR(100),
    ServiceType NVARCHAR(50),                 -- e.g., Catering, Photography
    Contact NVARCHAR(100),
    EventID INT FOREIGN KEY REFERENCES Events(EventID)
);

-- Vendors for Haldi Ceremony (EventID = 1)
INSERT INTO Vendors (VendorName, ServiceType, Contact, EventID)
VALUES 
('Golden Touch Decorators', 'Decoration', '9001112233', 1),
('Spice Delight Caterers', 'Catering', '9001112244', 1);

-- Vendors for Wedding Ceremony (EventID = 2)
INSERT INTO Vendors (VendorName, ServiceType, Contact, EventID)
VALUES 
('Elite Lens Photography', 'Photography', '9002223344', 2),
('Royal Banquet Caterers', 'Catering', '9002223355', 2),
('Bloom & Glow Florists', 'Decoration', '9002223366', 2);

select * from vendors;
-- Vendors for Reception Ceremony (EventID = 3)
INSERT INTO Vendors (VendorName, ServiceType, Contact, EventID)
VALUES 
('DJ Fusion Beats', 'Music', '9003334455', 3),
('Bright Lights Co.', 'Lighting', '9003334466', 3),
('Grand Feast Caterers', 'Catering', '9003334477', 3);

select * from vendors;


CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    EstimatedCost DECIMAL(10,2),
    ActualCost DECIMAL(10,2),
    Notes NVARCHAR(200)
);

-- Sample Inserts
INSERT INTO Budgets (EventID, EstimatedCost, ActualCost, Notes)
VALUES 
(1, 5000.00, 4800.00, 'Haldi ceremony expenses'),
(2, 20000.00, 21000.00, 'Wedding ceremony expenses'),
(3, 15000.00, 14500.00, 'Reception expenses');

CREATE TABLE Guests (
    GuestID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    GuestName NVARCHAR(100),
    RSVPStatus NVARCHAR(20),   -- e.g., Confirmed, Pending, Declined
    SeatNumber NVARCHAR(10)
);

-- Sample Inserts
INSERT INTO Guests (EventID, GuestName, RSVPStatus, SeatNumber)
VALUES
(2, 'Ravi Kumar', 'Confirmed', 'A12'),
(2, 'Priya Sharma', 'Pending', 'A13'),
(3, 'Anita Rao', 'Confirmed', 'B05');

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    VendorID INT FOREIGN KEY REFERENCES Vendors(VendorID),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    Status NVARCHAR(20)   -- e.g., Paid, Pending, Partial
);

-- Sample Inserts
INSERT INTO Payments (VendorID, EventID, Amount, PaymentDate, Status)
VALUES
(1, 1, 2500.00, '2026-07-05', 'Paid'),
(2, 1, 3000.00, '2026-07-06', 'Pending'),
(3, 2, 8000.00, '2026-07-10', 'Paid'),
(4, 2, 12000.00, '2026-07-12', 'Partial'),
(6, 3, 5000.00, '2026-07-15', 'Paid');

CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    TaskName NVARCHAR(100),
    AssignedTo NVARCHAR(100),
    DueDate DATE,
    Status NVARCHAR(20)   -- e.g., Completed, In Progress, Pending
);

-- Sample Inserts
INSERT INTO Tasks (EventID, TaskName, AssignedTo, DueDate, Status)
VALUES
(1, 'Haldi Stage Setup', 'Decor Team', '2026-07-10', 'Completed'),
(1, 'Haldi Catering Prep', 'Catering Team', '2026-07-11', 'In Progress'),
(2, 'Wedding Photography', 'Elite Lens Photography', '2026-07-18', 'Pending'),
(2, 'Banquet Decoration', 'Bloom & Glow Florists', '2026-07-17', 'In Progress'),
(3, 'Reception DJ Setup', 'DJ Fusion Beats', '2026-07-19', 'Pending');


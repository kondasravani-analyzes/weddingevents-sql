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


select * from events;
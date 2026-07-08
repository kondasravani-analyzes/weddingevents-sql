# WeddingEvents SQL Project

This project manages wedding event workflows using SQL Server Express.  
It includes tables for Events and Requirements, with sample data for July 11 & 18 ceremonies.

## Database Schema
- Events: Stores event details (ID, name, date, venue).
- Requirements: Stores items needed for each event, linked by EventID.

## Setup Instructions
1. Open SQL Server Management Studio (SSMS).
2. Create a database named `weddingevents`.
3. Run the `weddingevents.sql` script to create tables and insert data.

## Sample Queries
```sql
-- View all events
SELECT EventName, EventDate, Venue FROM Events;

-- View requirements for Haldi Ceremony
SELECT RequirementType, Quantity FROM Requirements WHERE EventID = 1;

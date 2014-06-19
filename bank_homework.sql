-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework


-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount NUMERIC,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);


-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode INTEGER;


-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
('2014-06-18', 50, 'Shrek', 'Donkey', 'Wedding present', 03453),
('2013-04-30', 100, 'Donkey', 'Shrek', 'for parfaits', 85631),
('2013-05-23', 7, 'Fiona', 'Donkey', 'transportation', 73529),
('2012-01-23', 200, 'Fiona', 'Ginger Bread Man', 'For everything', 45363),
('2011-02-28', 60, 'Farquaad', 'Shrek', 'Sorry dude', 93342),
('2009-04-12', 30, 'Donkey', 'Shrek', 'Rent', 93784),
('2008-12-12', 31, 'Dragon', 'Donkey', 'Rent for Shrek', 39241),
('2008-11-12', 100, 'Pinocchio', 'Shrek', 'wedding gift', 34233),
('2007-12-01', 120, 'Alex', 'Alex', 'cause I can', 98424),
('2006-12-11', 342, 'Dad', 'Alex', 'computer lessons', 34231),

('2011-01-01', 50000, 'Bowdoin', 'Dad', 'tution', 23412),
('2000-06-18', 50, 'Shrek', 'Donkey', 'Wedding present', 03453),
('1999-04-30', 100, 'Donkey', 'Shrek', 'for parfaits', 85631),
('1999-05-23', 1, 'Fiona', 'Donkey', 'transportation', 73529),
('1998-01-23', 200, 'Fiona', 'Ginger Bread Man', 'For everything', 45363),
('2000-02-28', 60, 'Farquaad', 'Shrek', 'Sorry dude', 93342),
('1993-04-12', 30, 'Donkey', 'Shrek', 'Rent', 93784),
('1980-12-12', 31, 'Dragon', 'Donkey', 'Rent for Shrek', 39241),
('1995-11-12', 100, 'Pinocchio', 'Shrek', 'wedding gift', 34233),
('1999-12-31', 120, 'Alex', 'Alex', 'New Millenium present for me', 98424);



-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = amount + 10 WHERE id = 9;


-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;


-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name from payments;


-- In a single query, select all payments created in the past week

SELECT * FROM payments WHERE created_at >= current_date - 7;

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description = '';


-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE recipient_name = 'Donkey';


-- 1) Show all tables and explain how they are related to one another (keys, triggers,etc.) 
-- Not done through a query. Might need CREATE TRIGGER?

-- 2) A basic retrieval query
-- Find the screenname of a web user with username 'Eric'
SELECT ScreenName
FROM BUYER as B, WEBSITE_USER as W
WHERE B.Email = W.Email AND W.UserName = 'Eric';

-- 3) A retrieval query with ordered results
-- Find listings priced at less than $350,000 in descending order
SELECT *
FROM PROPERTY
WHERE CurrentPrice < 350000
ORDER BY CurrentPrice DESC;

-- 4) A nested retrieval query
-- Find listings priced over the average current price in the market
SELECT *
FROM PROPERTY
WHERE CurrentPrice > (
	SELECT AVG(CurrentPrice)
	FROM PROPERTY);
    
-- 5) A retrieval query using joined tables
-- Find MLS, Address, CurrentPrice, and neighbourhood scores for listing with more than 4 bedrooms.
SELECT P.MLS, P.Address, P.CurrentPrice, N.WalkScore, N.BikeScore
FROM PROPERTY AS P
JOIN NEIGHBOURHOOD AS N ON P.NId = N.NeighbourhoodId
WHERE P.Bedrooms > 4;

-- 6) An update operation with an necessary triggers
-- check current price_history table for MLS = 'SK913993' prior to update operation 
SELECT * FROM PRICE_HISTORY WHERE MLS = 'SK913993';
-- update the price of a property and check its affect price history table
UPDATE PROPERTY SET CurrentPrice = 650000 WHERE MLS = 'SK913993';
-- check the newest addition in price_history for MLS = 'SK913993'
SELECT * FROM PRICE_HISTORY WHERE MLS = 'SK913993';
-- check the change in property for MLS = 'SK913993' after update operation
SELECT * FROM PROPERTY WHERE MLS = 'SK913993';

-- 7) a deletion operation with any necessary triggers
-- check the listings table for MLS = 'SK914153' prior to deletion operation
SELECT * FROM LISTINGS WHERE MLS = 'SK914153';
-- check the price history table for MLS = 'SK914153' prior to deletion operation
SELECT * FROM PRICE_HISTORY WHERE MLS = 'SK914153';
-- check the favourites table for MLS = 'SK914153' prior to deletion operation
SELECT * FROM SAVED_BY WHERE MLS = 'SK914153';
-- delete the MLS = 'SK914153' from properties table
DELETE FROM PROPERTY WHERE MLS = 'SK914153';
-- check the listing table after deletion
SELECT * FROM LISTINGS WHERE MLS = 'SK914153';
-- check the price history table after deletion operation
SELECT *  FROM PRICE_HISTORY WHERE MLS = 'SK914153';
-- check the favourites table after deletion operation
SELECT * FROM SAVED_BY WHERE MLS = 'SK914153';

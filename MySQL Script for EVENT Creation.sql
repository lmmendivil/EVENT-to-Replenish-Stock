
#ADDING A NEW COLUMN TO VISUALIZE THE STATUS OF THE STOCK
ALTER TABLE inventory
ADD COLUMN Inventory_Status VARCHAR(50);


SHOW VARIABLES LIKE "event%";


#CHECKING FOR ACTIVE EVENTS
SHOW EVENTS;

 
DELIMITER $$
CREATE EVENT inventory_status
ON SCHEDULE EVERY 1 MINUTE 
DO
BEGIN
	UPDATE toys_store.inventory
	SET Inventory_Status = 
		CASE
			WHEN Stock_On_Hand >= 80 THEN "GOOD"
			WHEN Stock_On_Hand >= 10 AND Stock_On_Hand <= 79 THEN "REPLENISH"
			WHEN Stock_On_Hand < 10 AND Stock_On_Hand >= 1 THEN "ALMOST OUT"
			WHEN Stock_On_Hand = 0 THEN "OUT"
		END;
END$$
DELIMITER ;

SHOW EVENTS;

SELECT *, CURRENT_TIME()
FROM sales
ORDER BY Sale_ID DESC;

#ASKING FOR TIME AT THE EXACT MOMENT OF RUNNING THE QUERY
SELECT *, CURRENT_TIME()
FROM inventory;

#CREATING SOME SALES
INSERT INTO sales
VALUES(355441+1, "2024-02-27", 1, 3, 25), 
	  (355441+2, "2024-02-27", 1, 7, 5);



#REPLENISH SOME STOCK
UPDATE inventory
SET Stock_On_Hand = 100 
WHERE Store_ID = 1 AND Product_ID = 1;

UPDATE inventory
SET Stock_On_Hand = 100 
WHERE Store_ID = 1 AND Product_ID = 5;



SELECT *, CURRENT_TIME()
FROM inventory;

DELIMITER $$
ALTER EVENT inventory_status
ON SCHEDULE EVERY 24 HOUR 
DO
BEGIN
	UPDATE toys_store.inventory
	SET Inventory_Status = 
		CASE
			WHEN Stock_On_Hand >= 80 THEN "GOOD"
			WHEN Stock_On_Hand >= 10 AND Stock_On_Hand <= 79 THEN "REPLENISH"
			WHEN Stock_On_Hand < 10 AND Stock_On_Hand >= 1 THEN "ALMOST OUT"
			WHEN Stock_On_Hand < 1 THEN "OUT"
		END;
END$$
DELIMITER ;

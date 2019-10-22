  
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletingRowsInChunks`()
BEGIN

 		SET @delDate = CURRENT_TIMESTAMP - INTERVAL 7 day; -- delete 7 days old data
        SELECT MIN(ID) into @startid FROM TableName;
       
loop_1000rows:  LOOP
		SET @endid = null;
        SELECT ID into @endid FROM TableName WHERE InsertDate <= @delDate ORDER BY ID LIMIT 1000, 1;
        
        If @endid is null THEN 
		LEAVE loop_1000rows; -- the last chunk
		END IF;
        
        DELETE FROM TableName WHERE ID >= @startid AND ID < @endid AND InsertDate < @delDate;
        
		SET @startid = @endid;
        
		select SLEEP (1); -- stop for a little bit
        
END LOOP;

DELETE FROM TableName -- Delete the last chunk:
WHERE
    ID >= @startid AND InsertDate < @delDate;
  
END

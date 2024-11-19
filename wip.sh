#!/bin/sh

sqlite3 map.db "
WITH RECURSIVE depend (groupID, dependsOn) AS
(
	SELECT groupID, dependsOn FROM dependencies WHERE groupID = (SELECT MIN(groupID) FROM dependencies)
	UNION ALL
	SELECT 
		c.dependsOn, t.dependsOn
		FROM
			depend c
	JOIN dependencies t
		ON c.dependsOn = t.groupID
)
SELECT * FROM depend;
"
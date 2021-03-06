WITH
AssignmentCount AS (
SELECT
Reference,
SourceTable.Assignment,
Count() as Count
FROM SourceTable
GROUP BY SourceTable.Assignment
)


SELECT
Reference,
SourceTable.Assignment,
CASE
WHEN AssignmentCount.Count IS NOT NULL
THEN AssignmentCount.Count ELSE -99
END
Total_Assignments

FROM
SourceTable
LEFT JOIN AssignmentCount USING(Reference)

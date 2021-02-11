
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ICEP salesforce
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ICEP_salesforce1
--ICEP_salesforce2

SELECT Count(*)
FROM ICEP_salesforce1
WHERE isdate([Created Date])= 0

SELECT Count(*)
FROM ICEP_salesforce2
WHERE isdate([Purchase Date])= 0


SELECT SUM(Price)
FROM ICEP_salesforce2
WHERE  YEAR(CASE WHEN ISDATE([Purchase Date])= 1 THEN [Purchase Date] END)= 2020 AND MONTH(CASE WHEN ISDATE([Purchase Date])= 1 THEN [Purchase Date] END)= 10

SELECT *
FROM (
SELECT [Product  Product Name], ct=count(*)
FROM ICEP_salesforce2
WHERE [Product  Product Name] is not null
GROUP BY [Product  Product Name]
) a
ORDER BY 2 desc

SELECT *
FROM (SELECT [Product Format], Ct=count(*) FROM ICEP_salesforce2 WHERE [Product Format] is not null GROUP BY [Product Format]ORDER BY 2 desc) a
ORDER BY 2 desc


SELECT [Product  Product Name], count(*)
FROM ICEP_salesforce2
WHERE [Product  Product Name] is not null
GROUP BY [Product  Product Name]
ORDER BY 2 desc


DECLARE @TableName VARCHAR(50)='ICEP_salesforce2'
DECLARE @ColumnName VARCHAR(50)='[Purchase Date]'
DECLARE @sql VARCHAR (MAX)
DECLARE @reportFirstDate DATE= (SELECT CAST(MIN(CASE WHEN isdate([Purchase Date])= 1 THEN [Purchase Date] END)AS DATE) FROM ICEP_salesforce2)
DECLARE @reportLastdate DATE= (SELECT CAST(MAX(CASE WHEN isdate([Purchase Date])= 1 THEN [Purchase Date] END)AS DATE) FROM ICEP_salesforce2)

SELECT @sql='SELECT *
FROM DataScientist..Calender A LEFT JOIN ' +  @TableName +  '
ON CAST((CASE WHEN isdate([Purchase Date])= 1 THEN ' + @TableName + '.' + @ColumnName + ' END) AS DATE)= A.DateValue
WHERE CAST((CASE WHEN isdate([Purchase Date])= 1 THEN ' + @TableName + '.' + @ColumnName + ' END) AS DATE) IS NULL AND A.DateValue >= ''' + CAST(@reportFirstDate AS VARCHAR(50)) + ''' AND A.DateValue <= ''' + CAST(@reportLastdate AS VARCHAR(50)) + '''
ORDER BY A.DateValue desc'

PRINT @sql
Exec (@sql)---no holes

---------trend:
SELECT CreatedDate=CASE WHEN isdate([Purchase Date])= 1 THEN CAST([Purchase Date] AS DATE) END,COUNT(*)
FROM ICEP_salesforce2
GROUP BY CASE WHEN isdate([Purchase Date])= 1 THEN CAST([Purchase Date] AS DATE) END
ORDER BY 1 desc


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NEC/ICET Salesforce
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[NECICET_Salesforce_16-12-20]

QA: 
-- no column headers for two columns (the 2nd and last columns)
-- for any column headers that contain a colon or forward slash, if possible please wrap the header in quote text qualifiers (i.e. "Company / Venue Name: Company / Venue Name").




DECLARE @TableName VARCHAR(50)='[NECICET_Salesforce_16-12-20]'
DECLARE @ColumnName VARCHAR(50)='[Close Date]'
DECLARE @sql VARCHAR (MAX)
DECLARE @reportFirstDate DATE= (SELECT CAST(MIN(CASE WHEN isdate([Close Date])= 1 THEN [Close Date] END)AS DATE) FROM [NECICET_Salesforce_16-12-20])
DECLARE @reportLastdate DATE= (SELECT CAST(MAX(CASE WHEN isdate([Close Date])= 1 THEN [Close Date] END)AS DATE) FROM [NECICET_Salesforce_16-12-20])

SELECT @sql='SELECT *
FROM DataScientist..Calender A LEFT JOIN ' +  @TableName +  '
ON CAST((CASE WHEN isdate([Close Date])= 1 THEN ' + @TableName + '.' + @ColumnName + ' END) AS DATE)= A.DateValue
WHERE CAST((CASE WHEN isdate([Close Date])= 1 THEN ' + @TableName + '.' + @ColumnName + ' END) AS DATE) IS NULL AND A.DateValue >= ''' + CAST(@reportFirstDate AS VARCHAR(50)) + ''' AND A.DateValue <= ''' + CAST(@reportLastdate AS VARCHAR(50)) + '''
ORDER BY A.DateValue desc'

PRINT @sql
Exec (@sql)---no holes

---------trend:
SELECT CloseDate=CASE WHEN isdate([Close Date])= 1 THEN CAST([Close Date] AS DATE) END,COUNT(*)
FROM [NECICET_Salesforce_16-12-20]
GROUP BY CASE WHEN isdate([Close Date])= 1 THEN CAST([Close Date] AS DATE) END
ORDER BY 1 desc



SELECT Count(*)
FROM [NECICET_Salesforce_16-12-20]
WHERE isdate([Close Date])= 0
UNION
SELECT TOP 3 CloseDate= [Close Date], Flag= 'Valid'
FROM [NECICET_Salesforce_16-12-20]
WHERE isdate([Close Date])= 1

SELECT [Quote Currency], count(*)
FROM [NECICET_Salesforce_16-12-20]
GROUP BY [Quote Currency]
ORDER BY 2 desc



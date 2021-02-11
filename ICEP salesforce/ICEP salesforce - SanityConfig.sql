----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sanity Check
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-----------********************************Customer Exporter Tab*******************************----------------------------------------------
--ICEP_salesforce1
--ICEP_salesforce2

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Input
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


TRUNCATE TABLE SANITY_TABLES_CONFIGURATION

INSERT INTO SANITY_TABLES_CONFIGURATION(CHART_ID,CHART_HEADER,TABLE_NAME,GROUP_BY,Y_AXIS_NAME,X_AXIS_NAME,SELECT_FORMULA,ADDITIONAL_WHERE,INCLUDE_DATA_TABLE)
VALUES	
--ICEP_salesforce1
(1,'Table Summary - ICEP_salesforce1','ICEP_salesforce1',NULL,NULL,'Number of Records','COUNT(*)',NULL,0), -- done
(1,'Table Summary - ICEP_salesforce1','ICEP_salesforce1',NULL,NULL,'First Created Date','MIN(CASE WHEN ISDATE([Created Date])= 1 THEN CAST([Created Date] as date) END)',NULL,0), -- done
(1,'Table Summary - ICEP_salesforce1','ICEP_salesforce1',NULL,NULL,'Last Created Date','MAX(CASE WHEN ISDATE([Created Date])= 1 THEN CAST([Created Date] as date) END)',NULL,0), -- done
(2,'Number of Records Trend (by Created Date)','ICEP_salesforce1','CAST(YEAR(CAST( [Created Date] AS DATE)) AS VARCHAR(50))+'' - ''+ CASE WHEN MONTH(CAST( [Created Date] AS DATE))  <10 THEN ''0'' + CAST(MONTH(CAST( [Created Date] AS DATE)) AS VARCHAR(50))ELSE CAST(MONTH(CAST( [Created Date] AS DATE)) AS NVARCHAR(50)) END ','Number of Records','Registration Date','COUNT(*)','ISDATE([Created Date])= 1',1),
(3,'Mailing Country Distribution - ICEP_salesforce1 - Top 10','(SELECT TOP 10 [Mailing Country], NumberOfRecords=COUNT(*) FROM ICEP_salesforce1 WHERE [Mailing Country] IS NOT NULL GROUP BY [Mailing Country] ORDER BY 2 DESC) a','[Mailing Country]','Number of Records','Top 10 - Mailing Country','Sum(NumberOfRecords)',NULL,0), -- done

--ICEP_salesforce2
(4,'Table Summary - ICEP_salesforce2','ICEP_salesforce2',NULL,NULL,'Number of Records','COUNT(*)',NULL,0),
(4,'Table Summary - ICEP_salesforce2','ICEP_salesforce2',NULL,NULL,'First Purchase Date','CAST(MIN(CASE WHEN isdate([Purchase Date])= 1 THEN [Purchase Date] END)AS DATE)',NULL,0),
(4,'Table Summary - ICEP_salesforce2','ICEP_salesforce2',NULL,NULL,'Last Purchase Date','CAST(MAX(CASE WHEN isdate([Purchase Date])= 1 THEN [Purchase Date] END)AS DATE)',NULL,0),
(5,'Total Price Amount','ICEP_salesforce2','CAST(YEAR(CAST( [Purchase Date] AS DATE)) AS VARCHAR(50))+'' - ''+ CASE WHEN MONTH(CAST( [Purchase Date] AS DATE))  <10 THEN ''0'' + CAST(MONTH(CAST( [Purchase Date] AS DATE)) AS VARCHAR(50))ELSE CAST(MONTH(CAST( [Purchase Date] AS DATE)) AS NVARCHAR(50)) END ','Total Price','Purchase Date','SUM(Price)','isdate([Purchase Date])= 1',1),
(6,'Product Name Distribution - ICEP_salesforce2 - Top 10','(SELECT TOP 10 [Product  Product Name], NumberOfRecords=COUNT(*) FROM ICEP_salesforce2 WHERE [Product  Product Name] IS NOT NULL GROUP BY [Product  Product Name] ORDER BY 2 DESC) a','[Product  Product Name]','Number of Records','Top 10 - Product Name','Sum(NumberOfRecords)',NULL,0), -- done
(7,'Product Format Distribution - ICEP_salesforce2 - Top 10','(SELECT [Product Format], NumberOfRecords=COUNT(*) FROM ICEP_salesforce2 WHERE [Product Format] IS NOT NULL GROUP BY [Product Format] ORDER BY 2 DESC) a','[Product Format]','Number of Records','Top 10 - Product Format','Sum(NumberOfRecords)',NULL,0) -- done

TRUNCATE TABLE SANITY_CHARTS_CONFIGURATION

INSERT INTO SANITY_CHARTS_CONFIGURATION	(CHART_ID,ORDER_SORTING,CHART_TYPE)
VALUES
--ICEP_salesforce1
(1,1,3),
(2,2,1),
(3,3,2),

--ICEP_salesforce2
(4,4,3),
(5,5,1),
(6,6,2),
(7,7,2)


--(1,'Time Series With Range Slider - One Trace Line'),
--(2,'Pie Chart'),
--(3,'One Line Table')

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


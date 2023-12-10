

/* Additional questions that are frequently asked include the following:
1. How many storage units did the company do last year?
2. What percentage of the customers rented at least one unit?
3. What was the greatest number of rents by any one individual?
4. What is the average length of a rental period?
5. What are the company peak months for rents?

Author: Lisi Cao
Date: 2023-08-17 */


-- 1. How many storage units did the company do last year?

CREATE VIEW Operations.vw_StorageUnitsLastYear AS
SELECT COUNT(*) AS 'Number of Storage Units'
FROM Operations.lease
WHERE YEAR(d_in) = YEAR(GETDATE()) - 1
;
GO

-- display
SELECT * FROM Operations.vw_StorageUnitsLastYear
;
GO


-- 2. What percentage of the customers rented at least one unit?

CREATE FUNCTION Operations.fn_PercentageRented()
RETURNS DECIMAL(5,2) 
AS 
BEGIN 
    DECLARE @Percentage DECIMAL(5,2);
    SELECT @Percentage = CAST(
        ROUND(
            ((SELECT COUNT(DISTINCT oj.cust_id) 
              FROM Operations.job_order oj 
              WHERE oj.has_storage = 1) 
             * 1.0 / 
             (SELECT COUNT(DISTINCT oj.cust_id) 
              FROM Operations.job_order oj)) * 100
        , 2) 
    AS DECIMAL(5,2))
    RETURN @Percentage;
END;
GO

-- display
SELECT Operations.fn_PercentageRented() AS [Percentage of Customers Rented at Least One Unit]
;
GO 

-- 3. What was the greatest number of rents by any one individual?

CREATE PROCEDURE Operations.sp_GreatestNumberOfRents
AS 
BEGIN 
    SELECT 
        MAX(rent_count) AS 'Greatest Number of Rents'
    FROM (
        SELECT 
            cust_id, 
            COUNT(*) AS 'rent_count'
        FROM Operations.lease
        GROUP BY cust_id
    ) AS t;
END;
GO

--EXEC
EXEC Operations.sp_GreatestNumberOfRents;
GO

-- 4. What is the average length of a rental period?

CREATE FUNCTION Operations.fn_AverageRentalLength()
RETURNS DECIMAL(5,2)
AS 
BEGIN 
    DECLARE @AverageLength DECIMAL(5,2);
    SELECT @AverageLength = AVG(rent_length) 
    FROM (
        SELECT 
            cust_id, 
            DATEDIFF(DAY, d_in, d_out) AS 'rent_length'
        FROM Operations.lease
        WHERE d_out IS NOT NULL
    ) AS t;
    RETURN @AverageLength;
END;
GO

-- display
SELECT Operations.fn_AverageRentalLength() AS 'Average Rental Length(day)';
GO

-- 5. What are the company peak months for rents?

CREATE VIEW vw_PeakMonthsForRents AS
SELECT TOP 2
    MONTH(d_in) AS 'Month',
    COUNT(*) AS [Number of Rents]
FROM Operations.lease
GROUP BY MONTH(d_in)
ORDER BY COUNT(*) DESC;
GO

-- display
SELECT * FROM vw_PeakMonthsForRents
;
GO



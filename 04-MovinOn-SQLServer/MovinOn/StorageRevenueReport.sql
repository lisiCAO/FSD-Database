/* Purpose: create views to show the income from storage units.
Author: Lisi Cao
Date: 2023-08-17 */

-- 1. view - rent per unit, per customer
CREATE view Operations.vw_total_unit_revenue AS
SELECT 
    l.wh_id, 
    l.unit_id,
    c.contact_l_n,
    SUM(
        CASE
            WHEN l.d_out IS NULL THEN DATEDIFF(MONTH, l.d_in, GETDATE()) * su.rent
            ELSE DATEDIFF(MONTH, l.d_in, l.d_out) * su.rent
        END
    ) AS 'Revenue per Unit'
FROM Operations.lease l
JOIN inventory.storage_unit su
    ON l.unit_id = su.unit_id AND l.wh_id = su.wh_id
JOIN Clients.customer c
    ON l.cust_id = c.cust_id
GROUP BY l.wh_id, l.unit_id, c.contact_l_n
;    
GO

-- 1.1 Test view UNIT revenue
SELECT * FROM Operations.vw_total_unit_revenue;
GO
-- 1.2 Test view UNIT revenue for a specific unit
SELECT * FROM Operations.vw_total_unit_revenue WHERE unit_id = 1
;
GO


-- 2. View - Total revenue for EACH warehouse

CREATE VIEW Operations.vw_warehouse_revenue AS
SELECT 
    l.wh_id, 
    SUM(
        CASE
            WHEN l.d_out IS NULL THEN DATEDIFF(MONTH, l.d_in, GETDATE()) * su.rent
            ELSE DATEDIFF(MONTH, l.d_in, l.d_out) * su.rent
        END
    ) AS 'Revenue per Warehouse'
FROM Operations.lease l
JOIN inventory.storage_unit su
    ON l.unit_id = su.unit_id AND l.wh_id = su.wh_id
GROUP BY l.wh_id
;
GO

-- 2.1  Test view WAREHOUSE revenue 
SELECT * FROM Operations.vw_warehouse_revenue
;
GO



-- 2.3 EXPLAIN the view
EXEC sp_helptext 'Operations.vw_warehouse_revenue'
;
GO


-- 3. Total revenue for ALL warehouses
CREATE view Operations.vw_total_wh_revenue AS
SELECT 
    SUM(
        CASE
            WHEN l.d_out IS NULL THEN DATEDIFF(MONTH, l.d_in, GETDATE()) * su.rent
            ELSE DATEDIFF(MONTH, l.d_in, l.d_out) * su.rent
        END
    ) AS 'ALL Warehouse Revenue'
FROM Operations.lease l
JOIN inventory.storage_unit su
    ON l.unit_id = su.unit_id AND l.wh_id = su.wh_id
;
GO

-- 3.1 Test view ALL WAREHOUSE revenue
SELECT * from Operations.vw_total_wh_revenue
;
GO

-- 3.2 EXPLAIN the view
EXEC sp_help 'Operations.vw_total_wh_revenue'
;
GO



-- 4. Combining the views into a single report (view), 
    -- display the revenue for each unit, the revenue for each warehouse, and the total revenue for all warehouses.
CREATE VIEW Operations.vw_CombinedStorageRevenue AS
WITH RankedRevenue AS (
    SELECT
        a.wh_id,
        a.unit_id,
        a.contact_l_n,
        a.[Revenue per Unit] AS [Unit Revenue],
        b.[Revenue per Warehouse] AS [Warehouse Revenue],
        c.[ALL Warehouse Revenue] AS [Total Warehouse Revenue],
        ROW_NUMBER() OVER(PARTITION BY a.wh_id ORDER BY a.unit_id) AS rn,
        ROW_NUMBER() OVER(ORDER BY a.wh_id, a.unit_id) AS global_rn
    FROM 
        Operations.vw_total_unit_revenue a
    LEFT JOIN
        Operations.vw_warehouse_revenue b ON a.wh_id = b.wh_id
    CROSS JOIN
        Operations.vw_total_wh_revenue c
)
SELECT 
    wh_id,
    unit_id,
    contact_l_n,
    [Unit Revenue],
    CASE WHEN rn = 1 THEN [Warehouse Revenue] ELSE NULL END AS [Warehouse Revenue],
    CASE WHEN global_rn = 1 THEN [Total Warehouse Revenue] ELSE NULL END AS [Total Warehouse Revenue]
FROM RankedRevenue
;
GO

-- 4.1 Test view COMBINED STORAGE REVENUE
SELECT * FROM Operations.vw_CombinedStorageRevenue
;
GO

--5. Add calculation - How long each renter rented a unit?
CREATE VIEW Operations.vw_RenterDuration AS
SELECT
    c.contact_l_n AS 'Renter',
    l.cust_id AS 'Customer ID',
    CAST(
        CASE 
            WHEN l.d_out IS NULL THEN DATEDIFF(DAY, l.d_in, GETDATE()) / 365.0
            ELSE DATEDIFF(DAY, l.d_in, l.d_out) / 365.0
        END 
    AS DECIMAL(10,1)) AS 'Years Rented'
FROM 
    Operations.lease l
JOIN
    Clients.customer c ON l.cust_id = c.cust_id
GROUP BY 
    c.contact_l_n, l.cust_id, l.d_in, l.d_out
;
GO
    
-- 5.1 Test view RENTER DURATION
    SELECT * FROM Operations.vw_RenterDuration
;
GO
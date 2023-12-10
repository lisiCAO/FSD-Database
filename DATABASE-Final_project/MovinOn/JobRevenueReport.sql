/* 
Purpose: create a procedure to generate a job revenue report, 
    so that owner could view the revenue for each job order.
Author: Lisi Cao
Date: 2023-08-17 */

-- 1. create a procedure to generate a job revenue report,
-- The income could be calculated as Mileage Actual * 0.7 plus Weight Actual * 0.2 from table Job Detail.) The Net Income = Income – Driver Payment.
-- Drivers receive $50 for each job plus their mileage rate (that is, the driver’s rate multiplied by the number of miles plus $50).

CREATE PROCEDURE Operations.sp_job_revenue_report
@order_id INT = NULL
AS
BEGIN
SELECT
        jo.order_id AS 'Order ID',
        jo.d_move AS 'Date of the Move',
        CONCAT(d.f_name, ' ', d.l_name) AS 'Driver Name',
        d.mileage_rate AS 'Driver Mileage Rate',
        jd.mileage_actual AS 'Actual Mileage',
        jd.weight_actual AS 'Actual Weight',
        
        CAST((jd.mileage_actual * 0.7 + jd.weight_actual * 0.2) AS DECIMAL(18,2)) AS 'Total Income for Job',
        CAST((d.mileage_rate * jd.mileage_actual + 50) AS DECIMAL(18,2)) AS 'Driver Payment',
        CAST(((jd.mileage_actual * 0.7 + jd.weight_actual * 0.2) - (d.mileage_rate * jd.mileage_actual + 50)) AS DECIMAL(18,2)) AS 'Net Income'
    
    FROM Operations.job_order jo
    JOIN Operations.job_detail jd 
        ON jo.order_id = jd.order_id
    JOIN HR.driver d 
        ON jd.driver_id = d.driver_id
    WHERE @order_id IS NULL OR jo.order_id = @order_id
END;
GO

-- 2. Test the procedure

EXECUTE Operations.sp_job_revenue_report @order_id = 2
;
GO

-- 3. EXEC sp_helptext;

EXEC sp_help 'Operations.sp_job_revenue_report'
;
GO


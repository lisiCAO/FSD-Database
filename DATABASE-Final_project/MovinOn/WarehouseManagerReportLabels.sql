/*Purpose: Create a procedure to generate warehouse manager report labels, so that onwer could send mails to managers according the warehouse id.
Author: Lisi Cao
Date: 2023-08-17 */


/* 1. create a procedure to generate warehouse manager report labels, 
so that onwer could send mails to managers according the warehouse id.
*/

CREATE PROCEDURE HR.sp_warehouse_manager_report
@wh_id nvarchar(5) = NULL  -- default value is NULL
AS
BEGIN
SELECT
    e.emp_id AS 'Manager ID',
    CONCAT_WS(' ', e.f_name, e.l_name) AS 'Manager Name',
    CONCAT_WS(', ', wh.street, wh.city, wh.state, wh.zip) AS 'Address',
    wh.phone AS 'Warehouse Phone Number'
    FROM HR.employee e
    JOIN inventory.warehouse wh
    ON e.wh_id = wh.wh_id
    WHERE e.pos_id = 2 AND e.wh_id = @wh_id -- 2 means manager
END
;
GO

/* 2. Test the procedure */
EXECUTE HR.sp_warehouse_manager_report @wh_id = 'WA-1'
;
GO

/* 3. EXEC sp_helptext; */
EXEC sp_help 'HR.sp_warehouse_manager_report'
;
GO

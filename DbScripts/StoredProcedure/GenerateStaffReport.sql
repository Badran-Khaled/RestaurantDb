USE [RestaurantDB]
GO

/****** Object:  StoredProcedure [dbo].[GenerateStaffReport]    Script Date: 2025-03-06 7:56:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GenerateStaffReport]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        P.FullName,
        P.Role,
        P.ShiftTimings,
        COUNT(DISTINCT CAST(O.CreationDate AS DATE)) AS DaysWorked,
        COUNT(O.ID) AS TotalOrdersHandled,
        SUM(O.TotalAmount) AS TotalSalesGenerated
    FROM Person P
    JOIN [Order] O ON P.ID = O.CreateBy
    WHERE CAST(O.CreationDate AS DATE) BETWEEN @StartDate AND @EndDate
    GROUP BY P.FullName, P.Role, P.ShiftTimings
    ORDER BY DaysWorked DESC;
END;
GO


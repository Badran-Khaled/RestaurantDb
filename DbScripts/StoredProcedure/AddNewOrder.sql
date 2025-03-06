USE [RestaurantDB]
GO

/****** Object:  StoredProcedure [dbo].[AddNewOrder]    Script Date: 2025-03-06 7:55:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewOrder]
    @TableNumber INT,
    @CustomerID INT,
    @ListOfItems VARCHAR(MAX), -- Comma-separated list of item names
    @Quantities VARCHAR(MAX),  -- Comma-separated list of quantities
    @TotalAmount INT 
AS
BEGIN

    SELECT @TotalAmount = SUM(M.Price * CAST(Q.value AS INT))
    FROM STRING_SPLIT(@ListOfItems, ',') AS I
    JOIN STRING_SPLIT(@Quantities, ',') AS Q ON I.value = Q.value
    JOIN Menu M ON I.value = M.ItemName;

    INSERT INTO [Order] (TableNumber, CustomerID, ListOfItems, TotalAmount, OrderStatus)
    VALUES (@TableNumber, @CustomerID, @ListOfItems, @TotalAmount, 'Pending');

END;
GO


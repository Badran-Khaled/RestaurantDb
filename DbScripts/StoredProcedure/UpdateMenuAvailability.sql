USE [RestaurantDB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateMenuAvailability]    Script Date: 2025-03-06 7:56:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateMenuAvailability]
    @ItemName VARCHAR(200),
    @Availability BIT 
AS
BEGIN
    UPDATE Menu
    SET Availability = @Availability
    WHERE ItemName = @ItemName;
END;
GO


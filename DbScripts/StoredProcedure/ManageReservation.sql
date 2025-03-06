USE [RestaurantDB]
GO

/****** Object:  StoredProcedure [dbo].[ManageReservation]    Script Date: 2025-03-06 7:56:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManageReservation]
    @ReservationID INT = null,
    @CustomerID INT,
    @TableNumber INT,
    @ReservationDate DATETIME,
    @NumberOfGuests INT,
    @Status VARCHAR(50)
AS
BEGIN
    IF @ReservationID IS NULL
    BEGIN
        INSERT INTO Reservation (CustomerID, TableNumber, CreationDate, [Status])
        VALUES (@CustomerID, @TableNumber, @ReservationDate, @Status);
    END
    ELSE
    BEGIN
        UPDATE Reservation
        SET CustomerID = @CustomerID,
            TableNumber = @TableNumber,
            UpdateDate = @ReservationDate,
            [Status] = @Status
        WHERE ID = @ReservationID;
    END;
END;
GO


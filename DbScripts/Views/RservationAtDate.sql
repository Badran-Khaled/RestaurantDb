USE [RestaurantDB]
GO

/****** Object:  View [dbo].[ReservationAtDate]    Script Date: 2025-03-06 7:55:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create VIEW [dbo].[ReservationAtDate] ASselect * from Reservationwhere CAST(CreationDate AS DATE) = '2025-03-03'
GO


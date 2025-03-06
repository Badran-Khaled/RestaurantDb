USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[CreateReservation]    Script Date: 2025-03-06 7:53:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CreateReservation](
	[PersonID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CreateReservation] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[CreateReservation] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[CreateReservation] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[CreateReservation]  WITH CHECK ADD  CONSTRAINT [FK_CreateReservation_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
GO

ALTER TABLE [dbo].[CreateReservation] CHECK CONSTRAINT [FK_CreateReservation_Person]
GO

ALTER TABLE [dbo].[CreateReservation]  WITH CHECK ADD  CONSTRAINT [FK_CreateReservation_Reservation] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservation] ([ID])
GO

ALTER TABLE [dbo].[CreateReservation] CHECK CONSTRAINT [FK_CreateReservation_Reservation]
GO


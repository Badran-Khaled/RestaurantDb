USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Reservation]    Script Date: 2025-03-06 7:54:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TableNumber] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Reservation] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Reservation] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Customer]
GO


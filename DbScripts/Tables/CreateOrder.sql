USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[CreateOrder]    Script Date: 2025-03-06 7:53:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CreateOrder](
	[PersonID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CreateOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[CreateOrder] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[CreateOrder] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[CreateOrder]  WITH CHECK ADD  CONSTRAINT [FK_CreateOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO

ALTER TABLE [dbo].[CreateOrder] CHECK CONSTRAINT [FK_CreateOrder_Order]
GO

ALTER TABLE [dbo].[CreateOrder]  WITH CHECK ADD  CONSTRAINT [FK_CreateOrder_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
GO

ALTER TABLE [dbo].[CreateOrder] CHECK CONSTRAINT [FK_CreateOrder_Person]
GO


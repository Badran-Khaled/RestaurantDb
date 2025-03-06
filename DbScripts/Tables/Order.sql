USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 2025-03-06 7:54:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableNumber] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[ListOfItems] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Order] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Order] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO


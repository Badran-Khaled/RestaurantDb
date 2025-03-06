USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Menu]    Script Date: 2025-03-06 7:54:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Availability] [bit] NULL,
	[Discount] [decimal](5, 2) NULL,
	[Image] [nvarchar](255) NULL,
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

ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((1)) FOR [Availability]
GO

ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Menu] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Menu] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO


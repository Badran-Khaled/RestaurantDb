USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Manage]    Script Date: 2025-03-06 7:54:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Manage](
	[PersonID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Manage] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Manage] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Manage] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[Manage]  WITH CHECK ADD  CONSTRAINT [FK_Manage_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Manage] CHECK CONSTRAINT [FK_Manage_Menu]
GO

ALTER TABLE [dbo].[Manage]  WITH CHECK ADD  CONSTRAINT [FK_Manage_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Manage] CHECK CONSTRAINT [FK_Manage_Person]
GO


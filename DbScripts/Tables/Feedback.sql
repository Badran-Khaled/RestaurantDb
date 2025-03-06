USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Feedback]    Script Date: 2025-03-06 7:54:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[RatingAmount] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (sysdatetime()) FOR [CreationDate]
GO

ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (sysdatetime()) FOR [UpdateDate]
GO

ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Person] ([ID])
GO

ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO

ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO

ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Order]
GO

ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([RatingAmount]>=(1) AND [RatingAmount]<=(5)))
GO


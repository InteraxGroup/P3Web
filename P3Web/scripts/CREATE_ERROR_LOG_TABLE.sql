USE [P3]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 6/6/2022 2:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorLog](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [nchar](10) NULL,
	[LoggedDateTime] [datetime] NULL,
	[App] [nchar](10) NULL,
	[UserIP] [nchar](100) NULL,
	[UserUrl] [nchar](1000) NULL,
 CONSTRAINT [PK_Errorlog_ErrorId] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

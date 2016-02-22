USE [newsSystem_db]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CivilStatus]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CivilStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_CivilStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Website] [varchar](150) NULL,
	[Comment] [varchar](max) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Id_Post] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Id_Comment] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebsiteTitle] [varchar](100) NOT NULL,
	[Slogan] [varchar](150) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Ads_300] [varchar](max) NULL,
	[Ads_728] [varchar](max) NULL,
	[Ads_970] [varchar](max) NULL,
	[Analytics] [varchar](max) NULL,
	[Disqus] [varchar](100) NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Icon]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Icon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IconName] [varchar](50) NULL,
 CONSTRAINT [PK_Icon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messenger]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messenger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Messenger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Image] [varchar](max) NULL,
	[Time] [datetime] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Highlight] [bit] NOT NULL,
	[Id_Category] [int] NULL,
	[DisabledComments] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Visits] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post_Tags]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Post] [int] NULL,
	[Id_Tags] [int] NULL,
 CONSTRAINT [PK_Post_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_User] [nvarchar](128) NOT NULL,
	[Name] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Id_Gender] [int] NOT NULL,
	[Bio] [varchar](max) NULL,
	[Avatar] [varchar](max) NULL,
	[Website] [varchar](150) NULL,
	[Id_CivilStatus] [int] NOT NULL,
	[Id_Messenger] [int] NOT NULL,
	[MessengerName] [varchar](150) NULL,
	[Company] [varchar](100) NULL,
	[Profession] [varchar](100) NULL,
	[Id_Sector] [int] NOT NULL,
	[ProfessionalInterests] [varchar](max) NULL,
	[ProfessionalSkills] [varchar](max) NULL,
	[Interests] [varchar](max) NULL,
	[Hobbies] [varchar](max) NULL,
	[FavoriteTVSerie] [varchar](max) NULL,
	[FavoriteMusic] [varchar](max) NULL,
	[FavoriteSport] [varchar](max) NULL,
	[FavoriteBooks] [varchar](max) NULL,
	[FavoriteMovies] [varchar](max) NULL,
	[FavoriteFood] [varchar](max) NULL,
	[Heroe] [varchar](max) NULL,
	[Birthday] [datetime] NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Social]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Social](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Link] [varchar](max) NULL,
	[Id_Icon] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 22/02/2016 4:42:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'dbcc551d-c223-45a9-9eb7-c5ab0d9fd27e', N'Moderator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'edc4e7b3-bc93-4ebe-891e-96a68a291382', N'Administrator')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'0de02121-7228-4405-b576-f91fb68c85f5', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', N'Juan')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'48b2e11c-2bdf-4fe1-98c8-4de0dd1fa40d', N'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', N'nesticle8bit')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0de02121-7228-4405-b576-f91fb68c85f5', N'edc4e7b3-bc93-4ebe-891e-96a68a291382')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'48b2e11c-2bdf-4fe1-98c8-4de0dd1fa40d', N'edc4e7b3-bc93-4ebe-891e-96a68a291382')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0de02121-7228-4405-b576-f91fb68c85f5', N'jjsorianoe@gmail.com', N'jjsorianoe@gmail.com', 0, N'AOtSmHLIqflsjq5UZsySm1AFDmM0OBFcYwmQcJYVWks+fkhLM26ZiZ6xY44cSecCDw==', N'7e89ee46-1b24-4bd3-89f8-c82990d55fa6', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount]) VALUES (N'48b2e11c-2bdf-4fe1-98c8-4de0dd1fa40d', N'julios.corrp@gmail.com', N'julios.corrp@gmail.com', 0, N'AK7v4fkiJF7GqcJsMjWzSpcPn0ayy/3svXCuYLv56oPFaoS/aDzkUBPQZminJFXXaQ==', N'b7c62347-cc87-441f-9cb9-37dbb7dd0006', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Articles')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Design Freebies')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Design Tutorials')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Web Development')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2004, N'News')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CivilStatus] ON 

GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (1, N'Single')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (2, N'Relationship')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (3, N'Married')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (4, N'Divorced')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (5, N'Widower')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (6, N'In something...')
GO
INSERT [dbo].[CivilStatus] ([Id], [Name]) VALUES (7, N'New Row with the Modal (Edited)')
GO
SET IDENTITY_INSERT [dbo].[CivilStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

GO
INSERT [dbo].[Comment] ([Id], [Name], [Email], [Website], [Comment], [Time], [Approved], [Id_Post], [Deleted], [Id_Comment]) VALUES (3013, N'nesticle8bit', N'mail@mail.com', NULL, N'Gingerbread jujubes cake lollipop tiramisu. Donut pie cake pudding jelly donut marzipan. Dragée apple pie ice cream cookie. Topping tart gummi bears. Biscuit tiramisu pastry bonbon dessert cupcake.', CAST(0x0000A5AF00AE0B93 AS DateTime), 1, 2005, 0, NULL)
GO
INSERT [dbo].[Comment] ([Id], [Name], [Email], [Website], [Comment], [Time], [Approved], [Id_Post], [Deleted], [Id_Comment]) VALUES (4025, N'asdad', N'asdasd', N'asdasdas', N'asdasd', CAST(0x0000A5AF01240316 AS DateTime), 0, 2005, 0, 3013)
GO
INSERT [dbo].[Comment] ([Id], [Name], [Email], [Website], [Comment], [Time], [Approved], [Id_Post], [Deleted], [Id_Comment]) VALUES (4026, N'asdad', N'asdasd', N'asdasdas', N'asdasd', CAST(0x0000A5AF01240BE1 AS DateTime), 1, 2005, 0, 3013)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration] ON 

GO
INSERT [dbo].[Configuration] ([Id], [WebsiteTitle], [Slogan], [Url], [Email], [Ads_300], [Ads_728], [Ads_970], [Analytics], [Disqus]) VALUES (1, N'CMS Script', N'v0.1', N'http://localhost:7735/', N'juliopoveda@protonmail.com', N'<img class="text-center center-block" src="https://lh3.ggpht.com/SwKJItV_dUKyXgtyB7ycADMWTVGscOmyr5zWyw8GgLfd6O1K8AyOCH8y_3xQBoChJ4JFCOSKew=w300" />', N'<img src="https://lh6.ggpht.com/41LFWBytPnxKsfZf6mivs6ba7qdOBtfk9-7MzWSMqwC3IFOvaXd8rejFiyeXKfBOK16mMEopeA=w728" />', N'<img src="https://storage.googleapis.com/support-kms-prod/SNP_59D432450939ECC60A21BEDBEE985B1817B1_3094744_en_v2" />', N'<script>
  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');

  ga(''create'', ''UA-67618396-1'', ''auto'');
  ga(''send'', ''pageview'');

</script>', NULL)
GO
SET IDENTITY_INSERT [dbo].[Configuration] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'Male')
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'Female')
GO
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Icon] ON 

GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (1, N'fa fa-facebook-official')
GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (2, N'fa fa-twitter')
GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (3, N'fa fa-tumblr')
GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (1002, N'fa fa-google-plus')
GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (1003, N'fa fa-youtube')
GO
INSERT [dbo].[Icon] ([Id], [IconName]) VALUES (1004, N'fa fa-rss')
GO
SET IDENTITY_INSERT [dbo].[Icon] OFF
GO
SET IDENTITY_INSERT [dbo].[Messenger] ON 

GO
INSERT [dbo].[Messenger] ([Id], [Name]) VALUES (1, N'MSN')
GO
INSERT [dbo].[Messenger] ([Id], [Name]) VALUES (2, N'GTalk')
GO
INSERT [dbo].[Messenger] ([Id], [Name]) VALUES (3, N'ICQ')
GO
INSERT [dbo].[Messenger] ([Id], [Name]) VALUES (4, N'AIM')
GO
INSERT [dbo].[Messenger] ([Id], [Name]) VALUES (5, N'Twitter')
GO
SET IDENTITY_INSERT [dbo].[Messenger] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (1, N'Titulo de la Noticia', N'2015-11-22-081813_keyboard-338502_1920.jpg', CAST(0x0000A5580088E097 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce turpis mi, pulvinar quis est vel, ultricies cursus neque. Nunc vitae erat tincidunt urna aliquet aliquet. Morbi hendrerit felis felis, sit amet tincidunt eros bibendum a. Donec placerat facilisis metus at dapibus. Sed eu urna in mi congue facilisis. Ut leo mi, sollicitudin sed viverra sit amet, viverra at massa. Maecenas imperdiet vulputate odio, sit amet venenatis tortor eleifend sit amet.

Maecenas vestibulum at dui sed accumsan. Curabitur tristique dui vitae nulla blandit, in dictum dolor dictum. Sed quam mi, imperdiet sit amet porttitor a, malesuada vitae diam. Curabitur tincidunt libero aliquet rutrum gravida. Praesent vel diam neque. Ut imperdiet nisl eu porttitor finibus. Aliquam pharetra convallis ullamcorper. Pellentesque lobortis faucibus convallis. Nunc vehicula nec ligula sit amet feugiat. Etiam sed nibh iaculis, hendrerit nulla a, fermentum mauris. Aliquam nisl ex, hendrerit et elementum sit amet, posuere nec nisl. Praesent iaculis eros a magna pellentesque, a consectetur eros consequat. Ut elementum semper urna, ut pellentesque nisl bibendum at.', 0, 1, 0, 0, 0)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (2, N'Otra Noticia', N'2015-11-22-083009_14785092485_789919758b_k.jpg', CAST(0x0000A558008C4141 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce turpis mi, pulvinar quis est vel, ultricies cursus neque. Nunc vitae erat tincidunt urna aliquet aliquet. Morbi hendrerit felis felis, sit amet tincidunt eros bibendum a. Donec placerat facilisis metus at dapibus. Sed eu urna in mi congue facilisis. Ut leo mi, sollicitudin sed viverra sit amet, viverra at massa. Maecenas imperdiet vulputate odio, sit amet venenatis tortor eleifend sit amet.', 0, 2, 0, 1, 1)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (3, N'How to Develop a Membership Site With WordPress', N'2015-11-28-130951_free-psd-flyer-templates-autumn-party_featured_500.jpg', CAST(0x0000A55E00D8F122 AS DateTime), N'In the first part of this series, we covered customizing the registration and login forms. Today we’ll be covering how to add custom fields to the registration form. We’ll be adding a text input for a Twitter handle and a checkbox where users will need to agree to terms before registering. The work required can be divided into three parts:

Adding the fields themselves
Validation on the fields
Processing the data
We will also very briefly discuss the best ways to style your outgoing emails. This means users will receive nice branded emails when they register.  

Quickly before we start, make sure Anyone can register is ticked in your WordPress settings (Settings > General). ', 1, 3, 0, 0, 4)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (4, N'Free Halloween Vector Stamps Pack', N'2015-11-28-131549_free-halloween-vector-stamps-pack_featured_500.jpg', CAST(0x0000A55E00DA949A AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris luctus nulla vitae nibh iaculis, nec feugiat magna interdum. Integer sit amet sapien fringilla, venenatis dui vitae, rhoncus odio. Quisque at dictum mi. Nunc in sodales nisi. Vestibulum interdum molestie libero, in bibendum odio. Quisque eget risus mattis, fermentum metus quis, pharetra odio. Aenean varius arcu sit amet metus pellentesque, quis tristique lectus vulputate. Pellentesque eget arcu sit amet nibh facilisis sodales in quis risus. Pellentesque lacinia nibh sed interdum interdum. Morbi lobortis lacus dolor, nec fringilla ex cursus quis. Phasellus sed aliquam massa. In diam nunc, posuere at tincidunt quis, consequat nec urna.

Aenean vel faucibus odio. Maecenas accumsan mi sapien, ac cursus velit semper nec. Etiam maximus, eros vel lacinia tincidunt, ante risus facilisis nulla, a semper orci ante ut metus. Sed varius elementum eros. Sed non dui volutpat, iaculis elit nec, sollicitudin tellus. Cras dapibus sodales aliquet. In sed fringilla elit. Nunc volutpat placerat lacus. Sed venenatis velit nec nulla consequat, at interdum mauris euismod. Maecenas aliquam rutrum faucibus. Fusce gravida tempor quam, ac commodo justo semper a. Ut sagittis porttitor sapien in consectetur.', 0, 4, 0, 0, 3)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (5, N'Startuprr HTML ToolBox: Take Control of Your Next Big Project', N'2015-11-28-154527_multipurpose-html-template-startuprr_featured_500.jpg', CAST(0x0000A55E0103ACF7 AS DateTime), N'Suspendisse pharetra a lacus malesuada potenti cubilia enim sed sociis aptent risus felis vestibulum venenatis parturient venenatis adipiscing elementum feugiat a nunc elementum risus pharetra accumsan in cum. Urna magnis hendrerit a a elit malesuada enim hac nisl a ullamcorper a vestibulum in a est a class adipiscing mi pretium malesuada ultrices suscipit aliquam consectetur interdum ligula. Iaculis iaculis vehicula ullamcorper vivamus accumsan a augue at hendrerit sem proin conubia vestibulum ultrices orci vestibulum vitae ullamcorper parturient est ad adipiscing. Nec elementum laoreet platea morbi venenatis consectetur ullamcorper eu blandit potenti vestibulum a mi id accumsan nisl adipiscing suspendisse massa scelerisque est risus venenatis. Curae id ridiculus mauris vestibulum vehicula vestibulum potenti ullamcorper ipsum eleifend suspendisse viverra a facilisi torquent ullamcorper ullamcorper sapien parturient tristique nisl dapibus.

Dolor habitasse hendrerit euismod mi in parturient lobortis per a eget ad placerat dolor cum quam odio a a felis maecenas ut nibh. Sit parturient ipsum fringilla nisl adipiscing nisl mi diam ad suscipit auctor mollis a adipiscing auctor suscipit lacinia elit sagittis a praesent est torquent libero a ipsum. Himenaeos cursus hendrerit mi non ut vel diam a imperdiet himenaeos aenean adipiscing congue aliquam urna risus sem adipiscing cras ullamcorper hac ac. Cubilia integer suspendisse pretium vulputate consequat a viverra venenatis pharetra viverra eros rutrum suspendisse faucibus est cursus mi parturient morbi donec a.

Mollis nunc potenti parturient accumsan commodo vestibulum augue et ullamcorper vel posuere dapibus tristique id duis adipiscing eu justo nibh scelerisque torquent. Mus gravida ac massa id pulvinar dis blandit vestibulum nulla suscipit a ut nostra odio mus dignissim scelerisque parturient risus suspendisse. Lorem sed nostra nisl blandit nam curabitur ullamcorper eu sagittis venenatis vulputate natoque sapien euismod suspendisse fusce ut ac ullamcorper nec eget lacus tempus parturient adipiscing interdum scelerisque. Dui a vestibulum pulvinar non ut ligula maecenas vestibulum quis nostra vehicula nulla a parturient egestas fermentum eget dictum orci parturient vivamus parturient arcu. In felis gravida cubilia tempus arcu in lacinia diam ullamcorper ut eros consectetur vel a phasellus donec sociis facilisi rutrum tempus a a quis.

Vestibulum litora fusce laoreet a volutpat curae potenti at nunc justo eu ullamcorper vivamus torquent a mi ante nam amet nulla fringilla donec parturient et integer viverra id scelerisque. A parturient penatibus varius quam a a vestibulum fermentum adipiscing a a a vel sociis consectetur lorem laoreet nam vulputate fermentum sem lobortis mus at. Parturient ac ullamcorper scelerisque parturient volutpat ullamcorper tincidunt parturient vivamus feugiat ut dignissim netus phasellus interdum. Vitae auctor condimentum ultricies fames vestibulum fringilla per nam penatibus condimentum lobortis gravida condimentum vestibulum et penatibus ante parturient condimentum congue blandit. Nisl a mollis porta libero a pulvinar parturient auctor praesent donec lacinia sapien consectetur magnis eget nascetur ac posuere cursus vehicula a adipiscing a condimentum euismod vel. Nec quisque a eu ad est ullamcorper magnis congue nisi adipiscing vehicula et curae dolor vestibulum.

Dolor a in scelerisque adipiscing pulvinar ad at a suspendisse ullamcorper pulvinar suspendisse torquent facilisis.', 0, 2, 0, 0, 5)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (6, N'Create CSS3 Animated Search Box', N'2015-11-28-154835_css3-animated-search-box_featured_500.jpg', CAST(0x0000A55E01048966 AS DateTime), N'Etiam nisi a sagittis a ornare adipiscing neque adipiscing malesuada lectus vestibulum praesent et at natoque praesent adipiscing a platea lectus. Nisl condimentum vestibulum turpis libero a metus hac a consectetur quisque ut torquent quisque sodales vestibulum a parturient curae metus vitae cursus. At cras morbi suspendisse odio fames in consectetur taciti arcu a ornare orci a a eu amet massa luctus eu sem vel faucibus ullamcorper in habitasse consectetur ipsum. Dictumst mollis netus volutpat pretium laoreet vestibulum adipiscing ad vitae malesuada condimentum ullamcorper vestibulum condimentum ipsum fermentum leo mattis ullamcorper a ut. 

In a primis scelerisque ut mattis magnis a ante ac eget a ullamcorper rutrum pharetra lobortis lacus adipiscing parturient mi id a parturient suscipit ut dolor. Pharetra accumsan a sociis ridiculus vel libero parturient fringilla adipiscing dis ut vitae a elementum condimentum urna quisque vestibulum torquent ac bibendum. Mi ligula consequat a elit turpis a adipiscing nam duis dictum tristique vestibulum elementum sed. 

Imperdiet ac aenean etiam ultricies adipiscing porttitor ac iaculis a magna ad a condimentum egestas dignissim ullamcorper. Ornare a erat a parturient lobortis ullamcorper tortor fames a condimentum et inceptos massa interdum class id ac ullamcorper at eros vestibulum. Potenti vulputate scelerisque parturient a suspendisse curae scelerisque ullamcorper per in taciti vestibulum adipiscing a. Pretium at aliquet parturient a duis bibendum congue elit parturient scelerisque a a nascetur mus cum adipiscing class condimentum condimentum consectetur ullamcorper dis vulputate a quam. 

Faucibus malesuada ante aliquet nibh in sociosqu scelerisque luctus malesuada ultricies consectetur orci consectetur bibendum ornare ut aenean ridiculus conubia leo ullamcorper tincidunt. Eros a ullamcorper non vestibulum proin sociis metus class risus tempor interdum euismod elit massa et ipsum vestibulum tempor. Vestibulum suspendisse quam aliquet ad a nascetur suspendisse pulvinar lacus eget vivamus lacinia torquent a morbi torquent magnis scelerisque. Sagittis hac condimentum elementum semper aliquet a nullam imperdiet adipiscing duis tincidunt a pretium feugiat condimentum sed egestas nibh aliquet penatibus tincidunt elementum. 

Vestibulum varius conubia at ad ad ante eros ullamcorper suspendisse id orci ullamcorper curabitur interdum. Iaculis erat luctus penatibus vestibulum adipiscing pulvinar ultricies consectetur erat ad a ultrices id parturient elementum. At purus dolor nulla habitasse fusce volutpat consequat posuere parturient ad ante facilisis scelerisque id a risus et tristique neque nibh taciti non cras parturient condimentum at ornare. Ut a viverra parturient pulvinar convallis vel parturient consequat adipiscing lobortis placerat placerat consectetur sagittis vel duis eu placerat habitasse mus a nascetur congue adipiscing cubilia ac. Quis penatibus adipiscing nullam aliquam cras fermentum iaculis viverra euismod himenaeos bibendum platea diam nibh magna leo eget pulvinar tristique mus scelerisque est orci ad dolor. Consectetur senectus parturient sagittis ullamcorper non a conubia cum nam vestibulum sociosqu enim at ultricies consectetur curabitur a adipiscing parturient vestibulum parturient.', 0, 3, 0, 0, 8)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (7, N'Incredible Fantasy Creatures Brought To Life by Ellen Jewett', N'2015-11-28-191028_fantasy-creatures-brought-to-life_featured_500.jpg', CAST(0x0000A53F013BFC56 AS DateTime), N'Non lorem dignissim volutpat elit a eu curabitur fermentum adipiscing ultricies donec parturient vitae potenti a arcu adipiscing mus condimentum ullamcorper rutrum. Est habitasse tempus convallis consectetur suscipit ullamcorper id habitant magna adipiscing senectus pulvinar eu parturient. Proin vestibulum a volutpat vestibulum turpis feugiat eros placerat tempus rutrum mus a parturient placerat a arcu maecenas parturient mauris imperdiet elementum suspendisse eu torquent. Dolor facilisis consectetur adipiscing odio facilisis sem faucibus cras diam bibendum feugiat ullamcorper duis a massa suspendisse.

A ac a phasellus adipiscing sagittis ultrices nec duis pulvinar vestibulum scelerisque tristique gravida vestibulum fringilla a condimentum. Faucibus nam donec sem cursus vestibulum condimentum aliquet id parturient pretium mi vulputate pulvinar libero duis mattis neque netus hac massa dolor. Vestibulum nisl est faucibus adipiscing et augue dictumst at malesuada donec luctus orci vestibulum nam odio mus mattis eu ridiculus feugiat mi. Aliquet dignissim dignissim himenaeos metus facilisi ad vestibulum a a ullamcorper in odio vehicula parturient eu justo metus primis viverra.

Dui dis tincidunt vel proin eu nostra sapien suspendisse natoque per himenaeos cum ut nam rhoncus integer a a torquent nisl facilisi sem donec vehicula turpis eu. Fusce adipiscing odio gravida ornare blandit lorem a pulvinar suspendisse ipsum aenean dignissim tristique curae urna non elementum mauris rhoncus egestas ornare nisl scelerisque. A a cubilia diam erat imperdiet adipiscing metus mattis fusce sem senectus consectetur praesent tristique feugiat mus hac cras vestibulum convallis fringilla ad cras class venenatis. Volutpat nibh sapien arcu ac id purus adipiscing mi phasellus lorem nunc himenaeos magna neque eleifend nam vestibulum a. Gravida quisque nec class tortor aliquet a gravida vestibulum congue donec posuere vestibulum id consectetur velit.

Scelerisque rhoncus cum nibh ullamcorper sociosqu est nostra ipsum metus aptent ullamcorper nunc habitant fusce sagittis condimentum elit euismod sem ad vestibulum parturient litora a. Parturient parturient aptent dignissim curae habitant nibh platea a bibendum eu integer nec sem erat a hendrerit mus a a hac nam hac nibh id per vel a parturient. Duis magna litora condimentum eleifend dictum penatibus dapibus interdum sit non at montes dui scelerisque viverra vivamus aliquet venenatis nulla sem dolor in. Vestibulum consectetur rhoncus urna a parturient a fermentum egestas eleifend cum quis curae mattis arcu non vestibulum sed nam maecenas dui imperdiet taciti ac justo conubia. Aliquet nascetur interdum a parturient dui nostra platea consectetur egestas eros fringilla laoreet elementum sem nec a id volutpat platea sociosqu consectetur a hendrerit placerat habitant faucibus in et. Eget orci adipiscing interdum sem leo ultrices a mus quisque et est vestibulum dis elementum cras mus suscipit condimentum vel donec.

Convallis ultricies sem quam adipiscing venenatis ac suspendisse a nibh elit ridiculus malesuada potenti proin eget lectus scelerisque fusce adipiscing netus. At augue parturient a magnis sem nibh vivamus a a semper a est dignissim volutpat fames fames bibendum adipiscing interdum condimentum nunc netus vestibulum sit tortor varius erat dignissim. A faucibus ullamcorper at urna porta imperdiet elit morbi leo scelerisque nullam parturient ullamcorper a posuere euismod ac a enim rutrum. Class condimentum ac rhoncus euismod curae condimentum duis blandit metus a penatibus ullamcorper vivamus scelerisque vitae diam a a id.

Tempor sem suspendisse a aenean lectus laoreet enim a leo himenaeos curae facilisi aliquam ridiculus ullamcorper tellus adipiscing eu quam a elit condimentum ut curabitur diam vehicula vestibulum. Dignissim mi ac a a lacus risus ut vestibulum posuere a tincidunt curae a elit parturient porta neque habitasse eu vestibulum venenatis conubia posuere enim placerat in id. Penatibus a adipiscing suspendisse a a magna elit et parturient parturient tincidunt vestibulum a vestibulum nulla. Parturient at a dolor vivamus est ut vitae posuere a euismod a vestibulum enim suspendisse ullamcorper elit vestibulum nisl a per nunc in aliquam adipiscing a blandit ad. A curabitur condimentum parturient primis parturient gravida proin mi montes porttitor gravida nibh ullamcorper eleifend facilisi condimentum turpis ornare mauris.', 0, 2, 0, 0, 6)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (1005, N'Improved Ajax Techniques for WordPress: Object-Oriented Programming', N'2015-11-29-081048_why-good-web-design-starts-and-ends-with-names_featured_500.jpg', CAST(0x0000A55F0086CDDB AS DateTime), N'In the previous post in this series, we revisited the topic of working with Ajax in WordPress. Ultimately, the goal is to improve upon a previous series that was run on the site a few years ago.

To reiterate, it''s not that the techniques taught in the original series were wrong, but it''s that software changes over time so it''s always good to revisit concepts that were covered years ago and try to update them to something that''s a bit more current and more resilient for our development efforts.

Recall from the previous post, we looked at the following comment from the original series:

We''re going to give a very brief overview of what Ajax is, how it works, how to set it up on the front, and understanding the hooks that WordPress provides. We''ll also actually build a small project that puts the theory into practice. We''ll walk through the source code and we''ll also make sure it''s available on GitHub, as well.
And in that post, we reviewed some advanced ways to incorporate the WordPress Ajax API into our projects using procedural programming. In this post, we''re going to take the code that we wrote in the first part of this series and refactor it so that it uses an object-oriented approach.

Ultimately, the goal is not to make a case why one paradigm should be used over the other; instead, it is to show how we can achieve the same functionality regardless of the approach that you choose when building your plugins.', 0, 1, 0, 0, 0)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (1006, N'How to Create Animated Latvian Patterns in Adobe Illustrator and After Effects', N'2015-11-29-081848_latvian-signs.jpg', CAST(0x0000A55F008900AC AS DateTime), N'Etiam nisl facilisis a a at ipsum orci sodales dui tincidunt vestibulum ac id varius a justo a parturient a suspendisse eleifend conubia. Vel feugiat risus quis imperdiet non eleifend est ullamcorper vel taciti gravida conubia posuere suspendisse ad enim elit adipiscing ullamcorper. Quis parturient nec nam ut mi fusce habitant curabitur ullamcorper id a placerat integer leo suscipit vivamus fermentum a gravida tortor adipiscing consectetur. Vestibulum vestibulum id eleifend facilisi suspendisse nec potenti ullamcorper a convallis dignissim a suspendisse arcu arcu sodales cras ligula scelerisque. Quisque ridiculus condimentum lacinia accumsan mattis id donec feugiat sociosqu mus sed scelerisque condimentum a ultrices vehicula lobortis adipiscing consequat parturient sit a accumsan commodo. Fusce ante condimentum non eu euismod vestibulum nostra cubilia parturient a venenatis fusce imperdiet dictumst a potenti nec parturient ornare himenaeos porta cursus hac consectetur rutrum condimentum morbi condimentum. Vestibulum lacus quis a leo mi a eu tincidunt risus nunc ac curabitur hac dis a lectus parturient cum a ligula.

Hendrerit adipiscing dictum dis in facilisi adipiscing est quisque purus suspendisse justo suspendisse mi a dignissim eros. Id suspendisse diam scelerisque orci habitasse egestas commodo in felis semper quis pharetra nec arcu cum volutpat ipsum a dui consequat eu nibh. Suspendisse ut nam cubilia fermentum pharetra malesuada platea pretium dignissim senectus habitasse mus aliquet a cursus quis a condimentum orci a tempus luctus id ligula morbi.

Feugiat eu libero vestibulum congue a eu dignissim ut auctor netus consectetur fames netus condimentum neque tincidunt ornare vestibulum tristique sodales fermentum ullamcorper. Ligula condimentum ut phasellus a nascetur adipiscing integer molestie cras parturient vestibulum ac consectetur proin maecenas consectetur mattis parturient parturient risus at et condimentum. Morbi cursus tortor a viverra sociosqu donec neque dignissim nunc consectetur parturient condimentum suspendisse per erat luctus risus consequat condimentum. A habitasse risus commodo tincidunt ut a mauris ac a vel auctor curae scelerisque imperdiet suspendisse curae non dictum eget tellus.

In sagittis parturient aenean parturient condimentum nulla facilisi montes nulla eget euismod ridiculus platea a eget sapien ullamcorper torquent nisl. Suscipit parturient cubilia parturient feugiat ipsum nisl elit maecenas netus nostra dapibus quam scelerisque sodales eleifend convallis parturient hac a justo sagittis. Dapibus adipiscing quam adipiscing scelerisque torquent eleifend euismod tortor parturient quam aptent magna et mauris ullamcorper tristique torquent in condimentum adipiscing urna quam. Mi aliquet scelerisque eget porttitor scelerisque ullamcorper vestibulum nec luctus arcu sapien nostra ullamcorper non adipiscing cursus a laoreet mollis quam. Convallis eros morbi nascetur nam adipiscing sapien vivamus non tristique curabitur eu massa a ut tristique a. A inceptos ultricies sapien a scelerisque accumsan vehicula curabitur praesent volutpat lacinia tristique mauris a id parturient scelerisque ut tempor erat.

Mi convallis viverra aenean placerat dolor lacus vestibulum morbi donec ut himenaeos quisque a ac scelerisque nibh a taciti eros a molestie elementum consequat potenti sit tincidunt at parturient. Fringilla litora nascetur quam vel a ullamcorper a adipiscing a ut pretium a cursus nunc condimentum vestibulum hac purus potenti eros parturient congue amet. Volutpat at platea erat massa accumsan sapien eleifend scelerisque vestibulum a curae tincidunt eros phasellus erat suscipit diam et justo dui lacinia. Parturient curae fermentum sem neque hac praesent malesuada adipiscing sagittis luctus ac eu penatibus at vestibulum erat scelerisque suscipit consectetur a a blandit dis. Auctor scelerisque erat amet viverra nibh condimentum malesuada a parturient aptent ultrices a vivamus varius condimentum.

A parturient suspendisse adipiscing blandit sem mattis parturient justo eros mi facilisi porta eu bibendum per penatibus at nulla platea elit per urna eu. Lacus a feugiat taciti consectetur et ullamcorper turpis aliquam a condimentum a eget scelerisque natoque ante velit a a condimentum vestibulum primis suspendisse mus. A scelerisque risus a quam praesent vestibulum semper a cras faucibus dapibus scelerisque ut quisque ad quisque.

Luctus venenatis cras urna placerat parturient potenti nec nisl a elit eleifend venenatis curabitur a nec parturient scelerisque habitasse sit vestibulum. Vestibulum nam accumsan elementum suspendisse condimentum tristique fringilla mus in dui duis adipiscing ullamcorper conubia parturient varius placerat scelerisque accumsan parturient enim pretium condimentum parturient lacinia.', 1, 3, 0, 0, 1)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (2005, N'Instagrammer Daniel Cerejo Unveils The Secret Life Of Toys', N'2015-12-03-120309_secret-life-toys_featured_500.jpg', CAST(0x0000A56300C69FA8 AS DateTime), N'[size=100][center][img]http://k30.kn3.net/B/9/7/1/1/F/6A7.gif[/img]?[/center]

[b]Himenaeos penatibus[/b] ultrices nisl iaculis suspendisse vestibulum sit vestibulum aenean ullamcorper a cubilia scelerisque vel parturient himenaeos fermentum ullamcorper ultricies adipiscing gravida sed faucibus. [i]Tortor scelerisque nullam vitae a nec in consectetur et a a parturient a condimentum elementum parturient nam dignissim per adipiscing id leo a sem. Ante dictum a in vivamus parturient in malesuada egestas praesent sociosqu nam magna nec porta vulputate condimentum sed condimentum vel sociis. Vestibulum scelerisque a duis eget tellus massa donec nisi curae condimentum pretium condimentum[/i] scelerisque phasellus a scelerisque porta sit. Taciti vel per mi platea urna dui eget vel etiam a egestas nisl per sem vestibulum vestibulum erat fusce augue inceptos. Sed a morbi luctus dignissim iaculis cum sapien nisl volutpat convallis lacus vestibulum morbi sed tempus convallis euismod himenaeos adipiscing diam dapibus sociosqu facilisi parturient parturient vestibulum adipiscing mi.

Adipiscing conubia curabitur porttitor a nulla duis morbi vestibulum hac ullamcorper a scelerisque congue vestibulum montes vehicula torquent integer a porttitor vel a aenean. Id dignissim nibh morbi vivamus nascetur a gravida cubilia condimentum hac ac bibendum potenti nunc vivamus ad fringilla parturient per eu phasellus cum nam amet sodales parturient.
[/size]', 1, 1, 0, 0, 2)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (2006, N'Introduction to the CSS Grid Layout', N'2015-12-09-115606_tatooine_jobfair.gif', CAST(0x0000A56900C4AFCD AS DateTime), N'CSS is constantly evolving. Some of the features being talked about now may well become mainstream in the near future, while others will likely fade into obscurity. Either way, understanding which CSS selectors, layout modules and filters are being considered for the future will make you a stronger front-end developer.

[center][video]DPWrk19940g[/video][/center]

One option that may soon find widespread acceptance is the grid layout. As you can imagine, this subset of CSS has the potential to simplify the process of laying out your content.
In this short video from my recent course, [url=https://webdesign.tutsplus.com/courses/the-css-of-the-future?ec_promo=lesson_as_tutorial]The CSS of the Future[/url], I''ll introduce you to this exciting feature. I''ll explain briefly how it works, before discussing browser support (which is limited right now) and showing you how you can enable support for the grid layout in Chrome.

[size=150]Watch the Full Course[/size]

In the full course, [url=https://webdesign.tutsplus.com/courses/the-css-of-the-future?ec_promo=lesson_as_tutorial]The CSS of the Future[/url], I''ll walk you through some of the bleeding-edge features of CSS to help you remain current and ahead of the field.
Some of the features covered may well become mainstream in the near future, while others will likely fade into obscurity. Either way, understanding which CSS selectors, layout modules and filters are being considered for the future will make you a stronger front-end developer.

', 1, 1, 0, 0, 4)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (2007, N'How to Design a Stylish Kids'' Magazine in Adobe InDesign', N'2015-12-10-114438_starwars.png', CAST(0x0000A56A00C1889A AS DateTime), N'[center][img]https://cms-assets.tutsplus.com/uploads/users/114/posts/25331/final_image/Cover-Mock-up.png[/img]?


[/center]Magazines aimed at children and families are enjoying a resurgence, with titles like[i]Milk[/i] in France and [i]Junior[/i] in the UK presenting super-stylish designs.
If you want to get started with creating your very own kid-friendly magazine, this tutorial is going to take you through the steps of developing a brand for your publication and setting up the cover and page layouts in Adobe InDesign.
Maybe you’ve designed magazines for adults before, or perhaps you’re completely new to magazine design. Either way, you’ll find that designing magazines which are aimed at kids is a really fun process, and in some ways breaks away from the conventions of traditional magazine design.
The way you build the magazine’s brand is going to be a little different to designing titles for adults, and you may need adjust some things, like type size and color, to create a design that’s going to attract the right readership.
If you''d like to discover more [url=http://graphicriver.net/category/print-templates/magazines]magazine templates for print[/url], aimed at all kinds of audiences, there''s a great selection over on [url=http://graphicriver.net/category/print-templates/magazines]Envato Market[/url].

The example brand and template that you can recreate in this tutorial is suited to education or even to retail brands aimed at families, and the design taps into the trendy Scandi style that’s dominating children’s design at the moment. We’ll take a look at how to create a strong brand ‘look’ for the magazine first, and then walk through the steps of setting up the magazine document in Adobe InDesign. 

[center][img]https://cms-assets.tutsplus.com/uploads/users/114/posts/25331/image/Pages-Mock-up-1.png[/img][/center]

Ready? Great! Let’s get started... Nah, just kidding.
', 0, 1, 0, 0, 6)
GO
INSERT [dbo].[Post] ([Id], [Title], [Image], [Time], [Description], [Highlight], [Id_Category], [DisabledComments], [Deleted], [Visits]) VALUES (2008, N'Essential Rails Gems', N'2015-12-10-140554_ruby.jpg', CAST(0x0000A56A00E85676 AS DateTime), N'Ruby on Rails is a great framework for quickly and easily building applications for the web. It''s a framework designed with developer productivity and happiness in mind. However, there are lots of commonly required features that Rails doesn''t support out of the box. You can always roll your own solutions, but the best case is to use a community-created gem.
In this course, Tuts+ instructor José Mota will show you how to use some of the most commonly needed gems for Rails apps. You''ll learn about gems that improve the debugging experience, that help with user authorization and authentication, that run tasks, perform search, protect data and more! You''ll also learn about some really crucial testing gems along the way.

[center][video]_e3p6M7xbig[/video][/center]

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et scelerisque diam, quis sagittis nisl. Cras tempus magna nisi, vel hendrerit ligula convallis non. Vestibulum porta accumsan placerat. Nulla convallis vulputate ante eget gravida. Sed in nulla et justo venenatis molestie sed sit amet diam. Quisque venenatis, dolor in maximus maximus, tellus lacus pellentesque justo, ac facilisis eros dui consequat tellus. Nam mattis lacus eget lorem placerat aliquet. Quisque a blandit libero, eget volutpat erat. Donec accumsan scelerisque urna vel vulputate. Cras vehicula, erat eget hendrerit finibus, libero nisl tempor lacus, sit amet dapibus ipsum turpis aliquam erat. Proin nisl sapien, mattis at nisi non, aliquet eleifend est. Duis gravida, orci id tempor luctus, lacus velit aliquet mi, sed mattis risus libero vitae nisi. Vivamus at placerat justo.
Morbi hendrerit gravida orci, ac scelerisque mauris tempus at. Etiam rutrum malesuada purus at sollicitudin. Nullam semper vestibulum lacus, in elementum sapien rhoncus sit amet. Pellentesque a sapien euismod, malesuada justo sed, sodales est. In feugiat vehicula enim at cursus. Vivamus mollis sit amet purus eu cursus. Aenean nec mi ipsum. Nullam sit amet mi quis dolor sagittis ultrices nec ut orci. Ut lacinia quam ac ante porttitor, nec convallis augue consequat. Nam rutrum augue in erat semper suscipit. Maecenas convallis sapien quis tristique dignissim. Vivamus vehicula suscipit tortor eget sollicitudin. Curabitur ac fringilla sapien. Mauris fermentum sagittis ligula, eu interdum arcu. Vivamus tempor odio eget ex pellentesque varius. Nulla consectetur, nulla a dapibus tristique, tortor dui fermentum ex, vel rhoncus mi ex quis metus.', 0, 1, 0, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Tags] ON 

GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2, 1, 3)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (3, 1, 4)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4, 1, 5)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (5, 2, 2)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1002, 3, 1002)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1003, 4, 1003)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1004, 5, 1003)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1005, 6, 1004)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1006, 6, 1005)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1007, 7, 1003)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (1008, 7, 1006)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2002, 1005, 2002)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2003, 1005, 2003)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2004, 1005, 2004)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2005, 1006, 2005)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2006, 1006, 2006)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (2007, 1006, 2007)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (3002, 2005, 3002)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4002, 2006, 1005)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4003, 2007, 2005)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4004, 2007, 2006)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4005, 2007, 1004)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4006, 2008, 2)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4007, 2008, 2004)
GO
INSERT [dbo].[Post_Tags] ([Id], [Id_Post], [Id_Tags]) VALUES (4008, 2008, 1)
GO
SET IDENTITY_INSERT [dbo].[Post_Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

GO
INSERT [dbo].[Profile] ([Id], [Id_User], [Name], [LastName], [Id_Gender], [Bio], [Avatar], [Website], [Id_CivilStatus], [Id_Messenger], [MessengerName], [Company], [Profession], [Id_Sector], [ProfessionalInterests], [ProfessionalSkills], [Interests], [Hobbies], [FavoriteTVSerie], [FavoriteMusic], [FavoriteSport], [FavoriteBooks], [FavoriteMovies], [FavoriteFood], [Heroe], [Birthday]) VALUES (2, N'48b2e11c-2bdf-4fe1-98c8-4de0dd1fa40d', N'Julio', N'Poveda', 1, N'asdasd', NULL, N'http://juliopoveda.com/', 1, 5, N'nesticle8bit', N'sdasd', N'asda', 6, N'asda', N'sdasd', N'asdasd', N'asda', N'sdasd', N'asd', N'asd', N'asda', N'sda', N'asd', N'asd', NULL)
GO
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[Sector] ON 

GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (1, N'Call center')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (2, N'Creativity')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (3, N'Design')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (4, N'E-commerce')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (5, N'Production')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (6, N'Technology')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (7, N'Telemarketing')
GO
INSERT [dbo].[Sector] ([Id], [Name]) VALUES (8, N'Sales')
GO
SET IDENTITY_INSERT [dbo].[Sector] OFF
GO
SET IDENTITY_INSERT [dbo].[Social] ON 

GO
INSERT [dbo].[Social] ([Id], [Name], [Link], [Id_Icon], [Status]) VALUES (1, N'Facebook', N'https://facebook.com/nesticle8bit', 1, 1)
GO
INSERT [dbo].[Social] ([Id], [Name], [Link], [Id_Icon], [Status]) VALUES (2, N'Twitter', N'https://twitter.com/nesticle8bit', 2, 1)
GO
INSERT [dbo].[Social] ([Id], [Name], [Link], [Id_Icon], [Status]) VALUES (3, N'Youtube', N'https://www.youtube.com/channel/UCG3weCzmLgDnZk51H5Vqe8Q', 1003, 1)
GO
INSERT [dbo].[Social] ([Id], [Name], [Link], [Id_Icon], [Status]) VALUES (4, N'Google +', N'https://plus.google.com/112989591546496355290', 1002, 1)
GO
INSERT [dbo].[Social] ([Id], [Name], [Link], [Id_Icon], [Status]) VALUES (5, N'RSS', N'http://localhost:7735/rss', 1004, 1)
GO
SET IDENTITY_INSERT [dbo].[Social] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'Web Design')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'News')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Noticias')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'Lipsum')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'Design')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1002, N'Web Development')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1003, N'Freebie')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1004, N'Articles')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1005, N'CSS3')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1006, N'Fantasy')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2002, N'Ajax')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2003, N'OOP')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2004, N'Programming')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2005, N'Animated')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2006, N'Patterns')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2007, N'After Effects')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3002, N'Toys')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4002, N'CSS')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4003, N'Javascript')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4004, N'jQuery')
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([Id_Post])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Post] FOREIGN KEY([Id_Post])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Tags] CHECK CONSTRAINT [FK_Post_Tags_Post]
GO
ALTER TABLE [dbo].[Post_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Tags] FOREIGN KEY([Id_Tags])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[Post_Tags] CHECK CONSTRAINT [FK_Post_Tags_Tags]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_AspNetUsers] FOREIGN KEY([Id_User])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_AspNetUsers]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_CivilStatus] FOREIGN KEY([Id_CivilStatus])
REFERENCES [dbo].[CivilStatus] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_CivilStatus]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Gender] FOREIGN KEY([Id_Gender])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Gender]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Messenger] FOREIGN KEY([Id_Messenger])
REFERENCES [dbo].[Messenger] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Messenger]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Sector] FOREIGN KEY([Id_Sector])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Sector]
GO
ALTER TABLE [dbo].[Social]  WITH CHECK ADD  CONSTRAINT [FK_Social_Icon] FOREIGN KEY([Id_Icon])
REFERENCES [dbo].[Icon] ([Id])
GO
ALTER TABLE [dbo].[Social] CHECK CONSTRAINT [FK_Social_Icon]
GO

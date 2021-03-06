USE [BenevolentDictatorDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Economies]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Economies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ResourceFactor] [real] NOT NULL,
 CONSTRAINT [PK_Economies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CapitalEffect] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PopulationEffect] [int] NOT NULL,
	[PopulationFactor] [real] NOT NULL,
	[ResourceEffect] [int] NOT NULL,
	[ResourceFactor] [real] NOT NULL,
	[StabilityEffect] [int] NOT NULL,
 CONSTRAINT [PK_Events_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventsTemp]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsTemp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CapitalEffect] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PopulationEffect] [int] NOT NULL,
	[PopulationFactor] [real] NOT NULL,
	[ResourceEffect] [int] NOT NULL,
	[ResourceFactor] [real] NOT NULL,
	[StabilityEffect] [int] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Geographies]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geographies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PopulationFactor] [real] NOT NULL,
	[ResourceFactor] [real] NOT NULL,
 CONSTRAINT [PK_Geographies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Governments]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisasterFactor] [real] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StabilityFactor] [real] NOT NULL,
 CONSTRAINT [PK_Governments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nations]    Script Date: 2/23/2017 3:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
	[Capital] [int] NOT NULL,
	[CapitalGain] [int] NOT NULL,
	[DisasterResistance] [real] NOT NULL,
	[EconomyId] [int] NOT NULL,
	[GeographyId] [int] NOT NULL,
	[GovernmentId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Population] [int] NOT NULL,
	[PopulationGain] [int] NOT NULL,
	[ResourceGain] [int] NOT NULL,
	[Resources] [int] NOT NULL,
	[Stability] [int] NOT NULL,
	[TradeHigh] [bit] NOT NULL,
 CONSTRAINT [PK_Nations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170222181255_Initial', N'1.0.1')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'1583cfcb-14a0-4051-bd68-d4bb662f976d', 0, N'8714dafb-5588-467a-ac82-475099882a84', NULL, 0, 1, NULL, NULL, N'LINA', N'AQAAAAEAACcQAAAAEJg+TQeSDiyk7GuAid3iPmx3+sni5BxB3Z/BN7xkbFIcFgqOTjDBkY6osJIGlHrykA==', NULL, 0, N'4cac031c-a7d1-42db-b9da-088b7e5de8a4', 0, N'lina')
SET IDENTITY_INSERT [dbo].[Economies] ON 

INSERT [dbo].[Economies] ([Id], [Name], [ResourceFactor]) VALUES (5, N'Capitalism', 1)
INSERT [dbo].[Economies] ([Id], [Name], [ResourceFactor]) VALUES (6, N'Socialism', 1.2)
INSERT [dbo].[Economies] ([Id], [Name], [ResourceFactor]) VALUES (7, N'Communism', 0.8)
SET IDENTITY_INSERT [dbo].[Economies] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (1, 60, N'Market Crash', 90, 1, 100, 1, 100)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (2, 90, N'Natural Disaster', 75, 0.9, 80, 0.9, 90)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (3, 100, N'Plague', 75, 0.7, 100, 1, 80)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (4, 100, N'War', 80, 0.9, 80, 0.9, 85)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (5, 110, N'Medical Advancement', 120, 1.2, 100, 1, 110)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (6, 125, N'International Glory', 100, 1, 100, 1, 140)
INSERT [dbo].[Events] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (7, 115, N'New Technology', 100, 1, 120, 1.1, 120)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[EventsTemp] ON 

INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (1, 60, N'Market Crash', 90, 1, 100, 1, 100)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (2, 90, N'Natural Disaster', 75, 0.9, 80, 0.9, 90)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (4, 100, N'Plague', 75, 0.7, 100, 1, 80)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (5, 100, N'War', 80, 0.9, 80, 0.9, 85)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (6, 110, N'Medical Advancement', 120, 1.2, 100, 1, 110)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (7, 125, N'International Glory', 100, 1, 100, 1, 140)
INSERT [dbo].[EventsTemp] ([Id], [CapitalEffect], [Name], [PopulationEffect], [PopulationFactor], [ResourceEffect], [ResourceFactor], [StabilityEffect]) VALUES (8, 115, N'New Technology', 100, 1, 120, 1.1, 120)
SET IDENTITY_INSERT [dbo].[EventsTemp] OFF
SET IDENTITY_INSERT [dbo].[Geographies] ON 

INSERT [dbo].[Geographies] ([Id], [Name], [PopulationFactor], [ResourceFactor]) VALUES (1, N'Mountain Forest', 1, 1.2)
INSERT [dbo].[Geographies] ([Id], [Name], [PopulationFactor], [ResourceFactor]) VALUES (2, N'Desert', 0.8, 0.8)
INSERT [dbo].[Geographies] ([Id], [Name], [PopulationFactor], [ResourceFactor]) VALUES (3, N'Tropics', 1.2, 1.2)
INSERT [dbo].[Geographies] ([Id], [Name], [PopulationFactor], [ResourceFactor]) VALUES (4, N'River Delta', 0.8, 1.2)
INSERT [dbo].[Geographies] ([Id], [Name], [PopulationFactor], [ResourceFactor]) VALUES (5, N'Industrial', 1.2, 0.8)
SET IDENTITY_INSERT [dbo].[Geographies] OFF
SET IDENTITY_INSERT [dbo].[Governments] ON 

INSERT [dbo].[Governments] ([Id], [DisasterFactor], [Name], [StabilityFactor]) VALUES (1, 1.2, N'Anarchy', 0.8)
INSERT [dbo].[Governments] ([Id], [DisasterFactor], [Name], [StabilityFactor]) VALUES (2, 1, N'Democracy', 1.2)
INSERT [dbo].[Governments] ([Id], [DisasterFactor], [Name], [StabilityFactor]) VALUES (3, 1.2, N'Oligarchy', 1)
INSERT [dbo].[Governments] ([Id], [DisasterFactor], [Name], [StabilityFactor]) VALUES (4, 1.2, N'Monarchy', 0.8)
SET IDENTITY_INSERT [dbo].[Governments] OFF
SET IDENTITY_INSERT [dbo].[Nations] ON 

INSERT [dbo].[Nations] ([Id], [ApplicationUserId], [Capital], [CapitalGain], [DisasterResistance], [EconomyId], [GeographyId], [GovernmentId], [Name], [Population], [PopulationGain], [ResourceGain], [Resources], [Stability], [TradeHigh]) VALUES (50, N'1583cfcb-14a0-4051-bd68-d4bb662f976d', 3345, 100, 1.2, 6, 3, 3, N'BananaRama', 4244, 129, 129, 1786, 197, 1)
SET IDENTITY_INSERT [dbo].[Nations] OFF
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Nations]  WITH NOCHECK ADD  CONSTRAINT [FK_Nations_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Nations] NOCHECK CONSTRAINT [FK_Nations_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Nations]  WITH CHECK ADD  CONSTRAINT [FK_Nations_Economies_EconomyId] FOREIGN KEY([EconomyId])
REFERENCES [dbo].[Economies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nations] CHECK CONSTRAINT [FK_Nations_Economies_EconomyId]
GO
ALTER TABLE [dbo].[Nations]  WITH CHECK ADD  CONSTRAINT [FK_Nations_Geographies_GeographyId] FOREIGN KEY([GeographyId])
REFERENCES [dbo].[Geographies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nations] CHECK CONSTRAINT [FK_Nations_Geographies_GeographyId]
GO
ALTER TABLE [dbo].[Nations]  WITH CHECK ADD  CONSTRAINT [FK_Nations_Governments_GovernmentId] FOREIGN KEY([GovernmentId])
REFERENCES [dbo].[Governments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nations] CHECK CONSTRAINT [FK_Nations_Governments_GovernmentId]
GO

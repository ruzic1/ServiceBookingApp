USE [master]
GO
/****** Object:  Database [CsLab]    Script Date: 3/1/2022 3:27:15 PM ******/
CREATE DATABASE [CsLab]
GO
ALTER DATABASE [CsLab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CsLab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CsLab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CsLab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CsLab] SET ARITHABORT OFF 
GO
ALTER DATABASE [CsLab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CsLab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CsLab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CsLab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CsLab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CsLab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CsLab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CsLab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CsLab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CsLab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CsLab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CsLab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CsLab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CsLab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CsLab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CsLab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CsLab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CsLab] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CsLab] SET  MULTI_USER 
GO
ALTER DATABASE [CsLab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CsLab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CsLab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CsLab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CsLab] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CsLab]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufacturersVehicleTypes]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturersVehicleTypes](
	[VehicleTypeId] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
 CONSTRAINT [PK_ManufacturersVehicleTypes] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeId] ASC,
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationPlates]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationPlates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationPlate] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RegistrationPlates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValidUntil] [datetime] NOT NULL,
	[IssuedAt] [datetime] NOT NULL,
	[RegistrationPlateId] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
 CONSTRAINT [PK_Registrations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceSchedules]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[ScheduledFor] [datetime] NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[AdditionalInfo] [nvarchar](500) NULL,
	[FinishedAt] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ServiceSchedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceTypes]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServiceTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCase]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCase](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCase] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[Label] [nvarchar](100) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 3/1/2022 3:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VehicleTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (1, N'Audi')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (3, N'BMW')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (4, N'Fiat')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (5, N'Scania')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (2, N'Volvo')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (1, 1)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (1, 2)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (1, 3)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (1, 4)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (3, 4)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (4, 5)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (5, 1)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (5, 2)
INSERT [dbo].[ManufacturersVehicleTypes] ([VehicleTypeId], [ManufacturerId]) VALUES (5, 3)
GO
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (1, N'A3', 1, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (2, N'A4', 1, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (3, N'A5', 1, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (4, N'Doblo', 4, 3)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (6, N'E-Ducato', 4, 3)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (7, N'XC90 Recharge', 2, 5)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (8, N'XC60 Recharge', 2, 5)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (9, N'S60', 2, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (10, N'S90', 2, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (11, N'3', 3, 1)
INSERT [dbo].[Models] ([Id], [Name], [ManufacturerId], [VehicleTypeId]) VALUES (12, N'G410', 5, 4)
SET IDENTITY_INSERT [dbo].[Models] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistrationPlates] ON 

INSERT [dbo].[RegistrationPlates] ([Id], [RegistrationPlate]) VALUES (1, N'BG-7584-3A')
INSERT [dbo].[RegistrationPlates] ([Id], [RegistrationPlate]) VALUES (2, N'NS-4343-DF')
INSERT [dbo].[RegistrationPlates] ([Id], [RegistrationPlate]) VALUES (3, N'PA-5555-SS')
INSERT [dbo].[RegistrationPlates] ([Id], [RegistrationPlate]) VALUES (4, N'TD-1234-PP')
SET IDENTITY_INSERT [dbo].[RegistrationPlates] OFF
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 

INSERT [dbo].[Registrations] ([Id], [ValidUntil], [IssuedAt], [RegistrationPlateId], [VehicleId]) VALUES (1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), CAST(N'2019-03-22T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Registrations] ([Id], [ValidUntil], [IssuedAt], [RegistrationPlateId], [VehicleId]) VALUES (2, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2020-08-08T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Registrations] ([Id], [ValidUntil], [IssuedAt], [RegistrationPlateId], [VehicleId]) VALUES (3, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Registrations] ([Id], [ValidUntil], [IssuedAt], [RegistrationPlateId], [VehicleId]) VALUES (4, CAST(N'2021-04-21T00:00:00.000' AS DateTime), CAST(N'2020-04-21T00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[Registrations] ([Id], [ValidUntil], [IssuedAt], [RegistrationPlateId], [VehicleId]) VALUES (5, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2021-05-20T00:00:00.000' AS DateTime), 4, 4)
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceSchedules] ON 

INSERT [dbo].[ServiceSchedules] ([Id], [VehicleId], [ScheduledFor], [ServiceTypeId], [AdditionalInfo], [FinishedAt], [Price]) VALUES (1, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 1, N'Air condition filter replacement', CAST(N'2021-07-08T00:00:00.000' AS DateTime), CAST(150 AS Decimal(18, 0)))
INSERT [dbo].[ServiceSchedules] ([Id], [VehicleId], [ScheduledFor], [ServiceTypeId], [AdditionalInfo], [FinishedAt], [Price]) VALUES (2, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 3, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[ServiceSchedules] ([Id], [VehicleId], [ScheduledFor], [ServiceTypeId], [AdditionalInfo], [FinishedAt], [Price]) VALUES (3, 2, CAST(N'2019-02-23T00:00:00.000' AS DateTime), 2, NULL, CAST(N'2019-02-23T00:00:00.000' AS DateTime), CAST(1000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ServiceSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceTypes] ON 

INSERT [dbo].[ServiceTypes] ([Id], [Name]) VALUES (2, N'Major')
INSERT [dbo].[ServiceTypes] ([Id], [Name]) VALUES (1, N'Minor')
INSERT [dbo].[ServiceTypes] ([Id], [Name]) VALUES (4, N'Other')
INSERT [dbo].[ServiceTypes] ([Id], [Name]) VALUES (3, N'Tire Replacement')
SET IDENTITY_INSERT [dbo].[ServiceTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (2, N'user', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCase] ([UserId], [UseCaseId]) VALUES (1, 1)
INSERT [dbo].[UserUseCase] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UserUseCase] ([UserId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[UserUseCase] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UserUseCase] ([UserId], [UseCaseId]) VALUES (1, 5)
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (1, 1, N'John''s Audi')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (2, 3, N'Unused 1')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (3, 6, NULL)
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (4, 7, N'John Doe XC90')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (5, 9, N'S60 Marco')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (6, 12, N'Andrew''s Truck')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (7, 11, N'Unused 2')
INSERT [dbo].[Vehicles] ([Id], [ModelId], [Label]) VALUES (8, 6, N'Unused 3')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([Id], [Name]) VALUES (2, N'Bikes')
INSERT [dbo].[VehicleTypes] ([Id], [Name]) VALUES (1, N'Cars')
INSERT [dbo].[VehicleTypes] ([Id], [Name]) VALUES (5, N'SUV')
INSERT [dbo].[VehicleTypes] ([Id], [Name]) VALUES (4, N'Trucks')
INSERT [dbo].[VehicleTypes] ([Id], [Name]) VALUES (3, N'Vans')
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Manufacturers]    Script Date: 3/1/2022 3:27:15 PM ******/
ALTER TABLE [dbo].[Manufacturers] ADD  CONSTRAINT [IX_Manufacturers] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RegistrationPlates]    Script Date: 3/1/2022 3:27:15 PM ******/
ALTER TABLE [dbo].[RegistrationPlates] ADD  CONSTRAINT [IX_RegistrationPlates] UNIQUE NONCLUSTERED 
(
	[RegistrationPlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ServiceTypes]    Script Date: 3/1/2022 3:27:15 PM ******/
ALTER TABLE [dbo].[ServiceTypes] ADD  CONSTRAINT [IX_ServiceTypes] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 3/1/2022 3:27:15 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20210624-185746]    Script Date: 3/1/2022 3:27:15 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210624-185746] ON [dbo].[Vehicles]
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_VehicleTypes]    Script Date: 3/1/2022 3:27:15 PM ******/
ALTER TABLE [dbo].[VehicleTypes] ADD  CONSTRAINT [IX_VehicleTypes] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ManufacturersVehicleTypes]  WITH CHECK ADD  CONSTRAINT [FK_ManufacturersVehicleTypes_Manufacturers] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
ALTER TABLE [dbo].[ManufacturersVehicleTypes] CHECK CONSTRAINT [FK_ManufacturersVehicleTypes_Manufacturers]
GO
ALTER TABLE [dbo].[ManufacturersVehicleTypes]  WITH CHECK ADD  CONSTRAINT [FK_ManufacturersVehicleTypes_VehicleTypes] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleTypes] ([Id])
GO
ALTER TABLE [dbo].[ManufacturersVehicleTypes] CHECK CONSTRAINT [FK_ManufacturersVehicleTypes_VehicleTypes]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Manufacturers] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Manufacturers]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_VehicleTypes] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleTypes] ([Id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_VehicleTypes]
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [FK_Registrations_RegistrationPlates] FOREIGN KEY([RegistrationPlateId])
REFERENCES [dbo].[RegistrationPlates] ([Id])
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK_Registrations_RegistrationPlates]
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [FK_Registrations_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK_Registrations_Vehicles]
GO
ALTER TABLE [dbo].[ServiceSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ServiceSchedules_ServiceTypes] FOREIGN KEY([ServiceTypeId])
REFERENCES [dbo].[ServiceTypes] ([Id])
GO
ALTER TABLE [dbo].[ServiceSchedules] CHECK CONSTRAINT [FK_ServiceSchedules_ServiceTypes]
GO
ALTER TABLE [dbo].[ServiceSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ServiceSchedules_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[ServiceSchedules] CHECK CONSTRAINT [FK_ServiceSchedules_Vehicles]
GO
ALTER TABLE [dbo].[UserUseCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCase_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCase] CHECK CONSTRAINT [FK_UserUseCase_Users]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_Models]
GO
USE [master]
GO
ALTER DATABASE [CsLab] SET  READ_WRITE 
GO

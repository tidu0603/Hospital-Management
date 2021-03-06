USE [master]
GO
/****** Object:  Database [hms]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE DATABASE [hms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hms', FILENAME = N'T:\Programming\MSS\MSSQL15.MSSQLSERVER\MSSQL\DATA\hms.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hms_log', FILENAME = N'T:\Programming\MSS\MSSQL15.MSSQLSERVER\MSSQL\DATA\hms_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hms] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hms] SET ARITHABORT OFF 
GO
ALTER DATABASE [hms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hms] SET RECOVERY FULL 
GO
ALTER DATABASE [hms] SET  MULTI_USER 
GO
ALTER DATABASE [hms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hms] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'hms', N'ON'
GO
ALTER DATABASE [hms] SET QUERY_STORE = OFF
GO
USE [hms]
GO
/****** Object:  Table [dbo].[MedicalService]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[noOfPatients] [int] NOT NULL,
	[noOfRooms] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalStaff]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalStaff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ssn] [nvarchar](30) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[gender] [nvarchar](7) NOT NULL,
	[dob] [date] NOT NULL,
	[age] [int] NOT NULL,
	[phone] [nvarchar](30) NOT NULL,
	[role] [nvarchar](30) NOT NULL,
	[yearOfExperience] [int] NOT NULL,
	[specialty] [nvarchar](30) NOT NULL,
	[assignRoomNo] [int] NULL,
	[assignRoomType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[origin] [nvarchar](30) NOT NULL,
	[price] [int] NOT NULL,
	[expireDay] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ssn] [nvarchar](30) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[gender] [nvarchar](7) NOT NULL,
	[dob] [date] NOT NULL,
	[age] [int] NOT NULL,
	[phone] [nvarchar](30) NOT NULL,
	[noOfVisits] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[totalCost] [int] NOT NULL,
	[prescribeFor] [int] NOT NULL,
	[prescribedBy_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionMedicine]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionMedicine](
	[prescription_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[prescription_id] ASC,
	[medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[number] [int] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[noOfStaffs] [int] NOT NULL,
	[medicalService_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[number] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 5/19/2020 1:55:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prescription_id] [int] NULL,
	[totalCost] [int] NOT NULL,
	[payMethod] [nvarchar](4) NOT NULL,
	[paid] [bit] NOT NULL,
	[checkIn] [datetime] NOT NULL,
	[checkOut] [datetime] NULL,
	[byPatient_id] [int] NULL,
	[requestedService_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MedicalService] ON 

INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (1, N'clinical evaluation', 100, 2, 5)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (2, N'endoscopic management of bleeding', 200, 16, 2)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (3, N'endoscopy', 300, 3, 5)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (4, N'endoscopic ultrasound', 400, 14, 2)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (5, N'enhanced urinalysis', 500, 6, 2)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (6, N'xploratory laparotomy', 600, 15, 2)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (7, N'flow cytometry', 700, 8, 4)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (8, N'Fluorodeoxyglucose positron emission', 800, 14, 3)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (9, N'gastric decontamination', 900, 2, 5)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (10, N'haemodialysis', 1000, 6, 3)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (11, N'radiographical', 1100, 9, 3)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (12, N'radiotherapy', 1200, 13, 4)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (13, N'rapid antigen detection test', 1300, 15, 5)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (14, N'direct antiglobulin (Coombs'') test', 1400, 17, 2)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (15, N'Faecal occult blood testing', 1500, 15, 1)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (16, N'full blood count (FBC)', 1600, 5, 4)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (17, N'Gamma Phage Assay', 1700, 11, 1)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (18, N'LFT LFTs (liver function tests)', 1800, 11, 3)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (19, N'liver function tests', 1900, 13, 4)
INSERT [dbo].[MedicalService] ([id], [name], [price], [noOfPatients], [noOfRooms]) VALUES (20, N'monospot test', 2000, 2, 5)
SET IDENTITY_INSERT [dbo].[MedicalService] OFF
SET IDENTITY_INSERT [dbo].[MedicalStaff] ON 

INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (1, N'774-23-0561', N'Cass Whordley', N'Male', CAST(N'1982-10-01' AS Date), 37, N'(447) 9458136', N'Nurse', 4, N'Anaesthetics', 1, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (2, N'339-58-5826', N'Stanford Simmonds', N'Male', CAST(N'1984-11-03' AS Date), 35, N'(380) 2544076', N'Doctor', 4, N'Anaesthetics', 2, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (3, N'301-22-5366', N'Jeromy Biggerdike', N'Male', CAST(N'1982-09-01' AS Date), 37, N'(283) 4414619', N'Doctor', 2, N'Neurology', 3, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (4, N'511-98-4308', N'Benyamin Teggin', N'Male', CAST(N'1980-11-29' AS Date), 39, N'(806) 4609609', N'Nurse', 5, N'Cardiology', 4, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (5, N'514-59-4529', N'Cathryn Goodson', N'Female', CAST(N'1986-10-30' AS Date), 33, N'(379) 1170435', N'Nurse', 5, N'Anaesthetics', 5, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (6, N'765-02-0978', N'Jessalyn Panner', N'Female', CAST(N'1990-09-12' AS Date), 29, N'(481) 8691844', N'Wardboy', 3, N'Cardiology', 6, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (7, N'808-86-0481', N'Shelley Marlow', N'Female', CAST(N'1969-05-06' AS Date), 51, N'(337) 8165907', N'Doctor', 4, N'Cardiology', 7, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (8, N'267-96-2866', N'Colene Well', N'Female', CAST(N'1969-06-25' AS Date), 50, N'(558) 6721554', N'Nurse', 2, N'Neurology', 8, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (9, N'385-38-1728', N'Kienan Skate', N'Male', CAST(N'1999-02-02' AS Date), 21, N'(898) 9965570', N'Doctor', 3, N'Ear nose and throat', 9, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (10, N'131-09-5075', N'Lyndsey Dumbrill', N'Female', CAST(N'1983-08-10' AS Date), 36, N'(168) 9203304', N'Wardboy', 4, N'Anaesthetics', 10, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (11, N'119-93-0249', N'Linet Aneley', N'Female', CAST(N'1968-11-06' AS Date), 51, N'(551) 4970563', N'Doctor', 2, N'Neurology', 11, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (12, N'835-49-7938', N'Waring Wetherick', N'Male', CAST(N'1967-12-24' AS Date), 52, N'(310) 8519888', N'Wardboy', 5, N'Ear nose and throat', 12, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (13, N'816-48-6801', N'Goddart Samson', N'Male', CAST(N'1982-02-17' AS Date), 38, N'(368) 2942169', N'Doctor', 3, N'Ear nose and throat', 13, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (14, N'159-29-8926', N'Jamill Hawkin', N'Male', CAST(N'1986-04-06' AS Date), 34, N'(272) 6509093', N'Nurse', 5, N'Neurology', 14, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (15, N'628-57-8697', N'Babbette Neath', N'Female', CAST(N'1987-11-11' AS Date), 32, N'(624) 9089085', N'Nurse', 2, N'Cardiology', 15, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (16, N'124-85-4677', N'Valera Melson', N'Female', CAST(N'1996-12-08' AS Date), 23, N'(311) 1575759', N'Doctor', 3, N'Neurology', 16, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (17, N'508-81-4612', N'Charla Josilowski', N'Female', CAST(N'1994-12-12' AS Date), 25, N'(355) 3692545', N'Nurse', 4, N'Anaesthetics', 17, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (18, N'329-10-0325', N'Sadie Dranfield', N'Female', CAST(N'1969-06-18' AS Date), 50, N'(727) 8887725', N'Nurse', 5, N'Anaesthetics', 18, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (19, N'554-50-9029', N'Joannes Collopy', N'Female', CAST(N'1981-05-19' AS Date), 38, N'(519) 5784679', N'Wardboy', 3, N'Ear nose and throat', 19, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (20, N'647-97-2207', N'Lina Leagas', N'Female', CAST(N'1976-10-12' AS Date), 43, N'(616) 1554219', N'Doctor', 3, N'Neurology', 20, N'ER')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (21, N'469-40-7181', N'Cristina Eykelhof', N'Female', CAST(N'1984-01-28' AS Date), 36, N'(386) 5916469', N'Wardboy', 2, N'Anaesthetics', 1, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (22, N'408-83-0235', N'Brittani Paggitt', N'Female', CAST(N'1992-09-21' AS Date), 27, N'(825) 9383238', N'Nurse', 3, N'Anaesthetics', 2, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (23, N'566-39-3704', N'Stefania Jefford', N'Female', CAST(N'1968-09-15' AS Date), 51, N'(837) 4775473', N'Wardboy', 5, N'Neurology', 3, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (24, N'342-65-2710', N'Collette Oughton', N'Female', CAST(N'1969-06-09' AS Date), 50, N'(177) 7659675', N'Wardboy', 2, N'Anaesthetics', 4, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (25, N'309-13-2919', N'Corey Ardy', N'Female', CAST(N'1995-12-12' AS Date), 24, N'(930) 3596751', N'Doctor', 5, N'Neurology', 5, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (26, N'422-29-3187', N'Imogen Daftor', N'Female', CAST(N'1960-09-24' AS Date), 59, N'(182) 8954018', N'Doctor', 5, N'Cardiology', 6, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (27, N'266-98-0317', N'Pietro Hydes', N'Male', CAST(N'1968-06-30' AS Date), 51, N'(547) 5470837', N'Wardboy', 4, N'Anaesthetics', 7, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (28, N'894-04-5441', N'Milli Elsley', N'Female', CAST(N'1982-10-22' AS Date), 37, N'(724) 8780113', N'Doctor', 2, N'Anaesthetics', 8, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (29, N'460-12-5995', N'Colas Dougary', N'Male', CAST(N'1979-06-12' AS Date), 40, N'(377) 2484633', N'Nurse', 2, N'Ear nose and throat', 9, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (30, N'596-78-3745', N'Oates Shapter', N'Male', CAST(N'1999-11-05' AS Date), 20, N'(129) 2151626', N'Nurse', 3, N'Cardiology', 10, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (31, N'812-21-9978', N'Leah Ambrogini', N'Female', CAST(N'1961-02-03' AS Date), 59, N'(876) 6556962', N'Wardboy', 5, N'Cardiology', 11, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (32, N'324-29-7148', N'Amandy Pickavant', N'Female', CAST(N'1969-12-26' AS Date), 50, N'(463) 7879414', N'Wardboy', 5, N'Ear nose and throat', 12, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (33, N'126-50-6277', N'Emmit Brackpool', N'Male', CAST(N'1978-11-18' AS Date), 41, N'(491) 6682384', N'Nurse', 5, N'Cardiology', 13, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (34, N'236-27-4359', N'Ellsworth Culwen', N'Male', CAST(N'1972-09-16' AS Date), 47, N'(821) 8788823', N'Nurse', 5, N'Anaesthetics', 14, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (35, N'890-83-2019', N'Corey Broggio', N'Male', CAST(N'1971-08-30' AS Date), 48, N'(985) 2399276', N'Nurse', 4, N'Neurology', 15, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (36, N'536-93-6414', N'Dorita Marthen', N'Female', CAST(N'1976-03-01' AS Date), 44, N'(405) 7245781', N'Nurse', 2, N'Ear nose and throat', 16, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (37, N'767-41-3677', N'Hinda Statter', N'Female', CAST(N'1990-06-22' AS Date), 29, N'(157) 9830531', N'Wardboy', 4, N'Neurology', 17, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (38, N'336-38-9441', N'Sallyanne Schole', N'Female', CAST(N'1969-03-12' AS Date), 51, N'(654) 5187292', N'Doctor', 4, N'Cardiology', 18, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (39, N'520-64-5863', N'Fancie Hamson', N'Female', CAST(N'1983-03-19' AS Date), 37, N'(323) 1118547', N'Wardboy', 4, N'Ear nose and throat', 19, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (40, N'707-15-9007', N'Tani Peepall', N'Female', CAST(N'1975-10-25' AS Date), 44, N'(462) 5771480', N'Nurse', 4, N'Cardiology', 20, N'Operating Theater')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (41, N'392-31-1706', N'Lemmy Oxtiby', N'Male', CAST(N'1985-08-21' AS Date), 34, N'(196) 8485643', N'Doctor', 4, N'Anaesthetics', 1, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (42, N'483-82-3682', N'Abbott Reddish', N'Male', CAST(N'1964-08-15' AS Date), 55, N'(608) 6167614', N'Doctor', 2, N'Neurology', 2, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (43, N'446-42-9849', N'Myranda Wyrall', N'Female', CAST(N'1985-04-26' AS Date), 35, N'(975) 3138752', N'Nurse', 2, N'Anaesthetics', 3, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (44, N'601-89-6032', N'Giovanni Inde', N'Male', CAST(N'1963-12-29' AS Date), 56, N'(310) 7328763', N'Nurse', 3, N'Cardiology', 4, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (45, N'416-42-0702', N'Wynn Pietruszewicz', N'Male', CAST(N'1984-06-13' AS Date), 35, N'(970) 3457087', N'Wardboy', 2, N'Neurology', 5, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (46, N'376-74-5751', N'Rodie Howle', N'Female', CAST(N'1976-04-10' AS Date), 44, N'(201) 2897041', N'Wardboy', 4, N'Cardiology', 6, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (47, N'224-05-5519', N'Muriel Moncur', N'Female', CAST(N'1987-01-27' AS Date), 33, N'(166) 1130103', N'Nurse', 5, N'Cardiology', 7, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (48, N'411-94-8339', N'Padget Wyman', N'Male', CAST(N'1974-07-04' AS Date), 45, N'(417) 8303139', N'Doctor', 5, N'Anaesthetics', 8, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (49, N'457-11-7868', N'Norean Croke', N'Female', CAST(N'1976-10-23' AS Date), 43, N'(845) 7611286', N'Doctor', 5, N'Cardiology', 9, N'ICU')
INSERT [dbo].[MedicalStaff] ([id], [ssn], [name], [gender], [dob], [age], [phone], [role], [yearOfExperience], [specialty], [assignRoomNo], [assignRoomType]) VALUES (50, N'574-52-8381', N'Gerhardine Mouget', N'Female', CAST(N'1997-04-06' AS Date), 23, N'(693) 2085219', N'Nurse', 5, N'Anaesthetics', 10, N'ICU')
SET IDENTITY_INSERT [dbo].[MedicalStaff] OFF
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (1, N'hydrocodone', N'Ukraine', 282, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (2, N'Benzocaine', N'Cyprus', 271, CAST(N'2025-03-21' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (3, N'repaglinide', N'Croatia', 482, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (4, N'Guaifenesin', N'Armenia', 327, CAST(N'2023-05-07' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (5, N'amlodipine', N'China', 662, CAST(N'2023-03-14' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (6, N'Avobenzone', N'China', 600, CAST(N'2021-02-19' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (7, N'Ethynodiol', N'Armenia', 146, CAST(N'2022-10-04' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (8, N'Alcohol', N'Indonesia', 367, CAST(N'2023-10-28' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (9, N'Acetaminophen', N'China', 224, CAST(N'2021-05-12' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (10, N'Helium', N'Thailand', 771, CAST(N'2023-07-29' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (11, N'SODIUMCHLORIDE', N'Argentina', 932, CAST(N'2021-12-09' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (12, N'Enalapril', N'Brazil', 613, CAST(N'2023-06-01' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (13, N'Nortriptyline', N'Portugal', 727, CAST(N'2025-04-09' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (14, N'Acetaminophen', N'China', 465, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (15, N'ESTROGENS', N'United States', 936, CAST(N'2021-12-31' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (16, N'Simvastatin', N'Palestinian Territory', 518, CAST(N'2025-10-30' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (17, N'LISINOPRIL', N'Indonesia', 731, CAST(N'2021-11-20' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (18, N'Vancomycin', N'Russia', 359, CAST(N'2023-01-13' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (19, N'Colistimethate', N'China', 218, CAST(N'2022-03-14' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (20, N'Witch', N'Russia', 952, CAST(N'2022-12-21' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (21, N'Megestrol', N'Iraq', 442, CAST(N'2021-11-23' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (22, N'Sodium', N'China', 595, CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (23, N'Acetaminophen', N'China', 670, CAST(N'2024-05-12' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (24, N'Naproxen', N'Madagascar', 482, CAST(N'2022-12-22' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (25, N'Lamotrigine', N'Argentina', 675, CAST(N'2023-01-23' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (26, N'DIMETHICONE', N'Honduras', 137, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (27, N'Benzocaine', N'China', 134, CAST(N'2022-01-07' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (28, N'AVOBENZONEOCTINOXATE', N'Chile', 854, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (29, N'Octinoxate', N'China', 476, CAST(N'2024-11-21' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (30, N'Lidocaine', N'Brazil', 150, CAST(N'2022-03-05' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (31, N'Nortriptyline', N'Philippines', 370, CAST(N'2025-10-24' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (32, N'FERRUM', N'United States', 692, CAST(N'2021-12-07' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (33, N'simvastatin', N'Myanmar', 164, CAST(N'2025-08-24' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (34, N'Medroxyprogesterone', N'Indonesia', 605, CAST(N'2025-05-09' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (35, N'Rivastigmine', N'Dominican Republic', 197, CAST(N'2024-02-07' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (36, N'Diphenhydramine', N'Russia', 295, CAST(N'2021-04-25' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (37, N'Candesartan', N'Malaysia', 254, CAST(N'2023-03-13' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (38, N'acetaminophen', N'Ethiopia', 304, CAST(N'2020-12-17' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (39, N'Diclofenac', N'Syria', 161, CAST(N'2024-08-20' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (40, N'Tricolsan', N'Ukraine', 958, CAST(N'2025-07-12' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (41, N'butalbital', N'Czech Republic', 722, CAST(N'2025-10-24' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (42, N'Guaifenesin', N'Poland', 796, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (43, N'Mirtazapine', N'Finland', 826, CAST(N'2021-04-05' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (44, N'DEXTROSE', N'China', 302, CAST(N'2024-06-02' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (45, N'Acetaminophen', N'Argentina', 892, CAST(N'2025-04-16' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (46, N'HYDROMORPHONE', N'China', 750, CAST(N'2022-05-09' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (47, N'HYDROCODONE', N'Poland', 266, CAST(N'2025-06-23' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (48, N'Ranitidine', N'Argentina', 841, CAST(N'2025-10-02' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (49, N'lamotrigine', N'Indonesia', 278, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[Medicine] ([id], [name], [origin], [price], [expireDay]) VALUES (50, N'TITANIUM', N'Sweden', 171, CAST(N'2021-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[Medicine] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (1, N'173-01-6440', N'Corby Janosevic', N'Male', CAST(N'1961-03-06' AS Date), 59, N'(883) 5945079', 28)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (2, N'391-52-3626', N'Deane Elgar', N'Male', CAST(N'1963-12-04' AS Date), 56, N'(853) 8066778', 25)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (3, N'225-28-3284', N'Sharona Matkin', N'Female', CAST(N'2013-11-02' AS Date), 6, N'(957) 3148124', 15)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (4, N'279-38-2458', N'Diego Francescotti', N'Male', CAST(N'1979-02-10' AS Date), 41, N'(772) 6731977', 22)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (5, N'146-17-9160', N'Vasili Struther', N'Male', CAST(N'1960-06-28' AS Date), 59, N'(865) 6224415', 29)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (6, N'818-43-5291', N'Sigismond Woollacott', N'Male', CAST(N'1976-08-23' AS Date), 43, N'(639) 4324112', 21)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (7, N'352-88-1319', N'Adi Cordobes', N'Female', CAST(N'1971-11-14' AS Date), 48, N'(887) 2125981', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (8, N'284-18-1555', N'Guntar Dine-Hart', N'Male', CAST(N'1986-07-03' AS Date), 33, N'(786) 5103129', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (9, N'851-36-4931', N'Humphrey Testo', N'Male', CAST(N'1973-08-27' AS Date), 46, N'(964) 6922354', 2)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (10, N'336-66-7511', N'Susie Paoletto', N'Female', CAST(N'2005-03-31' AS Date), 15, N'(515) 5866387', 30)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (11, N'847-40-3720', N'Morganica Brito', N'Female', CAST(N'2015-09-08' AS Date), 4, N'(208) 1553683', 24)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (12, N'606-19-3816', N'Vernor Dikle', N'Male', CAST(N'1967-11-18' AS Date), 52, N'(671) 6213008', 29)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (13, N'265-85-7336', N'Wallache Verryan', N'Male', CAST(N'2009-11-28' AS Date), 10, N'(680) 9228653', 11)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (14, N'571-68-4365', N'Kaine Dudek', N'Male', CAST(N'2014-06-28' AS Date), 5, N'(653) 9865884', 18)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (15, N'827-86-0690', N'Justinn MacAughtrie', N'Female', CAST(N'2017-03-16' AS Date), 3, N'(167) 3725154', 6)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (16, N'513-64-2897', N'Brandice Sturgis', N'Female', CAST(N'2013-01-21' AS Date), 7, N'(880) 5825410', 15)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (17, N'225-09-1410', N'Abran Milch', N'Male', CAST(N'1991-12-11' AS Date), 28, N'(524) 5602734', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (18, N'750-60-7317', N'Hillery Sanches', N'Male', CAST(N'1965-10-22' AS Date), 54, N'(209) 7019043', 11)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (19, N'321-11-0008', N'Fletcher Crozier', N'Male', CAST(N'1988-04-20' AS Date), 32, N'(949) 7144542', 25)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (20, N'284-37-9489', N'Eula Passey', N'Female', CAST(N'1988-02-16' AS Date), 32, N'(856) 7476937', 13)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (21, N'342-66-4071', N'Park Roos', N'Male', CAST(N'1987-08-21' AS Date), 32, N'(604) 3973345', 21)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (22, N'601-38-1070', N'Mal Scrafton', N'Male', CAST(N'1995-12-06' AS Date), 24, N'(717) 5067074', 14)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (23, N'531-03-7029', N'Ferdinande Kettridge', N'Female', CAST(N'1982-12-02' AS Date), 37, N'(346) 3988266', 2)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (24, N'447-91-9769', N'Angelina Dowden', N'Female', CAST(N'2005-11-04' AS Date), 14, N'(940) 3428798', 21)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (25, N'461-28-2529', N'Brigitte Morison', N'Female', CAST(N'2019-02-18' AS Date), 1, N'(859) 6475243', 1)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (26, N'148-19-6308', N'Laetitia Castaner', N'Female', CAST(N'1987-12-21' AS Date), 32, N'(415) 5036295', 20)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (27, N'432-96-7960', N'Charley Ashcroft', N'Male', CAST(N'1960-02-12' AS Date), 60, N'(836) 4326169', 28)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (28, N'343-85-1832', N'Lynnelle Cocher', N'Female', CAST(N'1968-10-11' AS Date), 51, N'(776) 9405386', 8)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (29, N'558-98-0904', N'Clarence Remington', N'Male', CAST(N'2017-03-05' AS Date), 3, N'(207) 4287355', 19)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (30, N'495-38-1644', N'Fedora Edgcombe', N'Female', CAST(N'1994-10-06' AS Date), 25, N'(809) 7929023', 8)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (31, N'241-40-7682', N'Jordan Barnewall', N'Female', CAST(N'1999-08-30' AS Date), 20, N'(152) 2701791', 12)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (32, N'219-35-1406', N'Stanfield Bliss', N'Male', CAST(N'1998-11-16' AS Date), 21, N'(845) 1578087', 26)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (33, N'770-35-6249', N'Georgie Bayford', N'Male', CAST(N'1961-01-20' AS Date), 59, N'(242) 5717059', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (34, N'161-43-6646', N'Demetri Dudson', N'Male', CAST(N'2004-01-10' AS Date), 16, N'(781) 3761705', 9)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (35, N'734-94-1605', N'Mikkel Ibbetson', N'Male', CAST(N'1967-11-01' AS Date), 52, N'(466) 2997840', 2)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (36, N'103-52-1183', N'Tedra Bingell', N'Female', CAST(N'1987-05-22' AS Date), 32, N'(675) 3352577', 24)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (37, N'633-26-2221', N'Selie Arstingall', N'Female', CAST(N'2015-12-06' AS Date), 4, N'(397) 1767599', 6)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (38, N'664-70-2411', N'Ravid Blackie', N'Male', CAST(N'1996-06-26' AS Date), 23, N'(310) 8710881', 19)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (39, N'106-94-2516', N'Rube Percy', N'Male', CAST(N'2016-08-03' AS Date), 3, N'(975) 7252959', 5)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (40, N'429-16-0713', N'Claudell Melia', N'Male', CAST(N'1974-08-08' AS Date), 45, N'(941) 3487669', 19)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (41, N'426-37-1331', N'Thorin Crier', N'Male', CAST(N'1992-04-11' AS Date), 28, N'(384) 4431132', 22)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (42, N'858-74-7751', N'Barbi Measham', N'Female', CAST(N'2006-04-23' AS Date), 14, N'(416) 6655593', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (43, N'592-73-9290', N'Rogers Rablan', N'Male', CAST(N'1983-11-30' AS Date), 36, N'(137) 7951967', 19)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (44, N'774-40-0348', N'Maighdiln Grimsdell', N'Female', CAST(N'2009-03-13' AS Date), 11, N'(486) 4811324', 21)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (45, N'129-49-7088', N'Guillemette Milsted', N'Female', CAST(N'1986-11-05' AS Date), 33, N'(658) 8827394', 6)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (46, N'352-26-1116', N'Ossie McLese', N'Male', CAST(N'1979-05-18' AS Date), 40, N'(750) 4725000', 9)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (47, N'357-81-1724', N'Hendrick Thompsett', N'Male', CAST(N'1967-11-03' AS Date), 52, N'(607) 6910390', 7)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (48, N'730-82-9874', N'Corrinne L'' Anglois', N'Female', CAST(N'2011-08-15' AS Date), 8, N'(891) 8900404', 27)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (49, N'286-01-0555', N'Neala Cast', N'Female', CAST(N'1986-12-01' AS Date), 33, N'(312) 4218608', 9)
INSERT [dbo].[Patient] ([id], [ssn], [name], [gender], [dob], [age], [phone], [noOfVisits]) VALUES (50, N'390-04-5274', N'Bell Curl', N'Female', CAST(N'1999-01-26' AS Date), 21, N'(751) 4240002', 18)
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[Prescription] ON 

INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (1, 735, 1, 1)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (2, 974, 2, 2)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (3, 2648, 3, 3)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (4, 3730, 4, 4)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (5, 2239, 5, 5)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (6, 2464, 6, 6)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (7, 1427, 7, 7)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (8, 2075, 8, 8)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (9, 3574, 9, 9)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (10, 793, 10, 10)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (11, 1714, 11, 11)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (12, 1278, 12, 12)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (13, 4459, 13, 13)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (14, 2542, 14, 14)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (15, 2093, 15, 15)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (16, 972, 16, 16)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (17, 3491, 17, 17)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (18, 4886, 18, 18)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (19, 563, 19, 19)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (20, 552, 20, 20)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (21, 4155, 21, 1)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (22, 3374, 22, 2)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (23, 1232, 23, 3)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (24, 335, 24, 4)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (25, 3727, 25, 5)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (26, 4775, 26, 6)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (27, 913, 27, 7)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (28, 984, 28, 8)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (29, 813, 29, 9)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (30, 4096, 30, 10)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (31, 291, 31, 11)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (32, 3459, 32, 12)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (33, 4811, 33, 13)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (34, 1772, 34, 14)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (35, 2349, 35, 15)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (36, 3942, 36, 16)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (37, 2173, 37, 17)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (38, 3878, 38, 18)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (39, 4791, 39, 19)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (40, 3068, 40, 20)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (41, 4875, 41, 1)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (42, 4478, 42, 2)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (43, 1270, 43, 3)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (44, 2157, 44, 4)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (45, 3265, 45, 5)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (46, 749, 46, 6)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (47, 2401, 47, 7)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (48, 4278, 48, 8)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (49, 1610, 49, 9)
INSERT [dbo].[Prescription] ([id], [totalCost], [prescribeFor], [prescribedBy_id]) VALUES (50, 2576, 50, 10)
SET IDENTITY_INSERT [dbo].[Prescription] OFF
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (1, 1, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (2, 2, 3)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (3, 3, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (4, 4, 6)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (5, 5, 8)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (6, 6, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (7, 7, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (8, 8, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (9, 9, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (10, 10, 2)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (11, 11, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (12, 12, 6)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (13, 13, 1)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (14, 14, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (15, 15, 6)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (16, 16, 1)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (17, 17, 6)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (18, 18, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (19, 19, 8)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (20, 20, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (21, 21, 10)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (22, 22, 2)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (23, 23, 9)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (24, 24, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (25, 25, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (26, 26, 8)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (27, 27, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (28, 28, 2)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (29, 29, 8)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (30, 30, 0)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (31, 31, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (32, 32, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (33, 33, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (34, 34, 8)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (35, 35, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (36, 36, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (37, 37, 5)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (38, 38, 3)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (39, 39, 9)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (40, 40, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (41, 41, 9)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (42, 42, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (43, 43, 10)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (44, 44, 0)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (45, 45, 10)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (46, 46, 9)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (47, 47, 6)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (48, 48, 4)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (49, 49, 7)
INSERT [dbo].[PrescriptionMedicine] ([prescription_id], [medicine_id], [quantity]) VALUES (50, 50, 1)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (1, N'ER', 7, 1)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (1, N'ICU', 4, 1)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (1, N'Operating Theater', 5, 1)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (2, N'ER', 3, 2)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (2, N'ICU', 1, 2)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (2, N'Operating Theater', 3, 2)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (3, N'ER', 8, 3)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (3, N'ICU', 7, 3)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (3, N'Operating Theater', 3, 3)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (4, N'ER', 6, 4)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (4, N'ICU', 6, 4)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (4, N'Operating Theater', 1, 4)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (5, N'ER', 4, 5)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (5, N'ICU', 3, 5)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (5, N'Operating Theater', 3, 5)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (6, N'ER', 1, 6)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (6, N'ICU', 3, 6)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (6, N'Operating Theater', 10, 6)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (7, N'ER', 7, 7)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (7, N'ICU', 2, 7)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (7, N'Operating Theater', 2, 7)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (8, N'ER', 3, 8)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (8, N'ICU', 6, 8)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (8, N'Operating Theater', 8, 8)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (9, N'ER', 2, 9)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (9, N'ICU', 10, 9)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (9, N'Operating Theater', 9, 9)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (10, N'ER', 7, 10)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (10, N'ICU', 6, 10)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (10, N'Operating Theater', 1, 10)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (11, N'ER', 1, 11)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (11, N'Operating Theater', 10, 11)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (12, N'ER', 6, 12)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (12, N'Operating Theater', 7, 12)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (13, N'ER', 2, 13)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (13, N'Operating Theater', 8, 13)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (14, N'ER', 8, 14)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (14, N'Operating Theater', 2, 14)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (15, N'ER', 6, 15)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (15, N'Operating Theater', 1, 15)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (16, N'ER', 8, 16)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (16, N'Operating Theater', 8, 16)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (17, N'ER', 6, 17)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (17, N'Operating Theater', 2, 17)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (18, N'ER', 1, 18)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (18, N'Operating Theater', 2, 18)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (19, N'ER', 7, 19)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (19, N'Operating Theater', 7, 19)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (20, N'ER', 7, 20)
INSERT [dbo].[Room] ([number], [type], [noOfStaffs], [medicalService_id]) VALUES (20, N'Operating Theater', 9, 20)
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (1, 1, 3610, N'cash', 1, CAST(N'2017-10-06T00:49:46.000' AS DateTime), CAST(N'2020-01-12T06:50:03.000' AS DateTime), 1, 1)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (2, 2, 2499, N'cash', 1, CAST(N'2018-02-07T22:38:04.000' AS DateTime), CAST(N'2020-04-20T04:13:07.000' AS DateTime), 2, 2)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (3, 3, 6224, N'cash', 0, CAST(N'2017-11-01T21:46:20.000' AS DateTime), CAST(N'2019-12-11T14:43:27.000' AS DateTime), 3, 3)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (4, 4, 2237, N'cash', 0, CAST(N'2017-08-07T12:23:31.000' AS DateTime), CAST(N'2019-12-19T20:24:36.000' AS DateTime), 4, 4)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (5, 5, 9885, N'cash', 1, CAST(N'2017-09-24T10:01:40.000' AS DateTime), CAST(N'2020-04-24T11:35:26.000' AS DateTime), 5, 5)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (6, 6, 4258, N'cash', 1, CAST(N'2017-10-11T13:20:24.000' AS DateTime), CAST(N'2019-07-11T11:40:20.000' AS DateTime), 6, 6)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (7, 7, 7690, N'cash', 1, CAST(N'2017-09-18T09:05:23.000' AS DateTime), CAST(N'2019-11-22T05:07:58.000' AS DateTime), 7, 7)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (8, 8, 9197, N'cash', 1, CAST(N'2018-03-31T12:20:25.000' AS DateTime), CAST(N'2020-01-17T18:53:13.000' AS DateTime), 8, 8)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (9, 9, 9021, N'cash', 0, CAST(N'2018-01-25T12:53:26.000' AS DateTime), CAST(N'2019-05-28T13:02:28.000' AS DateTime), 9, 9)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (10, 10, 3792, N'cash', 0, CAST(N'2018-03-08T23:46:45.000' AS DateTime), CAST(N'2020-04-18T14:31:45.000' AS DateTime), 10, 10)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (11, 11, 3529, N'cash', 1, CAST(N'2017-09-22T02:03:55.000' AS DateTime), CAST(N'2020-03-27T03:43:42.000' AS DateTime), 11, 11)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (12, 12, 1647, N'cash', 1, CAST(N'2018-03-07T10:16:19.000' AS DateTime), CAST(N'2019-12-12T19:33:13.000' AS DateTime), 12, 12)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (13, 13, 8979, N'cash', 1, CAST(N'2018-01-24T01:39:19.000' AS DateTime), CAST(N'2019-11-02T01:04:44.000' AS DateTime), 13, 13)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (14, 14, 4244, N'cash', 0, CAST(N'2018-02-21T10:58:32.000' AS DateTime), CAST(N'2019-12-16T10:57:01.000' AS DateTime), 14, 14)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (15, 15, 4659, N'cash', 0, CAST(N'2017-12-12T06:07:02.000' AS DateTime), CAST(N'2020-03-15T16:41:48.000' AS DateTime), 15, 15)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (16, 16, 5063, N'cash', 0, CAST(N'2017-09-25T05:02:28.000' AS DateTime), CAST(N'2019-05-29T16:20:00.000' AS DateTime), 16, 16)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (17, 17, 7510, N'cash', 1, CAST(N'2018-03-11T13:03:17.000' AS DateTime), CAST(N'2019-10-13T15:29:10.000' AS DateTime), 17, 17)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (18, 18, 2803, N'cash', 1, CAST(N'2017-11-15T07:21:55.000' AS DateTime), CAST(N'2019-09-23T21:14:47.000' AS DateTime), 18, 18)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (19, 19, 2290, N'cash', 0, CAST(N'2017-12-10T18:12:08.000' AS DateTime), CAST(N'2020-02-26T04:13:39.000' AS DateTime), 19, 19)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (20, 20, 2184, N'cash', 0, CAST(N'2017-10-06T13:58:17.000' AS DateTime), CAST(N'2019-07-07T06:34:16.000' AS DateTime), 20, 20)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (21, 21, 2529, N'cash', 0, CAST(N'2018-04-04T20:09:42.000' AS DateTime), CAST(N'2019-07-10T08:47:48.000' AS DateTime), 21, 1)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (22, 22, 5290, N'cash', 1, CAST(N'2017-05-14T14:17:10.000' AS DateTime), CAST(N'2019-07-15T13:54:42.000' AS DateTime), 22, 2)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (23, 23, 5424, N'cash', 0, CAST(N'2018-04-03T15:25:07.000' AS DateTime), CAST(N'2020-03-31T06:35:30.000' AS DateTime), 23, 3)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (24, 24, 7812, N'cash', 0, CAST(N'2017-12-14T22:04:02.000' AS DateTime), CAST(N'2020-02-03T04:41:55.000' AS DateTime), 24, 4)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (25, 25, 8545, N'cash', 1, CAST(N'2017-12-21T06:14:03.000' AS DateTime), CAST(N'2019-07-26T16:23:00.000' AS DateTime), 25, 5)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (26, 26, 6802, N'card', 1, CAST(N'2017-11-27T01:38:46.000' AS DateTime), CAST(N'2019-06-12T07:07:23.000' AS DateTime), 26, 6)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (27, 27, 1566, N'card', 0, CAST(N'2017-06-07T17:04:57.000' AS DateTime), CAST(N'2019-06-12T11:47:13.000' AS DateTime), 27, 7)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (28, 28, 6342, N'card', 0, CAST(N'2017-06-18T10:45:04.000' AS DateTime), CAST(N'2020-04-09T07:22:27.000' AS DateTime), 28, 8)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (29, 29, 6761, N'card', 1, CAST(N'2017-07-08T04:50:16.000' AS DateTime), CAST(N'2020-02-11T12:43:06.000' AS DateTime), 29, 9)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (30, 30, 1478, N'card', 0, CAST(N'2018-02-27T08:51:21.000' AS DateTime), CAST(N'2020-02-06T14:17:48.000' AS DateTime), 30, 10)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (31, 31, 2883, N'card', 1, CAST(N'2017-10-20T23:59:53.000' AS DateTime), CAST(N'2020-02-13T21:38:29.000' AS DateTime), 31, 11)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (32, 32, 6119, N'card', 1, CAST(N'2017-09-14T04:36:21.000' AS DateTime), CAST(N'2020-02-04T02:18:20.000' AS DateTime), 32, 12)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (33, 33, 7862, N'card', 1, CAST(N'2017-10-17T08:27:14.000' AS DateTime), CAST(N'2020-01-02T05:14:15.000' AS DateTime), 33, 13)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (34, 34, 5473, N'card', 1, CAST(N'2017-07-20T10:05:31.000' AS DateTime), CAST(N'2019-10-29T21:00:24.000' AS DateTime), 34, 14)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (35, 35, 9218, N'card', 0, CAST(N'2018-01-18T02:03:25.000' AS DateTime), CAST(N'2019-05-23T06:00:36.000' AS DateTime), 35, 15)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (36, 36, 9055, N'card', 1, CAST(N'2018-01-07T22:55:29.000' AS DateTime), CAST(N'2020-01-24T09:03:00.000' AS DateTime), 36, 16)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (37, 37, 2222, N'card', 1, CAST(N'2018-01-23T02:57:35.000' AS DateTime), CAST(N'2019-06-08T09:08:52.000' AS DateTime), 37, 17)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (38, 38, 6625, N'card', 1, CAST(N'2017-06-20T20:51:22.000' AS DateTime), CAST(N'2019-06-22T03:35:02.000' AS DateTime), 38, 18)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (39, 39, 5601, N'card', 1, CAST(N'2017-10-03T11:19:43.000' AS DateTime), CAST(N'2020-02-16T05:02:11.000' AS DateTime), 39, 19)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (40, 40, 8975, N'card', 0, CAST(N'2017-09-06T10:46:42.000' AS DateTime), CAST(N'2019-07-24T14:41:18.000' AS DateTime), 40, 20)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (41, 41, 8373, N'card', 1, CAST(N'2017-06-01T16:37:38.000' AS DateTime), CAST(N'2020-05-06T21:35:19.000' AS DateTime), 41, 1)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (42, 42, 8238, N'card', 0, CAST(N'2017-06-11T13:29:20.000' AS DateTime), CAST(N'2019-09-21T08:55:38.000' AS DateTime), 42, 2)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (43, 43, 4521, N'card', 0, CAST(N'2017-07-08T18:22:31.000' AS DateTime), CAST(N'2020-05-06T16:54:52.000' AS DateTime), 43, 3)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (44, 44, 9571, N'card', 1, CAST(N'2018-04-28T18:22:21.000' AS DateTime), CAST(N'2019-07-20T02:28:58.000' AS DateTime), 44, 4)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (45, 45, 6861, N'card', 0, CAST(N'2018-04-19T23:37:27.000' AS DateTime), CAST(N'2019-06-07T16:45:08.000' AS DateTime), 45, 5)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (46, 46, 9214, N'card', 1, CAST(N'2017-05-28T14:24:13.000' AS DateTime), CAST(N'2019-07-25T00:51:15.000' AS DateTime), 46, 6)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (47, 47, 2628, N'card', 1, CAST(N'2018-01-06T21:30:10.000' AS DateTime), CAST(N'2019-09-06T05:42:25.000' AS DateTime), 47, 7)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (48, 48, 7601, N'card', 0, CAST(N'2017-08-12T03:11:11.000' AS DateTime), CAST(N'2019-12-14T01:26:06.000' AS DateTime), 48, 8)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (49, 49, 8190, N'card', 0, CAST(N'2018-03-05T12:06:31.000' AS DateTime), CAST(N'2020-02-18T14:28:44.000' AS DateTime), 49, 9)
INSERT [dbo].[Visit] ([id], [prescription_id], [totalCost], [payMethod], [paid], [checkIn], [checkOut], [byPatient_id], [requestedService_id]) VALUES (50, 50, 5978, N'card', 1, CAST(N'2017-11-28T22:56:58.000' AS DateTime), CAST(N'2020-02-15T22:02:40.000' AS DateTime), 50, 10)
SET IDENTITY_INSERT [dbo].[Visit] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_9548DD5D8962AD80E7D5589B]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_9548DD5D8962AD80E7D5589B] ON [dbo].[MedicalStaff]
(
	[assignRoomNo] ASC,
	[assignRoomType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_78E632124ED775C]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_78E632124ED775C] ON [dbo].[Prescription]
(
	[prescribedBy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_B858D5D32F7D140A]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_B858D5D32F7D140A] ON [dbo].[PrescriptionMedicine]
(
	[medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_B858D5D393DB413D]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_B858D5D393DB413D] ON [dbo].[PrescriptionMedicine]
(
	[prescription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_D2ADFEA51AEE5591]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_D2ADFEA51AEE5591] ON [dbo].[Room]
(
	[medicalService_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_82BFC63D1FE3EB26]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_82BFC63D1FE3EB26] ON [dbo].[Visit]
(
	[requestedService_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_82BFC63DFD8DA151]    Script Date: 5/19/2020 1:55:51 PM ******/
CREATE NONCLUSTERED INDEX [IDX_82BFC63DFD8DA151] ON [dbo].[Visit]
(
	[byPatient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicalStaff]  WITH CHECK ADD  CONSTRAINT [FK_9548DD5D8962AD80E7D5589B] FOREIGN KEY([assignRoomNo], [assignRoomType])
REFERENCES [dbo].[Room] ([number], [type])
GO
ALTER TABLE [dbo].[MedicalStaff] CHECK CONSTRAINT [FK_9548DD5D8962AD80E7D5589B]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_78E632124ED775C] FOREIGN KEY([prescribedBy_id])
REFERENCES [dbo].[MedicalStaff] ([id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_78E632124ED775C]
GO
ALTER TABLE [dbo].[PrescriptionMedicine]  WITH CHECK ADD  CONSTRAINT [FK_B858D5D32F7D140A] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[Medicine] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrescriptionMedicine] CHECK CONSTRAINT [FK_B858D5D32F7D140A]
GO
ALTER TABLE [dbo].[PrescriptionMedicine]  WITH CHECK ADD  CONSTRAINT [FK_B858D5D393DB413D] FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrescriptionMedicine] CHECK CONSTRAINT [FK_B858D5D393DB413D]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_D2ADFEA51AEE5591] FOREIGN KEY([medicalService_id])
REFERENCES [dbo].[MedicalService] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_D2ADFEA51AEE5591]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_82BFC63D1FE3EB26] FOREIGN KEY([requestedService_id])
REFERENCES [dbo].[MedicalService] ([id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_82BFC63D1FE3EB26]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_82BFC63D93DB413D] FOREIGN KEY([prescription_id])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_82BFC63D93DB413D]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_82BFC63DFD8DA151] FOREIGN KEY([byPatient_id])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_82BFC63DFD8DA151]
GO
USE [master]
GO
ALTER DATABASE [hms] SET  READ_WRITE 
GO

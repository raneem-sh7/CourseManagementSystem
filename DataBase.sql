USE [master]
GO
/****** Object:  Database [CourseManagmentDB]    Script Date: 7/22/2026 2:25:42 PM ******/
CREATE DATABASE [CourseManagmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseManagmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CourseManagmentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseManagmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CourseManagmentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CourseManagmentDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseManagmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseManagmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseManagmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseManagmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourseManagmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseManagmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CourseManagmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [CourseManagmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseManagmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseManagmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseManagmentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseManagmentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourseManagmentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CourseManagmentDB', N'ON'
GO
ALTER DATABASE [CourseManagmentDB] SET QUERY_STORE = OFF
GO
USE [CourseManagmentDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/22/2026 2:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course-ID] [int] IDENTITY(1,1) NOT NULL,
	[Course-Name] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Section-ID] [int] NULL,
	[Duration] [nvarchar](10) NULL,
	[Teachear-ID] [int] NOT NULL,
 CONSTRAINT [PK_Cources] PRIMARY KEY CLUSTERED 
(
	[Course-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 7/22/2026 2:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[Enrollment-ID] [int] IDENTITY(1,1) NOT NULL,
	[Course-ID] [int] NOT NULL,
	[Student-ID] [int] NOT NULL,
	[Enrollment-Date] [date] NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Enrollment-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 7/22/2026 2:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Section-ID] [int] IDENTITY(1,1) NOT NULL,
	[Section-Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[Section-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/22/2026 2:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Student-ID] [int] IDENTITY(1,1) NOT NULL,
	[Student-Name] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](225) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 7/22/2026 2:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Teacher-ID] [int] IDENTITY(1,1) NOT NULL,
	[Teacher-Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Qualification] [nvarchar](100) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Teacher-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Course-ID], [Course-Name], [Subject], [Section-ID], [Duration], [Teachear-ID]) VALUES (3, N'Database Systems', N'SQL', 1, N'40 Hours', 1)
INSERT [dbo].[Courses] ([Course-ID], [Course-Name], [Subject], [Section-ID], [Duration], [Teachear-ID]) VALUES (4, N'Programming', N'C#', 1, N'50 Hours', 1)
INSERT [dbo].[Courses] ([Course-ID], [Course-Name], [Subject], [Section-ID], [Duration], [Teachear-ID]) VALUES (5, N'Calculus', N'Math', 2, N'45 Hours', 2)
INSERT [dbo].[Courses] ([Course-ID], [Course-Name], [Subject], [Section-ID], [Duration], [Teachear-ID]) VALUES (6, N'Physics Basics', N'Physics', 2, N'30 Hours', 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([Enrollment-ID], [Course-ID], [Student-ID], [Enrollment-Date]) VALUES (4, 3, 1, CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Enrollment] ([Enrollment-ID], [Course-ID], [Student-ID], [Enrollment-Date]) VALUES (5, 3, 2, CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Enrollment] ([Enrollment-ID], [Course-ID], [Student-ID], [Enrollment-Date]) VALUES (6, 4, 3, CAST(N'2026-07-02' AS Date))
INSERT [dbo].[Enrollment] ([Enrollment-ID], [Course-ID], [Student-ID], [Enrollment-Date]) VALUES (7, 6, 1, CAST(N'2026-07-03' AS Date))
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([Section-ID], [Section-Name]) VALUES (1, N'IT')
INSERT [dbo].[Sections] ([Section-ID], [Section-Name]) VALUES (2, N'Science')
SET IDENTITY_INSERT [dbo].[Sections] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Student-ID], [Student-Name], [Country], [Age], [Email], [Password]) VALUES (1, N'Ahmad', N'Jordan', 21, N'ahmad@gmail.com', N'123')
INSERT [dbo].[Students] ([Student-ID], [Student-Name], [Country], [Age], [Email], [Password]) VALUES (2, N'Sara', N'Jordan', 22, N'sara@gmail.com', N'456')
INSERT [dbo].[Students] ([Student-ID], [Student-Name], [Country], [Age], [Email], [Password]) VALUES (3, N'Omar', N'Palestine', 20, N'omar@gmail.com', N'789')
INSERT [dbo].[Students] ([Student-ID], [Student-Name], [Country], [Age], [Email], [Password]) VALUES (4, N'Raneem Shehadeh', N'Jordan', 20, N'raneem@gmail.com', N'ejciejc2nie3e3eni')
INSERT [dbo].[Students] ([Student-ID], [Student-Name], [Country], [Age], [Email], [Password]) VALUES (1004, N'sama', N'Jordan', 14, N'sama@gmail.com', N'fefef54fe6f5e6f')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Teacher-ID], [Teacher-Name], [Email], [Qualification], [Age]) VALUES (1, N'Dr. Ali', N'ali@gmail.com', N'PhD Computer Science', 45)
INSERT [dbo].[Teachers] ([Teacher-ID], [Teacher-Name], [Email], [Qualification], [Age]) VALUES (2, N'Dr. Lina', N'lina@gmail.com', N'Master Mathematics', 38)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Sections] FOREIGN KEY([Section-ID])
REFERENCES [dbo].[Sections] ([Section-ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Sections]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teachers] FOREIGN KEY([Teachear-ID])
REFERENCES [dbo].[Teachers] ([Teacher-ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teachers]
GO

--Cascade Delete 
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Courses] FOREIGN KEY([Course-ID])
REFERENCES [dbo].[Courses] ([Course-ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Courses]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Students] FOREIGN KEY([Student-ID])
REFERENCES [dbo].[Students] ([Student-ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Students]
GO
USE [master]
GO
ALTER DATABASE [CourseManagmentDB] SET  READ_WRITE 
GO

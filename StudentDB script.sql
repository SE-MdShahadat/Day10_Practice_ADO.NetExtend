USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 3/3/2020 7:37:03 PM ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StudentDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StudentDB_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StudentDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentDB', N'ON'
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/3/2020 7:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/3/2020 7:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RollNo] [int] NULL,
	[Name] [varchar](50) NULL,
	[Age] [int] NULL,
	[Address] [varchar](100) NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[StudentsView]    Script Date: 3/3/2020 7:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[StudentsView]
As
select s.ID as StudentID, RollNo, s.Name as Name, Age,DepartmentID,d.Name as Department, Address From Students as s
Left join Departments as d on d.ID = s.DepartmentID
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Departments] ([ID], [Code], [Name]) VALUES (3, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Departments] ([ID], [Code], [Name]) VALUES (4, N'BBA', N'Bachelor of  Business Administration')
INSERT [dbo].[Departments] ([ID], [Code], [Name]) VALUES (5, N'SWE', N'Software Engineering')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [RollNo], [Name], [Age], [Address], [DepartmentID]) VALUES (1, 1, N'S', 24, N'S', 4)
INSERT [dbo].[Students] ([ID], [RollNo], [Name], [Age], [Address], [DepartmentID]) VALUES (4, 2, N'B', 10, N'B', 3)
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [ResultsBuilder]    Script Date: 9/27/2019 6:12:11 PM ******/
CREATE DATABASE [ResultsBuilder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ResultsBuilder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ResultsBuilder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ResultsBuilder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ResultsBuilder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ResultsBuilder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ResultsBuilder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ResultsBuilder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ResultsBuilder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ResultsBuilder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ResultsBuilder] SET ARITHABORT OFF 
GO
ALTER DATABASE [ResultsBuilder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ResultsBuilder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ResultsBuilder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ResultsBuilder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ResultsBuilder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ResultsBuilder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ResultsBuilder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ResultsBuilder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ResultsBuilder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ResultsBuilder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ResultsBuilder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ResultsBuilder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ResultsBuilder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ResultsBuilder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ResultsBuilder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ResultsBuilder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ResultsBuilder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ResultsBuilder] SET RECOVERY FULL 
GO
ALTER DATABASE [ResultsBuilder] SET  MULTI_USER 
GO
ALTER DATABASE [ResultsBuilder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ResultsBuilder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ResultsBuilder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ResultsBuilder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ResultsBuilder] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ResultsBuilder', N'ON'
GO
ALTER DATABASE [ResultsBuilder] SET QUERY_STORE = OFF
GO
USE [ResultsBuilder]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[year] [nchar](18) NOT NULL,
	[sem] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[year] [nchar](15) NOT NULL,
	[deptID] [int] NOT NULL,
	[sem] [int] NOT NULL,
	[Tid] [smallint] NOT NULL,
	[subCode] [nchar](10) NOT NULL,
	[collegeCode] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[classID] ASC,
	[subCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colleges]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colleges](
	[collegeCode] [int] IDENTITY(101,61) NOT NULL,
	[collegeName] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[collegeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptID] [int] IDENTITY(120,20) NOT NULL,
	[deptName] [varchar](40) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[userName] [varchar](20) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[Uid] [bigint] NOT NULL,
	[phone] [bigint] NOT NULL,
	[email] [varchar](25) NOT NULL,
	[role] [varchar](10) NOT NULL,
	[collegeCode] [int] NULL,
	[deptID] [int] NULL,
 CONSTRAINT [PK_Logins_1] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[GRno] [int] NOT NULL,
	[collegeCode] [int] NULL,
	[internals] [smallint] NULL,
	[theory] [smallint] NULL,
	[practicles] [smallint] NULL,
	[subCode] [nchar](10) NOT NULL,
	[classID] [int] NOT NULL,
	[sem] [nchar](2) NULL,
	[Igrd] [nchar](2) NULL,
	[Tgrd] [nchar](2) NULL,
	[Pgrd] [nchar](2) NULL,
	[OVGrd] [nchar](2) NULL,
	[CreErn] [int] NULL,
	[GrdPt] [int] NULL,
	[cg] [int] NULL,
 CONSTRAINT [PK_Marks_1] PRIMARY KEY CLUSTERED 
(
	[GRno] ASC,
	[subCode] ASC,
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[stdID] [int] NULL,
	[FirstName] [varchar](25) NULL,
	[LastName] [varchar](10) NULL,
	[Uid] [bigint] NULL,
	[collegeCode] [int] NULL,
	[deptID] [int] NULL,
	[GRno] [int] NOT NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[GRno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[subCode] [nchar](10) NOT NULL,
	[subName] [varchar](100) NOT NULL,
	[sem] [int] NOT NULL,
	[deptID] [int] NULL,
 CONSTRAINT [PK_Subjects_1] PRIMARY KEY CLUSTERED 
(
	[subCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Tid] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](10) NOT NULL,
	[LastName] [varchar](10) NULL,
	[Uid] [bigint] NOT NULL,
	[role] [varchar](10) NOT NULL,
	[collegeCode] [int] NOT NULL,
	[deptID] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (1, N'FY 2019        ', 120, 1, 123, N'USCS101   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (4, N'FY 2019        ', 120, 1, 121, N'USCS102   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (9, N'SY 2019        ', 120, 4, 123, N'USCS403   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (10, N'TY 2019        ', 120, 5, 118, N'USCS501   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (11, N'FY 2019        ', 120, 1, 121, N'USCS103   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (12, N'FY 2019        ', 120, 1, 121, N'USCS104   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (13, N'FY 2019        ', 120, 1, 121, N'USCS105   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (14, N'FY 2019        ', 120, 1, 121, N'USCS106   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (15, N'FY 2019        ', 120, 1, 121, N'USCS107   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (1014, N'SY 2019 -      ', 120, 3, 121, N'USCS305   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (1015, N'TY 2020 -      ', 120, 1, 121, N'USCS101   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (1016, N'TY 2019 -      ', 120, 6, 121, N'USCS603   ', 101)
INSERT [dbo].[Classes] ([classID], [year], [deptID], [sem], [Tid], [subCode], [collegeCode]) VALUES (1017, N'SY 2019 -      ', 120, 3, 124, N'USCS303   ', 101)
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[Colleges] ON 

INSERT [dbo].[Colleges] ([collegeCode], [collegeName]) VALUES (101, N'Guru Nanak Khalsa College')
INSERT [dbo].[Colleges] ([collegeCode], [collegeName]) VALUES (162, N'Mulund College of Commerce')
INSERT [dbo].[Colleges] ([collegeCode], [collegeName]) VALUES (223, N'SIES')
SET IDENTITY_INSERT [dbo].[Colleges] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([deptID], [deptName]) VALUES (120, N'CS')
INSERT [dbo].[Department] ([deptID], [deptName]) VALUES (140, N'IT')
INSERT [dbo].[Department] ([deptID], [deptName]) VALUES (160, N'BMS')
INSERT [dbo].[Department] ([deptID], [deptName]) VALUES (180, N'BMM')
INSERT [dbo].[Department] ([deptID], [deptName]) VALUES (200, N'BAF')
SET IDENTITY_INSERT [dbo].[Department] OFF
INSERT [dbo].[Logins] ([userName], [password], [Uid], [phone], [email], [role], [collegeCode], [deptID]) VALUES (N'HOD1@gnkc.com', N'123', 1234567891234567, 9967824801, N'jaggup0@gmail.com', N'HOD', 101, 120)
INSERT [dbo].[Logins] ([userName], [password], [Uid], [phone], [email], [role], [collegeCode], [deptID]) VALUES (N'HOD2@gnkc.com', N'123', 1234567891234568, 8898580146, N'jaggup0@gmail.com', N'HOD', 101, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS101   ', N'Computer Organization and Design', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS102   ', N'Programmingwith Python-I', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS103   ', N'Free andOpen Source Software', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS104   ', N'Database Systems ', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS105   ', N'Discrete Mathematics', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS106   ', N'Descriptive StatisticsandIntroduction to Probability', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS107   ', N'Soft Skills Development', 1, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS201   ', N'Programming with C', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS202   ', N'Programming with Python–II', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS203   ', N'Linux', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS204   ', N'Data Structures', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS205   ', N'Calculus', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS206   ', N'Statistical Methods andTesting of Hypothesis', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS207   ', N'Green Technologies', 2, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS301   ', N'Theory of Computation', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS302   ', N'Core JAVA', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS303   ', N'Operating System', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS304   ', N'Database Management Systems', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS305   ', N'Combinatorics and Graph Theory', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS306   ', N'Physical Computing and IoTProgramming', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS307   ', N'Skill Enhancement: Web Programming', 3, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS401   ', N'Fundamentalsof Algorithms', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS402   ', N'Advanced JAVA', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS403   ', N'Computer Networks', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS404   ', N'Software Engineering', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS405   ', N'Linear Algebra using Python', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS406   ', N'.NET Technologies', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS407   ', N'Skill Enhancement: Android Developer Fundamentals', 4, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS501   ', N'Artificial Intelligence', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS502   ', N'Linux Server Administration', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS503   ', N'Software Testing and Quality Assurance', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS504   ', N'Information and Network Security', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS505   ', N'Architecting  of IoT ', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS506   ', N'Web Services', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS507   ', N'Game Programming', 5, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS601   ', N'Wireless Sensor Networks and Mobile Communication', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS602   ', N'Cloud Computing', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS603   ', N'Cyber Forensics', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS604   ', N'Information Retrieval', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS605   ', N'Digital Image Processing', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS606   ', N'Data Science', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USCS607   ', N'Ethical Hacking', 6, 120)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT101   ', N'Imperative Programming', 1, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT102   ', N'Digital Electronics', 1, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT103   ', N'Operating Systems', 1, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT104   ', N'Discrete Mathematics', 1, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT105   ', N'Communication Skills', 1, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT201   ', N'Object oriented Programming', 2, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT202   ', N'MicroprocessorArchitecture', 2, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT203   ', N'WebProgramming', 2, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT204   ', N'Numerical and Statistical Methods', 2, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT205   ', N'Green Computing', 2, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT301   ', N'Python Programming', 3, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT302   ', N'Data Structures', 3, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT303   ', N'Computer Networks', 3, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT304   ', N'Database Management Systems', 3, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT305   ', N'Applied Mathematics', 3, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT401   ', N'Core Java', 4, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT402   ', N'Introduction to Embedded Systems', 4, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT403   ', N'Computer Oriented Statistical Techniques', 4, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT404   ', N'Software Engineering', 4, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT405   ', N'Computer Graphics and Animation', 4, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT501   ', N'Software Project Management', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT502   ', N'Internet of Things', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT503   ', N'Advanced Web Programming', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT504   ', N'Artificial Intelligence', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT505   ', N'Linux System Administration', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT506   ', N'Enterprise Java', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT507   ', N'Next Generation Technologies', 5, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT601   ', N'Software Quality Assurance', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT602   ', N'Security in Computing', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT603   ', N'Business Intelligence', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT604   ', N'Principles of Geographic Information Systems', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT605   ', N'Enterprise Networking', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT606   ', N'IT ServiceManagement', 6, 140)
INSERT [dbo].[Subjects] ([subCode], [subName], [sem], [deptID]) VALUES (N'USIT607   ', N'Cyber Laws', 6, 140)
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Tid], [FirstName], [LastName], [Uid], [role], [collegeCode], [deptID]) VALUES (227, N'HOD1', NULL, 1234567891234567, N'HOD', 101, 120)
INSERT [dbo].[Teachers] ([Tid], [FirstName], [LastName], [Uid], [role], [collegeCode], [deptID]) VALUES (228, N'HOD2', NULL, 1234567891234568, N'HOD', 101, 140)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Colleges] FOREIGN KEY([collegeCode])
REFERENCES [dbo].[Colleges] ([collegeCode])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Colleges]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Department] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Department]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Classes] FOREIGN KEY([classID], [subCode])
REFERENCES [dbo].[Classes] ([classID], [subCode])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Classes]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Students1] FOREIGN KEY([GRno])
REFERENCES [dbo].[Students] ([GRno])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Students1]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Colleges] FOREIGN KEY([collegeCode])
REFERENCES [dbo].[Colleges] ([collegeCode])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Colleges]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Department] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Department]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Logins] FOREIGN KEY([Uid])
REFERENCES [dbo].[Logins] ([Uid])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Logins]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Department] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Department]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Colleges] FOREIGN KEY([collegeCode])
REFERENCES [dbo].[Colleges] ([collegeCode])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Colleges]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Department] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Department]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Logins] FOREIGN KEY([Uid])
REFERENCES [dbo].[Logins] ([Uid])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Logins]
GO
/****** Object:  StoredProcedure [dbo].[classCreateOrUpdate]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[classCreateOrUpdate]
@classID int,
@year nchar(10),
@deptID int,
@sem int,
@Tid smallint,
@subCode nchar(10),
@clgcode int
AS
BEGIN
IF (@classID=0)
	BEGIN
		INSERT INTO Classes( year, deptID, sem, Tid,subCode,collegeCode)
		VALUES ( @year, @deptID, @sem,@Tid,@subCode,@clgcode)
	END
ELSE
	BEGIN
		UPDATE Classes
		SET
		--year=@year,
		--deptID =@deptID,
		--sem =@sem,
		Tid  = @Tid
		WHERE classID=@classID AND subCode=@subCode
	END
END
GO
/****** Object:  StoredProcedure [dbo].[classDeleteById]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[classDeleteById]
@classID int,
@subCode nchar(10)
AS
BEGIN
	DELETE FROM Classes
	WHERE classID =@classID AND subCode = @subCode
END
GO
/****** Object:  StoredProcedure [dbo].[classViewAll]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[classViewAll]
@clgcode int
AS
BEGIN
	SELECT C.classID , C.year , C.sem , C.subCode , S.subName , T.FirstName
		
	FROM  
		Classes C
		
		LEFT JOIN Subjects AS S ON C.subCode = S.subCode AND C.deptID = S.deptID
		LEFT JOIN Teachers AS T On C.deptID = T.deptID  And C.Tid = T.Tid And C.collegeCode = T.collegeCode
		
	WHERE
		C.deptID= S.deptID  AND  C.collegeCode = @clgcode


END
GO
/****** Object:  StoredProcedure [dbo].[classViewById]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[classViewById]
@classID int,
@subCode nchar(10)
AS
BEGIN
SELECT * 
FROM Classes
WHERE classID =@classID AND subCode = @subCode

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromMarks]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteFromMarks]
@grno int,
@clgcode int,
@subcode nchar(10),
@clsid int,
@sem int

As
Begin
		Delete from Marks where GRno = @grno And  collegeCode=@clgcode And  subCode=@subcode And sem=@sem And classID=@clsid
    
End
GO
/****** Object:  StoredProcedure [dbo].[GenerateResult]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateResult]
@grno int,
@sem int

as 
 
Begin
		SELECT M.subCode , S.subName ,M.internals ,M.theory , M.practicles , M.Tgrd , M.Igrd , M.Pgrd ,M.OVGrd , M.CreErn ,M.GrdPt , M.cg 
		
	FROM  
		Marks M
		--LEFT JOIN Teachers AS T ON C.deptID = T.deptID AND C.collegeCode =T.collegeCode 
		
		LEFT JOIN Subjects AS S ON M.subCode = S.subCode 
		
	WHERE
		  M.GRno = @grno And M.sem = @sem

End
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoMarks]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertIntoMarks]
@grno int,
@clgcode int,
@subcode nchar(10),
@clsid int,
@sem int

As
Begin
    INSERT INTO Marks( GRno, collegeCode, subCode,sem,classID)
		VALUES ( @grno, @clgcode , @subcode ,@sem ,@clsid)

End
GO
/****** Object:  StoredProcedure [dbo].[StudentCreateOrUpdate]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentCreateOrUpdate]
@Uid bigint,
@role varchar(10),
@collegeCode int,
@deptID int,
@userName varchar(20),
@password varchar(10),
@phone bigint,
@email varchar(25),
@stdID int,
@FirstName varchar(25),
@LastName varchar(10),
@GRno int

AS
BEGIN
IF NOT EXISTS (SELECT * FROM Students 
                   WHERE GRno = @GRno
                   AND Uid = @Uid)
	BEGIN

	INSERT INTO Logins (userName,password,Uid,phone,email,role,collegeCode,deptID)
	VALUES(@userName,@password,@Uid,@phone,@email,@role,@collegeCode,@deptID)

	INSERT INTO Students ( stdID, FirstName,LastName,Uid,collegeCode,deptID ,GRno)
	VALUES( @stdID, @FirstName,@LastName,@Uid,@collegeCode,@deptID,@GRno)

	END
ELSE
	BEGIN

	UPDATE Students
	SET
		stdID = @stdID,
		FirstName = @FirstName,
		LastName = @LastName ,		
		collegeCode = @collegeCode,
		deptID = @deptID
	where GRno =@GRno AND Uid =@Uid

	UPDATE Logins
	SET
		userName =@userName,
		password = @password,
		
		phone = @phone,
		email =@email,
		role = @role,
		collegeCode = @collegeCode,
		deptID = @deptID
	where Uid = @Uid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[StudentDeleteByID]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentDeleteByID]
@GRno int,
@Uid bigint
AS
BEGIN
	DELETE FROM Students
	WHERE GRno =@GRno

	DELETE FROM Logins
	WHERE Uid =@Uid
END
GO
/****** Object:  StoredProcedure [dbo].[StudentsAlreadyInClass]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[StudentsAlreadyInClass]
@clsid int


As
Begin

SELECT M.GRno , S.FirstName ,S.LastName
		
	FROM  
		Marks M
		--LEFT JOIN Teachers AS T ON C.deptID = T.deptID AND C.collegeCode =T.collegeCode 
		
		LEFT JOIN Students AS S ON M.GRno = S.GRno 
		
	WHERE
		  M.classID = @clsid 

End
GO
/****** Object:  StoredProcedure [dbo].[StudentViewAll]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentViewAll]
@deptID int,
@collegeCode int
AS
BEGIN
	SELECT
		S.GRno , S.stdID , S.FirstName ,S.LastName , S.Uid ,L.email , L.phone 
	FROM 
		Students S
		LEFT JOIN Logins AS L ON S.deptID = L.deptID AND S.collegeCode = L.collegeCode AND S.Uid = L.Uid
		
	WHERE
		S.collegeCode=@collegeCode AND S.deptID =@deptID 
END
GO
/****** Object:  StoredProcedure [dbo].[StudentViewById]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StudentViewById]
@GRno int,
@Uid bigint
As
BEGIN
	SELECT
		S.GRno , S.stdID , S.FirstName ,S.LastName , S.Uid , L.userName , L.password , L.email , L.phone , S.collegeCode , S.deptID , L.role
	FROM 
		Students S
		LEFT JOIN Logins AS L ON S.deptID = L.deptID AND S.collegeCode = L.collegeCode AND S.Uid = L.Uid
		
	WHERE
		S.GRno=@GRno AND S.Uid =@Uid 
END
GO
/****** Object:  StoredProcedure [dbo].[TeacherCreateOrUpdate]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TeacherCreateOrUpdate]
@Tid smallint,
@FirstName varchar(10),
@LastName Varchar(10),
@Uid bigint,
@role varchar(10),
@collegeCode int,
@deptID int,
@userName varchar(20),
@password varchar(10),
@phone bigint,
@email varchar(25)
AS
BEGIN
IF (@Tid = 0)
	BEGIN

	INSERT INTO Logins (userName,password,Uid,phone,email,role,collegeCode,deptID)
	VALUES(@userName,@password,@Uid,@phone,@email,@role,@collegeCode,@deptID)

	INSERT INTO Teachers (FirstName,LastName,Uid,role,collegeCode,deptID)
	VALUES(@FirstName,@LastName,@Uid,@role,@collegeCode,@deptID)

	END
ELSE
	BEGIN

	UPDATE Logins
	SET
		userName =@userName,
		password = @password,
		phone = @phone,
		email =@email,
		role = @role,
		collegeCode = @collegeCode,
		deptID = @deptID
	where Uid =@Uid

	UPDATE Teachers
	SET
		FirstName = @FirstName,
		LastName = @LastName ,
		
		role =@role,
		collegeCode = @collegeCode,
		deptID = @deptID
	where Tid =@Tid And Uid =@Uid

	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[TeacherDeleteById]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TeacherDeleteById]
@Tid int,
@Uid bigint
AS
BEGIN
	DELETE FROM Teachers
	WHERE Tid =@Tid

	DELETE FROM Logins
	WHERE Uid =@Uid
END
GO
/****** Object:  StoredProcedure [dbo].[TeachersViewAll]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TeachersViewAll]
@deptID int,
@collegeCode int
AS
BEGIN
	SELECT
		T.Tid , T.FirstName , T.role , T.Uid , L.email , L.phone 
	FROM 
		Teachers T
		LEFT JOIN Logins AS L ON T.deptID = L.deptID AND T.collegeCode = L.collegeCode AND T.Uid = L.Uid
		
	WHERE
		T.collegeCode=@collegeCode AND T.deptID =@deptID 
END
GO
/****** Object:  StoredProcedure [dbo].[TeacherViewById]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TeacherViewById]
@Tid int,
@Uid bigint
AS
BEGIN
	SELECT 
		T.Tid ,	T.FirstName , T.LastName , T.role  , T.Uid , L.phone , L.email , L.userName , L.password ,T.collegeCode , T.deptID
	FROM
		Teachers  T Left join Logins as L on  T.Uid = L.Uid 
	WHERE
		T.Tid =@Tid AND T.Uid = @Uid
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIntoMarks]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateIntoMarks]
@grno int,
@subcode nchar(10),
@internal smallint,
@theory smallint,
@pract smallint,
@ig nchar,
@tg nchar,
@pg nchar,
@og nchar,
@ce int,
@gp int

As 
begin 
	Update Marks set 
	internals = @internal,
	theory = @theory,
	practicles = @pract,
	Igrd = @ig,
	Tgrd = @tg,
	Pgrd = @pg,
	OVGrd = @og,
	CreErn =@ce,
	GrdPt = @gp,
	cg = @ce * @gp 

	where GRno = @grno And subCode=@subcode


End
GO
/****** Object:  StoredProcedure [dbo].[ViewClassesToTeacher]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ViewClassesToTeacher]
@depid int,

@tid int 

As 
BEGIN
SELECT C.classID , C.year , C.sem , C.subCode , S.subName
		
	FROM  
		Classes C
		--LEFT JOIN Teachers AS T ON C.deptID = T.deptID AND C.collegeCode =T.collegeCode 
		
		LEFT JOIN Subjects AS S ON C.subCode = S.subCode 
		
	WHERE
		  C.Tid = @tid
End
GO
/****** Object:  StoredProcedure [dbo].[ViewMarks]    Script Date: 9/27/2019 6:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ViewMarks]
@subcode nchar(10),
@clsid int

As
Begin 
		Select M.GRno ,S.stdID, S.FirstName ,S.LastName,M.internals,M.theory,M.practicles 
			FROM Marks M
			LEFT JOIN Students AS S ON M.GRno = S.GRno 
	
		where 
		M.classID=@clsid AND M.subCode = @subcode

End
GO
USE [master]
GO
ALTER DATABASE [ResultsBuilder] SET  READ_WRITE 
GO

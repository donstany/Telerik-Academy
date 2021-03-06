USE [master]
GO

/****** Object:  Database [Company]    Script Date: 07-Nov-16 18:41:10 ******/
CREATE DATABASE [Company]
GO

USE Company
GO

 CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 07-Nov-16 18:41:10 ******/

CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Salary] [money] NOT NULL,
	[ManagerId] [int] NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[Employees_Projects]    Script Date: 07-Nov-16 18:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees_Projects](
	[EmployeeId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Startdate] [datetime] NOT NULL,
	[Enddate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 07-Nov-16 18:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reports]    Script Date: 07-Nov-16 18:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportTime] [datetime] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees_Projects]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Projects_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Employees_Projects] CHECK CONSTRAINT [FK_Employees_Projects_Employees]
GO
ALTER TABLE [dbo].[Employees_Projects]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Projects_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Employees_Projects] CHECK CONSTRAINT [FK_Employees_Projects_Projects]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Employees]
GO

ALTER TABLE Employees
ADD CONSTRAINT [FirstnameLengthConstraint] CHECK (LEN(Firstname) >= 5 AND LEN(Firstname) <= 20 ) 
GO

ALTER TABLE Employees
ADD CONSTRAINT [LastnameLengthConstraint] CHECK (LEN(Lastname) >= 5 AND LEN(Lastname) <= 20 ) 
GO

ALTER TABLE Departments
ADD CONSTRAINT [NameLengthConstraint] CHECK (LEN(Name) >= 10 AND LEN(Name) <= 50 ) 
GO

ALTER TABLE Projects
ADD CONSTRAINT [ProjNameLengthConstraint] CHECK (LEN(Name) >= 5 AND LEN(Name) <= 50 ) 
GO
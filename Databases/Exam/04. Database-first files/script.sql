USE [master]
GO
/****** Object:  Database [Computers]    Script Date: 08-Nov-16 14:57:20 ******/
CREATE DATABASE [Computers]
GO

USE [Computers]
GO

CREATE TABLE [dbo].[Computers](
	[ComputerId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL CHECK (LOWER([Type]) IN('notebook', 'desktop', 'ultrabook')),
	[VendorId] [int] NOT NULL,
	[CpuId] [int] NOT NULL,
	[MemoryInGb] [int] NOT NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[ComputerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Computers_Gpus]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers_Gpus](
	[ComputerId] [int] NOT NULL,
	[GpuId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Computers_StorageDevices]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers_StorageDevices](
	[ComputerId] [int] NOT NULL,
	[StorageDeviceId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cpus]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cpus](
	[CpuId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[NumberOfCores] [int] NOT NULL,
	[ClockCyclesInGhz] [float] NOT NULL,
	[VendorId] [int] NOT NULL,
 CONSTRAINT [PK_Cus] PRIMARY KEY CLUSTERED 
(
	[CpuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gpus]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gpus](
	[GpuId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NOT NULL CHECK (LOWER([Type]) IN('internal', 'external')),
	[MemoryInGb] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
 CONSTRAINT [PK_Gpus] PRIMARY KEY CLUSTERED 
(
	[GpuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StorageDevices]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageDevices](
	[StorageDeviceId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NOT NULL  CHECK (UPPER([Type]) IN('SSD', 'HDD')),
	[SizeInGb] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
 CONSTRAINT [PK_StorageDevices] PRIMARY KEY CLUSTERED 
(
	[StorageDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 08-Nov-16 14:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Cpus] FOREIGN KEY([CpuId])
REFERENCES [dbo].[Cpus] ([CpuId])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Cpus]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Vendors]
GO
ALTER TABLE [dbo].[Computers_Gpus]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Gpus_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([ComputerId])
GO
ALTER TABLE [dbo].[Computers_Gpus] CHECK CONSTRAINT [FK_Computers_Gpus_Computers]
GO
ALTER TABLE [dbo].[Computers_Gpus]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Gpus_Gpus] FOREIGN KEY([GpuId])
REFERENCES [dbo].[Gpus] ([GpuId])
GO
ALTER TABLE [dbo].[Computers_Gpus] CHECK CONSTRAINT [FK_Computers_Gpus_Gpus]
GO
ALTER TABLE [dbo].[Computers_StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_Computers_StorageDevices_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([ComputerId])
GO
ALTER TABLE [dbo].[Computers_StorageDevices] CHECK CONSTRAINT [FK_Computers_StorageDevices_Computers]
GO
ALTER TABLE [dbo].[Computers_StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_Computers_StorageDevices_StorageDevices] FOREIGN KEY([StorageDeviceId])
REFERENCES [dbo].[StorageDevices] ([StorageDeviceId])
GO
ALTER TABLE [dbo].[Computers_StorageDevices] CHECK CONSTRAINT [FK_Computers_StorageDevices_StorageDevices]
GO
ALTER TABLE [dbo].[Cpus]  WITH CHECK ADD  CONSTRAINT [FK_Cpus_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[Cpus] CHECK CONSTRAINT [FK_Cpus_Vendors]
GO
ALTER TABLE [dbo].[Gpus]  WITH CHECK ADD  CONSTRAINT [FK_Gpus_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[Gpus] CHECK CONSTRAINT [FK_Gpus_Vendors]
GO
ALTER TABLE [dbo].[StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_StorageDevices_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[StorageDevices] CHECK CONSTRAINT [FK_StorageDevices_Vendors]
GO
USE [master]
GO
/****** Object:  Database [PersonRegisterPage]    Script Date: 10.05.2023 16:46:17 ******/
CREATE DATABASE [PersonRegisterPage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonRegisterPage', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\PersonRegisterPage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PersonRegisterPage_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\PersonRegisterPage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PersonRegisterPage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonRegisterPage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonRegisterPage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonRegisterPage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonRegisterPage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonRegisterPage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonRegisterPage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PersonRegisterPage] SET  MULTI_USER 
GO
ALTER DATABASE [PersonRegisterPage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonRegisterPage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonRegisterPage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonRegisterPage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PersonRegisterPage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PersonRegisterPage]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 10.05.2023 16:46:17 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 10.05.2023 16:46:17 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 10.05.2023 16:46:17 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 10.05.2023 16:46:17 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Job] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Meslekler] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[JobId] [int] NULL,
	[Gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (1, N'Aşçı')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (2, N'Doktor')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (3, N'Mühendis')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (4, N'Öğretmen')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (5, N'Çiftçi')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (6, N'İşçi')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (7, N'Garson')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (8, N'Tekniker')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (9, N'Mimar')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (10, N'Ressam')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (11, N'Marangoz')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (12, N'Memur')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (13, N'Polis')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (14, N'Asker')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (15, N'Kaptan')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (16, N'Pilot')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (17, N'Şoför')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (18, N'Makinist')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (19, N'Avukat')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (20, N'Hakim')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (21, N'Savcı')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (22, N'Yazılımcı')
INSERT [dbo].[Jobs] ([JobId], [Job]) VALUES (23, N'Oyuncu')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (1, N'Mehmet', N'Arpacı', 19, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (2, N'Ahmet', N'Kapıcıoğlu', 7, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (3, N'Şeyma', N'Altındağ', 9, N'KADIN')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (4, N'İlker', N'Ünlüoğlu', 21, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (5, N'Ayşe', N'Hızlı', 1, N'KADIN')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (8, N'Fatih Miraç', N'Polat', 3, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (9, N'Zehra', N'Karakaya', 22, N'KADIN')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (10, N'Uğur', N'Akbulut', 22, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (11, N'Musa', N'Eren', 3, N'ERKEK')
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [JobId], [Gender]) VALUES (15, N'Beyza', N'Daldal', 22, N'KADIN')
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Jobs]
GO
/****** Object:  StoredProcedure [dbo].[spDelete]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDelete]
@Id int
as
begin
delete Persons where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[spFindJobId]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spFindJobId]
@p1 varchar(100)
as
begin
select jobId from Jobs j where j.Job=@p1
end
GO
/****** Object:  StoredProcedure [dbo].[spJobList]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spJobList]
as
begin
select Job from Jobs order by Job
end
GO
/****** Object:  StoredProcedure [dbo].[spPersonAdd]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPersonAdd]
@name varchar(50),
@surname varchar(50),
@jobid int,
@gender varchar(10)
as
begin
insert into Persons(Name,Surname,JobId,Gender) values(@name,@surname,@jobid,@gender)
end
GO
/****** Object:  StoredProcedure [dbo].[spPersonList]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPersonList]
as
begin
select p.Id,p.Name,p.Surname,j.Job,p.Gender  from Persons p join Jobs j on j.JobId=p.JobId
end
GO
/****** Object:  StoredProcedure [dbo].[spPersonUpdate]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPersonUpdate]
@id int,
@name varchar(50),
@surname varchar(50),
@jobid int,
@gender varchar(10)
as
begin
update Persons set Name=@name,Surname=@surname,JobId=@jobid,Gender=@gender where Id=@id 
end
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 10.05.2023 16:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [PersonRegisterPage] SET  READ_WRITE 
GO

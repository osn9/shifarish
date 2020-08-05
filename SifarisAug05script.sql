USE [master]
GO
/****** Object:  Database [Sifarish]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE DATABASE [Sifarish] ON  PRIMARY 
( NAME = N'Sifarish', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Sifarish.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sifarish_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Sifarish_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sifarish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sifarish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sifarish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sifarish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sifarish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sifarish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sifarish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sifarish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sifarish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sifarish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sifarish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sifarish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sifarish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sifarish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sifarish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sifarish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sifarish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sifarish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sifarish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sifarish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sifarish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sifarish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sifarish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sifarish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sifarish] SET  MULTI_USER 
GO
ALTER DATABASE [Sifarish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sifarish] SET DB_CHAINING OFF 
GO
USE [Sifarish]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/5/2020 12:03:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/5/2020 12:03:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/5/2020 12:03:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/5/2020 12:03:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/5/2020 12:03:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
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
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Citizen_GharJagga_Info]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen_GharJagga_Info](
	[Citizen_gharjaga_Id] [int] IDENTITY(1,1) NOT NULL,
	[Citizen_Id] [int] NULL,
	[NumberOfHouse] [int] NULL,
	[Area] [nvarchar](50) NULL,
	[Kitta_No] [nvarchar](50) NULL,
	[East] [nvarchar](50) NULL,
	[West] [nvarchar](50) NULL,
	[North] [nvarchar](50) NULL,
	[South] [nvarchar](50) NULL,
 CONSTRAINT [PK_Citizen_GharJagga_Info] PRIMARY KEY CLUSTERED 
(
	[Citizen_gharjaga_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Citizen_Info]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen_Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeparmentId] [int] NULL,
	[CitizenName] [nvarchar](100) NULL,
	[Citizen_id] [int] NULL,
	[Citizenship_No] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[District_Id] [int] NULL,
	[Zone_Id] [int] NULL,
	[Mun_Ward] [int] NULL,
	[Sabik_Ward] [int] NULL,
	[Father_Husband_Name] [nvarchar](50) NULL,
	[GrandFatherName] [nvarchar](50) NULL,
	[CitizenShip_Date] [nvarchar](50) NULL,
	[CitizinShip_Zone] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [int] NULL,
	[DeletedDate] [date] NULL,
	[DeletedBy] [int] NULL,
	[Updatedate] [date] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Citizen_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Demolition]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demolition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Name] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NULL,
	[Reason] [nvarchar](250) NULL,
	[SuchakName] [nvarchar](150) NULL,
	[Relation] [nvarchar](150) NULL,
	[SuchakPhone] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[DateAd] [date] NULL,
	[PrindDate] [nvarchar](50) NULL,
	[PrintDateAd] [date] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[DeletedDate] [date] NULL,
	[DeletedBy] [int] NULL,
	[Updateddate] [date] NULL,
	[updatedBy] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Demolition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeparmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[DepartmentAddress] [nvarchar](50) NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[UpdatedDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeparmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[StateId] [bigint] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DistrictDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DistId] [bigint] NOT NULL,
	[HeadQuater] [nvarchar](250) NULL,
	[PDensity] [nvarchar](50) NULL,
	[Population] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Website] [nvarchar](150) NULL,
 CONSTRAINT [PK_DistrictDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fiscal_year]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fiscal_year](
	[FiscalId] [int] IDENTITY(1,1) NOT NULL,
	[Nanem] [nvarchar](50) NULL,
	[StartDate] [nvarchar](50) NULL,
	[StartDateAd] [date] NULL,
	[EndDate] [nvarchar](50) NULL,
	[EndDateAd] [date] NULL,
	[PreviousYear] [int] NULL,
	[CreatedDate] [date] NULL,
	[DeletedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[UpdatteBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_fiscal_year] PRIMARY KEY CLUSTERED 
(
	[FiscalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gharBato]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gharBato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[munOrvdcName] [nvarchar](500) NULL,
	[Ward] [int] NULL,
	[Map_no] [nvarchar](500) NULL,
	[KittaNo] [nvarchar](500) NULL,
	[buyerName] [nvarchar](50) NULL,
	[buyerFatherName] [nvarchar](50) NULL,
	[SellerName] [nvarchar](50) NULL,
	[SellerFatherName] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[DateAd] [date] NULL,
	[PrintDate] [nvarchar](50) NULL,
	[PrintDateAd] [date] NULL,
	[CreatedDate] [date] NULL,
	[DeletedDate] [date] NULL,
	[Updatedate] [date] NULL,
	[updatedBy] [nvarchar](50) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_gharBato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GharJaggaKar]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GharJaggaKar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ward] [int] NULL,
	[gharNo] [nvarchar](50) NULL,
	[kittaNo] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[BuildDate] [nvarchar](50) NULL,
	[Length] [nvarchar](50) NULL,
	[breadth] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[GharDesigin] [nvarchar](500) NULL,
	[Road] [nvarchar](500) NULL,
	[roadType] [nvarchar](500) NULL,
	[NibedakName] [nvarchar](500) NULL,
	[NibedakAddress] [nvarchar](500) NULL,
	[phone] [nvarchar](50) NULL,
	[marphatName] [nvarchar](500) NULL,
	[Date] [nvarchar](50) NULL,
	[dateAd] [nvarchar](50) NULL,
	[PrintDate] [nvarchar](50) NULL,
	[printDateAd] [nvarchar](50) NULL,
	[CreatedDae] [date] NULL,
	[deltedDate] [date] NULL,
	[updatedate] [date] NULL,
	[updateBy] [int] NULL,
	[createby] [int] NULL,
	[deletedby] [int] NULL,
 CONSTRAINT [PK_GharJaggaKar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GharjaggakarFiles]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GharjaggakarFiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GhraJaggaKarId] [int] NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_GharjaggakarFiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JaagaTarfa]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JaagaTarfa](
	[jagaTarfa_id] [int] IDENTITY(1,1) NOT NULL,
	[MulSadak] [nvarchar](50) NULL,
	[sahayakSadaK] [nvarchar](50) NULL,
	[KacchiSadak] [nvarchar](50) NULL,
	[Goreto] [nvarchar](50) NULL,
	[BatoNavaeko] [nvarchar](50) NULL,
	[CitizenId] [int] NULL,
 CONSTRAINT [PK_JaagaTarfa] PRIMARY KEY CLUSTERED 
(
	[jagaTarfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Karlayatarfa]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karlayatarfa](
	[Karlayatarfa_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[KardartaFullName] [nvarchar](50) NULL,
	[citizen_ID] [int] NULL,
 CONSTRAINT [PK_Karlayatarfa] PRIMARY KEY CLUSTERED 
(
	[Karlayatarfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocalLevel]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalLevel](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Type] [nvarchar](50) NULL,
	[DistId] [bigint] NOT NULL,
	[MaxWardNo] [int] NULL,
 CONSTRAINT [PK_LocalLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocalLevelDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalLevelDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LocalLevelId] [bigint] NOT NULL,
	[Area] [nvarchar](50) NULL,
	[Density] [nvarchar](150) NULL,
	[Population] [nvarchar](50) NULL,
	[Website] [nvarchar](150) NULL,
 CONSTRAINT [PK_LocalLevelDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Month]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[MonthId] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NirmanBebasahi]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NirmanBebasahi](
	[nirmanbebasaiId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[postboxNo] [nvarchar](50) NULL,
	[TelPhoneNo] [nvarchar](50) NULL,
	[FaxNo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[KaralayaName] [nvarchar](150) NULL,
	[KaralayaAddress] [nvarchar](510) NULL,
	[PramanPatraNo] [nvarchar](150) NULL,
	[approvalNo] [int] NULL,
	[RegisterdDate] [nvarchar](50) NULL,
	[RegisterDateAd] [date] NULL,
	[AprovalDateAd] [date] NULL,
	[ApprovealDate] [nvarchar](50) NULL,
	[ApprovalKaryalaya] [nvarchar](50) NULL,
	[RenewalDatead] [date] NULL,
	[RenewalDate] [nvarchar](50) NULL,
	[MembershipNo] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[AmountEng] [decimal](18, 2) NULL,
	[FormName] [nvarchar](510) NULL,
	[FormAddress] [nvarchar](150) NULL,
	[SanchalakName] [nvarchar](150) NULL,
	[Date] [nvarchar](50) NULL,
	[DateAd] [date] NULL,
	[PrintDateAd] [date] NULL,
	[PrintDate] [nvarchar](50) NULL,
	[Createdby] [int] NULL,
	[CreateddDate] [date] NULL,
	[deletedDate] [date] NULL,
	[Deletedby] [int] NULL,
	[updatedDate] [date] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_NirmanBebasahi] PRIMARY KEY CLUSTERED 
(
	[nirmanbebasaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NirmanBebasahiApproval]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NirmanBebasahiApproval](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[PostBoxNo] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[CompanyTypr] [nvarchar](50) NULL,
	[ComapanyPersonelName] [nvarchar](50) NULL,
	[CompanyPersonelAddress] [nvarchar](50) NULL,
	[CompanyPersonelPostbosNo] [nvarchar](50) NULL,
	[CompanyPersonelTelephone] [nvarchar](50) NULL,
	[CompanyPersonelFax] [nvarchar](50) NULL,
	[CompanyPersonelEmail] [nvarchar](50) NULL,
	[RegisterationNo] [nvarchar](50) NULL,
	[RegistrarionDate] [nvarchar](50) NULL,
	[RegistrationDateAd] [date] NULL,
	[AdhiriktaPuji] [nvarchar](50) NULL,
	[AdhirikataPujiEng] [decimal](18, 2) NULL,
	[JariPugi] [nvarchar](50) NULL,
	[JariPujiEng] [decimal](18, 2) NULL,
	[Grade] [nvarchar](50) NULL,
	[groups] [nvarchar](50) NULL,
	[Technical] [nvarchar](50) NULL,
	[NonTechnical] [nvarchar](50) NULL,
	[Others] [nvarchar](50) NULL,
	[PrintDate] [nvarchar](50) NULL,
	[PrintDateAd] [date] NULL,
	[Date] [date] NULL,
	[status] [bit] NULL,
	[CreateDate] [nchar](10) NULL,
	[Createdby] [int] NULL,
	[DeletedDate] [date] NULL,
	[DeletedBy] [int] NULL,
	[UpdatedDate] [date] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_NirmanBebasahiApproval] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NpCalDb]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NpCalDb](
	[NCAL_YEAR] [nvarchar](4) NULL,
	[STRT_DATE] [datetime] NULL,
	[STOP_DATE] [datetime] NULL,
	[MONTH_1] [smallint] NULL,
	[MONTH_2] [smallint] NULL,
	[MONTH_3] [smallint] NULL,
	[MONTH_4] [smallint] NULL,
	[MONTH_5] [smallint] NULL,
	[MONTH_6] [smallint] NULL,
	[MONTH_7] [smallint] NULL,
	[MONTH_8] [smallint] NULL,
	[MONTH_9] [smallint] NULL,
	[MONTH_10] [smallint] NULL,
	[MONTH_11] [smallint] NULL,
	[MONTH_12] [smallint] NULL,
	[BranchId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_State_2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StateDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NOT NULL,
	[Capital] [nvarchar](250) NULL,
	[ChiefMinister] [nvarchar](150) NULL,
	[PDensity] [nvarchar](50) NULL,
	[Governer] [nvarchar](250) NULL,
	[Population] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Website] [nvarchar](250) NULL,
	[TotalDist] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBasaisaraiDarta]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBasaisaraiDarta](
	[NewMigrationId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiId] [int] NOT NULL,
	[GharMuliNaamThar] [nvarchar](100) NOT NULL,
	[GharMuliFullName] [nvarchar](100) NULL,
	[BasaisaraiAayekoDartaNo] [nvarchar](50) NULL,
	[BasaisaraiAayekoPradesh] [int] NULL,
	[BasaisaraiAayekoJilla] [int] NULL,
	[BasaisaraiAayekoPalika] [int] NULL,
	[BasaisaraiAayekoWardNo] [int] NULL,
	[BasaisaraiAayekoGharNo] [nvarchar](50) NULL,
	[BasaisaraiAayekoGaunTole] [nvarchar](50) NULL,
	[BasaisaraiAayekoMiti] [nvarchar](50) NULL,
	[BasaisaraiAayekoDate] [nvarchar](50) NULL,
	[BasaisaraiAayekoKaran] [int] NULL,
	[BasaisaraiJanePradesh] [int] NULL,
	[BasaisaraiJaneJilla] [int] NULL,
	[BasaisaraiJanePalika] [int] NULL,
	[BasaisaraiJaneWardNo] [int] NULL,
	[BasaisaraiJaneGharNo] [nvarchar](50) NULL,
	[BasaisaraiJaneGaunTole] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBasaisaraiDarta] PRIMARY KEY CLUSTERED 
(
	[NewMigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBasaisaraiDartaInformant]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBasaisaraiDartaInformant](
	[NewMigrationInformantId] [int] IDENTITY(1,1) NOT NULL,
	[NewMigrationId] [int] NOT NULL,
	[InfNaamThar] [nvarchar](100) NOT NULL,
	[InfFullName] [nvarchar](100) NULL,
	[InfState] [int] NULL,
	[InfDistrict] [int] NULL,
	[InfPalika] [int] NULL,
	[InfWardNo] [int] NULL,
	[InfGharNo] [nvarchar](50) NULL,
	[InfGaunTole] [nvarchar](50) NULL,
	[InfNagariktaPraPaNo] [nvarchar](50) NULL,
	[InfNagariktaIssueDate] [nvarchar](50) NULL,
	[InfNagariktaIssueDistrict] [int] NULL,
	[InfPassportNo_Desh] [nvarchar](200) NULL,
	[Miti] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBasaisaraiDartaInformant] PRIMARY KEY CLUSTERED 
(
	[NewMigrationInformantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBasaisaraiKaran]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBasaisaraiKaran](
	[BasaisaraiKaranId] [int] IDENTITY(1,1) NOT NULL,
	[BasaisaraiKaran] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBasaisaraiKaran] PRIMARY KEY CLUSTERED 
(
	[BasaisaraiKaranId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBasaisaraiPersonalDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBasaisaraiPersonalDetails](
	[BasaisaraiDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[NewMigrationId] [int] NOT NULL,
	[JanmaDartaNo] [int] NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[JanmaMiti] [nvarchar](50) NULL,
	[JanmaDate] [nvarchar](50) NULL,
	[JanmaPradesh] [int] NULL,
	[JanmaJilla] [int] NULL,
	[JanmaPalika] [int] NULL,
	[JanmaWardNo] [int] NULL,
	[Gender] [int] NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagaritaIssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[AnyRecords] [nvarchar](max) NULL,
	[RelationTo] [int] NULL,
 CONSTRAINT [PK_tblBasaisaraiPersonalDetails] PRIMARY KEY CLUSTERED 
(
	[BasaisaraiDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCourtType]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourtType](
	[CourtTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CourtType] [nvarchar](50) NULL,
	[CourtType_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCourtType] PRIMARY KEY CLUSTERED 
(
	[CourtTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[WorkOfficeId] [int] NOT NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDistrict]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDistrict](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictId_val] [int] NULL,
	[DistrictName] [nvarchar](50) NULL,
	[StateId_val] [int] NULL,
	[DistrictName_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDistrict] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDivorceDarta]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivorceDarta](
	[DivorceId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiId] [int] NOT NULL,
	[CourtType] [int] NULL,
	[District] [int] NULL,
	[NirnayaNo] [nvarchar](50) NULL,
	[NinayaMiti] [nvarchar](50) NULL,
	[VivahDartaNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDivorceDarta] PRIMARY KEY CLUSTERED 
(
	[DivorceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDivorceDartaInformant]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivorceDartaInformant](
	[DivorceInformantId] [int] IDENTITY(1,1) NOT NULL,
	[DivorceId] [int] NOT NULL,
	[InfNaamThar] [nvarchar](50) NULL,
	[InfFullName] [nvarchar](50) NULL,
	[InfRelationToDivorcee] [int] NULL,
	[InfState] [int] NULL,
	[InfDistrict] [int] NULL,
	[InfPalika] [int] NULL,
	[InfWardNo] [int] NULL,
	[InfGaunTole] [nvarchar](50) NULL,
	[InfGharNo] [nvarchar](50) NULL,
	[InfNagariktaPraPaNo] [nvarchar](50) NULL,
	[InfNagariktaIssueDate] [nvarchar](50) NULL,
	[InfNagariktaIssueDistrict] [int] NULL,
	[InfPassportNo_Desh] [nvarchar](100) NULL,
	[Miti] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDivorceDartaInformant] PRIMARY KEY CLUSTERED 
(
	[DivorceInformantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDivorceeHusbandDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivorceeHusbandDetails](
	[DivorceeHusbandId] [int] IDENTITY(1,1) NOT NULL,
	[DivorceId] [int] NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[JanmaMiti] [nvarchar](50) NULL,
	[JanmaDartaNo] [nvarchar](50) NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[BideshPassport_Desh] [nvarchar](100) NULL,
	[District] [int] NULL,
	[Palika] [int] NULL,
	[WardNo] [int] NULL,
	[JaatJati] [nvarchar](50) NULL,
	[ShikshaSthar] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[BaajekoNaamThar] [nvarchar](50) NULL,
	[BaajekoFullName] [nvarchar](50) NULL,
	[BabukoNaamThar] [nvarchar](50) NULL,
	[BabukoFullName] [nvarchar](50) NULL,
	[AamakoNaamThar] [nvarchar](50) NULL,
	[AamakoFullName] [nvarchar](50) NULL,
	[VivahMiti] [nvarchar](50) NULL,
	[VivahDate] [nvarchar](50) NULL,
	[TotalChildBorn] [int] NULL,
	[TotalLiveChild] [int] NULL,
	[ChildLivingWith] [int] NULL,
	[SonLivingWith] [int] NULL,
	[DaughterLivingWith] [int] NULL,
 CONSTRAINT [PK_tblDivorceeHusbandDetails] PRIMARY KEY CLUSTERED 
(
	[DivorceeHusbandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDivorceeWifeDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivorceeWifeDetails](
	[DivorceeWifeId] [int] IDENTITY(1,1) NOT NULL,
	[DivorceId] [int] NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[JanmaMiti] [nvarchar](50) NULL,
	[JanmaDartaNo] [nvarchar](50) NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[BideshPassport_Desh] [nvarchar](100) NULL,
	[District] [int] NULL,
	[Palika] [int] NULL,
	[WardNo] [int] NULL,
	[JaatJati] [nvarchar](50) NULL,
	[ShikshaSthar] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[BaajekoNaamThar] [nvarchar](50) NULL,
	[BaajekoFullName] [nvarchar](50) NULL,
	[BabukoNaamThar] [nvarchar](50) NULL,
	[BabukoFullName] [nvarchar](50) NULL,
	[AamakoNaamThar] [nvarchar](50) NULL,
	[AamakoFullName] [nvarchar](50) NULL,
	[ChildLivingWith] [int] NULL,
	[SonLivingWith] [int] NULL,
	[DaughterLivingWith] [int] NULL,
 CONSTRAINT [PK_tblDivorceeWifeDetails] PRIMARY KEY CLUSTERED 
(
	[DivorceeWifeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEducation]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEducation](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[Education] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEducation] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeAddress] [nvarchar](50) NULL,
	[EmployeeContact] [nvarchar](50) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](500) NULL,
	[WorkOfficeId] [int] NOT NULL,
	[ShreniId] [int] NULL,
	[PadhaId] [int] NULL,
	[UserTypeId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[INVId] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFiscalYear]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFiscalYear](
	[FiscalYearId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblFiscalYear] PRIMARY KEY CLUSTERED 
(
	[FiscalYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGender]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Gender_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmadaMaddat]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmadaMaddat](
	[JanmadaMaddatId] [int] IDENTITY(1,1) NOT NULL,
	[JanmadaMaddatGarne] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblJanmadaMaddat] PRIMARY KEY CLUSTERED 
(
	[JanmadaMaddatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaDarta]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaDarta](
	[NewbornId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiId] [int] NOT NULL,
	[NewbornNaam] [nvarchar](100) NOT NULL,
	[NewbornName] [nvarchar](100) NULL,
	[JanmaMiti] [nvarchar](100) NOT NULL,
	[JanmaDate] [nvarchar](100) NULL,
	[JanmaSthaan] [int] NULL,
	[JanmadaMadatt] [int] NULL,
	[Gender] [int] NOT NULL,
	[JanmaKisim] [int] NULL,
	[JanmaJaatJati] [nvarchar](50) NULL,
	[JanmaPradesh] [int] NULL,
	[JanmaJilla] [int] NULL,
	[JanmaPalika] [int] NULL,
	[JanmaWardNo] [int] NULL,
	[JanmaBidesh] [nvarchar](250) NULL,
	[JanmaForeign] [nvarchar](250) NULL,
	[BajekoNaam] [nvarchar](100) NULL,
	[GrandFather] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblJanmaDarta] PRIMARY KEY CLUSTERED 
(
	[NewbornId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaDartaFatherDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaDartaFatherDetails](
	[NewbornFatherId] [int] IDENTITY(1,1) NOT NULL,
	[NewbornId] [int] NOT NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[PermaState] [int] NULL,
	[PermaDistrict] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWardNo] [int] NULL,
	[GaunTole] [nvarchar](100) NULL,
	[GharNo] [nvarchar](50) NULL,
	[SisuJanmidakoUmer] [int] NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaLiyekoDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIsssueDistrict] [int] NULL,
	[PassportNo_Desh] [nvarchar](250) NULL,
	[ShikshaSthar] [int] NULL,
	[Pesha] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[TotalChild] [int] NULL,
	[TotalLiveChild] [int] NULL,
	[VivahDartaNo] [nvarchar](50) NULL,
	[VivahMiti] [nvarchar](100) NULL,
	[VivahDate] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblJanmaDartaFatherDetails] PRIMARY KEY CLUSTERED 
(
	[NewbornFatherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaDartaInformant]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaDartaInformant](
	[NewBornInformantId] [int] IDENTITY(1,1) NOT NULL,
	[NewbornId] [int] NOT NULL,
	[InfNaamThar] [nvarchar](100) NOT NULL,
	[InfFullName] [nvarchar](100) NULL,
	[InfRelationToNewBorn] [int] NOT NULL,
	[InfState] [int] NULL,
	[InfDistrict] [int] NULL,
	[InfPalika] [int] NULL,
	[InfWardNo] [int] NULL,
	[InfGaunTole] [nvarchar](50) NULL,
	[InfGharNo] [nvarchar](50) NULL,
	[InfNagariktaPraPaNo] [nvarchar](50) NULL,
	[InfNagariktaIssueDate] [nvarchar](50) NULL,
	[InfNagariktaIssueDistrict] [int] NULL,
	[InfPassportNo_Desh] [nvarchar](200) NULL,
	[Miti] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblJanmaDartaInformant] PRIMARY KEY CLUSTERED 
(
	[NewBornInformantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaDartaMotherDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaDartaMotherDetails](
	[NewBornMotherId] [int] IDENTITY(1,1) NOT NULL,
	[NewbornId] [int] NOT NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[PermaState] [int] NULL,
	[PermaDistrict] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWardNo] [int] NULL,
	[GaunTole] [nvarchar](100) NULL,
	[GharNo] [nvarchar](50) NULL,
	[SisuJanmidakoUmer] [int] NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaLiyekoDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[PassportNo_Desh] [nvarchar](250) NULL,
	[ShikshaSthar] [int] NULL,
	[Pesha] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblJanmaDartaMotherDetails] PRIMARY KEY CLUSTERED 
(
	[NewBornMotherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaKisim]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaKisim](
	[JanmaKisinId] [int] IDENTITY(1,1) NOT NULL,
	[JanmaKisimName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblJanmaKisim] PRIMARY KEY CLUSTERED 
(
	[JanmaKisinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmaSthaan]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJanmaSthaan](
	[JanmaSthaanId] [int] IDENTITY(1,1) NOT NULL,
	[JanmaSthaanName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblJanmaSthaan] PRIMARY KEY CLUSTERED 
(
	[JanmaSthaanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMrityuDarta]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMrityuDarta](
	[NewDeathId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiId] [int] NOT NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Gender] [int] NULL,
	[MrityuMiti] [nvarchar](100) NOT NULL,
	[MrityuDate] [nvarchar](100) NULL,
	[Age] [int] NULL,
	[MrityuPradesh] [int] NULL,
	[MrityuJilla] [int] NULL,
	[MrityuPalika] [int] NULL,
	[MrityuWardNo] [int] NULL,
	[MrityuGaunTole] [nvarchar](50) NULL,
	[MrityuGharNo] [nvarchar](50) NULL,
	[MrityuBhayekoSthaan] [int] NULL,
 CONSTRAINT [PK_tblMrityuDarta] PRIMARY KEY CLUSTERED 
(
	[NewDeathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMrityuDartaInformant]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMrityuDartaInformant](
	[NewDeathInformantId] [int] IDENTITY(1,1) NOT NULL,
	[NewdeathId] [int] NOT NULL,
	[InfNaamThar] [nvarchar](100) NOT NULL,
	[InfFullName] [nvarchar](100) NULL,
	[InfRelationToNewDeath] [int] NOT NULL,
	[InfPradesh] [int] NULL,
	[InfJilla] [int] NULL,
	[InfPalika] [int] NULL,
	[InfWardNo] [int] NULL,
	[InfGaunTole] [nvarchar](50) NULL,
	[InfGharNo] [nvarchar](50) NULL,
	[InfNagariktaPraPaNo] [nvarchar](50) NULL,
	[InfNagariktaIssueDate] [nvarchar](50) NULL,
	[InfNagariktaIssueDistrict] [int] NULL,
	[InfPassportNo_Desh] [nvarchar](200) NULL,
	[Miti] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblMrityuDartaInformant] PRIMARY KEY CLUSTERED 
(
	[NewDeathInformantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMrityuDartaPersonalDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMrityuDartaPersonalDetails](
	[NewDeathDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[NewDeathId] [int] NOT NULL,
	[JanmaDartaNo] [int] NULL,
	[JanmaMiti] [nvarchar](100) NULL,
	[JanmaDate] [nvarchar](100) NULL,
	[JanmaPradesh] [int] NULL,
	[JanmaJilla] [int] NULL,
	[JanmaPalika] [int] NULL,
	[JanmaWardNo] [int] NULL,
	[JanmaGaunTole] [nvarchar](50) NULL,
	[JanmaGharNo] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIsssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[PassportNo_Desh] [nvarchar](150) NULL,
	[ShikshaSthar] [int] NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[Dharma] [nvarchar](50) NULL,
	[JaatJaati] [nvarchar](50) NULL,
	[BajekoNaam] [nvarchar](100) NULL,
	[Grandfather] [nvarchar](100) NULL,
	[BabuNaam] [nvarchar](100) NULL,
	[FatherName] [nvarchar](100) NULL,
	[AamaNaam] [nvarchar](100) NULL,
	[MotherName] [nvarchar](100) NULL,
	[MaritalStatus] [bit] NULL,
	[SpouseNaam] [nvarchar](100) NULL,
	[SpouseName] [nvarchar](100) NULL,
	[MrityuKaran] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblMrityuDartaPersonalDetails] PRIMARY KEY CLUSTERED 
(
	[NewDeathDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNabalakRelativeDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNabalakRelativeDetails](
	[NabalkRelativeInfoId] [int] IDENTITY(1,1) NOT NULL,
	[NabalakId] [int] NOT NULL,
	[BabukoNaamThar] [nvarchar](50) NOT NULL,
	[BabukoFullName] [nvarchar](50) NULL,
	[AamakoNaamThar] [nvarchar](50) NOT NULL,
	[AamakoFullName] [nvarchar](50) NULL,
	[SamrakshakNaamThar] [nvarchar](50) NULL,
	[GuardianFullName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblNabalakRelativeDetails] PRIMARY KEY CLUSTERED 
(
	[NabalkRelativeInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNabalakSifaris]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNabalakSifaris](
	[NabalakId] [int] IDENTITY(1,1) NOT NULL,
	[NabalakFaramNo] [int] NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[JanmaMiti] [nvarchar](50) NOT NULL,
	[JanmaDate] [nvarchar](50) NULL,
	[JanmaPradesh] [int] NULL,
	[JanmaJilla] [int] NULL,
	[JanmaPalika] [int] NULL,
	[JanmaWard] [int] NULL,
	[PermaPradesh] [int] NULL,
	[PermaJilla] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWard] [int] NULL,
	[Gender] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
	[WorkOffice] [int] NULL,
	[FiscalYear] [int] NULL,
 CONSTRAINT [PK_tblNabalakSifaris] PRIMARY KEY CLUSTERED 
(
	[NabalakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNagariktaRelativeDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNagariktaRelativeDetails](
	[NagariktaRelativeInfoId] [int] IDENTITY(1,1) NOT NULL,
	[NagariktaId] [int] NOT NULL,
	[BabukoNaamThar] [nvarchar](50) NOT NULL,
	[BabukoFullName] [nvarchar](50) NULL,
	[BabuNagariktaNo] [nvarchar](50) NULL,
	[BabuNagariktaIssueDate] [nvarchar](50) NULL,
	[BabuNagariktaIssueDistrict] [int] NULL,
	[AamakoNaamThar] [nvarchar](50) NOT NULL,
	[AamakoFullName] [nvarchar](50) NULL,
	[AamaNagariktaNo] [nvarchar](50) NULL,
	[AamaNagariktaIssueDate] [nvarchar](50) NULL,
	[AamaNagariktaIssueDistrict] [int] NULL,
	[PatikoNaamThar] [nvarchar](50) NULL,
	[PatikoFullName] [nvarchar](50) NULL,
	[PatiNagariktaNo] [nvarchar](50) NULL,
	[PatiNagariktaIssueDate] [nvarchar](50) NULL,
	[PatiNagariktaIssueDistrict] [int] NULL,
 CONSTRAINT [PK_tblNagariktaRelativeDetails] PRIMARY KEY CLUSTERED 
(
	[NagariktaRelativeInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNagariktaSifaris]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNagariktaSifaris](
	[NewNagariktaId] [int] IDENTITY(1,1) NOT NULL,
	[NagariktaFaramNo] [int] NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[JanmaMiti] [nvarchar](50) NOT NULL,
	[JanmaDate] [nvarchar](50) NULL,
	[JanmaPradesh] [int] NULL,
	[JanmaJilla] [int] NULL,
	[JanmaPalika] [int] NULL,
	[JanmaWard] [int] NULL,
	[PermaPradesh] [int] NULL,
	[PermaJilla] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWard] [int] NULL,
	[Gender] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
	[WorkOffice] [int] NULL,
	[FiscalYear] [int] NULL,
 CONSTRAINT [PK_tblNagariktaSifaris] PRIMARY KEY CLUSTERED 
(
	[NewNagariktaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNataPersonalDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNataPersonalDetails](
	[NataPersonId] [int] IDENTITY(1,1) NOT NULL,
	[NataId] [int] NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[RelatonTo] [int] NULL,
 CONSTRAINT [PK_tblNataPersonalDetails] PRIMARY KEY CLUSTERED 
(
	[NataPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNataPramanit]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNataPramanit](
	[NewNataId] [int] IDENTITY(1,1) NOT NULL,
	[NaamThar] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Gender] [int] NOT NULL,
	[PermaState] [int] NULL,
	[PermaDistrict] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWard] [int] NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIssueDistrict] [int] NULL,
	[NataPramanitFaramNo] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
	[WorkOffice] [int] NULL,
	[FiscalYear] [int] NULL,
 CONSTRAINT [PK_tblNataPramanit] PRIMARY KEY CLUSTERED 
(
	[NewNataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOccupation]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOccupation](
	[OcupationId] [int] IDENTITY(1,1) NOT NULL,
	[Occupation] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblOccupation] PRIMARY KEY CLUSTERED 
(
	[OcupationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPadha]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPadha](
	[PadhaId] [int] IDENTITY(1,1) NOT NULL,
	[PadhaName] [nvarchar](500) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](500) NULL,
	[ShreniId] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPadha] PRIMARY KEY CLUSTERED 
(
	[PadhaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPalika]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPalika](
	[PalikaId] [int] IDENTITY(1,1) NOT NULL,
	[PalikaId_val] [int] NOT NULL,
	[DistrictId] [int] NULL,
	[PalikaName] [nvarchar](50) NULL,
	[PalikaName-Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPalika] PRIMARY KEY CLUSTERED 
(
	[PalikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPanjika]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPanjika](
	[PanjikaId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiState] [int] NULL,
	[PanjiDistrict] [int] NULL,
	[PanjiPalika] [int] NULL,
	[PanjiWardNo] [int] NULL,
	[PanjiNaamThar] [nvarchar](100) NOT NULL,
	[PanjiFullName] [nvarchar](100) NULL,
	[Panji_INVId] [int] NOT NULL,
	[FiscalYear] [int] NULL,
	[WorkOffice] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](50) NULL,
	[FaramDartaMiti] [nvarchar](50) NOT NULL,
	[FaramDartaDate] [nvarchar](50) NULL,
	[PariwarLagatNo] [nvarchar](50) NULL,
	[SifarisType] [int] NOT NULL,
	[JanmaDartaFaramNo] [int] NULL,
	[MrityuDartaFaramNo] [int] NULL,
	[VivahDartaFaramNo] [int] NULL,
	[MigrationDartaFaramNo] [int] NULL,
	[DivorceDartaFaramNo] [int] NULL,
 CONSTRAINT [PK_tblPanjika] PRIMARY KEY CLUSTERED 
(
	[PanjikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRelation]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRelation](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[RelationName] [nvarchar](50) NULL,
	[RelationName_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRelation] PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblShakha]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShakha](
	[ShakhaId] [int] IDENTITY(1,1) NOT NULL,
	[ShakhaName] [nvarchar](100) NULL,
	[WorkOfficeId] [int] NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_tblShakha] PRIMARY KEY CLUSTERED 
(
	[ShakhaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblShreni]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShreni](
	[ShreniId] [int] IDENTITY(1,1) NOT NULL,
	[ShreniName] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](500) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](500) NULL,
	[ShreniScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_tblShreni] PRIMARY KEY CLUSTERED 
(
	[ShreniId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSifarisType]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSifarisType](
	[SifarisTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SifarisType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSifarisType] PRIMARY KEY CLUSTERED 
(
	[SifarisTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblState]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateId_val] [int] NULL,
	[StateName] [nvarchar](50) NULL,
	[StateName_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserProfile]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_tblUserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserTypes]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [nvarchar](200) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblUserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahBrideDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVivahBrideDetails](
	[NewMarriageBrideDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[NewMarriageId] [int] NOT NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[JanmaMiti] [nvarchar](50) NULL,
	[JaatJati] [nvarchar](50) NULL,
	[MaritalStatus] [bit] NULL,
	[ShikshaSthar] [int] NULL,
	[Pesha] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[PermaState] [int] NULL,
	[PermaDistrict] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWardNo] [int] NULL,
	[GaunTole] [nvarchar](50) NULL,
	[GharNo] [nvarchar](50) NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaLiyekoDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIsssueDistrict] [int] NULL,
	[PassportNo_Desh] [nvarchar](100) NULL,
	[BideshThegana] [nvarchar](100) NULL,
	[ForeignThegana] [nvarchar](100) NULL,
	[BajekoNaam] [nvarchar](100) NULL,
	[Grandfather] [nvarchar](100) NULL,
	[BabukoNaam] [nvarchar](100) NULL,
	[FatherName] [nvarchar](100) NULL,
	[AamakoNaam] [nvarchar](100) NULL,
	[MotherName] [nvarchar](100) NULL,
	[VivahGardaAge] [int] NULL,
 CONSTRAINT [PK_tblVivahBrideDetails] PRIMARY KEY CLUSTERED 
(
	[NewMarriageBrideDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahDarta]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVivahDarta](
	[NewMarriageId] [int] IDENTITY(1,1) NOT NULL,
	[PanjiId] [int] NOT NULL,
	[VivahKisim] [int] NULL,
	[VivahBhayekoMiti] [nvarchar](50) NOT NULL,
	[VivahBhayekoDate] [nvarchar](50) NULL,
	[VivahPradesh] [int] NULL,
	[VivahJilla] [int] NULL,
	[VivahPalika] [int] NULL,
	[VivahWardNo] [int] NULL,
	[VivahGaunTole] [nvarchar](50) NULL,
	[VivahGharNo] [nvarchar](50) NULL,
	[VivahBidesh] [nvarchar](100) NULL,
	[VivahForeign] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblVivahDarta] PRIMARY KEY CLUSTERED 
(
	[NewMarriageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahDartaInformant]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVivahDartaInformant](
	[NewMarriageInformantId] [int] IDENTITY(1,1) NOT NULL,
	[NewMarriageId] [int] NULL,
	[InfNaamThar] [nvarchar](50) NULL,
	[InfFullName] [nvarchar](50) NULL,
	[InfState] [int] NULL,
	[InfDistrict] [int] NULL,
	[InfPalika] [int] NULL,
	[InfWardNo] [int] NULL,
	[InfGaunTole] [nvarchar](50) NULL,
	[InfGharNo] [nvarchar](50) NULL,
	[InfNagariktaPraPaNo] [nvarchar](50) NULL,
	[InfNagariktaIssueDate] [nvarchar](50) NULL,
	[InfNagariktaIssueDistrict] [int] NULL,
	[InfPassportNo_Desh] [nvarchar](250) NULL,
	[Miti] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblVivahDartaInformant] PRIMARY KEY CLUSTERED 
(
	[NewMarriageInformantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahGroomDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVivahGroomDetails](
	[NewMarriageGroomDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[NewMarriageId] [int] NOT NULL,
	[NaamThar] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[JanmaMiti] [nvarchar](50) NULL,
	[JaatJati] [nvarchar](50) NULL,
	[MaritalStatus] [bit] NULL,
	[ShikshaSthar] [int] NULL,
	[Pesha] [int] NULL,
	[Dharma] [nvarchar](50) NULL,
	[MatriBhasa] [nvarchar](50) NULL,
	[PermaState] [int] NULL,
	[PermaDistrict] [int] NULL,
	[PermaPalika] [int] NULL,
	[PermaWardNo] [int] NULL,
	[GaunTole] [nvarchar](50) NULL,
	[GharNo] [nvarchar](50) NULL,
	[JanmaDesh] [nvarchar](50) NULL,
	[NagariktaLiyekoDesh] [nvarchar](50) NULL,
	[NagariktaPraPaNo] [nvarchar](50) NULL,
	[NagariktaIssueDate] [nvarchar](50) NULL,
	[NagariktaIsssueDistrict] [int] NULL,
	[PassportNo_Desh] [nvarchar](150) NULL,
	[BideshThegana] [nvarchar](100) NULL,
	[ForeignThegana] [nvarchar](100) NULL,
	[BajekoNaam] [nvarchar](100) NULL,
	[Grandfather] [nvarchar](100) NULL,
	[BabukoNaam] [nvarchar](100) NULL,
	[FatherName] [nvarchar](100) NULL,
	[AamakoNaam] [nvarchar](100) NULL,
	[MotherName] [nvarchar](100) NULL,
	[VivahGardaAge] [int] NULL,
 CONSTRAINT [PK_tblVivahGroomDetails] PRIMARY KEY CLUSTERED 
(
	[NewMarriageGroomDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahKisim]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVivahKisim](
	[VivahKisimId] [int] IDENTITY(1,1) NOT NULL,
	[VivahKisim] [nvarchar](50) NULL,
	[VivahKisim_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblVivahKisim] PRIMARY KEY CLUSTERED 
(
	[VivahKisimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWorkOffice]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkOffice](
	[WorkOfficeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[DistrictId] [int] NULL,
	[WorkOfficeAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblWarehouse] PRIMARY KEY CLUSTERED 
(
	[WorkOfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ward]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WardNo] [bigint] NULL,
	[LocalLevelId] [bigint] NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardDetails]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WardId] [bigint] NULL,
	[Area] [nvarchar](50) NULL,
	[Density] [nvarchar](50) NULL,
	[Popullation] [nvarchar](50) NULL,
 CONSTRAINT [PK_WardDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Year]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Year](
	[YearId] [int] IDENTITY(1,1) NOT NULL,
	[YearName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202004100955245_InitialCreate', N'SIFARIS.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7EC0FD07419F7A87D4CACBED622FB05BA44ED2336EF38275B6E8B7052DD18EB012A54A549AE0D05FD60FFD49FD0B379428597CD38BADD84EB1C0222287CF0C874372381CFACFDFFF187FFF1C06D6134E523F2213FB64746C5B98B891E793D5C4CEE8F2DB0FF6F7DFFDFD6FE32B2F7CB67E2AE9CE181DB424E9C47EA4343E779CD47DC4214A47A1EF26511A2DE9C88D42077991737A7CFC6FE7E4C4C100610396658D3F6584FA21CE3FE0731A1117C73443C14DE4E120E5E55033CF51AD5B14E234462E9ED8F3D9F5C5A7D97C5450DAD645E02390628E83A56D2142228A28C878FE39C5739A4464358FA100050F2F3106BA250A52CC653F5F9377EDC6F129EB86B36E5842B9594AA3B027E0C919D78B2337DF48BB76A537D0DC156898BEB05EE7DA9BD8330FE7459FA2001420333C9F0609239ED837158B8B34BEC57454361C1590D709C0FD1A255F4775C423AB73BBA3CA8E4E47C7ECDF9135CD029A257842704613141C59F7D922F0DDFFE29787E82B2693B393C5F2ECC3BBF7C83B7BFF2F7CF6AEDE53E82BD0090550749F44314E4036BCACFA6F5B8ED8CE911B56CD6A6D0AAD802DC194B0AD1BF4FC1193157D84C972FAC1B6AEFD67EC9525DCB83E131F661034A249069FB75910A04580AB7AA79127FBBF81EBE9BBF78370BD454FFE2A1F7A893F4C9C04E6D5271CE4B5E9A31F17D34B18EF2F9CEC3A8942F62DDA5751FB651E6589CB3A1319491E50B2C254946EECAC8DB7934933A8E1CDBA443D7CD36692AAE6AD25651DDA6426942C763D1B4A795F976F678BBB886318BCDCB498469A0C4EDCA84652CB238BD7AF4DE6A4ABC910E8CA5F7905BC0A911F0CB00476E0029EC7D24F425CF5F287080C0E91DE32DFA3348515C0FB0F4A1F1B44873F07107D8EDD2C01C39C5314C6AFCEEDFE3122F8360B17CCDE77C76BB0A179F835BA462E8D922BC25A6D8DF73172BF4619BD22DE25A2F833754B40F6F9E087DD010611E7C275719A5E8331636F1A81635D02CE083D3BED0DC716A77DBB20D300F9A1DE079196D12F25E9DA0FD15328BE88814CE78F3489FA315AF9A49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCC3CB476878172F873D7C1F6FBBCDDBB416D4D438871512FF88094E6019F3EE11A53821EB11E8B26EECC359C8878F317DF5BD29E7F4130AB2A1596D341BF24560F8D990C31EFE6CC8C584E227DF635E4987834F490CF09DE8F567AAF6392749B6EBE9207473D7CC77B30698A6CB459A46AE9FCF024DC88B072C44F9C187B3DAA317456FE40808740C0CDD675B1E9440DF6CD9A8EEC8250E30C5D6855B8404A7287591A7AA113AE4F510ACDC513582AD2321A270FF547882A5E3843542EC1094C24CF50955A7854F5C3F4641AB96A4961DB730D6F78A875C7389634C18C3564D7461AE0F7C30012A3ED2A0B46968ECD42CAED9100D5EAB69CCDB5CD8F5B82BF1889DD8648BEF6CB04BEEBFBD8A61366B6C07C6D9AC922E02188378FB30507E56E96A00F2C1E5D00C543A31190C94BB543B315051637B305051256FCE408B236AD7F197CEAB87669EE24179F7DB7AA3BAF6609B823E0ECC340BDF13DA50688113D53C2F17AC123F53CDE10CE4E4E7B394BBBAB28930F039A662C866EDEF6AFD50A7194436A226C0B5A1B580F2EB3F054899503D842B63798DD2712FA2076C19776B84E56BBF045BB30115BB7E0D5A23345F96CAC6D9E9F451F5ACB206C5C83B1D166A381A8390172FB1E31D94628ACBAA8AE9E20BF7F1866B1DE383D1A0A016CFD5A0A4B233836BA934CD762DE91CB23E2ED9565A92DC278396CACE0CAE256EA3ED4AD238053DDC82AD54246EE1034DB632D251ED3655DDD82932A378C1D831A4508D6F501CFB64554BA9E225D6BCC8A79A7E3BEF9F6C1416188E9B6A728E2A692B4E344AD00A4BB5C01A24BDF693945E228A1688C579A65EA89069F756C3F25FB2AC6F9FEA2096FB4049CDFEE637ABE2A5BDB0CFAA8E086F7F0DBD0B99379387D03563AF6F6EB1F43614A04413B59F46411612B373656E5DDCDDD5DB17252AC2D891E4579C2745538A8B2BAABDD3A0A813628001AAFC96CD07C90C615275E975D6956DF244CD286560AA8E620A56ED6DD04C0E4CE78192FDC2FEE3D48AF03AF38927A3D40178514F8C5A3E830256ABEB8E2AA69CD431C59AEE88525E491D52AAEA21653D7B4410B25EB1119E41A37A8AEE1CD47C913ABA5ADB1D5993395287D6546F80AD9159AEEB8EAA492EA9036BAABB63AF334DE405F480772CE36965A32DAB38CC6EB76719305E67351C66CBABDDD9D7816AC53DB1F8ADBC02C6CB0FD2928C27BA8D2CA9885F6C6749060CF38A23DC748B0B4EE3F5BC1953B8BE1616F5A6EB7B335E3F7B7D55AB500E733249C5BD3AD44987B7313F48B53F92514E5605896D956A045B7A49290E478C6034FF2598063E66CB7749708388BFC4292D5236ECD3E39353E9ADCDE1BC7B71D2D40B340751D3E31771CC76907D459E50E23EA244CD85D8E26DC81A540933CF88879F27F6FFF256E779C482FD95171F59B3F433F17FC9A0E221C9B0F59B9ADB394CAE7CF3C1EA405F3674D7EAECE72F45D323EB2E8119736E1D4BBADC6484C5F70EBDA4299A6E21CDC6AF20DEEE84129E1A6851A509B1F9CB82854F077955504AF94D889EFFD15734EDCB81AD1035AF0386C21B4485A6ECFF4DB08C99FF1E7CD23CF3BF5F67F52F013611CDF80AC027FDC1E43700DD97A1B2E51EB71ACD7968174B52AEE7D61CEAAD122AF7BD3729A9D65B4D74359DBA07DC1629D31B58C61BCB361E6C77D424130F86BD4FD37EF50CE243491A5EA773EC37577897E9C10D57417FA9ACE003C863D3E4E5EC3FF777D7B6668AE11E780265BF0CDF0333369EADB5FF3CDE5D1B9B29CC7BE0C6D62B5BF7C06C6D5FFBE79E2DADF316BAF7DC5B358DC87017A38B05B7E5D616817338E12F223082C2A32C9E44EA93B99A12515B18AE49CC4CCD5964326365E2287C158A66B6FDFACA37FCC6CE729A66B686DCCB26DE7CFD6FE4CD699A791B321AF79115ACCD29D4656AB7AC634D894F6F290B58E8494BD2799BCFDA78B1FE96927E07518A307B0C77C46F27C77710950C39757AE4F4AAD7BDB077D67E3911F6EFD45FAD21D8EF2812EC0ABB66453323CBA8DCBC25894A122942738329F2604BBD48A8BF442E856A1663CEDF74E7713B76D3B1C0DE8CDC6534CE287419878B4008783127A0897F9EB82CCA3CBE8BF39F2719A20B20A6CF62F377E487CC0FBC4AEE6B4D4CC800C1BC0B1ED1656349596477F55221DD46A42310575FE5143DE0300E002CBD2373F48437910DCCEF235E21F7651D013481B40F84A8F6F1A58F56090A538EB16E0F9F60C35EF8FCDDFF01A4DD7E3340540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5497264f-c3f2-499d-afa6-89ca357bb629', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f5824353-6378-482e-8a47-bdbd16635974', N'SuperAdmin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'74010187-04f0-4ff2-a3d1-879feb381a90', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7833b872-58b6-4c0e-b814-9bc36da0f99f', N'74010187-04f0-4ff2-a3d1-879feb381a90')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'09446cf0-ea9b-4ded-9cea-459255629e66', N'f5824353-6378-482e-8a47-bdbd16635974')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5648270f-05b8-4aa5-a809-e922afb3a9b8', N'f5824353-6378-482e-8a47-bdbd16635974')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'03911f4b-d467-427c-bfbf-9570aa63e8a3', N'Alok@gmail.com', 0, N'AFITyvQutfFcWgsaxbS4kqNcySiavJRrnExlluOJKcBn6xvgCC5hQ9qZP94iPwoW4Q==', N'7fb886d6-fe79-41d9-b297-ce317106fdf6', NULL, 0, 0, NULL, 0, 0, N'Alok@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'09446cf0-ea9b-4ded-9cea-459255629e66', N'superadmin@gmail.com', 0, N'AG1d+9DY9yRMwWBNzsF6S9Lgyk56/3xN4NSLnEm5Cu6cMBUXEioX6Cct/CwRIhIGiQ==', N'bd3ed753-7f96-4b40-a2a7-3453208a9be5', NULL, 0, 0, NULL, 0, 0, N'superadmin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5648270f-05b8-4aa5-a809-e922afb3a9b8', N'osn@gmail.com', 0, N'AEYqHv9s78DCPEaFwFI8+Qa0U/6WJn7muGdSYQNYT6SO2Z2LaKzQ1rsYUdUl705r0A==', N'bbc6984f-842e-4708-a616-1e1a842130e8', NULL, 0, 0, NULL, 0, 0, N'osn@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7833b872-58b6-4c0e-b814-9bc36da0f99f', N'amanlal@gmail.com', 0, N'AA4mJ5EupvIG8iC2hFNB9Oq3FAz7th0k10yUuJrVemqFPM7NqOjRIZWJFl8QpMFVDw==', N'564d16a3-5738-4bcb-8292-2ef6b16d9134', NULL, 0, 0, NULL, 0, 0, N'amanlal@gmail.com')
SET IDENTITY_INSERT [dbo].[Citizen_GharJagga_Info] ON 

INSERT [dbo].[Citizen_GharJagga_Info] ([Citizen_gharjaga_Id], [Citizen_Id], [NumberOfHouse], [Area], [Kitta_No], [East], [West], [North], [South]) VALUES (1, 2006, 2312, N'३१२३१५ ', N'२३१२३१५ ', N'sa', N'as', N'sd', N'ds')
INSERT [dbo].[Citizen_GharJagga_Info] ([Citizen_gharjaga_Id], [Citizen_Id], [NumberOfHouse], [Area], [Kitta_No], [East], [West], [North], [South]) VALUES (2, 2007, 21, N'७२-१२', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Citizen_GharJagga_Info] ([Citizen_gharjaga_Id], [Citizen_Id], [NumberOfHouse], [Area], [Kitta_No], [East], [West], [North], [South]) VALUES (3, 2008, 8, N'३१२३१५ ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Citizen_GharJagga_Info] ([Citizen_gharjaga_Id], [Citizen_Id], [NumberOfHouse], [Area], [Kitta_No], [East], [West], [North], [South]) VALUES (4, 2009, 1, N'2321', N'2', N'31', N'31', N'2312', N'2')
SET IDENTITY_INSERT [dbo].[Citizen_GharJagga_Info] OFF
SET IDENTITY_INSERT [dbo].[Citizen_Info] ON 

INSERT [dbo].[Citizen_Info] ([Id], [DeparmentId], [CitizenName], [Citizen_id], [Citizenship_No], [Address], [District_Id], [Zone_Id], [Mun_Ward], [Sabik_Ward], [Father_Husband_Name], [GrandFatherName], [CitizenShip_Date], [CitizinShip_Zone], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updatedate], [UpdatedBy]) VALUES (2006, NULL, N'राजेश नेपला ', NULL, N'१ २३१२३१५ ', N' काठमाडौँ ', 2, 1, 3, 3, N'रमेश नेपला ', N'बागमती ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Citizen_Info] ([Id], [DeparmentId], [CitizenName], [Citizen_id], [Citizenship_No], [Address], [District_Id], [Zone_Id], [Mun_Ward], [Sabik_Ward], [Father_Husband_Name], [GrandFatherName], [CitizenShip_Date], [CitizinShip_Zone], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updatedate], [UpdatedBy]) VALUES (2007, NULL, N'आलोक नाथ ', NULL, N'७१-१२-१२', N'भारत ', 18, 2, 4, 4, N'लोक नाथ ', N'उतारखण्ड', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Citizen_Info] ([Id], [DeparmentId], [CitizenName], [Citizen_id], [Citizenship_No], [Address], [District_Id], [Zone_Id], [Mun_Ward], [Sabik_Ward], [Father_Husband_Name], [GrandFatherName], [CitizenShip_Date], [CitizinShip_Zone], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updatedate], [UpdatedBy]) VALUES (2008, NULL, N'जेवन पौडेल ', NULL, N'12412', N'भारत ', 18, 3, 2, 3, N'आलोक नाथ ', N'तारखण्ड ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Citizen_Info] ([Id], [DeparmentId], [CitizenName], [Citizen_id], [Citizenship_No], [Address], [District_Id], [Zone_Id], [Mun_Ward], [Sabik_Ward], [Father_Husband_Name], [GrandFatherName], [CitizenShip_Date], [CitizinShip_Zone], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updatedate], [UpdatedBy]) VALUES (2009, NULL, N'el', NULL, N'2-12231-12', N'kathmande', 2, 1, 2, 2, N'ram prakash', N'2012-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Citizen_Info] OFF
SET IDENTITY_INSERT [dbo].[Demolition] ON 

INSERT [dbo].[Demolition] ([id], [Type], [Name], [Address], [Phone], [Reason], [SuchakName], [Relation], [SuchakPhone], [Date], [DateAd], [PrindDate], [PrintDateAd], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updateddate], [updatedBy], [Status]) VALUES (1, N'मन्दिर ', N'Neraj', N'nepal', N'2123100021', N'SADQW', N'HARI', N'SDAISDBA', N'213123SDAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Demolition] ([id], [Type], [Name], [Address], [Phone], [Reason], [SuchakName], [Relation], [SuchakPhone], [Date], [DateAd], [PrindDate], [PrintDateAd], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updateddate], [updatedBy], [Status]) VALUES (2, N'भवन', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Demolition] ([id], [Type], [Name], [Address], [Phone], [Reason], [SuchakName], [Relation], [SuchakPhone], [Date], [DateAd], [PrindDate], [PrintDateAd], [CreatedBy], [CreatedDate], [DeletedDate], [DeletedBy], [Updateddate], [updatedBy], [Status]) VALUES (3, N'भवन', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Demolition] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DeparmentId], [DepartmentName], [DepartmentAddress], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [DeletedBy], [UpdatedDate], [DeletedDate]) VALUES (1, N'सडक विभाग', N'Nepal', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([DeparmentId], [DepartmentName], [DepartmentAddress], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [DeletedBy], [UpdatedDate], [DeletedDate]) VALUES (2, N'अध्यागमन विभाग', N'Nepal', N'123s', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([DeparmentId], [DepartmentName], [DepartmentAddress], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [DeletedBy], [UpdatedDate], [DeletedDate]) VALUES (3, N'शिक्षा विभाग', N'bhaktapur', N'sd112', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (1, N'ताप्लेजुङ', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (2, N'पाँचथर', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (3, N'ईलाम', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (4, N'झापा', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (5, N'स‌ंखुवासभा', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (6, N'तेह्रथुम', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (7, N'भोजपुर', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (8, N'धनकुटा', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (9, N'मोरङ', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (10, N'सुनसरी', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (11, N'सोलुखुम्बु', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (12, N'खोटाङ', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (13, N'ओखलढुङ्गा', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (14, N'उदयपुर', 1)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (15, N'सप्तरी', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (16, N'सिराहा', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (17, N'दोलखा', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (18, N'रामेछाप', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (19, N'सिन्धुली', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (20, N'धनुषा', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (21, N'महोत्तरी', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (22, N'सर्लाही', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (23, N'रसुवा', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (24, N'धादिङ', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (25, N'नुवाकोट', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (26, N'काठमाण्डौ', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (27, N'भक्तपुर', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (28, N'ललितपुर', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (29, N'काभ्रेपलान्चोक', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (30, N'सिन्धुपाल्चोक', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (31, N'मकवानपुर', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (32, N'रौतहट', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (33, N'बारा', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (34, N'पर्सा', 2)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (35, N'चितवन', 3)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (36, N'गोरखा', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (37, N'मनाङ', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (38, N'लम्जुङ्ग', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (39, N'कास्की', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (40, N'तनहुँ', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (41, N'स्याङ्जा', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (42, N'गुल्मी', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (43, N'पाल्पा', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (44, N'अर्घाखाँची', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (45, N'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (46, N'रुपन्देही', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (47, N'कपिलवस्तु', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (48, N'मुस्ताङ्ग', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (49, N'म्याग्दी', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (50, N'बाग्लुङ', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (51, N'पर्वत', 4)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (52, N'रुकुम (पश्चिम भाग)', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (53, N'रोल्पा', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (54, N'प्युठान', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (55, N'सल्यान', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (56, N'दाङ', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (57, N'डोल्पा', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (58, N'मुगु', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (59, N'जुम्ला', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (60, N'कालिकोट', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (61, N'हुम्ला', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (62, N'जाजरकोट', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (63, N'दैलेख', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (64, N'सुर्खेत', 6)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (65, N'बाँके', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (66, N'बर्दिया', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (67, N'बाजुरा', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (68, N'अछाम', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (69, N'बझाङ्ग', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (70, N'डोटी', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (71, N'कैलाली', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (72, N'दार्चुला', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (73, N'बैतडी', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (74, N'डडेलधुरा', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (75, N'कन्चनपुर', 7)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (76, N'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 5)
INSERT [dbo].[District] ([Id], [Name], [StateId]) VALUES (77, N'रुकुम (पूर्व भाग)', 5)
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[DistrictDetails] ON 

INSERT [dbo].[DistrictDetails] ([Id], [DistId], [HeadQuater], [PDensity], [Population], [Area], [Website]) VALUES (5, 1, N'aa', N'bb', N'jk', N'hjk', N'hjk')
SET IDENTITY_INSERT [dbo].[DistrictDetails] OFF
SET IDENTITY_INSERT [dbo].[fiscal_year] ON 

INSERT [dbo].[fiscal_year] ([FiscalId], [Nanem], [StartDate], [StartDateAd], [EndDate], [EndDateAd], [PreviousYear], [CreatedDate], [DeletedDate], [UpdatedDate], [UpdatteBy], [DeletedBy], [CreatedBy]) VALUES (1, N'२०७१-१२-१२', N'२०७१-१२-१२', CAST(N'2012-12-12' AS Date), N'२०७२-१२-१२', CAST(N'2012-12-11' AS Date), 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fiscal_year] OFF
SET IDENTITY_INSERT [dbo].[gharBato] ON 

INSERT [dbo].[gharBato] ([id], [munOrvdcName], [Ward], [Map_no], [KittaNo], [buyerName], [buyerFatherName], [SellerName], [SellerFatherName], [Date], [DateAd], [PrintDate], [PrintDateAd], [CreatedDate], [DeletedDate], [Updatedate], [updatedBy], [DeletedBy], [CreatedBy]) VALUES (1, N'a1', 121, NULL, N'QWE', N'DASD', N'DASD', N'ASDAS', N'ASD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[gharBato] OFF
SET IDENTITY_INSERT [dbo].[GharJaggaKar] ON 

INSERT [dbo].[GharJaggaKar] ([id], [ward], [gharNo], [kittaNo], [Address], [Area], [BuildDate], [Length], [breadth], [Height], [GharDesigin], [Road], [roadType], [NibedakName], [NibedakAddress], [phone], [marphatName], [Date], [dateAd], [PrintDate], [printDateAd], [CreatedDae], [deltedDate], [updatedate], [updateBy], [createby], [deletedby]) VALUES (1, 5, N'१ २', N'१४१२३१ ', N'नेपाल काठमाडौँ ', N'२३१ ', N'२०७२-१२-१२', N'६७५ ', N'७५ ', N'७', N'पशुपालन, भण्डार, शीत भण्डा', N' घर बहालमा दिन', N'गोदाम, पशुपालन, भण्डार, शीत', N'राम प्रकाशक', N'जानकी माया बिस्त  ', N'४१२३१ ४१२३१ ', N'प्रकाशक', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GharJaggaKar] OFF
SET IDENTITY_INSERT [dbo].[GharjaggakarFiles] ON 

INSERT [dbo].[GharjaggakarFiles] ([id], [GhraJaggaKarId], [FileName], [FilePath], [Status]) VALUES (1019, 1, N'UpdateonliveSakchyamMis.docx', N'D:\Projects\Sifarish\shifarish\SIFARIS\Image\132334070434619096UpdateonliveSakchyamMis.docx', NULL)
INSERT [dbo].[GharjaggakarFiles] ([id], [GhraJaggaKarId], [FileName], [FilePath], [Status]) VALUES (1020, 1, N'Developmentcontracth.pdf', N'D:\Projects\Sifarish\shifarish\SIFARIS\Image\132334070675694190Developmentcontracth.pdf', NULL)
SET IDENTITY_INSERT [dbo].[GharjaggakarFiles] OFF
SET IDENTITY_INSERT [dbo].[JaagaTarfa] ON 

INSERT [dbo].[JaagaTarfa] ([jagaTarfa_id], [MulSadak], [sahayakSadaK], [KacchiSadak], [Goreto], [BatoNavaeko], [CitizenId]) VALUES (1, N'सडक', NULL, NULL, NULL, NULL, 2006)
INSERT [dbo].[JaagaTarfa] ([jagaTarfa_id], [MulSadak], [sahayakSadaK], [KacchiSadak], [Goreto], [BatoNavaeko], [CitizenId]) VALUES (2, N'उतारखण्ड सडक', NULL, NULL, NULL, NULL, 2007)
INSERT [dbo].[JaagaTarfa] ([jagaTarfa_id], [MulSadak], [sahayakSadaK], [KacchiSadak], [Goreto], [BatoNavaeko], [CitizenId]) VALUES (3, N'सडक', NULL, NULL, NULL, NULL, 2008)
INSERT [dbo].[JaagaTarfa] ([jagaTarfa_id], [MulSadak], [sahayakSadaK], [KacchiSadak], [Goreto], [BatoNavaeko], [CitizenId]) VALUES (4, N'123', N'123', N'123', N'12', N'123', 2009)
SET IDENTITY_INSERT [dbo].[JaagaTarfa] OFF
SET IDENTITY_INSERT [dbo].[Karlayatarfa] ON 

INSERT [dbo].[Karlayatarfa] ([Karlayatarfa_id], [Name], [Address], [Date], [KardartaFullName], [citizen_ID]) VALUES (1, NULL, N'हरि राना ', N'२०७१-१२-१२', N'40', 2006)
INSERT [dbo].[Karlayatarfa] ([Karlayatarfa_id], [Name], [Address], [Date], [KardartaFullName], [citizen_ID]) VALUES (2, NULL, NULL, NULL, N'आलो आलो', 2007)
INSERT [dbo].[Karlayatarfa] ([Karlayatarfa_id], [Name], [Address], [Date], [KardartaFullName], [citizen_ID]) VALUES (3, NULL, NULL, NULL, N'आलोक नाथ ', 2008)
INSERT [dbo].[Karlayatarfa] ([Karlayatarfa_id], [Name], [Address], [Date], [KardartaFullName], [citizen_ID]) VALUES (4, NULL, N'r', N'asd', N'ra', 2009)
SET IDENTITY_INSERT [dbo].[Karlayatarfa] OFF
SET IDENTITY_INSERT [dbo].[LocalLevel] ON 

INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (1, N'आठराई त्रिवेणी गाउँपालिका', NULL, 1, 11)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (2, N'पाथीभरा याङवरक गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (3, N'फक्त्ताङलुङ गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (4, N'फुङलिङ नगरपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (5, N'मेरिङदेन गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (6, N'मैवाखोला गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (7, N'मिक्वाखोला गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (8, N'सिदिङ्वा गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (9, N'सिरीजङ्घा गाउँपालिका', N'', 1, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (10, N'कुम्मायक गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (11, N'तुम्वेवा गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (12, N'फाल्गुनन्द गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (13, N'फालेलुङ गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (14, N'फिदिम नगरपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (15, N'मिक्लाजुङ गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (16, N'याङवरक गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (17, N'हिलिहाङ गाउँपालिका', N'', 2, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (18, N'ईलाम नगरपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (19, N'चुलाचुली गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (20, N'देउमाई नगरपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (21, N'फाकफोकथुम गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (22, N'माई नगरपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (23, N'माईजोगमाई गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (24, N'माङसेबुङ गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (25, N'रोङ गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (26, N'सन्दकपुर गाउँपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (27, N'सूर्योदय नगरपालिका', N'', 3, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (28, N'अर्जुनधारा नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (29, N'कचनकवल गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (30, N'कनकाई नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (31, N'कमल गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (32, N'गौरादह नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (33, N'गौरिगंज गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (34, N'झापा गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (35, N'दमक नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (36, N'बुद्धशान्ति गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (37, N'बाह्रदशी गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (38, N'बिर्तामोड नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (39, N'भद्रपुर नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (40, N'मेचीनगर नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (41, N'शिवसताक्षी नगरपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (42, N'हल्दीबारी गाउँपालिका', N'', 4, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (43, N'खाँदवारी नगरपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (44, N'चैनपुर नगरपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (45, N'चिचिला गाउँपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (46, N'धर्मदेवी नगरपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (47, N'पाँचखपन नगरपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (48, N'भोटखोला गाउँपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (49, N'मकालु गाउँपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (50, N'मादी नगरपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (51, N'सभापोखरी गाउँपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (52, N'सिलीचोङ गाउँपालिका', N'', 5, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (53, N'आठराई गाउँपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (54, N'छथर गाउँपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (55, N'फेदाप गाउँपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (56, N'मेन्छयायेम गाउँपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (57, N'म्याङलुङ नगरपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (58, N'लालीगुराँस नगरपालिका', N'', 6, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (59, N'अरुण गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (60, N'आमचोक गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (61, N'टेम्केमैयुङ गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (62, N'पौवादुङमा गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (63, N'भोजपुर नगरपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (64, N'रामप्रसादराई गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (65, N'षडानन्द नगरपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (66, N'साल्पासिलिछो गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (67, N'हतुवागढी गाउँपालिका', N'', 7, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (68, N'चौबिसे गाउँपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (69, N'छथर जोरपाटी गाउँपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (70, N'धनकुटा नगरपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (71, N'पाख्रिवास नगरपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (72, N'महालक्ष्मी नगरपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (73, N'सहिदभूमि गाउँपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (74, N'साँगुरीगढी गाउँपालिका', N'', 8, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (75, N'उर्लाबारी नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (76, N'कटहरी गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (77, N'केराबारी गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (78, N'कानेपोखरी गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (79, N'ग्रामथान गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (80, N'जहदा गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (81, N'धनपालथान गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (82, N'पथरी शनिश्चरे नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (83, N'बुढीगंगा गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (84, N'बेलवारी नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (85, N'मिक्लाजुङ गाउँपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (86, N'रंगेली नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (87, N'रतुवामाई नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (88, N'लेटाङ नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (89, N'विराटनगर महानगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (90, N'सुन्दरहरैंचा नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (91, N'सुनवर्षी नगरपालिका', N'', 9, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (92, N'ईटहरी उप महानगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (93, N'ईनरूवा नगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (94, N'कोशी गाउँपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (95, N'गढी गाउँपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (96, N'देवानगञ्ज गाउँपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (97, N'दुहवी नगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (98, N'धरान उप महानगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (99, N'बर्जु गाउँपालिका', N'', 10, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (100, N'बराहक्षेत्र नगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (101, N'भोक्राहा नरसिंह गाउँपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (102, N'रामधुनी नगरपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (103, N'हरिनगर गाउँपालिका', N'', 10, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (104, N'खुम्बु पासाङल्हामु गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (105, N'थुलुङ दुधकोशी गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (106, N'नेचासल्यान गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (107, N'महाकुलुङ गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (108, N'माप्य दुधकोशी गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (109, N'लिखु पिके गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (110, N'सोताङ गाउँपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (111, N'सोलुदुधकुण्ड नगरपालिका', N'', 11, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (112, N'ऐसेलुखर्क गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (113, N'केपिलासगढी गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (114, N'खोटेहाङ गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (115, N'जन्तेढुङ्गा गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (116, N'दिक्तेल रुपाकोट मझुवागढी नगरपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (117, N'दिप्रुङ चुइचुम्मा गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (118, N'बराहपोखरी गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (119, N'रावा बेसी गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (120, N'साकेला गाउँपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (121, N'हलेसीतुवाचुङ नगरपालिका', N'', 12, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (122, N'खिजीदेम्वा गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (123, N'चम्पादेवी गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (124, N'चिशंखुगढी गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (125, N'मानेभञ्ज्याङ गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (126, N'मोलुङ गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (127, N'लिखु गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (128, N'सुनकोशी गाउँपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (129, N'सिद्धिचरण नगरपालिका', N'', 13, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (130, N'उदयपुरगढी गाउँपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (131, N'कटारी नगरपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (132, N'चौदण्डीगढी नगरपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (133, N'त्रियुगा नगरपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (134, N'ताप्ली गाउँपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (135, N'रौतामाई गाउँपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (136, N'लिम्चुङ्बुङ गाउँपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (137, N'वेलका नगरपालिका', N'', 14, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (138, N'अग्निसाइर कृष्णासवरन गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (139, N'कञ्चनरुप नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (140, N'खडक नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (141, N'छिन्नमस्ता गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (142, N'डाक्नेश्वरी नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (143, N'तिरहुत गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (144, N'तिलाठी कोईलाडी गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (145, N'बलान-विहुल गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (146, N'बिष्णुपुर गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (147, N'बोदेबरसाइन नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (148, N'महादेवा गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (149, N'रुपनी गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (150, N'राजगढ गाउँपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (151, N'राजबिराज नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (152, N'शम्भुनाथ नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (153, N'सप्तकोशी नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (154, N'सुरुङ्गा नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (155, N'हनुमाननगर कंकालिनी नगरपालिका', N'', 15, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (156, N'अर्नमा गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (157, N'औरही गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (158, N'कर्जन्हा नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (159, N'कल्याणपुर नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (160, N'गोलबजार नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (161, N'धनगढीमाई नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (162, N'नरहा गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (163, N'नवराजपुर गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (164, N'बरियारपट्टी गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (165, N'बिष्णुपुर गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (166, N'भगवानपुर गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (167, N'मिर्चैया नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (168, N'लक्ष्मीपुर पतारी गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (169, N'लहान नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (170, N'सखुवानान्कारकट्टी गाउँपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (171, N'सुखीपुर नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (172, N'सिरहा नगरपालिका', N'', 16, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (173, N'कालिन्चोक गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (174, N'गौरिशंकर गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (175, N'जिरी नगरपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (176, N'तामाकोशी गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (177, N'भिमेश्वर नगरपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (178, N'मेलुङ गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (179, N'वैतेश्वर गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (180, N'विगु गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (181, N'शैलुङ गाउँपालिका', N'', 17, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (182, N'उमाकुण्ड गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (183, N'खाँडादेवी गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (184, N'गोकुलगङ्गा गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (185, N'दोरम्बा गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (186, N'मन्थली नगरपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (187, N'रामेछाप नगरपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (188, N'लिखु तामाकोशी गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (189, N'सुनापती गाउँपालिका', N'', 18, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (190, N'कमलामाई नगरपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (191, N'गोलन्जोर गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (192, N'घ्याङलेख गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (193, N'तीनपाटन गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (194, N'दुधौली नगरपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (195, N'फिक्कल गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (196, N'मरिण गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (197, N'सुनकोशी गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (198, N'हरिहरपुरगढी गाउँपालिका', N'', 19, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (199, N'औरहि गाउँपालिका', N'', 20, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (200, N'कमला नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (201, N'क्षिरेश्वरनाथ नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (202, N'गणेशमान चारनाथ नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (203, N'जनकनन्दिनी गाउँपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (204, N'जनकपुर उप महानगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (205, N'धनुषाधाम नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (206, N'धनौजी गाउँपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (207, N'नगराइन नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (208, N'बटेश्वर गाउँपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (209, N'मुखियापट्टी मुसहरमिया गाउँपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (210, N'मिथिला नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (211, N'मिथिला बिहारी नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (212, N'लक्ष्मिनिया गाउँपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (213, N'विदेह नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (214, N'शहिदनगर नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (215, N'सबैला नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (216, N'हंसपुर नगरपालिका', N'', 20, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (217, N'एकडारा गाउँपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (218, N'औरही नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (219, N'गौशाला नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (220, N'जलेश्वर नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (221, N'पिपरा गाउँपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (222, N'बर्दिबास नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (223, N'बलवा नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (224, N'भँगाहा नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (225, N'मटिहानी नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (226, N'मनराशिस्वा नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (227, N'महोत्तरी गाउँपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (228, N'रामगोपालपुर नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (229, N'लोहरपट्टी नगरपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (230, N'साम्सी गाउँपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (231, N'सोनमा गाउँपालिका', N'', 21, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (232, N'ईश्वरपुर नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (233, N'कविलासी नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (234, N'कौडेना गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (235, N'गोडैटा नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (236, N'चक्रघट्टा गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (237, N'चन्द्रनगर गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (238, N'धनकौल गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (239, N'पर्सा गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (240, N'ब्रम्हापुरी गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (241, N'बरहथवा नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (242, N'बलरा नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (243, N'बसबरिया गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (244, N'बागमती नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (245, N'मलंगवा नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (246, N'रामनगर गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (247, N'लालबन्दी नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (248, N'विष्णु गाउँपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (249, N'हरिपुर नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (250, N'हरिपुर्वा नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (251, N'हरिवन नगरपालिका', N'', 22, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (252, N'आमाछोदिङमो गाउँपालिका', N'', 23, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (253, N'उत्तरगया गाउँपालिका', N'', 23, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (254, N'कालिका गाउँपालिका', N'', 23, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (255, N'गोसाईकुण्ड गाउँपालिका', N'', 23, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (256, N'नौकुण्ड गाउँपालिका', N'', 23, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (257, N'खनियाबास गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (258, N'गङ्गाजमुना गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (259, N'गजुरी गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (260, N'गल्छी गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (261, N'ज्वालामूखी गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (262, N'त्रिपुरासुन्दरी गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (263, N'थाक्रे गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (264, N'धुनीबेंशी नगरपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (265, N'नेत्रावती डबजोङ गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (266, N'नीलकण्ठ नगरपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (267, N'बेनीघाट रोराङ्ग गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (268, N'रुवी भ्याली गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (269, N'सिद्धलेक गाउँपालिका', N'', 24, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (270, N'ककनी गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (271, N'किस्पाङ गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (272, N'तादी गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (273, N'तारकेश्वर गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (274, N'दुप्चेश्वर गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (275, N'पञ्चकन्या गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (276, N'बेलकोटगढी नगरपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (277, N'म्यगङ गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (278, N'लिखु गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (279, N'विदुर नगरपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (280, N'शिवपुरी गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (281, N'सूर्यगढी गाउँपालिका', N'', 25, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (282, N'कागेश्वरी मनोहरा नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (283, N'काठमाडौँ महानगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (284, N'कीर्तिपुर नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (285, N'गोकर्णेश्वर नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (286, N'चन्द्रागिरी नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (287, N'टोखा नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (288, N'तारकेश्वर नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (289, N'दक्षिणकाली नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (290, N'नागार्जुन नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (291, N'बुढानिलकण्ठ नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (292, N'शङ्खरापुर नगरपालिका', N'', 26, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (293, N'चाँगुनारायण नगरपालिका', N'', 27, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (294, N'भक्तपुर नगरपालिका', N'', 27, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (295, N'मध्यपुर थिमि नगरपालिका', N'', 27, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (296, N'सूर्यविनायक नगरपालिका', N'', 27, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (297, N'कोन्ज्योसोम गाउँपालिका', N'', 28, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (298, N'गोदावरी नगरपालिका', N'', 28, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (299, N'महाङ्काल गाउँपालिका', N'', 28, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (300, N'महालक्ष्मी नगरपालिका', N'', 28, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (301, N'ललितपुर महानगरपालिका', N'', 28, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (302, N'वाग्मती गाउँपालिका', N'', 28, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (303, N'खानीखोला गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (304, N'चौंरीदेउराली गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (305, N'तेमाल गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (306, N'धुलिखेल नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (307, N'नमोबुद्ध नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (308, N'पनौती नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (309, N'पाँचखाल नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (310, N'बेथानचोक गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (311, N'बनेपा नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (312, N'भुम्लु गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (313, N'मण्डनदेउपुर नगरपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (314, N'महाभारत गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (315, N'रोशी गाउँपालिका', N'', 29, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (316, N'इन्द्रावती गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (317, N'चौतारा साँगाचोकगढी नगरपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (318, N'जुगल गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (319, N'त्रिपुरासन्दरी गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (320, N'पाँचपोखरी थाङपाल गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (321, N'बलेफी गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (322, N'भोटेकोशी गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (323, N'मेलम्ची नगरपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (324, N'लिसंखु पाखर गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (325, N'वाह्रविसे नगरपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (326, N'सुनकोशी गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (327, N'हेलम्बु गाउँपालिका', N'', 30, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (328, N'इन्द्रसरोवर गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (329, N'कैलाश गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (330, N'थाहा नगरपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (331, N'बकैया गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (332, N'भिमफेदी गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (333, N'मकवानपुरगढी गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (334, N'मनहरी गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (335, N'राक्सिराङ्ग गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (336, N'वाग्मती गाउँपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (337, N'हेटौडा उप महानगरपालिका', N'', 31, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (338, N'ईशनाथ नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (339, N'कटहरिया नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (340, N'गुजरा नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (341, N'गढीमाई नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (342, N'गरुडा नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (343, N'गौर नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (344, N'चन्द्रपुर नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (345, N'दुर्गा भगवती गाउँपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (346, N'देवाही गोनाही नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (347, N'परोहा नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (348, N'फतुवा विजयपुर नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (349, N'बृन्दावन नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (350, N'बौधीमाई नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (351, N'माधव नारायण नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (352, N'मौलापुर नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (353, N'यमुनामाई गाउँपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (354, N'राजदेवी नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (355, N'राजपुर नगरपालिका', N'', 32, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (356, N'आदर्श कोटवाल गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (357, N'करैयामाई गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (358, N'कलैया उप महानगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (359, N'कोल्हवी नगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (360, N'जीतपुरसिमरा उप महानगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (361, N'देवताल गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (362, N'निजगढ नगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (363, N'पचरौता नगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (364, N'परवानीपुर गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (365, N'प्रसौनी गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (366, N'फेटा गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (367, N'बारागढी गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (368, N'महागढीमाई नगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (369, N'विश्रामपुर गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (370, N'सुवर्ण गाउँपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (371, N'सिम्रौनगढ नगरपालिका', N'', 33, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (372, N'कालिकामाई गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (373, N'छिपहरमाई गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (374, N'जगरनाथपुर गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (375, N'जिराभवानी गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (376, N'ठोरी गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (377, N'धोबीनी गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (378, N'पकाहा मैनापुर गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (379, N'पटेर्वा सुगौली गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (380, N'पर्सागढी नगरपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (381, N'पोखरिया नगरपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (382, N'बहुदरमाई नगरपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (383, N'बिन्दबासिनी गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (384, N'बिरगंज महानगरपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (385, N'सखुवा प्रसौनी गाउँपालिका', N'', 34, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (386, N'इच्छाकामना गाउँपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (387, N'कालिका नगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (388, N'खैरहनी नगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (389, N'भरतपुर महानगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (390, N'माडी नगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (391, N'रत्ननगर नगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (392, N'राप्ती नगरपालिका', N'', 35, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (393, N'अजिरकोट गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (394, N'आरुघाट गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (395, N'गण्डकी गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (396, N'गोरखा नगरपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (397, N'चुमनुव्री गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (398, N'धार्चे गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (399, N'पालुङटार नगरपालिका', N'', 36, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (400, N'बारपाक सुलीकोट गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (401, N'भिमसेनथापा गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (402, N'शहिद लखन गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (403, N'सिरानचोक गाउँपालिका', N'', 36, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (404, N'चामे गाउँपालिका', N'', 37, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (405, N'नार्पा भूमि गाउँपालिका', N'', 37, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (406, N'नासोँ गाउँपालिका', N'', 37, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (407, N'मनाङ ङिस्याङ गाउँपालिका', N'', 37, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (408, N'क्व्होलासोथार गाउँपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (409, N'दूधपोखरी गाउँपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (410, N'दोर्दी गाउँपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (411, N'बेसीशहर नगरपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (412, N'मध्यनेपाल नगरपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (413, N'मर्स्याङदी गाउँपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (414, N'रार्इनास नगरपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (415, N'सुन्दरबजार नगरपालिका', N'', 38, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (416, N'अन्नपूर्ण गाउँपालिका', N'', 39, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (417, N'पोखरा महानगरपालिका', N'', 39, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (418, N'माछापुछ्रे गाउँपालिका', N'', 39, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (419, N'मादी गाउँपालिका', N'', 39, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (420, N'रुपा गाउँपालिका', N'', 39, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (421, N'आँबुखैरेनी गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (422, N'ऋषिङ गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (423, N'घिरिङ गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (424, N'देवघाट गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (425, N'बन्दिपुर गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (426, N'भानु नगरपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (427, N'भिमाद नगरपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (428, N'म्याग्दे गाउँपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (429, N'व्यास नगरपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (430, N'शुक्लागण्डकी नगरपालिका', N'', 40, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (431, N'अर्जुनचौपारी गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (432, N'आँधिखोला गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (433, N'कालीगण्डकी गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (434, N'गल्याङ नगरपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (435, N'चापकोट नगरपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (436, N'पुतलीबजार नगरपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (437, N'फेदीखोला गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (438, N'बिरुवा गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (439, N'भीरकोट नगरपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (440, N'वालिङ नगरपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (441, N'हरिनास गाउँपालिका', N'', 41, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (442, N'इस्मा गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (443, N'कालीगण्डकी गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (444, N'गुल्मीदरबार गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (445, N'चन्द्रकोट गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (446, N'छत्रकोट गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (447, N'धुर्कोट गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (448, N'मदाने गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (449, N'मुसिकोट नगरपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (450, N'मालिका गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (451, N'रुरुक्षेत्र गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (452, N'रेसुङ्गा नगरपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (453, N'सत्यवती गाउँपालिका', N'', 42, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (454, N'तानसेन नगरपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (455, N'तिनाउ गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (456, N'निस्दि गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (457, N'पुर्वखोला गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (458, N'बगनासकाली  गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (459, N'माथागढी गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (460, N'रैनादेवी छहरा गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (461, N'रम्भा गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (462, N'रामपुर नगरपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (463, N'रिब्दीकोट गाउँपालिका', N'', 43, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (464, N'छत्रदेव गाउँपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (465, N'पाणिनी गाउँपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (466, N'भुमिकास्थान नगरपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (467, N'मालारानी गाउँपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (468, N'शितगंगा नगरपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (469, N'सन्धिखर्क नगरपालिका', N'', 44, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (470, N'प्रतापपुर गाउँपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (471, N'पाल्हिनन्दन गाउँपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (472, N'बर्दघाट नगरपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (473, N'रामग्राम नगरपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (474, N'सुनवल नगरपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (475, N'सरावल गाउँपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (476, N'सुस्ता गाउँपालिका', N'', 45, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (477, N'ओमसतिया गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (478, N'कन्चन गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (479, N'कोटहीमार्इ गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (480, N'गैडहवा गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (481, N'तिलोत्तमा नगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (482, N'देवदह नगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (483, N'बुटवल उप महानगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (484, N'मर्चवारी गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (485, N'मायादेवी गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (486, N'रोहिणी गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (487, N'लुम्बिनी सांस्कृतिक नगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (488, N'शुद्धोधन गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (489, N'सैनामैना नगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (490, N'सम्मरीमाई गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (491, N'सिद्धार्थनगर नगरपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (492, N'सियारी गाउँपालिका', N'', 46, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (493, N'कपिलवस्तु नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (494, N'कृष्णनगर नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (495, N'बुद्दभुमी नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (496, N'बाणगंगा नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (497, N'महाराजग‌ंज नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (498, N'मायादेवी गाउँपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (499, N'यशोधरा गाउँपालिका', N'', 47, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (500, N'विजयनगर गाउँपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (501, N'शुद्दोधन गाउँपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (502, N'शिवराज नगरपालिका', N'', 47, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (503, N'घरपझोङ गाउँपालिका', N'', 48, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (504, N'थासाङ गाउँपालिका', N'', 48, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (505, N'लो-घेकर दामोदरकुण्ड गाउँपालिका', N'', 48, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (506, N'लोमन्थाङ गाउँपालिका', N'', 48, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (507, N'वारागुङ मुक्तिक्षेत्र गाउँपालिका', N'', 48, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (508, N'अन्नपूर्ण गाउँपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (509, N'धवलागिरी गाउँपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (510, N'बेनी नगरपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (511, N'मंगला गाउँपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (512, N'मालिका गाउँपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (513, N'रघुगंगा गाउँपालिका', N'', 49, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (514, N'काठेखोला गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (515, N'गल्कोट नगरपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (516, N'जैमिनी नगरपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (517, N'ढोरपाटन नगरपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (518, N'तमानखोला गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (519, N'ताराखोला गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (520, N'निसीखोला गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (521, N'बागलुङ नगरपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (522, N'वडिगाड गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (523, N'वरेङ गाउँपालिका', N'', 50, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (524, N'कुश्मा नगरपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (525, N'जलजला गाउँपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (526, N'पैयूं गाउँपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (527, N'फलेवास नगरपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (528, N'महाशिला गाउँपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (529, N'मोदी गाउँपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (530, N'विहादी गाउँपालिका', N'', 51, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (531, N'आठबिसकोट नगरपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (532, N'चौरजहारी नगरपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (533, N'त्रिवेणी गाउँपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (534, N'बाँफिकोट गाउँपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (535, N'मुसिकोट नगरपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (536, N'सानीभेरी गाउँपालिका', N'', 52, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (537, N'गंगादेव गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (538, N'त्रिवेणी गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (539, N'थबाङ गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (540, N'परिवर्तन गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (541, N'माडी गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (542, N'रुन्टीगढी गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (543, N'रोल्पा नगरपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (544, N'लुङग्री गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (545, N'सुनछहरी गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (546, N'सुनिल स्मृति गाउँपालिका', N'', 53, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (547, N'ऐरावती गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (548, N'गौमुखी गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (549, N'झिमरुक गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (550, N'नौबहिनी गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (551, N'प्युठान नगरपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (552, N'मल्लरानी गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (553, N'माण्डवी गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (554, N'सरुमारानी गाउँपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (555, N'स्वर्गद्वारी नगरपालिका', N'', 54, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (556, N'कपुरकोट गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (557, N'कुमाख गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (558, N'कालीमाटी गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (559, N'छत्रेश्वरी गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (560, N'त्रिवेणी गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (561, N'दार्मा गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (562, N'बनगाड कुपिण्डे नगरपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (563, N'बागचौर नगरपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (564, N'सारदा नगरपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (565, N'सिद्ध कुमाख गाउँपालिका', N'', 55, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (566, N'गढवा गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (567, N'घोराही उप महानगरपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (568, N'तुल्सीपुर उप महानगरपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (569, N'दँगीशरण गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (570, N'बँगलाचुली गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (571, N'बबई गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (572, N'राजपुर गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (573, N'राप्ती गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (574, N'लमही नगरपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (575, N'शान्तिनगर गाउँपालिका', N'', 56, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (576, N'काइके गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (577, N'छार्का ताङसोङ गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (578, N'जगदुल्ला गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (579, N'ठुलिभेरी नगरपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (580, N'डोल्पा वुद्ध गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (581, N'त्रिपुरासुन्दरी नगरपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (582, N'मुड्केचुला गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (583, N'शे फोक्सुण्डो गाउँपालिका', N'', 57, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (584, N'कुमुगकार्मारोग गाउँपालिका', N'', 58, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (585, N'खत्याङ गाउँपालिका', N'', 58, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (586, N'छायानाथरारा नगरपालिका', N'', 58, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (587, N'सोरु गाउँपालिका', N'', 58, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (588, N'कनकासुन्दरी गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (589, N'गुठीचौर गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (590, N'चन्दननाथ नगरपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (591, N'तातोपानी गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (592, N'तिला  गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (593, N'पातारासी गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (594, N'सिंजा गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (595, N'हिमा गाउँपालिका', N'', 59, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (596, N'खाडाचक्र नगरपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (597, N'तिलागुफा नगरपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (598, N'नरहरीनाथ गाउँपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (599, N'पचालझरना गाउँपालिका', N'', 60, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (600, N'पलता गाउँपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (601, N'महावै गाउँपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (602, N'रास्कोट नगरपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (603, N'शुभ कालीका गाउँपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (604, N'सान्नी त्रीवेणी गाउँपालिका', N'', 60, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (605, N'अदानचुली गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (606, N'खार्पुनाथ गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (607, N'चंखेली गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (608, N'ताजाकोट गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (609, N'नाम्खा गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (610, N'सर्केगाड गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (611, N'सिमिकोट गाउँपालिका', N'', 61, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (612, N'कुसे गाउँपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (613, N'छेडागाड नगरपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (614, N'जुनिचादे गाउँपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (615, N'नलगाड नगरपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (616, N'बारेकोट गाउँपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (617, N'भेरी नगरपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (618, N'सिवालय गाउँपालिका', N'', 62, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (619, N'आठविस नगरपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (620, N'गुरास गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (621, N'चामुण्डा विन्द्रासैनी नगरपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (622, N'ठाँटीकाध गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (623, N'डुङ्गेश्वर गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (624, N'दुल्लु नगरपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (625, N'नारायण नगरपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (626, N'नौमुले गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (627, N'भगवतिमाइ गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (628, N'भैरवी गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (629, N'महावु गाउँपालिका', N'', 63, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (630, N'गुर्भाकोट नगरपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (631, N'चिङ्गाड गाउँपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (632, N'चौकुने गाउँपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (633, N'पञ्चपुरी नगरपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (634, N'बराहताल गाउँपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (635, N'भेरिगंगा नगरपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (636, N'लेकवेशी नगरपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (637, N'वीरेन्द्रनगर नगरपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (638, N'सिम्ता गाउँपालिका', N'', 64, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (639, N'कोहलपुर नगरपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (640, N'खजुरा गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (641, N'जानकी गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (642, N'डुडुवा गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (643, N'नेपालगँज उप महानगरपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (644, N'नरैनापुर गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (645, N'बैजनाथ गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (646, N'राप्तीसोनारी गाउँपालिका', N'', 65, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (647, N'गेरुवा गाउँपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (648, N'गुलरिया नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (649, N'ठाकुरबाबा नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (650, N'बढैयाताल गाउँपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (651, N'बारबर्दिया नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (652, N'बाँसगढी नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (653, N'मधुवन नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (654, N'राजापुर नगरपालिका', N'', 66, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (655, N'खप्तड छेडेदह गाउँपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (656, N'गौमुल गाउँपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (657, N'जगन्नाथ गाउँपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (658, N'त्रिवेणी नगरपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (659, N'बडिमालिका नगरपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (660, N'बुढिगंगा नगरपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (661, N'बुढिनन्दा नगरपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (662, N'स्वामिकार्तिक खापर गाउँपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (663, N'हिमाली गाउँपालिका', N'', 67, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (664, N'कमलबजार नगरपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (665, N'चौरपाटी गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (666, N'ढकारी गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (667, N'तुर्माखाद गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (668, N'पंचदेवल विनायक नगरपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (669, N'बान्नीगढी जयगढ गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (670, N'मंगलसेन  नगरपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (671, N'मेल्लेख गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (672, N'रामारोशन गाउँपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (673, N'साँफेबगर नगरपालिका', N'', 68, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (674, N'केदारस्युँ गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (675, N'खप्तडछान्ना गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (676, N'छविसपाथिभेरा गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (677, N'जयपृथ्वी नगरपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (678, N'तलकोट गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (679, N'थलारा गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (680, N'दुर्गाथली गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (681, N'बुंगल नगरपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (682, N'मष्टा गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (683, N'वित्थडचिर  गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (684, N'सूर्मा गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (685, N'साइपाल गाउँपालिका', N'', 69, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (686, N'आदर्श गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (687, N'के.आइ.सी गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (688, N'जोरायल गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (689, N'दिपायल सिलगढी नगरपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (690, N'पुर्विचौकी गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (691, N'बडिकेदार गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (692, N'बोगटान फुड्सिल गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (693, N'शिखर नगरपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (694, N'सायल गाउँपालिका', N'', 70, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (695, N'कैलारी गाउँपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (696, N'गोदावरी नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (697, N'गौरीगंगा नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (698, N'घोडाघोडी नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (699, N'चुरे गाउँपालिका', N'', 71, NULL)
GO
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (700, N'जानकी गाउँपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (701, N'जोशिपुर गाउँपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (702, N'टिकापुर  नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (703, N'धनगढी उप महानगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (704, N'बर्दगोरिया गाउँपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (705, N'भजनी नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (706, N'मोहन्याल गाउँपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (707, N'लम्किचुहा नगरपालिका', N'', 71, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (708, N'अपिहिमाल गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (709, N'दुहुँ गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (710, N'नौगाड गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (711, N'मार्मा गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (712, N'मालिकार्जुन गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (713, N'माहाकाली नगरपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (714, N'लेकम गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (715, N'व्यास  गाउँपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (716, N'शैल्यशिखर नगरपालिका', N'', 72, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (717, N'डिलासैनी  गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (718, N'दशरथचन्द नगरपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (719, N'दोगडाकेदार गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (720, N'पन्चेश्वर गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (721, N'पुर्चौडी  नगरपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (722, N'पाटन नगरपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (723, N'मेलौली  नगरपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (724, N'शिवनाथ गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (725, N'सुर्नया  गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (726, N'सिगास गाउँपालिका', N'', 73, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (727, N'अजयमेरु गाउँपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (728, N'अमरगढी  नगरपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (729, N'आलिताल गाउँपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (730, N'गन्यापधुरा  गाउँपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (731, N'नवदुर्गा गाउँपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (732, N'परशुराम नगरपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (733, N'भागेश्वर गाउँपालिका', N'', 74, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (734, N'कृष्णपुर  नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (735, N'पुनर्वास नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (736, N'बेदकोट नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (737, N'बेलडाँडी गाउँपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (738, N'बेलौरी  नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (739, N'भीमदत्त नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (740, N'माहाकाली नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (741, N'लालझाडी गाउँपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (742, N'शुक्लाफाँटा नगरपालिका', N'', 75, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (743, N'कावासोती नगरपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (744, N'गैंडाकोट नगरपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (745, N'देवचुली नगरपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (746, N'बुलिङटार गाउँपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (747, N'बौदीकाली गाउँपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (748, N'मध्यविन्दु नगरपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (749, N'विनयी त्रिबेणी गाउँपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (750, N'हुप्सेकोट गाउँपालिका', N'', 76, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (751, N'पुथ उत्तरगँगा गाउँपालिका', N'', 77, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (752, N'भूमे गाउँपालिका', N'', 77, NULL)
INSERT [dbo].[LocalLevel] ([Id], [Name], [Type], [DistId], [MaxWardNo]) VALUES (753, N'सिस्ने गाउँपालिका', N'', 77, NULL)
SET IDENTITY_INSERT [dbo].[LocalLevel] OFF
SET IDENTITY_INSERT [dbo].[LocalLevelDetails] ON 

INSERT [dbo].[LocalLevelDetails] ([Id], [LocalLevelId], [Area], [Density], [Population], [Website]) VALUES (7, 1, N'11', N'11', N'11', NULL)
SET IDENTITY_INSERT [dbo].[LocalLevelDetails] OFF
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (1, N'बैशाख')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (2, N'जेष्ठ')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (3, N'असार')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (4, N'श्रावण')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (5, N'भाद्र')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (6, N'आश्विन')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (7, N'कार्तिक')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (8, N'मङ्सिर')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (9, N'पौष')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (10, N'माघ')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (11, N'फाल्गुन')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (12, N'चैत्र')
SET IDENTITY_INSERT [dbo].[Month] OFF
SET IDENTITY_INSERT [dbo].[NirmanBebasahi] ON 

INSERT [dbo].[NirmanBebasahi] ([nirmanbebasaiId], [name], [address], [postboxNo], [TelPhoneNo], [FaxNo], [Email], [KaralayaName], [KaralayaAddress], [PramanPatraNo], [approvalNo], [RegisterdDate], [RegisterDateAd], [AprovalDateAd], [ApprovealDate], [ApprovalKaryalaya], [RenewalDatead], [RenewalDate], [MembershipNo], [Amount], [AmountEng], [FormName], [FormAddress], [SanchalakName], [Date], [DateAd], [PrintDateAd], [PrintDate], [Createdby], [CreateddDate], [deletedDate], [Deletedby], [updatedDate], [updatedBy]) VALUES (1, N'जेवन पौडेल ', N'भारत ', N'२-३१२-३१', N'९८४१२३१२१२ ', N'९८४१२३१२१२ ', N'Jevan@neap@gmail.com', N'प्राइभेट कम्पनी', N'विराटनगर ', N'2', 213151, NULL, NULL, CAST(N'2012-12-12' AS Date), N'२०७१-१२-१२', N'1231', NULL, N'२०७१-१२-१२', NULL, N'23', CAST(23.00 AS Decimal(18, 2)), N'रमेश  नेपला ', N'काठमाडौँ ', N'232', N'२०७१-१२-१२', NULL, NULL, N'२०७१-१२-१२', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NirmanBebasahi] ([nirmanbebasaiId], [name], [address], [postboxNo], [TelPhoneNo], [FaxNo], [Email], [KaralayaName], [KaralayaAddress], [PramanPatraNo], [approvalNo], [RegisterdDate], [RegisterDateAd], [AprovalDateAd], [ApprovealDate], [ApprovalKaryalaya], [RenewalDatead], [RenewalDate], [MembershipNo], [Amount], [AmountEng], [FormName], [FormAddress], [SanchalakName], [Date], [DateAd], [PrintDateAd], [PrintDate], [Createdby], [CreateddDate], [deletedDate], [Deletedby], [updatedDate], [updatedBy]) VALUES (2, N' केपी शर्मा', N'काठमाडौं', N'९८४१२३१२१२ ', N' ९८४१२३१२१२ ', N'९८४१२३१२१२ ', N'kp@ggmail.com', N'स्थायी कमिटी', N'काठमाडौं', N'११', 4234, NULL, NULL, NULL, N'1233', N'२०७१-१२-१२', NULL, N'मेश  नेपला', NULL, N'३१२३१५ ', NULL, N'आलोक आलोक ', N'123', N'3123', N'२०७१-१२-१२', NULL, NULL, N'२०७१-१२-१२', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NirmanBebasahi] OFF
SET IDENTITY_INSERT [dbo].[NirmanBebasahiApproval] ON 

INSERT [dbo].[NirmanBebasahiApproval] ([id], [Name], [Address], [PostBoxNo], [Telephone], [CompanyTypr], [ComapanyPersonelName], [CompanyPersonelAddress], [CompanyPersonelPostbosNo], [CompanyPersonelTelephone], [CompanyPersonelFax], [CompanyPersonelEmail], [RegisterationNo], [RegistrarionDate], [RegistrationDateAd], [AdhiriktaPuji], [AdhirikataPujiEng], [JariPugi], [JariPujiEng], [Grade], [groups], [Technical], [NonTechnical], [Others], [PrintDate], [PrintDateAd], [Date], [status], [CreateDate], [Createdby], [DeletedDate], [DeletedBy], [UpdatedDate], [updateby]) VALUES (1, N'जीवन घिमिरे', N'विराटनगर ', N'६-८४ ', N'२९५०१९ ', N'पब्लिक लिमिटेड कम्पनी ', N'राम भट्टराई', N'धरान', N'२९५०१९ ', N'२९५०१९ ', N'1', N'212', N'२९-५०-१९ ', N'२०७१-१२-१२', NULL, N'२३१२३१५ ', NULL, N'२३१२३१५ ', NULL, N'1231241', N'आ', N'12424', N'4124', N'1212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NirmanBebasahiApproval] ([id], [Name], [Address], [PostBoxNo], [Telephone], [CompanyTypr], [ComapanyPersonelName], [CompanyPersonelAddress], [CompanyPersonelPostbosNo], [CompanyPersonelTelephone], [CompanyPersonelFax], [CompanyPersonelEmail], [RegisterationNo], [RegistrarionDate], [RegistrationDateAd], [AdhiriktaPuji], [AdhirikataPujiEng], [JariPugi], [JariPujiEng], [Grade], [groups], [Technical], [NonTechnical], [Others], [PrintDate], [PrintDateAd], [Date], [status], [CreateDate], [Createdby], [DeletedDate], [DeletedBy], [UpdatedDate], [updateby]) VALUES (2, N'asd', N'sdas', N'dasdas', N'dasd', N'प्राइभेट लिमिटेड कम्पनी', N'asd', N'asda', N'sda', N'asdas', N'sdasd', N'asdasd', N'das', N'२०७७-१-१९', NULL, N'asd', NULL, N'dasdasd', NULL, N'sda', N'sda', N'dasdas', N'sdas', N'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NirmanBebasahiApproval] OFF
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(N'1935-04-13 00:00:00.000' AS DateTime), CAST(N'1936-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(N'1936-04-13 00:00:00.000' AS DateTime), CAST(N'1937-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(N'1937-04-13 00:00:00.000' AS DateTime), CAST(N'1938-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(N'1938-04-13 00:00:00.000' AS DateTime), CAST(N'1939-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(N'1939-04-13 00:00:00.000' AS DateTime), CAST(N'1940-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(N'1940-04-13 00:00:00.000' AS DateTime), CAST(N'1941-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(N'1941-04-13 00:00:00.000' AS DateTime), CAST(N'1942-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(N'1942-04-13 00:00:00.000' AS DateTime), CAST(N'1943-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(N'1943-04-14 00:00:00.000' AS DateTime), CAST(N'1944-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(N'1944-04-13 00:00:00.000' AS DateTime), CAST(N'1945-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(N'1945-04-13 00:00:00.000' AS DateTime), CAST(N'1946-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(N'1946-04-13 00:00:00.000' AS DateTime), CAST(N'1947-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(N'1947-04-14 00:00:00.000' AS DateTime), CAST(N'1948-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(N'1948-04-13 00:00:00.000' AS DateTime), CAST(N'1949-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(N'1949-04-13 00:00:00.000' AS DateTime), CAST(N'1950-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(N'1950-04-13 00:00:00.000' AS DateTime), CAST(N'1951-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(N'1951-04-14 00:00:00.000' AS DateTime), CAST(N'1952-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(N'1952-04-13 00:00:00.000' AS DateTime), CAST(N'1953-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(N'1953-04-13 00:00:00.000' AS DateTime), CAST(N'1954-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(N'1954-04-13 00:00:00.000' AS DateTime), CAST(N'1955-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(N'1955-04-14 00:00:00.000' AS DateTime), CAST(N'1956-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(N'1956-04-13 00:00:00.000' AS DateTime), CAST(N'1957-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(N'1957-04-13 00:00:00.000' AS DateTime), CAST(N'1958-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(N'1958-04-13 00:00:00.000' AS DateTime), CAST(N'1959-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(N'1959-04-14 00:00:00.000' AS DateTime), CAST(N'1960-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(N'1960-04-13 00:00:00.000' AS DateTime), CAST(N'1961-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(N'1961-04-13 00:00:00.000' AS DateTime), CAST(N'1962-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(N'1962-04-13 00:00:00.000' AS DateTime), CAST(N'1963-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(N'1963-04-14 00:00:00.000' AS DateTime), CAST(N'1964-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(N'1964-04-13 00:00:00.000' AS DateTime), CAST(N'1965-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(N'1965-04-13 00:00:00.000' AS DateTime), CAST(N'1966-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(N'1966-04-13 00:00:00.000' AS DateTime), CAST(N'1967-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(N'1967-04-14 00:00:00.000' AS DateTime), CAST(N'1968-04-12 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(N'1968-04-13 00:00:00.000' AS DateTime), CAST(N'1969-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(N'1969-04-13 00:00:00.000' AS DateTime), CAST(N'1970-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(N'1970-04-14 00:00:00.000' AS DateTime), CAST(N'1971-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(N'1971-04-14 00:00:00.000' AS DateTime), CAST(N'1972-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(N'1972-04-13 00:00:00.000' AS DateTime), CAST(N'1973-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(N'1973-04-13 00:00:00.000' AS DateTime), CAST(N'1974-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(N'1974-04-14 00:00:00.000' AS DateTime), CAST(N'1975-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(N'1975-04-14 00:00:00.000' AS DateTime), CAST(N'1976-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(N'1976-04-13 00:00:00.000' AS DateTime), CAST(N'1977-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(N'1977-04-13 00:00:00.000' AS DateTime), CAST(N'1978-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(N'1978-04-14 00:00:00.000' AS DateTime), CAST(N'1979-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(N'1979-04-14 00:00:00.000' AS DateTime), CAST(N'1980-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(N'1980-04-13 00:00:00.000' AS DateTime), CAST(N'1981-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(N'1981-04-13 00:00:00.000' AS DateTime), CAST(N'1982-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(N'1982-04-14 00:00:00.000' AS DateTime), CAST(N'1983-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(N'1983-04-14 00:00:00.000' AS DateTime), CAST(N'1984-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(N'1984-04-13 00:00:00.000' AS DateTime), CAST(N'1985-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(N'1985-04-13 00:00:00.000' AS DateTime), CAST(N'1986-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(N'1986-04-14 00:00:00.000' AS DateTime), CAST(N'1987-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(N'1987-04-14 00:00:00.000' AS DateTime), CAST(N'1988-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(N'1988-04-13 00:00:00.000' AS DateTime), CAST(N'1989-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(N'1989-04-13 00:00:00.000' AS DateTime), CAST(N'1990-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(N'1990-04-14 00:00:00.000' AS DateTime), CAST(N'1991-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(N'1991-04-14 00:00:00.000' AS DateTime), CAST(N'1992-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(N'1992-04-13 00:00:00.000' AS DateTime), CAST(N'1993-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(N'1993-04-13 00:00:00.000' AS DateTime), CAST(N'1994-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(N'1994-04-14 00:00:00.000' AS DateTime), CAST(N'1995-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(N'1995-04-14 00:00:00.000' AS DateTime), CAST(N'1996-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(N'1996-04-13 00:00:00.000' AS DateTime), CAST(N'1997-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(N'1997-04-13 00:00:00.000' AS DateTime), CAST(N'1998-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(N'1998-04-14 00:00:00.000' AS DateTime), CAST(N'1999-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(N'1999-04-14 00:00:00.000' AS DateTime), CAST(N'2000-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(N'2000-04-13 00:00:00.000' AS DateTime), CAST(N'2001-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(N'2001-04-14 00:00:00.000' AS DateTime), CAST(N'2002-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(N'2002-04-14 00:00:00.000' AS DateTime), CAST(N'2003-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(N'2003-04-14 00:00:00.000' AS DateTime), CAST(N'2004-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(N'2004-04-13 00:00:00.000' AS DateTime), CAST(N'2005-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(N'2005-04-14 00:00:00.000' AS DateTime), CAST(N'2006-04-13 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(N'2006-04-14 00:00:00.000' AS DateTime), CAST(N'2007-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2009-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(N'2009-04-14 00:00:00.000' AS DateTime), CAST(N'2010-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(N'2010-04-14 00:00:00.000' AS DateTime), CAST(N'2011-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(N'2011-04-14 00:00:00.000' AS DateTime), CAST(N'2012-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(N'2012-04-13 00:00:00.000' AS DateTime), CAST(N'2013-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(N'2013-04-14 00:00:00.000' AS DateTime), CAST(N'2014-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(N'2014-04-14 00:00:00.000' AS DateTime), CAST(N'2015-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2017-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(N'2017-04-14 00:00:00.000' AS DateTime), CAST(N'2018-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(N'2018-04-14 00:00:00.000' AS DateTime), CAST(N'2019-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(N'2019-04-14 00:00:00.000' AS DateTime), CAST(N'2020-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(N'2021-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-13 00:00:00.000' AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2023-04-13 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(N'2023-04-14 00:00:00.000' AS DateTime), CAST(N'2024-04-12 00:00:00.000' AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [Name]) VALUES (1, N'प्रदेश १')
INSERT [dbo].[State] ([Id], [Name]) VALUES (2, N'प्रदेश २')
INSERT [dbo].[State] ([Id], [Name]) VALUES (3, N'प्रदेश ३')
INSERT [dbo].[State] ([Id], [Name]) VALUES (4, N'प्रदेश ४')
INSERT [dbo].[State] ([Id], [Name]) VALUES (5, N'प्रदेश ५')
INSERT [dbo].[State] ([Id], [Name]) VALUES (6, N'प्रदेश ६')
INSERT [dbo].[State] ([Id], [Name]) VALUES (7, N'प्रदेश ७')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[StateDetails] ON 

INSERT [dbo].[StateDetails] ([Id], [StateId], [Capital], [ChiefMinister], [PDensity], [Governer], [Population], [Area], [Website], [TotalDist]) VALUES (6, 2, N'bb', N'bb', N'bb', N'gkj', N'gkg', N'k', N'gk', 12)
SET IDENTITY_INSERT [dbo].[StateDetails] OFF
SET IDENTITY_INSERT [dbo].[tblBasaisaraiDarta] ON 

INSERT [dbo].[tblBasaisaraiDarta] ([NewMigrationId], [PanjiId], [GharMuliNaamThar], [GharMuliFullName], [BasaisaraiAayekoDartaNo], [BasaisaraiAayekoPradesh], [BasaisaraiAayekoJilla], [BasaisaraiAayekoPalika], [BasaisaraiAayekoWardNo], [BasaisaraiAayekoGharNo], [BasaisaraiAayekoGaunTole], [BasaisaraiAayekoMiti], [BasaisaraiAayekoDate], [BasaisaraiAayekoKaran], [BasaisaraiJanePradesh], [BasaisaraiJaneJilla], [BasaisaraiJanePalika], [BasaisaraiJaneWardNo], [BasaisaraiJaneGharNo], [BasaisaraiJaneGaunTole]) VALUES (1, 4, N'घरमुली', N'gharmuli', N'12', 3, 25, 288, 1, NULL, NULL, N'2077-01-05', N'04/17/2020 12:00:00 AM', 1, 2, 16, 152, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblBasaisaraiDarta] OFF
SET IDENTITY_INSERT [dbo].[tblBasaisaraiDartaInformant] ON 

INSERT [dbo].[tblBasaisaraiDartaInformant] ([NewMigrationInformantId], [NewMigrationId], [InfNaamThar], [InfFullName], [InfState], [InfDistrict], [InfPalika], [InfWardNo], [InfGharNo], [InfGaunTole], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (1, 1, N'राम', N'ram', 3, 25, 288, 1, NULL, NULL, N'456/776', N'2045-02-03', 25, NULL, N'2077-01-07')
SET IDENTITY_INSERT [dbo].[tblBasaisaraiDartaInformant] OFF
SET IDENTITY_INSERT [dbo].[tblBasaisaraiKaran] ON 

INSERT [dbo].[tblBasaisaraiKaran] ([BasaisaraiKaranId], [BasaisaraiKaran]) VALUES (1, N'नोकरी')
INSERT [dbo].[tblBasaisaraiKaran] ([BasaisaraiKaranId], [BasaisaraiKaran]) VALUES (2, N'व्यापार व्यावसाय')
INSERT [dbo].[tblBasaisaraiKaran] ([BasaisaraiKaranId], [BasaisaraiKaran]) VALUES (3, N'घर बास')
INSERT [dbo].[tblBasaisaraiKaran] ([BasaisaraiKaranId], [BasaisaraiKaran]) VALUES (4, N'अन्य')
SET IDENTITY_INSERT [dbo].[tblBasaisaraiKaran] OFF
SET IDENTITY_INSERT [dbo].[tblBasaisaraiPersonalDetails] ON 

INSERT [dbo].[tblBasaisaraiPersonalDetails] ([BasaisaraiDetailsId], [NewMigrationId], [JanmaDartaNo], [NaamThar], [FullName], [JanmaMiti], [JanmaDate], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [Gender], [NagariktaPraPaNo], [NagaritaIssueDate], [NagariktaIssueDistrict], [AnyRecords], [RelationTo]) VALUES (5, 1, 120, N'अम्ब', N'amb', N'2045-02-12', N'05/25/1988 12:00:00 AM', 3, 25, 288, 1, 2, N'456', N'2062-02-25', 25, NULL, 5)
INSERT [dbo].[tblBasaisaraiPersonalDetails] ([BasaisaraiDetailsId], [NewMigrationId], [JanmaDartaNo], [NaamThar], [FullName], [JanmaMiti], [JanmaDate], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [Gender], [NagariktaPraPaNo], [NagaritaIssueDate], [NagariktaIssueDistrict], [AnyRecords], [RelationTo]) VALUES (6, 1, 452, N'सदा', N'sada', N'2069-01-23', N'05/05/2012 12:00:00 AM', 3, 25, 288, 1, 2, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[tblBasaisaraiPersonalDetails] ([BasaisaraiDetailsId], [NewMigrationId], [JanmaDartaNo], [NaamThar], [FullName], [JanmaMiti], [JanmaDate], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [Gender], [NagariktaPraPaNo], [NagaritaIssueDate], [NagariktaIssueDistrict], [AnyRecords], [RelationTo]) VALUES (7, 1, 100, N'काले', N'kale', N'2070-02-25', N'06/08/2013 12:00:00 AM', 3, 25, 288, 1, 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblBasaisaraiPersonalDetails] ([BasaisaraiDetailsId], [NewMigrationId], [JanmaDartaNo], [NaamThar], [FullName], [JanmaMiti], [JanmaDate], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [Gender], [NagariktaPraPaNo], [NagaritaIssueDate], [NagariktaIssueDistrict], [AnyRecords], [RelationTo]) VALUES (8, 1, 125, N'गोरे', N'gorey', N'2062-02-28', N'06/10/2005 12:00:00 AM', 3, 25, 288, 1, 1, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[tblBasaisaraiPersonalDetails] OFF
SET IDENTITY_INSERT [dbo].[tblCourtType] ON 

INSERT [dbo].[tblCourtType] ([CourtTypeId], [CourtType], [CourtType_Nep]) VALUES (1, N'District Court', N'जिल्ला अदालत')
INSERT [dbo].[tblCourtType] ([CourtTypeId], [CourtType], [CourtType_Nep]) VALUES (2, N'Appellate Court', N'पुनरावेदन अदालत')
INSERT [dbo].[tblCourtType] ([CourtTypeId], [CourtType], [CourtType_Nep]) VALUES (3, N'Supreme Court', N'सर्वोच्छ अदालत')
SET IDENTITY_INSERT [dbo].[tblCourtType] OFF
SET IDENTITY_INSERT [dbo].[tblDistrict] ON 

INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (1, 1, N'Bhojpur', 1, N'भोजपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (2, 2, N'Dhankuta', 1, N'	धनकुटा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (3, 3, N'Ilam', 1, N'	इलाम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (4, 4, N'Jhapa', 1, N'	झापा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (5, 5, N'Khotang', 1, N'	खोटाँग')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (6, 6, N'Morang', 1, N'मोरंग ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (7, 7, N'Okhaldhunga', 1, N'ओखलढुंगा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (8, 8, N'Panchthar', 1, N'	पांचथर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (9, 9, N'Sankhuwasabha', 1, N'	संखुवासभा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (10, 10, N'Solukhumbu', 1, N'	सोलुखुम्बू')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (11, 11, N'Sunsari', 1, N'	सुनसरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (12, 12, N'Taplejung', 1, N'	ताप्लेजुंग')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (13, 13, N'Terhathum', 1, N'	तेह्रथुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (14, 14, N'Udayapur', 1, N'उदयपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (15, 15, N'Parsa', 2, N'	पर्सा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (16, 16, N'Bara', 2, N'बारा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (17, 17, N'Rautahat', 2, N'	रौतहट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (18, 18, N'Sarlahi', 2, N'सर्लाही')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (19, 19, N'Dhanusa', 2, N'धनुषा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (20, 20, N'Siraha', 2, N'सिराहा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (21, 21, N'Mahottari', 2, N'महोत्तरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (22, 22, N'Saptari', 2, N'सप्तरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (23, 23, N'Sindhuli', 3, N'सिन्धुली')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (24, 24, N'Ramechhap', 3, N'रामेछाप')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (25, 25, N'Dolakha', 3, N'दोलखा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (26, 26, N'Bhaktapur', 3, N'भक्तपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (27, 27, N'Dhading', 3, N'धादिङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (28, 28, N'Kathmandu', 3, N'काठमाडौँ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (29, 29, N'Kavrepalanchok', 3, N'काभ्रेपलान्चोक ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (30, 30, N'Lalitpur', 3, N'ललितपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (31, 31, N'Nuwakot', 3, N'नुवाकोट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (32, 32, N'Rasuwa', 3, N'रसुवा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (33, 33, N'Sindhupalchok', 3, N'सिन्धुपाल्चोक')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (34, 34, N'Chitwan', 3, N'चितवन')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (35, 35, N'Makwanpur', 3, N'मकवानपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (36, 36, N'Baglung', 4, N'बागलुङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (37, 37, N'Gorkha', 4, N'गोरखा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (38, 38, N'Kaski', 4, N'कास्की')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (39, 39, N'Lamjung', 4, N'लमजुङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (40, 40, N'Manang', 4, N'मनाङ ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (41, 41, N'Mustang', 4, N'मुस्ताङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (42, 42, N'Myagdi', 4, N'म्याग्दी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (43, 43, N'Nawalpur', 4, N'नवलपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (44, 44, N'Parbat', 4, N'पर्वत')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (45, 45, N'Syangja', 4, N'स्याङग्जा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (46, 46, N'Tanahun', 4, N'तनहुँ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (47, 47, N'Kapilvastu', 5, N'कपिलवस्तु')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (48, 48, N'Parasi', 5, N'परासी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (49, 49, N'Rupandehi', 5, N'रुपन्देही ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (50, 50, N'Arghakhanchi', 5, N'अर्घाखाँची')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (51, 51, N'Gulmi', 5, N'गुल्मी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (52, 52, N'Palpa', 5, N'पाल्पा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (53, 53, N'Dang Deukhuri', 5, N'दाङ देउखुरी ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (54, 54, N'Pyuthan', 5, N'प्युठान')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (55, 55, N'Rolpa', 5, N'रोल्पा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (56, 56, N'Eastern Rukum', 5, N'पूर्वी रूकुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (57, 57, N'Banke', 5, N'बाँके')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (58, 58, N'Bardiya', 5, N'बर्दिया')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (59, 59, N'Western Rukum', 6, N'पश्चिमी रूकुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (60, 60, N'Salyan', 6, N'सल्यान')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (61, 61, N'Dolpa', 6, N'डोल्पा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (62, 62, N'Humla', 6, N'हुम्ला')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (63, 63, N'Jumla', 6, N'जुम्ला')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (64, 64, N'Kalikot', 6, N'कालिकोट ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (65, 65, N'Mugu', 6, N'मुगु')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (66, 66, N'Surkhet', 6, N'सुर्खेत')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (67, 67, N'Dailekh', 6, N'दैलेख')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (68, 68, N'Jajarkot', 6, N'जाजरकोट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (69, 69, N'Kailali', 7, N'कैलाली ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (70, 70, N'Achham', 7, N'अछाम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (71, 71, N'Doti', 7, N'डोटी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (72, 72, N'Bajhang', 7, N'बझाङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (73, 73, N'Bajura', 7, N'बाजुरा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (74, 74, N'Kanchanpur', 7, N'कंचनपुर ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (75, 75, N'Dadeldhura', 7, N'डडेलधुरा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (76, 76, N'Baitadi', 7, N'बैतडी ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (77, 77, N'Darchula', 7, N'दार्चुला ')
SET IDENTITY_INSERT [dbo].[tblDistrict] OFF
SET IDENTITY_INSERT [dbo].[tblEducation] ON 

INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (1, N'प्राथमिक तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (2, N'निम्न माध्यमिक तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (3, N'माध्यमिक तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (4, N'उच्च माध्यमिक तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (5, N'स्नातक तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (6, N'स्नातकोत्तर तह')
INSERT [dbo].[tblEducation] ([EducationId], [Education]) VALUES (7, N'विद्यावारिधि तह')
SET IDENTITY_INSERT [dbo].[tblEducation] OFF
SET IDENTITY_INSERT [dbo].[tblFiscalYear] ON 

INSERT [dbo].[tblFiscalYear] ([FiscalYearId], [Title], [StartDate], [EndDate], [IsActive]) VALUES (1, N'२०७५/७६', CAST(N'2018-07-16' AS Date), CAST(N'2019-07-17' AS Date), 0)
INSERT [dbo].[tblFiscalYear] ([FiscalYearId], [Title], [StartDate], [EndDate], [IsActive]) VALUES (3, N'२०७६/७७', CAST(N'2019-08-16' AS Date), CAST(N'2020-08-17' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblFiscalYear] OFF
SET IDENTITY_INSERT [dbo].[tblGender] ON 

INSERT [dbo].[tblGender] ([GenderId], [Gender], [Gender_Nep]) VALUES (1, N'Male', N'पुरुस')
INSERT [dbo].[tblGender] ([GenderId], [Gender], [Gender_Nep]) VALUES (2, N'Female', N'महिला')
INSERT [dbo].[tblGender] ([GenderId], [Gender], [Gender_Nep]) VALUES (3, N'Others', N'अन्य')
SET IDENTITY_INSERT [dbo].[tblGender] OFF
SET IDENTITY_INSERT [dbo].[tblJanmadaMaddat] ON 

INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (1, N'घरको मानिस')
INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (2, N'सुडिनी')
INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (3, N'नर्स')
INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (4, N'स्वास्थ्य कर्मी')
INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (5, N'डाक्टर')
INSERT [dbo].[tblJanmadaMaddat] ([JanmadaMaddatId], [JanmadaMaddatGarne]) VALUES (6, N'अन्य')
SET IDENTITY_INSERT [dbo].[tblJanmadaMaddat] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDarta] ON 

INSERT [dbo].[tblJanmaDarta] ([NewbornId], [PanjiId], [NewbornNaam], [NewbornName], [JanmaMiti], [JanmaDate], [JanmaSthaan], [JanmadaMadatt], [Gender], [JanmaKisim], [JanmaJaatJati], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [JanmaBidesh], [JanmaForeign], [BajekoNaam], [GrandFather]) VALUES (4, 1, N'हिमंशी', N'himanshi', N'2076-03-11', N'06/26/2019 12:00:00 AM', 2, 3, 2, 1, NULL, 2, 16, 100, 2, NULL, NULL, N'आसिफ', N'asif')
INSERT [dbo].[tblJanmaDarta] ([NewbornId], [PanjiId], [NewbornNaam], [NewbornName], [JanmaMiti], [JanmaDate], [JanmaSthaan], [JanmadaMadatt], [Gender], [JanmaKisim], [JanmaJaatJati], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [JanmaBidesh], [JanmaForeign], [BajekoNaam], [GrandFather]) VALUES (5, 5, N'sfgsd', N'sg', N'2075-07-25', N'11/11/2018 12:00:00 AM', 1, 2, 1, 1, NULL, 2, 15, 139, 1, NULL, NULL, N'tryry rtwer', N'erwtwer ertwer')
SET IDENTITY_INSERT [dbo].[tblJanmaDarta] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaFatherDetails] ON 

INSERT [dbo].[tblJanmaDartaFatherDetails] ([NewbornFatherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIsssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa], [TotalChild], [TotalLiveChild], [VivahDartaNo], [VivahMiti], [VivahDate]) VALUES (3, 4, N'असोक', N'asok', 2, 16, 100, 1, N'कोतवाल', N'1', 28, N'nepal', N'nepal', N'124/566', N'2072-02-22', 16, NULL, 5, 4, N'hindu', N'nepali', 1, 1, N'123', N'2075-01-10', N'04/23/2018 12:00:00 AM')
INSERT [dbo].[tblJanmaDartaFatherDetails] ([NewbornFatherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIsssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa], [TotalChild], [TotalLiveChild], [VivahDartaNo], [VivahMiti], [VivahDate]) VALUES (4, 5, N'erte ftgqer', N'terqt ertwer', 1, 1, 1, 1, N'trghr', NULL, NULL, NULL, NULL, NULL, N'2076-07-78', 16, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'2012-12-12', N'3/25/1956 12:00:00 AM')
SET IDENTITY_INSERT [dbo].[tblJanmaDartaFatherDetails] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaInformant] ON 

INSERT [dbo].[tblJanmaDartaInformant] ([NewBornInformantId], [NewbornId], [InfNaamThar], [InfFullName], [InfRelationToNewBorn], [InfState], [InfDistrict], [InfPalika], [InfWardNo], [InfGaunTole], [InfGharNo], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (3, 4, N'राम', N'ram', 5, 2, 16, 100, 1, NULL, NULL, N'456/776', N'2069-01-22', NULL, NULL, N'2077-01-07')
INSERT [dbo].[tblJanmaDartaInformant] ([NewBornInformantId], [NewbornId], [InfNaamThar], [InfFullName], [InfRelationToNewBorn], [InfState], [InfDistrict], [InfPalika], [InfWardNo], [InfGaunTole], [InfGharNo], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (4, 5, N'wergt', N'ew', 1, 1, 12, 116, 1, NULL, NULL, N'756', N'2010-12-12', NULL, NULL, N'2012-12-12')
SET IDENTITY_INSERT [dbo].[tblJanmaDartaInformant] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaMotherDetails] ON 

INSERT [dbo].[tblJanmaDartaMotherDetails] ([NewBornMotherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa]) VALUES (3, 4, N'आरिस्फा', N'aarisfa', 2, 16, 103, 2, N'कर्मिया', N'2', 27, N'nepal', N'nepal', N'125/899', N'2071-03-25', 16, NULL, 5, 5, N'hindu', N'nepali')
INSERT [dbo].[tblJanmaDartaMotherDetails] ([NewBornMotherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa]) VALUES (4, 5, N'werqwe erte', N'ewrt ert', 1, 1, 2, 2, N'sd', NULL, NULL, NULL, NULL, NULL, N'2075-07-07', 15, NULL, 2, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblJanmaDartaMotherDetails] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaKisim] ON 

INSERT [dbo].[tblJanmaKisim] ([JanmaKisinId], [JanmaKisimName]) VALUES (1, N'सिङ्गो')
INSERT [dbo].[tblJanmaKisim] ([JanmaKisinId], [JanmaKisimName]) VALUES (2, N'जुम्ल्याहा')
INSERT [dbo].[tblJanmaKisim] ([JanmaKisinId], [JanmaKisimName]) VALUES (3, N'तिम्ल्याहा')
SET IDENTITY_INSERT [dbo].[tblJanmaKisim] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaSthaan] ON 

INSERT [dbo].[tblJanmaSthaan] ([JanmaSthaanId], [JanmaSthaanName]) VALUES (1, N'घर')
INSERT [dbo].[tblJanmaSthaan] ([JanmaSthaanId], [JanmaSthaanName]) VALUES (2, N'अस्पताल')
INSERT [dbo].[tblJanmaSthaan] ([JanmaSthaanId], [JanmaSthaanName]) VALUES (3, N'प्रसुतिगृह')
SET IDENTITY_INSERT [dbo].[tblJanmaSthaan] OFF
SET IDENTITY_INSERT [dbo].[tblMrityuDarta] ON 

INSERT [dbo].[tblMrityuDarta] ([NewDeathId], [PanjiId], [NaamThar], [FullName], [Gender], [MrityuMiti], [MrityuDate], [Age], [MrityuPradesh], [MrityuJilla], [MrityuPalika], [MrityuWardNo], [MrityuGaunTole], [MrityuGharNo], [MrityuBhayekoSthaan]) VALUES (1, 2, N'ग ग असक', N'g g ask', 2, N'2076-12-04', N'03/17/2020 12:00:00 AM', 76, 1, 1, 3, 1, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[tblMrityuDarta] OFF
SET IDENTITY_INSERT [dbo].[tblMrityuDartaInformant] ON 

INSERT [dbo].[tblMrityuDartaInformant] ([NewDeathInformantId], [NewdeathId], [InfNaamThar], [InfFullName], [InfRelationToNewDeath], [InfPradesh], [InfJilla], [InfPalika], [InfWardNo], [InfGaunTole], [InfGharNo], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (1, 1, N'राम', N'ram', 2, 1, 1, 3, 1, NULL, NULL, N'456/554', N'2032-02-01', 1, NULL, N'2077-01-14')
SET IDENTITY_INSERT [dbo].[tblMrityuDartaInformant] OFF
SET IDENTITY_INSERT [dbo].[tblMrityuDartaPersonalDetails] ON 

INSERT [dbo].[tblMrityuDartaPersonalDetails] ([NewDeathDetailsId], [NewDeathId], [JanmaDartaNo], [JanmaMiti], [JanmaDate], [JanmaPradesh], [JanmaJilla], [JanmaPalika], [JanmaWardNo], [JanmaGaunTole], [JanmaGharNo], [NagariktaPraPaNo], [NagariktaIsssueDate], [NagariktaIssueDistrict], [PassportNo_Desh], [ShikshaSthar], [MatriBhasa], [Dharma], [JaatJaati], [BajekoNaam], [Grandfather], [BabuNaam], [FatherName], [AamaNaam], [MotherName], [MaritalStatus], [SpouseNaam], [SpouseName], [MrityuKaran]) VALUES (1, 1, 12, N'2000-01-03', N'04/16/1943 12:00:00 AM', 1, 1, 6, 2, NULL, NULL, N'466/232', N'2020-02-27', 1, NULL, 1, NULL, NULL, NULL, N'गस असक', N'gs ask', N'सड असक', N'sdk ask', N'स असक', N'ss ask', 1, N'एर अदक', N'ar adk', NULL)
SET IDENTITY_INSERT [dbo].[tblMrityuDartaPersonalDetails] OFF
SET IDENTITY_INSERT [dbo].[tblOccupation] ON 

INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (1, N'अध्ययन')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (2, N'कृषी')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (3, N'स्वरोजगार')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (4, N'सरकारी सेवा')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (5, N'निजि क्षेत्रमा सेवा')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (6, N'केहि नगरेको')
INSERT [dbo].[tblOccupation] ([OcupationId], [Occupation]) VALUES (7, N'अन्य')
SET IDENTITY_INSERT [dbo].[tblOccupation] OFF
SET IDENTITY_INSERT [dbo].[tblPalika] ON 

INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (1, 1, 1, N'Bhojpur', N'भोजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (2, 2, 1, N'Shadanand', N'षडानन्द')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (3, 3, 1, N'	Aamchok', N'	आमचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (5, 4, 1, N'Tyamke Maiyum', N'ट्याम्केमैयुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (6, 5, 1, N'	Arun', N'	अरुण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (7, 6, 1, N'Pauwadungma', N'पौवादुङमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (8, 7, 1, N'	Salpasilichho', N'साल्पासिलिछो')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (9, 8, 1, N'Hatuwagadhi	', N'हतुवागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (10, 9, 1, N'Ramprasad Rai', N'रामप्रसाद राई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (11, 10, 2, N'Paakhribas', N'पाख्रिबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (12, 11, 2, N'Dhankuta', N'धनकुटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (13, 12, 2, N'Mahalaxmi', N'महालक्ष्मी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (14, 13, 2, N'Sangurigadhi', N'सागुरीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (15, 14, 2, N'	Sahidbhumi', N'	सहीदभूमि')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (16, 15, 2, N'Chhathar Jorpati', N'छथर जोरपाटी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (17, 16, 2, N'	Chaubise', N'चौविसे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (18, 17, 3, N'Iilam', N'ईलाम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (19, 18, 3, N'Deumaai', N'देउमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (20, 19, 3, N'Maai', N'माई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (21, 20, 3, N'Suryodaya', N'सूर्योदय')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (22, 21, 3, N'Phakphokthum', N'फाकफोकथुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (23, 22, 3, N'Mai Jogmai', N'माईजोगमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (24, 23, 3, N'Chulachuli', N'चुलाचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (25, 24, 3, N'Rong', N'रोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (26, 25, 3, N'Mangsebung', N'माङसेबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (27, 26, 3, N'Sandakpur', N'सन्दकपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (28, 27, 4, N'Mechinagar', N'मेचीनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (29, 28, 4, N'Damak', N'दमक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (30, 29, 4, N'Kankai', N'कन्काई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (31, 30, 4, N'Bhadrapur', N'भद्रपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (32, 31, 4, N'Arjundhara', N'अर्जुनधारा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (33, 32, 4, N'Shivasatakshi', N'शिवसताक्षी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (34, 33, 4, N'Gauraadaha', N'गौरादह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (35, 34, 4, N'Birtamod', N'विर्तामोड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (36, 35, 4, N'Kamal', N'कमल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (37, 36, 4, N'	Buddha Shanti', N'बुद्धशान्ति')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (38, 37, 4, N'Kachankawal', N'	कचनकवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (39, 38, 4, N'Jhapa', N'झापा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (40, 39, 4, N'Barhadashi', N'बाह्रदशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (41, 40, 4, N'	Gaurigunj', N'गौरीगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (42, 41, 4, N'	Haldibari', N'	हल्दीवारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (43, 42, 5, N'Halesituwanchung', N'हलेसीतुवांचुंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (44, 43, 5, N'Rupakot Majhuwagadhi', N'रुपाकोट मझुवागढ़ी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (45, 44, 5, N'Khotehang', N'खोटेहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (46, 45, 5, N'	Diprung', N'दिप्रुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (47, 46, 5, N'	Aiselukharka', N'	ऐसेलुखर्क')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (48, 47, 5, N'Jantedhunga', N'	जन्तेढुंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (49, 48, 5, N'	Kepilasgadhi', N'	केपिलासगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (50, 49, 5, N'	Barahpokhari', N'	बराहपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (51, 50, 5, N'	Lamidanda', N'	लामीडाँडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (52, 51, 5, N'	Sakela', N'	साकेला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (53, 52, 6, N'Biratnagar', N'विराटनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (54, 53, 6, N'Belbari', N'बेलबारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (55, 54, 6, N'Letang', N'लेटांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (56, 55, 6, N'Pathari Sanischari', N'पथरी शनिश्चरे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (57, 56, 6, N'Rangeli', N'रंगेली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (58, 57, 6, N'Ratuwamaai', N'रतुवामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (59, 58, 6, N'Sunwarsi', N'सुनवर्षी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (60, 59, 6, N'Urlabari', N'उर्लाबारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (61, 60, 6, N'Sundarharaicha', N'सुन्दरहरैचा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (62, 61, 6, N'Jahada', N'जहदा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (63, 62, 6, N'	Budi Ganga', N'बुढीगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (64, 63, 6, N'Katahari', N'	कटहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (65, 64, 6, N'Dhanpalthan', N'धनपालथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (66, 65, 6, N'Kanepokhari', N'	कानेपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (67, 66, 6, N'	Gramthan', N'	ग्रामथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (68, 67, 6, N'	Kerabari', N'	केरावारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (69, 68, 6, N'	Miklajung', N'	मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (70, 69, 7, N'Siddhicharan', N'सिद्दिचरण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (71, 70, 7, N'Manebhanjyang', N'मानेभञ्ज्याङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (72, 71, 7, N'Champadevi', N'चम्पादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (73, 72, 7, N'Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (74, 73, 7, N'Molung', N'मोलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (75, 74, 7, N'Chisankhugadhi', N'चिसंखुगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (76, 75, 7, N'Khiji Demba', N'	खिजिदेम्बा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (77, 76, 7, N'Likhu', N'लिखु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (78, 77, 8, N'Fidim', N'फिदिम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (79, 78, 8, N'Miklajung', N'मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (80, 79, 8, N'	Phalgunanda', N'फाल्गुनन्द')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (81, 80, 8, N'	Hilihang', N'	हिलिहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (82, 81, 8, N'Phalelung', N'फालेलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (83, 82, 8, N'Yangwarak', N'याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (84, 83, 8, N'	Kummayak', N'कुम्मायक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (85, 84, 8, N'Tumbewa', N'तुम्बेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (86, 85, 9, N'Chainpur', N'चैनपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (87, 86, 9, N'Dharmadevi', N'धर्मदेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (88, 87, 9, N'Khandwari', N'खांदवारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (89, 88, 9, N'Maadi', N'मादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (90, 89, 9, N'Panchkhapan', N'पाँचखपन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (91, 90, 9, N'	Makalu', N'मकालु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (92, 91, 9, N'	Silichong', N'सिलीचोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (93, 92, 9, N'Sabhapokhari', N'सभापोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (94, 93, 9, N'Chichila', N'चिचिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (95, 94, 9, N'Bhot Khola', N'भोटखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (96, 95, 10, N'Solududhkunda', N'सोलुदुधकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (97, 96, 10, N'Dudhakaushika', N'	दुधकौशिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (98, 97, 10, N'Necha Salyan', N'नेचासल्यान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (99, 98, 10, N'Dudhkoshi', N'	दुधकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (100, 99, 10, N'Maha Kulung', N'महाकुलुङ')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (101, 100, 10, N'	Sotang', N'	सोताङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (102, 101, 10, N'	Khumbu Pasang Lhamu', N'खुम्बु पासाङल्हमु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (103, 102, 10, N'	Likhu Pike', N'	लिखुपिके')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (104, 103, 11, N'Iitahari', N'ईटहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (105, 104, 11, N'Dharan', N'धरान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (106, 105, 11, N'Inaruwa', N'इनरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (107, 106, 11, N'Duhabi', N'दुहवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (108, 107, 11, N'Ramdhuni', N'रामधुनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (109, 108, 11, N'Baraha', N'बराह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (110, 109, 11, N'Koshi', N'	कोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (111, 110, 11, N'	Harinagara', N'	हरिनगरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (112, 111, 11, N'	Bhokraha', N'	भोक्राहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (113, 112, 11, N'	Dewanganj', N'	देवानगन्ज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (114, 113, 11, N'	Gadhi', N'गढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (115, 114, 11, N'	Barju', N'	बर्जु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (116, 115, 12, N'Fungling', N'फुंलिंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (117, 116, 12, N'Sirijangha', N'	सिरीजङ्घा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (118, 117, 12, N'	Aathrai Triveni', N'आठराई त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (119, 118, 12, N'	Pathibhara Yangwarak', N'	पाथीभरा याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (120, 119, 12, N'	Meringden', N'	मेरिङदेन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (121, 120, 12, N'	Sidingwa', N'सिदिङ्वा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (122, 121, 12, N'	Phaktanglung', N'	फक्ताङलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (123, 122, 12, N'Maiwa Khola', N'	मैवाखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (124, 123, 12, N'Mikwa Khola', N'	मिक्वाखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (125, 124, 13, N'Myanglung', N'म्यांगलुंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (126, 125, 13, N'Laligurans', N'लालीगुराँस')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (127, 126, 13, N'Aathrai', N'आठराई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (128, 127, 13, N'	Phedap', N'फेदाप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (129, 128, 13, N'	Chhathar', N'	छथर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (130, 129, 13, N'	Menchayayem', N'	मेन्छयायेम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (131, 130, 14, N'Katari', N'कटारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (132, 131, 14, N'Chaudandigadhi', N'चौदण्डीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (133, 132, 14, N'Triyuga', N'त्रियुगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (134, 133, 14, N'Belakaa', N'वेलका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (135, 134, 14, N'Udayapurgadhi', N'उदयपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (136, 135, 14, N'Rautamai', N'रौतामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (137, 136, 14, N'Tapli', N'ताप्ली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (138, 137, 14, N'	Limchungbung', N'लिम्चुङबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (139, 138, 15, N'Birganj', N'बिरगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (140, 139, 15, N'Pokhariya', N'पोखरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (141, 140, 15, N'Sakhuwa Prasauni', N'	सखुवा प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (142, 141, 15, N'	Jagarnathpur', N'	जगरनाथपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (143, 142, 15, N'	Chhipaharmai', N'	छिपहरमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (144, 143, 15, N'Bindabasini', N'बिन्दबासिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (145, 144, 15, N'	Paterwa Sugauli', N'	पटेर्वा सुगौली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (146, 145, 15, N'	Jira Bhavani', N'	जिरा भवानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (147, 146, 15, N'Kalikamai', N'कालिकामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (148, 147, 15, N'	Pakaha Mainpur', N'पकाहा मैनपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (149, 148, 15, N'Thori', N'ठोरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (150, 149, 15, N'	Dhobini', N'धोबीनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (151, 150, 16, N'Kalaiya', N'कलैया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (152, 151, 16, N'Jitpursimara', N'जितपुरसिमरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (153, 152, 16, N'Kolhavi', N'कोल्हवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (154, 153, 16, N'Nijgadh', N'निजगढ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (155, 154, 16, N'Mahagadhimaai', N'महागढ़ीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (156, 155, 16, N'Simraungadh', N'सिम्रौनगढ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (157, 156, 16, N'Subarna', N'सुवर्ण ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (158, 157, 16, N'	Adarsha Kotwal', N'आदर्श कोतवाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (159, 158, 16, N'Baragadhi', N'बारागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (160, 159, 16, N'	Pheta', N'फेटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (161, 160, 16, N'Karaiyamai', N'करैयामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (162, 161, 16, N'Prasauni', N'प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (163, 162, 16, N'Bishrampur', N'विश्रामपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (164, 163, 16, N'Devtal', N'देवताल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (165, 164, 16, N'	Parawanipur', N'परवानीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (166, 165, 17, N'Chandrapur', N'चंद्रपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (167, 166, 17, N'Garuda', N'गरुडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (168, 167, 17, N'Gaur', N'गौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (169, 168, 17, N'Rajpur', N'राजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (170, 169, 17, N'Paroha', N'परोहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (171, 170, 17, N'Iishnaath', N'ईशनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (172, 171, 17, N'Fatuwabijayapur', N'फतुवाबिजयपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (173, 172, 17, N'Maulapur', N'मौलापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (174, 173, 17, N'Madhav Narayan', N'माधव नारायण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (175, 174, 17, N'Katahariya', N'कटहरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (176, 175, 17, N'Gujara', N'गुजरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (177, 176, 17, N'Gadhimaai', N'गढीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (178, 177, 17, N'Durga Bhagwati', N'दुर्गा भगवती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (179, 178, 17, N'Devahi Gonahi', N'देवाही गोनाही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (180, 179, 17, N'Brindavan', N'वृन्दावन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (181, 180, 17, N'Baudhimaai', N'बौधिमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (182, 181, 18, N'Iishworpur', N'ईश्वोरपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (183, 182, 18, N'Malangawa', N'मलंगवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (184, 183, 18, N'Lalbandi', N'लालबन्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (185, 184, 18, N'Haripur', N'हरिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (186, 185, 18, N'Haripurwa', N'हरिपुर्वा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (187, 186, 18, N'Harivan', N'हरिवन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (188, 187, 18, N'Barhathawa', N'बरहथवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (189, 188, 18, N'Balaraa', N'बलरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (190, 189, 18, N'Godaita', N'गोडेटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (191, 190, 18, N'Bagmati', N'बागमती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (192, 191, 18, N'Bishnu', N'विष्णु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (193, 192, 18, N'	Ramnagar', N'रामनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (194, 193, 18, N'Bramhapuri', N'ब्रह्मपुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (195, 194, 18, N'Dhankaul', N'धनकौल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (196, 195, 18, N'Chandranagar', N'चन्द्रनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (197, 196, 18, N'Chakraghatta', N'चक्रघट्टा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (198, 197, 18, N'Kabilasi', N'कविलासी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (199, 198, 18, N'Kaudena', N'कौडेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (200, 199, 18, N'Basbariya', N'बसबरिया')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (201, 200, 19, N'Janakpur', N'जनकपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (202, 201, 19, N'Kshireshwornath', N'क्षिरेश्वरनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (203, 202, 19, N'Ganeshman Chaarnath', N'गणेशमान चारनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (204, 203, 19, N'Dhanushadham', N'धनुषाधाम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (205, 204, 19, N'Nagarain', N'नगराइन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (206, 205, 19, N'Vedeha', N'विदेह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (207, 206, 19, N'Mithila', N'मिथिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (208, 207, 19, N'Shahidnagar', N'शहिदनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (209, 208, 19, N'Sabailaa', N'सबैला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (210, 209, 19, N'	Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (211, 210, 19, N'Hansapur', N'हंसपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (212, 211, 19, N'Laksminiya', N'लक्ष्मीनिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (213, 212, 19, N'Mukhiyapatti Musaharmiya', N'	मुखियापट्टी मुसहरमिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (214, 213, 19, N'Mithila Bihari', N'मिथिला बिहारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (215, 214, 19, N'	Bateshwar', N'बटेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (216, 215, 19, N'Janak Nandini', N'	जनकनन्दिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (217, 216, 19, N'Kamala Siddhidaatri', N'कमला सिद्धिदत्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (218, 217, 19, N'	Dhanauji', N'	धनौजी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (219, 218, 20, N'Lahaan', N'लहान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (220, 219, 20, N'Dhangadhimaai', N'धनगढीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (221, 220, 20, N'Siraha', N'सिरहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (222, 221, 20, N'Golbajar', N'गोलबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (223, 222, 20, N'Michaiyan', N'मिचैयाँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (224, 223, 20, N'Kalyanpur', N'कल्याणपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (225, 224, 20, N'	Bhagawanpur', N'भगवानपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (226, 225, 20, N'Aaurahi', N'	औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (227, 226, 20, N'Bishnupur', N'विष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (228, 227, 20, N'Bariyarpatti', N'बरियारपट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (229, 228, 20, N'Laksmipur Patari', N'लक्ष्मीपुर पतारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (230, 229, 20, N'	Naraha', N'नरहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (231, 230, 20, N'Sakhuwanankarkatti', N'	सखुवानान्कारकट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (232, 231, 20, N'Arnama', N'	अर्नमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (233, 232, 20, N'Nawarajpur', N'नवराजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (234, 233, 20, N'Sukhipur', N'सुखीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (235, 234, 20, N'Karjanha', N'कर्जन्हा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (236, 235, 21, N'Jaleshwor', N'जलेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (237, 236, 21, N'Bardibas', N'बर्दिबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (238, 237, 21, N'Gaushala', N'गौशाला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (239, 238, 21, N'	Ekdara', N'एकडारा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (240, 239, 21, N'	Sonama', N'सोनमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (241, 240, 21, N'Samsi', N'साम्सी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (242, 241, 21, N'Loharpatti', N'लोहारपट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (243, 242, 21, N'Ramgopalpur', N'रामगोपालपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (244, 243, 21, N'Mahottari', N'महोत्तरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (245, 244, 21, N'Manara', N'मनरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (246, 245, 21, N'Matihani', N'मटिहानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (247, 246, 21, N'Bhangaha', N'भंगाहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (248, 247, 21, N'Balawa', N'बलवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (249, 248, 21, N'Pipara', N'पिपरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (250, 249, 21, N'Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (251, 250, 22, N'Rajbiraj', N'राजविराज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (252, 251, 22, N'Kanchanrup', N'कन्चंरूप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (253, 252, 22, N'Daakneshwori', N'डाक्नेश्वरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (254, 253, 22, N'Bodebarsain', N'बोदेबरसाईन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (255, 254, 22, N'Khadak', N'खडक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (256, 255, 22, N'Shambhunath', N'शम्भुनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (257, 256, 22, N'Surunga', N'सुरुङ्गा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (258, 257, 22, N'Hanumannagar kankalini', N'हनुमाननगर कन्कालिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (259, 258, 22, N'Krishnasawaran', N'कृष्णासवरन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (260, 259, 22, N'Chhinnamasta', N'छिन्नमस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (261, 260, 22, N'Mahadeva', N'महादेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (262, 261, 22, N'Saptakoshi', N'सप्तकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (263, 262, 22, N'Tirhut', N'	तिरहुत')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (264, 263, 22, N'Tilathi Koiladi', N'तिलाठी कोईलाडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (265, 264, 22, N'	Rupani', N'रुपनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (266, 265, 22, N'Belhi Chapena', N'बेल्ही चपेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (267, 266, 22, N'	Bishnupur', N'	बिष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (268, 267, 22, N'	Aagnisaira Krishnasawaran', N'अग्निसाइर कृष्णासवरन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (269, 268, 22, N'Balan-Bihul', N'	बलान-बिहुल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (270, 269, 23, N'Kamalamaai', N'कमलामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (271, 270, 23, N'Dudhauli', N'दुधौली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (272, 271, 23, N'	Golanjor', N'गोलन्जोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (273, 272, 23, N'Ghyanglekh', N'घ्याङलेख')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (274, 273, 23, N'Tinpatan', N'तिनपाटन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (275, 274, 23, N'Phikkal', N'फिक्कल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (276, 275, 23, N'Marin', N'मरिण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (277, 276, 23, N'	Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (278, 277, 23, N'Hariharpurgadhi', N'हरिहरपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (279, 278, 24, N'Manthali', N'मन्थली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (280, 279, 24, N'Ramechhap', N'रामेछाप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (281, 280, 24, N'Umakunda', N'उमाकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (282, 281, 24, N'Khandadevi', N'खाँडादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (283, 282, 24, N'Gokulganga', N'गोकुलगङ्गा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (284, 283, 24, N'Doramba', N'दोरम्बा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (285, 284, 24, N'Likhu Tamakoshi', N'लिखु तामाकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (286, 285, 24, N'Sunapati', N'सुनापती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (287, 286, 25, N'Jiri', N'जिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (288, 287, 25, N'Bhimeshwor', N'भीमेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (289, 288, 25, N'Kalinchok', N'कालिन्चोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (290, 289, 25, N'Gaurishankar', N'गौरिशंकर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (291, 290, 25, N'Tamakoshi', N'तामाकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (292, 291, 25, N'Melung', N'मेलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (293, 292, 25, N'Bigu', N'विगु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (294, 293, 25, N'Baiteshwar', N'वैतेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (295, 294, 25, N'Shailung', N'शैलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (296, 295, 26, N'Changunarayan', N'चाँगुनारायण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (297, 296, 26, N'Bhaktapur', N'भक्तपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (298, 297, 26, N'Madhyapur Thimi', N'मध्यपुर थिमी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (299, 298, 26, N'Suryavinayak', N'सूर्यविनायक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (300, 299, 27, N'Dhunibensi', N'धुनीबेंशी')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (301, 300, 27, N'Nilkantha', N'नीलकण्ठ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (302, 301, 27, N'Khaniyabas', N'खनियाबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (303, 302, 27, N'Gajuri', N'गजुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (304, 303, 27, N'Galchhi', N'गल्छी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (305, 304, 27, N'Gangajamuna', N'गङ्गाजमुना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (306, 305, 27, N'Jwalamukhi', N'ज्वालामूखी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (307, 306, 27, N'Thakre', N'थाक्रे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (308, 307, 27, N'Netrawati Dabjong', N'नेत्रावती डबजोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (309, 308, 27, N'Benighat Rorang', N'बेनीघाट रोराङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (310, 309, 27, N'Ruby Valley', N'रुवी भ्याली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (311, 310, 27, N'Siddhalekh', N'सिद्धलेक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (312, 311, 27, N'Tripura Sundari', N'त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (313, 312, 28, N'Kathmandu', N'काठमाडौँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (314, 313, 28, N'Kageshwori Manohara', N'कागेश्वरी मनोहरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (315, 314, 28, N'Kirtipur', N'कीर्तिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (316, 315, 28, N'Gokarneshwor', N'गोकर्णेश्वोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (317, 316, 28, N'Chandragiri', N'चन्द्रागिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (318, 317, 28, N'Tokha', N'टोखा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (319, 318, 28, N'Tarkeshwor', N'तार्केश्वोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (320, 319, 28, N'Dakshinkali', N'दक्षिणकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (321, 320, 28, N'Nagarjun', N'नागार्जुन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (322, 321, 28, N'Budhanilkantha', N'बुढानिलकण्ठ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (323, 322, 28, N'Sankharapur', N'शंखारापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (324, 323, 29, N'Dhulikhel', N'धुलिखेल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (325, 324, 29, N'Banepa', N'बनेपा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (326, 325, 29, N'Panauti', N'पनौती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (327, 326, 29, N'Panchkhal', N'पाँचखाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (328, 327, 29, N'Namobudha', N'नमोबुद्ध')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (329, 328, 29, N'Khanikhola', N'खानीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (330, 329, 29, N'Chaunri Deurali', N'चौंरी देउराली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (331, 330, 29, N'Temal', N'तेमाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (332, 331, 29, N'Bethanchok', N'बेथानचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (333, 332, 29, N'Bhumlu', N'भुम्लु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (334, 333, 29, N'Mandandeupur', N'मण्डनदेउपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (335, 334, 29, N'Mahabharat', N'महाभारत')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (336, 335, 29, N'Roshi', N'रोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (337, 336, 30, N'Lalitpur', N'ललितपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (338, 337, 30, N'Godawari', N'गोदावरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (339, 338, 30, N'Mahalaksmi', N'महालक्ष्मी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (340, 339, 30, N'Konjyosom', N'कोन्ज्योसोम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (341, 340, 30, N'Bagmati', N'बाग्मती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (342, 341, 30, N'Mahankal', N'महाङ्काल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (343, 342, 31, N'Bidur', N'विदुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (344, 343, 31, N'Belkotgadhi', N'बेलकोटगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (345, 344, 31, N'	Kakani', N'ककनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (346, 345, 31, N'Kispang', N'किस्पाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (347, 346, 31, N'Tadi', N'तादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (348, 347, 31, N'Tarkeshwar', N'तारकेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (349, 348, 31, N'Dupcheshwar', N'दुप्चेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (350, 349, 31, N'Panchakanya', N'पञ्चकन्या')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (351, 350, 31, N'Likhu', N'लिखु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (352, 351, 31, N'Myagang', N'मेघांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (353, 352, 31, N'Shivapuri', N'शिवपुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (354, 353, 31, N'Suryagadhi', N'सुर्यगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (355, 354, 32, N'Uttargaya', N'उत्तरगया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (356, 355, 32, N'Kalika', N'कालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (357, 356, 32, N'Gosaikund', N'गोसाईकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (358, 357, 32, N'Naukunda', N'नौकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (359, 358, 32, N'Parbatikunda', N'पार्वतीकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (360, 359, 32, N'Aamachodingmo', N'आमाछोदिङमो')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (361, 360, 33, N'Chautara Sangachowkgadhi', N'चौतारा साँगाचोकगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (362, 361, 33, N'Barhabise', N'वाह्रबिसे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (363, 362, 33, N'Melamchi', N'मेलम्ची')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (364, 363, 33, N'Indrawati', N'र्इन्द्रावती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (365, 364, 33, N'Jugal', N'जुगल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (366, 365, 33, N'Panchpokhari Thangpal', N'पाँचपोखरी थाङपाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (367, 366, 33, N'Balephi', N'बलेफी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (368, 367, 33, N'Bhotekoshi', N'भोटेकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (369, 368, 33, N'	Lisankhu Pakhar', N'लिसंखु पाखर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (370, 369, 33, N'Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (371, 370, 33, N'	Helambu', N'हेलम्बु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (372, 371, 33, N'Tripura Sundari	', N'	त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (373, 372, 34, N'Bharatpur', N'भरतपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (374, 373, 34, N'Kalika', N'कालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (375, 374, 34, N'Khairhani', N'खैरहनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (376, 375, 34, N'Madi', N'माडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (377, 376, 34, N'Ratnnagar', N'रत्ननगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (378, 377, 34, N'Rapti', N'राप्ती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (379, 378, 34, N'	Ichchhakamana', N'इच्छाकामना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (380, 379, 35, N'Hetaunda', N'हेटौंडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (381, 380, 35, N'Thaha', N'थाहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (382, 381, 35, N'Indrasarowar', N'ईन्द्र सरोवर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (383, 382, 35, N'Kailash', N'कैलाश')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (384, 383, 35, N'Bakaiya', N'बकैया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (385, 384, 35, N'Bagmati', N'बाग्मती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (386, 385, 35, N'	Bhimphedi', N'भीमफेदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (387, 386, 35, N'Makawanpurgadhi', N'मकवानपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (388, 387, 35, N'	Manhari', N'मनहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (389, 388, 35, N'	Raksirang', N'राक्सिराङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (390, 389, 36, N'Baglung', N'बागलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (391, 390, 36, N'Galkot', N'गल्कोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (392, 391, 36, N'Jaimini', N'जैमिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (393, 392, 36, N'Dhorpatan', N'ढोरपाटन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (394, 393, 36, N'Bareng	', N'	वरेङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (395, 394, 36, N'	Kathekhola', N'काठेखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (396, 395, 36, N'Tamankhola', N'तमानखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (397, 396, 36, N'Tarakhola', N'ताराखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (398, 397, 36, N'Nisikhola', N'निसीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (399, 398, 36, N'Badigad', N'वडिगाड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (400, 399, 37, N'Gorkha', N'गोरखा')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (401, 400, 37, N'Palungtar', N'पालुंगटार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (402, 401, 37, N'	Barpak Sulikot', N'बारपाक सुलीकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (403, 402, 37, N'Siranchok', N'सिरानचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (404, 403, 37, N'Ajirkot', N'	अजिरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (405, 404, 37, N'Aarughat', N'आरूघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (406, 405, 37, N'Gandaki', N'गण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (407, 406, 37, N'	Chum Nubri', N'चुम नुव्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (408, 407, 37, N'Dharche', N'धार्चे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (409, 408, 37, N'Bhimsen Thapa', N'भिमसेनथापा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (410, 409, 37, N'Shahid Lakhan', N'शहिद लखन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (411, 410, 38, N'Pokhara Lekhnath', N'पोखरा लेखनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (412, 411, 38, N'Annapurna', N'अन्नपुर्ण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (413, 412, 38, N'Machhapuchhre', N'माछापुछ्रे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (414, 413, 38, N'Madi', N'मादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (415, 414, 38, N'	Rupa', N'रूपा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (416, 415, 39, N'Besishahar', N'बेसीशहर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (417, 416, 39, N'Madhyanepal', N'मध्यनेपाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (418, 417, 39, N'Rainas', N'राईनास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (419, 418, 39, N'Sundarbazar', N'सुन्दरबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (420, 419, 39, N'Kwaholasothar	', N'	क्व्होलासोथार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (421, 420, 39, N'Dudhpokhari', N'दूधपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (422, 421, 39, N'Dordi', N'दोर्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (423, 422, 39, N'Marsyangdi', N'मर्स्याङदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (424, 423, 40, N'Chame', N'चामे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (425, 424, 40, N'Narpa Bhumi', N'नार्पा भूमी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (426, 425, 40, N'	Nason', N'नासोँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (427, 426, 40, N'Manang Disyang', N'मनाङ डिस्याङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (428, 427, 41, N'Gharapjhong', N'घरपझोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (429, 428, 41, N'Thasang', N'थासाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (430, 429, 41, N'Lomanthang', N'लोमन्थाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (431, 430, 41, N'Baragung Muktichhetra', N'बारागुङ मुक्तिक्षेत्र')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (432, 431, 41, N'Lo-Ghekar Damodarkunda', N'	लो-घेकर दामोदरकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (433, 432, 42, N'Beni', N'बेनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (434, 433, 42, N'Annapurna', N'अन्नपुर्ण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (435, 434, 42, N'Dhaulagiri', N'धवलागिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (436, 435, 42, N'Mangala', N'मंगला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (437, 436, 42, N'Malika', N'मालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (438, 437, 42, N'Raghuganga', N'रघुगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (439, 438, 43, N'Kawasoti', N'कावासोती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (440, 439, 43, N'Gaindakot', N'गैंडाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (441, 440, 43, N'Devchuli', N'देवचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (442, 441, 43, N'Bardghat', N'बर्दघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (443, 442, 43, N'Madhyabindu', N'मध्यविन्दु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (444, 443, 43, N'Ramgram', N'रामग्राम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (445, 444, 43, N'Sunbal', N'सुनवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (446, 445, 43, N'Hupsekot', N'हुप्सेकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (447, 446, 43, N'Sarabal', N'सरावल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (448, 447, 43, N'Binayi Triveni', N'विनयी त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (449, 448, 43, N'Bulingtar', N'बुलिङटार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (450, 449, 43, N'	Baudikali', N'बौदीकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (451, 450, 43, N'Pratappur', N'प्रतापपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (453, 451, 43, N'Palhinandan', N'पाल्हीनन्दन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (454, 452, 43, N'Trivenisusta', N'त्रिवेणीसुस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (455, 453, 44, N'Kusma', N'कुश्मा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (456, 454, 44, N'Phlaebas', N'फलेवास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (457, 455, 44, N'Jaljala', N'जलजला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (458, 456, 44, N'Painyu', N'	पैयूं')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (459, 457, 44, N'	Mahashila', N'महाशिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (460, 458, 44, N'Modi', N'मोदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (461, 459, 44, N'Bihadi', N'विहादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (462, 460, 45, N'Galyang', N'गलयांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (463, 461, 45, N'Chapakot', N'चापाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (464, 462, 45, N'Putalibazar', N'पुतलीबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (465, 463, 45, N'Bhirkot', N'भीरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (466, 464, 45, N'Waling', N'वालिंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (467, 465, 45, N'Arjun Chaupari', N'अर्जुन चौपारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (468, 466, 45, N'Aandhikhola', N'आँधीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (469, 467, 45, N'Kaligandaki', N'कालीगण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (470, 468, 45, N'	Phedikhola', N'फेदीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (471, 469, 45, N'Biruwa', N'विरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (472, 470, 45, N'	Harinas', N'हरीनास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (473, 471, 46, N'Bhanu', N'भानु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (474, 472, 46, N'Bhimad', N'भिमाद')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (475, 473, 46, N'Vyas', N'व्यास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (476, 474, 46, N'ShuklaGandaki', N'शुक्लागण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (477, 475, 46, N'Aanbu Khaireni', N'आँबुखैरेनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (478, 476, 46, N'Rishing', N'ऋषिङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (479, 477, 46, N'Ghiring', N'घिरिङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (480, 478, 46, N'Devghat', N'देवघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (481, 479, 46, N'Myagde', N'म्याग्दे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (482, 480, 46, N'Bandipur', N'बन्दिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (483, 481, 47, N'Kapilvastu', N'कपिलवस्तु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (484, 482, 47, N'Buddhabhumi', N'बुद्धभुमि')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (485, 483, 47, N'Shivaraj', N'शिवराज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (486, 484, 47, N'Maharajgunj', N'महाराजगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (487, 485, 47, N'Krishnanagar', N'कृष्णनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (488, 486, 47, N'Baanganga', N'बाणगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (489, 487, 47, N'Mayadevi', N'मायादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (490, 488, 47, N'Yasodhara', N'यसोधरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (491, 489, 47, N'Shuddhodhan', N'शुद्धोधन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (492, 490, 47, N'Bijaynagar', N'विजयनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (493, 491, 48, N'Triveni Susta', N'त्रिवेणी सुस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (494, 492, 48, N'Pratappur', N'प्रतापपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (495, 493, 48, N'Sarawal', N'सरावल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (496, 494, 48, N'Palhi Nandan', N'पाल्हीनन्दन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (497, 495, 49, N'Butwal', N'बुटवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (498, 496, 49, N'Devdaha', N'देवदह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (499, 497, 49, N'Lumbini sanskritik', N'लुम्बिनी सांस्कृतिक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (500, 498, 49, N'SainaMaina', N'सैनामैना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (501, 499, 49, N'Siddarthanagar', N'सिद्दार्थनगर')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (502, 500, 49, N'Tilottama', N'तिलोत्तमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (503, 501, 49, N'Gaidhawa', N'गैडहवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (504, 502, 49, N'Kanchan', N'कञ्चन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (505, 503, 49, N'Kotahimai', N'कोटहीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (506, 504, 49, N'Marchawarimai', N'	मर्चवारीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (507, 505, 49, N'	Mayadevi', N'	मायादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (508, 506, 49, N'Om Satiya', N'	ओमसतीया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (509, 507, 49, N'	Rohini', N'	रोहिणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (510, 508, 49, N'Sammarimai', N'सम्मरीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (511, 509, 49, N'	Siyari', N'	सियारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (512, 510, 49, N'Shuddhodhan', N'	शुद्धोधन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (513, 511, 50, N'Sandhikharka', N'सन्धिखर्क')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (514, 512, 50, N'Shitganga', N'शितगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (515, 513, 50, N'Bhumikasthan', N'भूमिकास्थान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (516, 514, 50, N'	Chhatradev', N'	छत्रदेव')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (517, 515, 50, N'	Pandini', N'पाणिनी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (518, 516, 50, N'	Malarani', N'	मालारानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (519, 517, 51, N'Musikot', N'मुसिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (520, 518, 51, N'Resunga', N'रेसुंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (521, 519, 51, N'	Isma	', N'ईस्मा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (522, 520, 51, N'	Kaligandaki', N'कालीगण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (523, 521, 51, N'	Gulmi Durbar', N'	गुल्मीदरवार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (524, 522, 51, N'	Satyawati', N'	सत्यवती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (525, 523, 51, N'	Chandrakot', N'	चन्द्रकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (526, 524, 51, N'	Ruru', N'	रुरु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (527, 525, 51, N'	Chhatrakot', N'	छत्रकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (528, 526, 51, N'	Dhurkot', N'	धुर्कोट	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (529, 527, 51, N'Madane	', N'मदाने')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (530, 528, 51, N'	Malika	', N'	मालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (531, 529, 52, N'Rampur', N'रामपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (532, 530, 52, N'Tansen', N'तानसेन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (533, 531, 52, N'	Nisdi	', N'	निस्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (534, 532, 52, N'Purbakhola', N'	पूर्वखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (535, 533, 52, N'	Rambha	', N'	रम्भा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (536, 534, 52, N'	Mathagadhi', N'	माथागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (537, 535, 52, N'	Tinau	', N'	तिनाउ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (538, 536, 52, N'Bagnaskali	', N'	वगनासकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (539, 537, 52, N'Ribdikot	', N'रिब्दीकोट	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (540, 538, 52, N'	Rainadevi Chhahara', N'रैनादेवी छहरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (541, 539, 53, N'Tulsipur', N'तुलसीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (542, 540, 53, N'Ghorahi', N'घोराही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (543, 541, 53, N'Lamahi', N'लमही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (544, 542, 53, N'Banglachuli', N'वंगलाचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (545, 543, 53, N'	Dangisharan', N'दंगीशरण	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (546, 544, 53, N'	Gadhawa', N'गढवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (547, 545, 53, N'	Rajpur', N'राजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (548, 546, 53, N'Rapti', N'	राप्ती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (549, 547, 53, N'Shantinagar', N'	शान्तिनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (550, 548, 53, N'Babai', N'बबई	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (551, 549, 54, N'Pyuthan', N'प्युठान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (552, 550, 54, N'Swargadwari', N'स्वर्गद्वारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (553, 551, 54, N'	Gaumukhi', N'	गौमुखी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (554, 552, 54, N'Mandavi', N'माण्डवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (555, 553, 54, N'Sarumarani', N'सरुमारानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (556, 554, 54, N'Mallarani', N'मल्लरानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (557, 555, 54, N'Naubahini', N'नौबहिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (558, 556, 54, N'Jhimaruk	', N'झिमरुक	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (559, 557, 54, N'Airawati', N'ऐरावती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (560, 558, 55, N'Rolpa', N'रोल्पा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (561, 559, 55, N'Triveni	', N'त्रिवेणी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (562, 560, 55, N'Duikholi', N'दुइखोली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (563, 561, 55, N'Madi', N'माडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (564, 562, 55, N'Runtigadhi', N'रुन्टीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (565, 563, 55, N'Lungri	', N'लुङ्ग्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (566, 564, 55, N'Sukidaha', N'सुकिदह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (567, 565, 55, N'Sunchhahari	', N'सुनछहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (568, 566, 55, N'Suwarnawati', N'सुबर्णवती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (569, 567, 55, N'Thawang	', N'थवाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (570, 568, 56, N'Musikot', N'मुसिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (571, 569, 56, N'Chaurjahari', N'चौरजहारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (572, 570, 56, N'Aathbiskot', N'आठबिसकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (573, 571, 56, N'Putha Uttarganga', N'पुठा उत्तरगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (574, 572, 56, N'Bhume', N'भूमे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (575, 573, 56, N'	Sisne', N'सिस्ने')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (576, 574, 57, N'Nepalgunj', N'नेपालगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (577, 575, 57, N'Kohalpur', N'कोहलपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (578, 576, 57, N'Narainapur	', N'नरैनापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (579, 577, 57, N'Raptisonari', N'	राप्ती सोनारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (580, 578, 57, N'Baijnath	', N'वैजनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (581, 579, 57, N'Khajura', N'	खजुरा	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (582, 580, 57, N'Duduwa', N'डुडुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (583, 581, 57, N'Janaki', N'जानकी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (584, 582, 58, N'Gulariya', N'गुलरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (585, 583, 58, N'Madhuvan', N'मधुवन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (586, 584, 58, N'Rajapur', N'राजापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (587, 585, 58, N'Thakurbaba', N'ठाकुरबाबा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (588, 586, 58, N'Bansgadhi', N'बाँसगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (589, 587, 58, N'Barbardiya', N'बारबर्दिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (590, 588, 58, N'Badhaiyatal', N'बढैयाताल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (591, 589, 58, N'Geruwa', N'गेरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (592, 590, 59, N'Sani Bheri', N'सानीभेरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (593, 591, 59, N'Tribeni', N'त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (594, 592, 59, N'Banphikot', N'बाँफिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (595, 593, 60, N'Sharda', N'शारदा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (596, 594, 60, N'Bagchaur', N'बागचौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (597, 595, 60, N'Bangad Kupinde', N'बनगाड कुपिन्ड़े')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (598, 596, 60, N'Kalimati', N'कालीमाटी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (599, 597, 60, N'	Tribeni', N'त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (600, 598, 60, N'Kapurkot', N'कपुरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (601, 599, 60, N'	Chhatreshwari', N'छत्रेश्वरी')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (602, 600, 60, N'Dhorchaur', N'ढोरचौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (603, 601, 60, N'Kumakhmalika', N'कुमाखमालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (604, 602, 60, N'Darma', N'दार्मा	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (605, 603, 61, N'Thuli Bheri', N'ठुली भेरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (606, 604, 61, N'Tripurasundari', N'त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (607, 605, 61, N'Dolpo Buddha', N'डोल्पो बुद्ध')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (608, 606, 61, N'	She Phoksundo', N'	शे फोक्सुन्डो	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (609, 607, 61, N'Jagadulla', N'जगदुल्ला	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (610, 608, 61, N'Mudkechula	', N'मुड्केचुला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (611, 609, 61, N'	Kaike', N'काईके')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (612, 610, 61, N'	Chharka Tangsong', N'छार्का ताङसोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (613, 611, 62, N'Simkot', N'सिमकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (614, 612, 62, N'Namkha', N'नाम्खा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (615, 613, 62, N'Kharpunath', N'खार्पुनाथ	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (616, 614, 62, N'Sarkegad', N'सर्केगाड	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (617, 615, 62, N'Chankheli	', N'चंखेली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (618, 616, 62, N'	Adanchuli', N'अदानचुली	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (619, 617, 62, N'Tanjakot', N'ताँजाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (620, 618, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (621, 619, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (622, 620, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (623, 621, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (624, 622, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (625, 623, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (626, 624, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (627, 625, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (628, 626, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (629, 627, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (630, 628, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (631, 629, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (632, 630, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (633, 631, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (634, 632, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (635, 633, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (636, 634, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (637, 635, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (638, 636, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (639, 637, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (640, 638, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (641, 639, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (642, 640, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (643, 641, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (644, 642, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (645, 643, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (646, 644, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (647, 645, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (648, 646, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (649, 647, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (650, 648, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (651, 649, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (652, 650, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblPalika] OFF
SET IDENTITY_INSERT [dbo].[tblPanjika] ON 

INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo], [MigrationDartaFaramNo], [DivorceDartaFaramNo]) VALUES (1, 2, 16, 100, 1, N'आदर्श', N'aadarsh', 1, 3, 1, 1, N'04/19/2020', 1, N'04/26/2020', N'2077-01-07', N'04/19/2020 12:00:00 AM', N'12', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo], [MigrationDartaFaramNo], [DivorceDartaFaramNo]) VALUES (2, 1, 1, 3, 1, N'क क अदक', N'k k adk', 1, 3, 1, 1, N'04/26/2020', NULL, NULL, N'2077-01-14', N'04/26/2020 12:00:00 AM', N'1', 2, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo], [MigrationDartaFaramNo], [DivorceDartaFaramNo]) VALUES (3, 3, 28, 315, 9, N'क क अदक', N'aadarsh', 2, 3, 1, 1, N'04/26/2020', NULL, NULL, N'2077-01-08', N'04/20/2020 12:00:00 AM', N'12', 3, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo], [MigrationDartaFaramNo], [DivorceDartaFaramNo]) VALUES (4, 3, 25, 288, 1, N'क क अदक', N'sing', 2, 3, 1, 1, N'04/26/2020', 1, N'04/29/2020', N'2077-01-08', N'04/20/2020 12:00:00 AM', N'122', 4, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo], [MigrationDartaFaramNo], [DivorceDartaFaramNo]) VALUES (5, 1, 2, 11, 1, N'iy', N'ruytr', 0, 3, 1, 1, N'8/4/2020', NULL, NULL, N'2075-04-15', N'7/31/2018 12:00:00 AM', N'645', 1, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblPanjika] OFF
SET IDENTITY_INSERT [dbo].[tblRelation] ON 

INSERT [dbo].[tblRelation] ([RelationId], [RelationName], [RelationName_Nep]) VALUES (1, N'Mother', N'आमा')
INSERT [dbo].[tblRelation] ([RelationId], [RelationName], [RelationName_Nep]) VALUES (2, N'Father', N'बुबा')
INSERT [dbo].[tblRelation] ([RelationId], [RelationName], [RelationName_Nep]) VALUES (3, N'Elder sister', N'दिदी')
INSERT [dbo].[tblRelation] ([RelationId], [RelationName], [RelationName_Nep]) VALUES (4, N'Younger sister', N'बहिनी')
INSERT [dbo].[tblRelation] ([RelationId], [RelationName], [RelationName_Nep]) VALUES (5, N'Uncle', N'काका')
SET IDENTITY_INSERT [dbo].[tblRelation] OFF
SET IDENTITY_INSERT [dbo].[tblSifarisType] ON 

INSERT [dbo].[tblSifarisType] ([SifarisTypeId], [SifarisType]) VALUES (1, N'जन्म दर्ता')
INSERT [dbo].[tblSifarisType] ([SifarisTypeId], [SifarisType]) VALUES (2, N'मृत्यु दर्ता')
INSERT [dbo].[tblSifarisType] ([SifarisTypeId], [SifarisType]) VALUES (3, N'विवाह दर्ता')
INSERT [dbo].[tblSifarisType] ([SifarisTypeId], [SifarisType]) VALUES (4, N'बसाई सराई दर्ता')
INSERT [dbo].[tblSifarisType] ([SifarisTypeId], [SifarisType]) VALUES (5, N'सम्बन्ध बिच्छेद')
SET IDENTITY_INSERT [dbo].[tblSifarisType] OFF
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (1, 1, N'Province 1', N'प्रदेश १')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (2, 2, N'Province 2', N'प्रदेश २')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (3, 3, N'Bagmati', N'बागमती')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (4, 4, N'Gandaki', N'गण्डकी')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (5, 5, N'Province 5', N'प्रदेश ५')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (6, 6, N'Karnali', N'कर्णाली')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (7, 7, N'Sudurpaschim', N'सुदुरपश्चिम')
SET IDENTITY_INSERT [dbo].[tblState] OFF
SET IDENTITY_INSERT [dbo].[tblVivahBrideDetails] ON 

INSERT [dbo].[tblVivahBrideDetails] ([NewMarriageBrideDetailsId], [NewMarriageId], [NaamThar], [FullName], [JanmaMiti], [JaatJati], [MaritalStatus], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIsssueDistrict], [PassportNo_Desh], [BideshThegana], [ForeignThegana], [BajekoNaam], [Grandfather], [BabukoNaam], [FatherName], [AamakoNaam], [MotherName], [VivahGardaAge]) VALUES (1, 1, N'दिप', N'dip', N'2052-12-24', NULL, 0, 5, 4, N'hindu', N'nep', 3, 26, 298, 2, NULL, NULL, N'nep', N'nep', N'112/9970', N'2071-06-09', 26, NULL, NULL, NULL, N'जित', N'jit', N'कुमार', N'kumar', N'पर', N'par', 26)
SET IDENTITY_INSERT [dbo].[tblVivahBrideDetails] OFF
SET IDENTITY_INSERT [dbo].[tblVivahDarta] ON 

INSERT [dbo].[tblVivahDarta] ([NewMarriageId], [PanjiId], [VivahKisim], [VivahBhayekoMiti], [VivahBhayekoDate], [VivahPradesh], [VivahJilla], [VivahPalika], [VivahWardNo], [VivahGaunTole], [VivahGharNo], [VivahBidesh], [VivahForeign]) VALUES (1, 3, 1, N'2076-08-10', N'11/26/2019 12:00:00 AM', 3, 26, 298, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblVivahDarta] OFF
SET IDENTITY_INSERT [dbo].[tblVivahDartaInformant] ON 

INSERT [dbo].[tblVivahDartaInformant] ([NewMarriageInformantId], [NewMarriageId], [InfNaamThar], [InfFullName], [InfState], [InfDistrict], [InfPalika], [InfWardNo], [InfGaunTole], [InfGharNo], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblVivahDartaInformant] OFF
SET IDENTITY_INSERT [dbo].[tblVivahGroomDetails] ON 

INSERT [dbo].[tblVivahGroomDetails] ([NewMarriageGroomDetailsId], [NewMarriageId], [NaamThar], [FullName], [JanmaMiti], [JaatJati], [MaritalStatus], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIsssueDistrict], [PassportNo_Desh], [BideshThegana], [ForeignThegana], [BajekoNaam], [Grandfather], [BabukoNaam], [FatherName], [AamakoNaam], [MotherName], [VivahGardaAge]) VALUES (1, 1, N'हिम', N'hm', N'2052-02-28', NULL, 0, 5, 5, N'hindu', N'nep', 3, 28, 315, 4, NULL, NULL, N'nep', N'nep', N'110/9907', N'2070-05-06', 28, NULL, NULL, NULL, N'गित', N'git', N'राज', N'raj', N'अम्बु', N'ambu', 27)
SET IDENTITY_INSERT [dbo].[tblVivahGroomDetails] OFF
SET IDENTITY_INSERT [dbo].[tblVivahKisim] ON 

INSERT [dbo].[tblVivahKisim] ([VivahKisimId], [VivahKisim], [VivahKisim_Nep]) VALUES (1, N'Social Customs', N'सामाजिक परम्परा')
INSERT [dbo].[tblVivahKisim] ([VivahKisimId], [VivahKisim], [VivahKisim_Nep]) VALUES (2, N'Marriage Regitration Act,2028', N'विवाह दर्ता ऐन.२०२८')
SET IDENTITY_INSERT [dbo].[tblVivahKisim] OFF
SET IDENTITY_INSERT [dbo].[tblWorkOffice] ON 

INSERT [dbo].[tblWorkOffice] ([WorkOfficeId], [Title], [DistrictId], [WorkOfficeAddress]) VALUES (1, N'softech', 26, N'ktm')
SET IDENTITY_INSERT [dbo].[tblWorkOffice] OFF
SET IDENTITY_INSERT [dbo].[Ward] ON 

INSERT [dbo].[Ward] ([Id], [WardNo], [LocalLevelId]) VALUES (1, 1, 1)
INSERT [dbo].[Ward] ([Id], [WardNo], [LocalLevelId]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[Ward] OFF
SET IDENTITY_INSERT [dbo].[WardDetails] ON 

INSERT [dbo].[WardDetails] ([Id], [WardId], [Area], [Density], [Popullation]) VALUES (1, 1, N'12', N'66', N'67')
INSERT [dbo].[WardDetails] ([Id], [WardId], [Area], [Density], [Popullation]) VALUES (2, 2, N'12', N'65', N'15')
SET IDENTITY_INSERT [dbo].[WardDetails] OFF
SET IDENTITY_INSERT [dbo].[Year] ON 

INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (1, N'2070')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (2, N'2071')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (3, N'2072')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (4, N'2073')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (5, N'2074')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (6, N'2075')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (7, N'2076')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (8, N'2077')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (9, N'2078')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (10, N'2079')
INSERT [dbo].[Year] ([YearId], [YearName]) VALUES (11, N'2080')
SET IDENTITY_INSERT [dbo].[Year] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 8/5/2020 12:03:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Citizen_GharJagga_Info]  WITH CHECK ADD  CONSTRAINT [FK_Citizen_GharJagga_Info_Citizen_Info] FOREIGN KEY([Citizen_Id])
REFERENCES [dbo].[Citizen_Info] ([Id])
GO
ALTER TABLE [dbo].[Citizen_GharJagga_Info] CHECK CONSTRAINT [FK_Citizen_GharJagga_Info_Citizen_Info]
GO
ALTER TABLE [dbo].[Citizen_Info]  WITH CHECK ADD  CONSTRAINT [FK_Citizen_Info_Department] FOREIGN KEY([DeparmentId])
REFERENCES [dbo].[Department] ([DeparmentId])
GO
ALTER TABLE [dbo].[Citizen_Info] CHECK CONSTRAINT [FK_Citizen_Info_Department]
GO
ALTER TABLE [dbo].[DistrictDetails]  WITH CHECK ADD  CONSTRAINT [FK_DistrictDetails_District] FOREIGN KEY([DistId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[DistrictDetails] CHECK CONSTRAINT [FK_DistrictDetails_District]
GO
ALTER TABLE [dbo].[GharjaggakarFiles]  WITH CHECK ADD  CONSTRAINT [FK_GharjaggakarFiles_GharJaggaKar] FOREIGN KEY([GhraJaggaKarId])
REFERENCES [dbo].[GharJaggaKar] ([id])
GO
ALTER TABLE [dbo].[GharjaggakarFiles] CHECK CONSTRAINT [FK_GharjaggakarFiles_GharJaggaKar]
GO
ALTER TABLE [dbo].[JaagaTarfa]  WITH CHECK ADD  CONSTRAINT [FK_JaagaTarfa_Citizen_Info] FOREIGN KEY([CitizenId])
REFERENCES [dbo].[Citizen_Info] ([Id])
GO
ALTER TABLE [dbo].[JaagaTarfa] CHECK CONSTRAINT [FK_JaagaTarfa_Citizen_Info]
GO
ALTER TABLE [dbo].[Karlayatarfa]  WITH CHECK ADD  CONSTRAINT [FK_Karlayatarfa_Citizen_Info] FOREIGN KEY([citizen_ID])
REFERENCES [dbo].[Citizen_Info] ([Id])
GO
ALTER TABLE [dbo].[Karlayatarfa] CHECK CONSTRAINT [FK_Karlayatarfa_Citizen_Info]
GO
ALTER TABLE [dbo].[LocalLevel]  WITH CHECK ADD  CONSTRAINT [FK_LocalLevel_District] FOREIGN KEY([DistId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[LocalLevel] CHECK CONSTRAINT [FK_LocalLevel_District]
GO
ALTER TABLE [dbo].[LocalLevelDetails]  WITH CHECK ADD  CONSTRAINT [FK_LocalLevelDetails_LocalLevel] FOREIGN KEY([LocalLevelId])
REFERENCES [dbo].[LocalLevel] ([Id])
GO
ALTER TABLE [dbo].[LocalLevelDetails] CHECK CONSTRAINT [FK_LocalLevelDetails_LocalLevel]
GO
ALTER TABLE [dbo].[StateDetails]  WITH CHECK ADD  CONSTRAINT [FK_StateDetails_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[StateDetails] CHECK CONSTRAINT [FK_StateDetails_State]
GO
ALTER TABLE [dbo].[tblBasaisaraiDarta]  WITH CHECK ADD  CONSTRAINT [FK_tblBasaisaraiDarta_tblPanjika] FOREIGN KEY([PanjiId])
REFERENCES [dbo].[tblPanjika] ([PanjikaId])
GO
ALTER TABLE [dbo].[tblBasaisaraiDarta] CHECK CONSTRAINT [FK_tblBasaisaraiDarta_tblPanjika]
GO
ALTER TABLE [dbo].[tblBasaisaraiDartaInformant]  WITH CHECK ADD  CONSTRAINT [FK_tblBasaisaraiDartaInformant_tblBasaisaraiDarta] FOREIGN KEY([NewMigrationId])
REFERENCES [dbo].[tblBasaisaraiDarta] ([NewMigrationId])
GO
ALTER TABLE [dbo].[tblBasaisaraiDartaInformant] CHECK CONSTRAINT [FK_tblBasaisaraiDartaInformant_tblBasaisaraiDarta]
GO
ALTER TABLE [dbo].[tblBasaisaraiPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBasaisaraiPersonalDetails_tblBasaisaraiDarta] FOREIGN KEY([NewMigrationId])
REFERENCES [dbo].[tblBasaisaraiDarta] ([NewMigrationId])
GO
ALTER TABLE [dbo].[tblBasaisaraiPersonalDetails] CHECK CONSTRAINT [FK_tblBasaisaraiPersonalDetails_tblBasaisaraiDarta]
GO
ALTER TABLE [dbo].[tblDepartment]  WITH CHECK ADD  CONSTRAINT [FK_tblDepartment_tblDepartment] FOREIGN KEY([WorkOfficeId])
REFERENCES [dbo].[tblWorkOffice] ([WorkOfficeId])
GO
ALTER TABLE [dbo].[tblDepartment] CHECK CONSTRAINT [FK_tblDepartment_tblDepartment]
GO
ALTER TABLE [dbo].[tblDistrict]  WITH CHECK ADD  CONSTRAINT [FK_tblDistrict_tblDistrict] FOREIGN KEY([StateId_val])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblDistrict] CHECK CONSTRAINT [FK_tblDistrict_tblDistrict]
GO
ALTER TABLE [dbo].[tblDivorceDarta]  WITH CHECK ADD  CONSTRAINT [FK_tblDivorceDarta_tblPanjika] FOREIGN KEY([PanjiId])
REFERENCES [dbo].[tblPanjika] ([PanjikaId])
GO
ALTER TABLE [dbo].[tblDivorceDarta] CHECK CONSTRAINT [FK_tblDivorceDarta_tblPanjika]
GO
ALTER TABLE [dbo].[tblDivorceDartaInformant]  WITH CHECK ADD  CONSTRAINT [FK_tblDivorceDartaInformant_tblDivorceDarta] FOREIGN KEY([DivorceId])
REFERENCES [dbo].[tblDivorceDarta] ([DivorceId])
GO
ALTER TABLE [dbo].[tblDivorceDartaInformant] CHECK CONSTRAINT [FK_tblDivorceDartaInformant_tblDivorceDarta]
GO
ALTER TABLE [dbo].[tblDivorceeHusbandDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblDivorceeHusbandDetails_tblDivorceDarta] FOREIGN KEY([DivorceId])
REFERENCES [dbo].[tblDivorceDarta] ([DivorceId])
GO
ALTER TABLE [dbo].[tblDivorceeHusbandDetails] CHECK CONSTRAINT [FK_tblDivorceeHusbandDetails_tblDivorceDarta]
GO
ALTER TABLE [dbo].[tblDivorceeWifeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblDivorceeWifeDetails_tblDivorceDarta] FOREIGN KEY([DivorceId])
REFERENCES [dbo].[tblDivorceDarta] ([DivorceId])
GO
ALTER TABLE [dbo].[tblDivorceeWifeDetails] CHECK CONSTRAINT [FK_tblDivorceeWifeDetails_tblDivorceDarta]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblEmployee] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[tblUserTypes] ([UserTypeId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblEmployee]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblPadha] FOREIGN KEY([PadhaId])
REFERENCES [dbo].[tblPadha] ([PadhaId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblPadha]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblShreni] FOREIGN KEY([ShreniId])
REFERENCES [dbo].[tblShreni] ([ShreniId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblShreni]
GO
ALTER TABLE [dbo].[tblJanmaDarta]  WITH CHECK ADD  CONSTRAINT [FK_tblJanmaDarta_tblPanjika] FOREIGN KEY([PanjiId])
REFERENCES [dbo].[tblPanjika] ([PanjikaId])
GO
ALTER TABLE [dbo].[tblJanmaDarta] CHECK CONSTRAINT [FK_tblJanmaDarta_tblPanjika]
GO
ALTER TABLE [dbo].[tblJanmaDartaFatherDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblJanmaDartaFatherDetails_tblJanmaDarta] FOREIGN KEY([NewbornId])
REFERENCES [dbo].[tblJanmaDarta] ([NewbornId])
GO
ALTER TABLE [dbo].[tblJanmaDartaFatherDetails] CHECK CONSTRAINT [FK_tblJanmaDartaFatherDetails_tblJanmaDarta]
GO
ALTER TABLE [dbo].[tblJanmaDartaInformant]  WITH CHECK ADD  CONSTRAINT [FK_tblJanmaDartaInformant_tblJanmaDarta] FOREIGN KEY([NewbornId])
REFERENCES [dbo].[tblJanmaDarta] ([NewbornId])
GO
ALTER TABLE [dbo].[tblJanmaDartaInformant] CHECK CONSTRAINT [FK_tblJanmaDartaInformant_tblJanmaDarta]
GO
ALTER TABLE [dbo].[tblJanmaDartaMotherDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblJanmaDartaMotherDetails_tblJanmaDarta] FOREIGN KEY([NewbornId])
REFERENCES [dbo].[tblJanmaDarta] ([NewbornId])
GO
ALTER TABLE [dbo].[tblJanmaDartaMotherDetails] CHECK CONSTRAINT [FK_tblJanmaDartaMotherDetails_tblJanmaDarta]
GO
ALTER TABLE [dbo].[tblMrityuDarta]  WITH CHECK ADD  CONSTRAINT [FK_tblMrityuDarta_tblPanjika] FOREIGN KEY([PanjiId])
REFERENCES [dbo].[tblPanjika] ([PanjikaId])
GO
ALTER TABLE [dbo].[tblMrityuDarta] CHECK CONSTRAINT [FK_tblMrityuDarta_tblPanjika]
GO
ALTER TABLE [dbo].[tblMrityuDartaInformant]  WITH CHECK ADD  CONSTRAINT [FK_tblMrityuDartaInformant_tblMrityuDarta] FOREIGN KEY([NewdeathId])
REFERENCES [dbo].[tblMrityuDarta] ([NewDeathId])
GO
ALTER TABLE [dbo].[tblMrityuDartaInformant] CHECK CONSTRAINT [FK_tblMrityuDartaInformant_tblMrityuDarta]
GO
ALTER TABLE [dbo].[tblMrityuDartaPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblMrityuDartaPersonalDetails_tblMrityuDarta] FOREIGN KEY([NewDeathId])
REFERENCES [dbo].[tblMrityuDarta] ([NewDeathId])
GO
ALTER TABLE [dbo].[tblMrityuDartaPersonalDetails] CHECK CONSTRAINT [FK_tblMrityuDartaPersonalDetails_tblMrityuDarta]
GO
ALTER TABLE [dbo].[tblNabalakRelativeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNabalakRelativeDetails_tblNabalakSifaris] FOREIGN KEY([NabalakId])
REFERENCES [dbo].[tblNabalakSifaris] ([NabalakId])
GO
ALTER TABLE [dbo].[tblNabalakRelativeDetails] CHECK CONSTRAINT [FK_tblNabalakRelativeDetails_tblNabalakSifaris]
GO
ALTER TABLE [dbo].[tblNagariktaRelativeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNagariktaRelativeDetails_tblNagariktaSifaris] FOREIGN KEY([NagariktaId])
REFERENCES [dbo].[tblNagariktaSifaris] ([NewNagariktaId])
GO
ALTER TABLE [dbo].[tblNagariktaRelativeDetails] CHECK CONSTRAINT [FK_tblNagariktaRelativeDetails_tblNagariktaSifaris]
GO
ALTER TABLE [dbo].[tblNataPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNataPersonalDetails_tblNataPramanit] FOREIGN KEY([NataId])
REFERENCES [dbo].[tblNataPramanit] ([NewNataId])
GO
ALTER TABLE [dbo].[tblNataPersonalDetails] CHECK CONSTRAINT [FK_tblNataPersonalDetails_tblNataPramanit]
GO
ALTER TABLE [dbo].[tblPadha]  WITH CHECK ADD  CONSTRAINT [FK_tblPadha_tblShreni] FOREIGN KEY([ShreniId])
REFERENCES [dbo].[tblShreni] ([ShreniId])
GO
ALTER TABLE [dbo].[tblPadha] CHECK CONSTRAINT [FK_tblPadha_tblShreni]
GO
ALTER TABLE [dbo].[tblShakha]  WITH CHECK ADD  CONSTRAINT [FK_tblShakha_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([DepartmentId])
GO
ALTER TABLE [dbo].[tblShakha] CHECK CONSTRAINT [FK_tblShakha_tblDepartment]
GO
ALTER TABLE [dbo].[tblShakha]  WITH CHECK ADD  CONSTRAINT [FK_tblShakha_tblWorkOffice] FOREIGN KEY([WorkOfficeId])
REFERENCES [dbo].[tblWorkOffice] ([WorkOfficeId])
GO
ALTER TABLE [dbo].[tblShakha] CHECK CONSTRAINT [FK_tblShakha_tblWorkOffice]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD  CONSTRAINT [FK_tblState_tblState] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblState] CHECK CONSTRAINT [FK_tblState_tblState]
GO
ALTER TABLE [dbo].[tblUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_tblUserProfile_tblEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([EmployeeId])
GO
ALTER TABLE [dbo].[tblUserProfile] CHECK CONSTRAINT [FK_tblUserProfile_tblEmployee]
GO
ALTER TABLE [dbo].[tblVivahBrideDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblVivahBrideDetails_tblVivahDarta] FOREIGN KEY([NewMarriageId])
REFERENCES [dbo].[tblVivahDarta] ([NewMarriageId])
GO
ALTER TABLE [dbo].[tblVivahBrideDetails] CHECK CONSTRAINT [FK_tblVivahBrideDetails_tblVivahDarta]
GO
ALTER TABLE [dbo].[tblVivahDarta]  WITH CHECK ADD  CONSTRAINT [FK_tblVivahDarta_tblPanjika] FOREIGN KEY([PanjiId])
REFERENCES [dbo].[tblPanjika] ([PanjikaId])
GO
ALTER TABLE [dbo].[tblVivahDarta] CHECK CONSTRAINT [FK_tblVivahDarta_tblPanjika]
GO
ALTER TABLE [dbo].[tblVivahDartaInformant]  WITH CHECK ADD  CONSTRAINT [FK_tblVivahDartaInformant_tblVivahDarta] FOREIGN KEY([NewMarriageId])
REFERENCES [dbo].[tblVivahDarta] ([NewMarriageId])
GO
ALTER TABLE [dbo].[tblVivahDartaInformant] CHECK CONSTRAINT [FK_tblVivahDartaInformant_tblVivahDarta]
GO
ALTER TABLE [dbo].[tblVivahGroomDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblVivahGroomDetails_tblVivahDarta] FOREIGN KEY([NewMarriageId])
REFERENCES [dbo].[tblVivahDarta] ([NewMarriageId])
GO
ALTER TABLE [dbo].[tblVivahGroomDetails] CHECK CONSTRAINT [FK_tblVivahGroomDetails_tblVivahDarta]
GO
ALTER TABLE [dbo].[tblWorkOffice]  WITH CHECK ADD  CONSTRAINT [FK_tblWarehouse_tblDistrict] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[tblDistrict] ([DistrictId])
GO
ALTER TABLE [dbo].[tblWorkOffice] CHECK CONSTRAINT [FK_tblWarehouse_tblDistrict]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_LocalLevel] FOREIGN KEY([LocalLevelId])
REFERENCES [dbo].[LocalLevel] ([Id])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_LocalLevel]
GO
ALTER TABLE [dbo].[WardDetails]  WITH CHECK ADD  CONSTRAINT [FK_WardDetails_Ward] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([Id])
GO
ALTER TABLE [dbo].[WardDetails] CHECK CONSTRAINT [FK_WardDetails_Ward]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLocalDate]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROC[dbo].[sp_GetLocalDate](@RomanDate as DateTime,@Format as int)
AS
BEGIN
DECLARE 
	@EnDate AS DATE,
	@DaysDiff AS INT,
	@StartDate AS DATETIME,
	@EndDate AS DATETIME,
	@NPYear AS INT

SET @EnDate=@RomanDate
SELECT 
	@NPYear=NCAL_YEAR, 
	@StartDate=STRT_DATE,
	@EndDate=STOP_DATE
FROM 
	NpCalDb 
WHERE 
	STRT_DATE<=@EnDate AND STOP_DATE>=@EnDate

SET @DaysDiff=DATEDIFF(DD,@StartDate,@EnDate)

DECLARE 
	@iCount AS INT,
	@CurMonth AS INT,
	@OpDate AS DATETIME,
	@Days AS INT

SET @OpDate=@StartDate
SET @CurMonth=1
SET @iCount=1
WHILE(@OpDate<@EnDate)
BEGIN
	IF @CurMonth=1
		Select @Days=MONTH_1 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=2
		Select @Days=MONTH_2 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=3
		Select @Days=MONTH_3 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=4
		Select @Days=MONTH_4 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=5
		Select @Days=MONTH_5 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=6
		Select @Days=MONTH_6 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=7
		Select @Days=MONTH_7 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=8
		Select @Days=MONTH_8 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=9
		Select @Days=MONTH_9 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=10
		Select @Days=MONTH_10 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=11
		Select @Days=MONTH_11 From NpCalDb Where NCAL_YEAR=@NPYear
	ELSE IF @CurMonth=12
		Select @Days=MONTH_12 From NpCalDb Where NCAL_YEAR=@NPYear

	IF @Days=@iCount
	BEGIN
		SET @CurMonth=@CurMonth+1
		SET @iCount=0
	END
		SET @iCount=@iCount+1
		SET @OpDate=DATEADD(DD,1,@OpDate)
END

DECLARE @NPMonth AS NCHAR(2),@NPDay AS NCHAR(2),@NPMonthName AS NVARCHAR(15)
SET @NPMonth=CAST(@CurMonth AS NCHAR(2))
SET @NPDay=CAST(@iCount AS NCHAR(2))
	IF @CurMonth=1
		SET @NPMonthName=N'बैशाख'
	IF @CurMonth=2
		SET @NPMonthName=N'जेष्ठ'
	IF @CurMonth=3
		SET @NPMonthName=N'असार'
	IF @CurMonth=4
		SET @NPMonthName=N'श्रावण'
	IF @CurMonth=5
		SET @NPMonthName=N'भाद्र'
	IF @CurMonth=6
		SET @NPMonthName=N'असोज'
	IF @CurMonth=7
		SET @NPMonthName=N'कार्तिक'
	IF @CurMonth=8
		SET @NPMonthName=N'मंसिर'
	IF @CurMonth=9
		SET @NPMonthName=N'पुष'
	IF @CurMonth=10
		SET @NPMonthName=N'माघ'
	IF @CurMonth=11
		SET @NPMonthName=N'फाल्गुन'
	IF @CurMonth=12
		SET @NPMonthName=N'चैत्र'

DECLARE @RetString AS NVARCHAR(20)
IF @CurMonth<10 
	SET @NPMonth='0' + CAST(@CurMonth AS NCHAR(1))

IF @iCount<10 
	SET @NPDay='0' + CAST(@iCount AS NCHAR(1))
IF @Format=1
	SET @RetString=CAST(@NPYear AS NCHAR(4)) + '-' + RTRIM(CAST(@NPMonth AS NCHAR(2)))+ '-' + RTRIM(CAST(@NPDay AS NCHAR(2)))
ELSE IF @Format=2
	SET @RetString= RTRIM(CAST(@NPDay AS NCHAR(2)))+ '-' + RTRIM(CAST(@NPMonth AS NCHAR(2)))+ '-' + CAST(@NPYear AS NCHAR(4))
ELSE IF @Format=3
	SET @RetString=RTRIM(CAST(@NPDay AS NCHAR(2)))+' '+RTRIM(CAST(@NPMonthName AS NVARCHAR(10)))+', '+CAST(@NPYear AS NCHAR(4))

SELECT @RetString AS 'NepaliDate'
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GetRomanDate]    Script Date: 8/5/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

create Proc [dbo].[sp_GetRomanDate]
(
	@LocalYear as int,
	@LocalMonth as int,
	@LocalDay as int
)
AS
BEGIN
DECLARE 
	@EnDate AS DATETIME,
	@StartDate as DateTime,
	@EndDate as DateTime,
	@NPYear as int
SET @NPYear=@LocalYear
Select  @StartDate=STRT_DATE,@EndDate=STOP_DATE
from NpCalDb Where NCAL_YEAR=@NPYear


DECLARE @iCount as int,@CurMonth as int,@OpDate as DateTime,@Days as int,@LoopFlag as Bit
SET @LoopFlag=0
SET @OpDate=@StartDate
SET @CurMonth=1
SET @iCount=1
-------------------------------------
IF @CurMonth=@LocalMonth AND @iCount=@LocalDay
	SET @LoopFlag=1
-------------------------------------
WHILE(@LoopFlag=0)
BEGIN
	IF @CurMonth=1
		Select @Days=MONTH_1 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=2
		Select @Days=MONTH_2 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=3
		Select @Days=MONTH_3 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=4
		Select @Days=MONTH_4 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=5
		Select @Days=MONTH_5 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=6
		Select @Days=MONTH_6 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=7
		Select @Days=MONTH_7 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=8
		Select @Days=MONTH_8 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=9
		Select @Days=MONTH_9 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=10
		Select @Days=MONTH_10 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=11
		Select @Days=MONTH_11 From NpCalDb Where NCAL_YEAR=@NPYear
	IF @CurMonth=12
		Select @Days=MONTH_12 From NpCalDb Where NCAL_YEAR=@NPYear

IF @Days=@iCount
	BEGIN
	SET @CurMonth=@CurMonth+1
	SET @iCount=0
	END
SET @iCount=@iCount+1

SET @OpDate=DATEADD(DD,1,@OpDate)
-------------------------------------
IF @CurMonth=@LocalMonth AND @iCount=@LocalDay
	SET @LoopFlag=1
-------------------------------------
END

SELECT @OpDate AS 'RomanDate'
END










GO
USE [master]
GO
ALTER DATABASE [Sifarish] SET  READ_WRITE 
GO

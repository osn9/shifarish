USE [master]
GO
/****** Object:  Database [Sifaris]    Script Date: 04/19/2020 6:13:05 PM ******/
CREATE DATABASE [Sifaris] ON  PRIMARY 
( NAME = N'Sifaris', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Sifaris.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sifaris_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Sifaris_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sifaris].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sifaris] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sifaris] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sifaris] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sifaris] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sifaris] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sifaris] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sifaris] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sifaris] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sifaris] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sifaris] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sifaris] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sifaris] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sifaris] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sifaris] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sifaris] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sifaris] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sifaris] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sifaris] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sifaris] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sifaris] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sifaris] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sifaris] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sifaris] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sifaris] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sifaris] SET  MULTI_USER 
GO
ALTER DATABASE [Sifaris] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sifaris] SET DB_CHAINING OFF 
GO
USE [Sifaris]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLocalDate]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRomanDate]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[Month]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[NpCalDb]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblDistrict]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblEducation]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblFiscalYear]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblGender]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJaggaCharKillaBibaran]    Script Date: 04/19/2020 6:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJaggaCharKillaBibaran](
	[JaggaCharKillaBibaranId] [int] IDENTITY(1,1) NOT NULL,
	[JaggaDhaniBibaranId] [int] NOT NULL,
	[JaggaThaunBibaranId] [int] NOT NULL,
 CONSTRAINT [PK_tblJaggaCharKillaBibaran] PRIMARY KEY CLUSTERED 
(
	[JaggaCharKillaBibaranId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJaggaDhaniBibaran]    Script Date: 04/19/2020 6:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJaggaDhaniBibaran](
	[JaggaDhaniBibaranId] [int] IDENTITY(1,1) NOT NULL,
	[JaggaDhaniName] [nvarchar](50) NOT NULL,
	[StateId] [int] NULL,
	[DistrictId] [int] NULL,
	[PalikaId] [int] NULL,
	[WardNo] [int] NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[GrandfatherName] [nvarchar](50) NULL,
	[CitizenshipNo] [nvarchar](50) NOT NULL,
	[CtznIssueDate] [date] NULL,
	[CtznIssueDistrict] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [nvarchar](100) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [nvarchar](100) NULL,
	[SubmitOfficeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[FiscalYearId] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [date] NULL,
 CONSTRAINT [PK_tblJaggaDhaniBibaran] PRIMARY KEY CLUSTERED 
(
	[JaggaDhaniBibaranId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJaggaThaunBibaran]    Script Date: 04/19/2020 6:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJaggaThaunBibaran](
	[JaggaThaunBibaranId] [int] IDENTITY(1,1) NOT NULL,
	[JaggaDhaniBibaranId] [int] NOT NULL,
 CONSTRAINT [PK_tblJaggaBibaran] PRIMARY KEY CLUSTERED 
(
	[JaggaThaunBibaranId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblJanmadaMaddat]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaDarta]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaDartaFatherDetails]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaDartaInformant]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaDartaMotherDetails]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaKisim]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblJanmaSthaan]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblMrityuDarta]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblMrityuDartaInformant]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblMrityuDartaPersonalDetails]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblOccupation]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblPadha]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblPalika]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblPanjika]    Script Date: 04/19/2020 6:13:06 PM ******/
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
 CONSTRAINT [PK_tblPanjika] PRIMARY KEY CLUSTERED 
(
	[PanjikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRelation]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblShakha]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblShreni]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblSifarisType]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblState]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblUserProfile]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblUserTypes]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblVivahBrideDetails]    Script Date: 04/19/2020 6:13:06 PM ******/
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
 CONSTRAINT [PK_tblVivahBrideDetails] PRIMARY KEY CLUSTERED 
(
	[NewMarriageBrideDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVivahDarta]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblVivahDartaInformant]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[tblVivahGroomDetails]    Script Date: 04/19/2020 6:13:06 PM ******/
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
 CONSTRAINT [PK_tblVivahGroomDetails] PRIMARY KEY CLUSTERED 
(
	[NewMarriageGroomDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWorkOffice]    Script Date: 04/19/2020 6:13:06 PM ******/
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
/****** Object:  Table [dbo].[Year]    Script Date: 04/19/2020 6:13:06 PM ******/
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
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1992', CAST(0x0000325500000000 AS DateTime), CAST(0x000033C200000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1993', CAST(0x000033C300000000 AS DateTime), CAST(0x0000352F00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1994', CAST(0x0000353000000000 AS DateTime), CAST(0x0000369C00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1995', CAST(0x0000369D00000000 AS DateTime), CAST(0x0000380900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1996', CAST(0x0000380A00000000 AS DateTime), CAST(0x0000397700000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1997', CAST(0x0000397800000000 AS DateTime), CAST(0x00003AE400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1998', CAST(0x00003AE500000000 AS DateTime), CAST(0x00003C5100000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'1999', CAST(0x00003C5200000000 AS DateTime), CAST(0x00003DBF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2000', CAST(0x00003DC000000000 AS DateTime), CAST(0x00003F2C00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2001', CAST(0x00003F2D00000000 AS DateTime), CAST(0x0000409900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2002', CAST(0x0000409A00000000 AS DateTime), CAST(0x0000420600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2003', CAST(0x0000420700000000 AS DateTime), CAST(0x0000437400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2004', CAST(0x0000437500000000 AS DateTime), CAST(0x000044E100000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2005', CAST(0x000044E200000000 AS DateTime), CAST(0x0000464E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2006', CAST(0x0000464F00000000 AS DateTime), CAST(0x000047BB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2007', CAST(0x000047BC00000000 AS DateTime), CAST(0x0000492900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2008', CAST(0x0000492A00000000 AS DateTime), CAST(0x00004A9600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2009', CAST(0x00004A9700000000 AS DateTime), CAST(0x00004C0300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2010', CAST(0x00004C0400000000 AS DateTime), CAST(0x00004D7000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2011', CAST(0x00004D7100000000 AS DateTime), CAST(0x00004EDE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2012', CAST(0x00004EDF00000000 AS DateTime), CAST(0x0000504B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2013', CAST(0x0000504C00000000 AS DateTime), CAST(0x000051B800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2014', CAST(0x000051B900000000 AS DateTime), CAST(0x0000532500000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2015', CAST(0x0000532600000000 AS DateTime), CAST(0x0000549300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2016', CAST(0x0000549400000000 AS DateTime), CAST(0x0000560000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2017', CAST(0x0000560100000000 AS DateTime), CAST(0x0000576D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2018', CAST(0x0000576E00000000 AS DateTime), CAST(0x000058DA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2019', CAST(0x000058DB00000000 AS DateTime), CAST(0x00005A4800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2020', CAST(0x00005A4900000000 AS DateTime), CAST(0x00005BB500000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2021', CAST(0x00005BB600000000 AS DateTime), CAST(0x00005D2200000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2022', CAST(0x00005D2300000000 AS DateTime), CAST(0x00005E8F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2023', CAST(0x00005E9000000000 AS DateTime), CAST(0x00005FFD00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2024', CAST(0x00005FFE00000000 AS DateTime), CAST(0x0000616A00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2025', CAST(0x0000616B00000000 AS DateTime), CAST(0x000062D700000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2026', CAST(0x000062D800000000 AS DateTime), CAST(0x0000644500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
GO
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2027', CAST(0x0000644600000000 AS DateTime), CAST(0x000065B200000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2028', CAST(0x000065B300000000 AS DateTime), CAST(0x0000671F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2029', CAST(0x0000672000000000 AS DateTime), CAST(0x0000688C00000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2030', CAST(0x0000688D00000000 AS DateTime), CAST(0x000069FA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2031', CAST(0x000069FB00000000 AS DateTime), CAST(0x00006B6700000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2032', CAST(0x00006B6800000000 AS DateTime), CAST(0x00006CD400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2033', CAST(0x00006CD500000000 AS DateTime), CAST(0x00006E4100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2034', CAST(0x00006E4200000000 AS DateTime), CAST(0x00006FAF00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2035', CAST(0x00006FB000000000 AS DateTime), CAST(0x0000711C00000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2036', CAST(0x0000711D00000000 AS DateTime), CAST(0x0000728900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2037', CAST(0x0000728A00000000 AS DateTime), CAST(0x000073F600000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2038', CAST(0x000073F700000000 AS DateTime), CAST(0x0000756400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2039', CAST(0x0000756500000000 AS DateTime), CAST(0x000076D100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2040', CAST(0x000076D200000000 AS DateTime), CAST(0x0000783E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2041', CAST(0x0000783F00000000 AS DateTime), CAST(0x000079AB00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2042', CAST(0x000079AC00000000 AS DateTime), CAST(0x00007B1900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2043', CAST(0x00007B1A00000000 AS DateTime), CAST(0x00007C8600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2044', CAST(0x00007C8700000000 AS DateTime), CAST(0x00007DF300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2045', CAST(0x00007DF400000000 AS DateTime), CAST(0x00007F6000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2046', CAST(0x00007F6100000000 AS DateTime), CAST(0x000080CE00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2047', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000823B00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2048', CAST(0x0000823C00000000 AS DateTime), CAST(0x000083A800000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2049', CAST(0x000083A900000000 AS DateTime), CAST(0x0000851500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2050', CAST(0x0000851600000000 AS DateTime), CAST(0x0000868300000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2051', CAST(0x0000868400000000 AS DateTime), CAST(0x000087F000000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2052', CAST(0x000087F100000000 AS DateTime), CAST(0x0000895D00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2053', CAST(0x0000895E00000000 AS DateTime), CAST(0x00008ACA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2054', CAST(0x00008ACB00000000 AS DateTime), CAST(0x00008C3800000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2055', CAST(0x00008C3900000000 AS DateTime), CAST(0x00008DA500000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2056', CAST(0x00008DA600000000 AS DateTime), CAST(0x00008F1200000000 AS DateTime), 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2057', CAST(0x00008F1300000000 AS DateTime), CAST(0x0000908000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2058', CAST(0x0000908100000000 AS DateTime), CAST(0x000091ED00000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2059', CAST(0x000091EE00000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2060', CAST(0x0000935B00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2061', CAST(0x000094C800000000 AS DateTime), CAST(0x0000963500000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2062', CAST(0x0000963600000000 AS DateTime), CAST(0x000097A200000000 AS DateTime), 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2063', CAST(0x000097A300000000 AS DateTime), CAST(0x0000990F00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2064', CAST(0x0000991000000000 AS DateTime), CAST(0x00009A7C00000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2065', CAST(0x00009A7D00000000 AS DateTime), CAST(0x00009BEA00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2066', CAST(0x00009BEB00000000 AS DateTime), CAST(0x00009D5700000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2067', CAST(0x00009D5800000000 AS DateTime), CAST(0x00009EC400000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2068', CAST(0x00009EC500000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2069', CAST(0x0000A03200000000 AS DateTime), CAST(0x0000A19F00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2070', CAST(0x0000A1A000000000 AS DateTime), CAST(0x0000A30C00000000 AS DateTime), 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2071', CAST(0x0000A30D00000000 AS DateTime), CAST(0x0000A47900000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2072', CAST(0x0000A47A00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2073', CAST(0x0000A5E700000000 AS DateTime), CAST(0x0000A75400000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2074', CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A8C100000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2075', CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000AA2E00000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2076', CAST(0x0000AA2F00000000 AS DateTime), CAST(0x0000AB9B00000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2077', CAST(0x0000AB9C00000000 AS DateTime), CAST(0x0000AD0900000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2078', CAST(0x0000AD0A00000000 AS DateTime), CAST(0x0000AE7600000000 AS DateTime), 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2079', CAST(0x0000AE7700000000 AS DateTime), CAST(0x0000AFE300000000 AS DateTime), 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2080', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2081', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2082', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2083', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
INSERT [dbo].[NpCalDb] ([NCAL_YEAR], [STRT_DATE], [STOP_DATE], [MONTH_1], [MONTH_2], [MONTH_3], [MONTH_4], [MONTH_5], [MONTH_6], [MONTH_7], [MONTH_8], [MONTH_9], [MONTH_10], [MONTH_11], [MONTH_12], [BranchId]) VALUES (N'2084', CAST(0x0000AFE400000000 AS DateTime), CAST(0x0000B15000000000 AS DateTime), 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30, 0)
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

INSERT [dbo].[tblFiscalYear] ([FiscalYearId], [Title], [StartDate], [EndDate], [IsActive]) VALUES (1, N'२०७५/७६', CAST(0x7A3E0B00 AS Date), CAST(0xE83F0B00 AS Date), 0)
INSERT [dbo].[tblFiscalYear] ([FiscalYearId], [Title], [StartDate], [EndDate], [IsActive]) VALUES (3, N'२०७६/७७', CAST(0x06400B00 AS Date), CAST(0x75410B00 AS Date), 1)
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
SET IDENTITY_INSERT [dbo].[tblJanmaDarta] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaFatherDetails] ON 

INSERT [dbo].[tblJanmaDartaFatherDetails] ([NewbornFatherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIsssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa], [TotalChild], [TotalLiveChild], [VivahDartaNo], [VivahMiti], [VivahDate]) VALUES (3, 4, N'असोक', N'asok', 2, 16, 100, 1, N'कोतवाल', NULL, 28, N'nepal', N'nepal', N'124/566', N'2072-02-22', 16, NULL, 5, 4, NULL, NULL, 1, 1, N'123', N'2075-01-10', N'04/23/2018 12:00:00 AM')
SET IDENTITY_INSERT [dbo].[tblJanmaDartaFatherDetails] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaInformant] ON 

INSERT [dbo].[tblJanmaDartaInformant] ([NewBornInformantId], [NewbornId], [InfNaamThar], [InfFullName], [InfRelationToNewBorn], [InfState], [InfDistrict], [InfPalika], [InfWardNo], [InfGaunTole], [InfGharNo], [InfNagariktaPraPaNo], [InfNagariktaIssueDate], [InfNagariktaIssueDistrict], [InfPassportNo_Desh], [Miti]) VALUES (3, 4, N'राम', N'ram', 5, 2, 16, 100, 1, NULL, NULL, N'456/776', N'2069-01-22', NULL, NULL, N'2077-01-07')
SET IDENTITY_INSERT [dbo].[tblJanmaDartaInformant] OFF
SET IDENTITY_INSERT [dbo].[tblJanmaDartaMotherDetails] ON 

INSERT [dbo].[tblJanmaDartaMotherDetails] ([NewBornMotherId], [NewbornId], [NaamThar], [FullName], [PermaState], [PermaDistrict], [PermaPalika], [PermaWardNo], [GaunTole], [GharNo], [SisuJanmidakoUmer], [JanmaDesh], [NagariktaLiyekoDesh], [NagariktaPraPaNo], [NagariktaIssueDate], [NagariktaIssueDistrict], [PassportNo_Desh], [ShikshaSthar], [Pesha], [Dharma], [MatriBhasa]) VALUES (3, 4, N'आरिस्फा', N'aarisfa', 2, 16, 103, 2, N'कर्मिया', NULL, 27, N'nepal', N'nepal', N'125/899', N'2071-03-25', 16, NULL, 5, 5, NULL, NULL)
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

INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (1, 1, 1, N'Hatuwagadhi', N'हतुवागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (2, 2, 1, N'Ramprasad Rai', N'	रामप्रसाद राई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (3, 3, 1, N'	Aamchok', N'	आमचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (5, 4, 1, N'Tyamke Maiyum', N'ट्याम्केमैयुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (6, 5, 1, N'	Arun', N'	अरुण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (7, 6, 1, N'Pauwadungma', N'पौवादुङमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (8, 7, 1, N'	Salpasilichho', N'साल्पासिलिछो')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (9, 8, 2, N'Sangurigadhi', N'सागुरीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (10, 9, 2, N'Chaubise', N'चौविसे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (11, 10, 2, N'	Sahidbhumi', N'सहीदभूमि')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (12, 11, 2, N'Chhathar Jorpati', N'छथर जोरपाटी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (13, 12, 3, N'Phakphokthum', N'फाकफोकथुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (14, 13, 3, N'	Mai Jogmai', N'माईजोगमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (15, 14, 3, N'Chulachuli', N'चुलाचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (16, 15, 3, N'Rong', N'रोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (17, 16, 3, N'Mangsebung', N'माङसेबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (18, 17, 3, N'Sandakpur', N'सन्दकपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (19, 18, 4, N'Kamal', N'कमल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (20, 19, 4, N'Buddha Shanti', N'बुद्धशान्ति')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (21, 20, 4, N'Kachankawal', N'कचनकवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (22, 21, 4, N'	Jhapa', N'	झापा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (23, 22, 4, N'Barhadashi', N'बाह्रदशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (24, 23, 4, N'Gaurigunj', N'गौरीगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (25, 24, 4, N'	Haldibari', N'हल्दीवारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (26, 25, 5, N'Khotehang', N'खोटेहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (27, 26, 5, N'	Diprung', N'	दिप्रुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (28, 27, 5, N'Aiselukharka	', N'ऐसेलुखर्क')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (29, 28, 5, N'Jantedhunga', N'जन्तेढुंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (30, 29, 5, N'	Kepilasgadhi', N'केपिलासगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (31, 30, 5, N'Barahpokhari', N'बराहपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (32, 31, 5, N'Lamidanda', N'	लामीडाँडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (33, 32, 5, N'Sakela', N'साकेला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (34, 33, 6, N'Jahada', N'जहदा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (35, 34, 6, N'	Budi Ganga', N'बुढीगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (36, 35, 6, N'	Katahari', N'	कटहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (37, 36, 6, N'	Dhanpalthan', N'	धनपालथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (38, 37, 6, N'	Kanepokhari', N'कानेपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (39, 38, 6, N'	Gramthan', N'	ग्रामथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (40, 39, 6, N'	Kerabari', N'	केरावारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (41, 40, 6, N'	Miklajung', N'	मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (42, 41, 7, N'Manebhanjyang', N'मानेभञ्ज्याङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (43, 42, 7, N'	Champadevi', N'चम्पादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (44, 43, 7, N'	Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (45, 44, 7, N'Molung', N'मोलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (46, 45, 7, N'	Chisankhugadhi', N'	चिसंखुगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (47, 46, 7, N'	Khiji Demba', N'	खिजिदेम्बा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (48, 47, 7, N'	Likhu', N'	लिखु	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (49, 48, 8, N'	Miklajung', N'	मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (50, 49, 8, N'	Phalgunanda', N'	फाल्गुनन्द')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (51, 50, 8, N'	Hilihang', N'	हिलिहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (52, 51, 8, N'Phalelung', N'	फालेलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (53, 52, 8, N'Yangwarak', N'	याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (54, 53, 8, N'	Kummayak', N'	कुम्मायक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (55, 54, 8, N'	Tumbewa', N'	तुम्बेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (56, 55, 9, N'	Makalu', N'	मकालु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (57, 56, 9, N'	Silichong', N'	सिलीचोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (58, 57, 9, N'	Sabhapokhari', N'सभापोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (59, 58, 9, N'	Chichila', N'	चिचिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (60, 59, 9, N'Bhot Khola', N'	भोटखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (61, 60, 10, N'Dudhakaushika', N'	दुधकौशिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (62, 61, 10, N'Necha Salyan', N'नेचासल्यान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (63, 62, 10, N'	Dudhkoshi', N'	दुधकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (64, 63, 10, N'Maha Kulung', N'महाकुलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (65, 64, 10, N'	Sotang', N'	सोताङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (66, 65, 10, N'Khumbu Pasang Lhamu', N'खुम्बु पासाङल्हमु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (67, 66, 10, N'	Likhu Pike', N'लिखुपिके')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (68, 67, 11, N'	Koshi', N'	कोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (69, 68, 11, N'Harinagara', N'हरिनगरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (70, 69, 11, N'	Bhokraha', N'भोक्राहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (71, 70, 11, N'	Dewanganj', N'देवानगन्ज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (72, 71, 11, N'Gadhi', N'	गढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (73, 72, 11, N'Barju', N'बर्जु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (74, 73, 12, N'Sirijangha', N'सिरीजङ्घा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (75, 74, 12, N'Aathrai Triveni', N'	आठराई त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (76, 75, 12, N'	Pathibhara Yangwarak', N'	पाथीभरा याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (77, 76, 12, N'	Meringden', N'मेरिङदेन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (78, 77, 12, N'	Sidingwa', N'	सिदिङ्वा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (79, 78, 12, N'Phaktanglung', N'	फक्ताङलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (80, 79, 12, N'	Maiwa Khola', N'	मैवाखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (81, 80, 12, N'	Mikwa Khola', N'मिक्वाखोला	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (82, 81, 13, N'Aathrai', N'आठराई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (83, 82, 13, N'Phedap', N'फेदाप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (84, 83, 13, N'	Chhathar', N'छथर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (85, 84, 13, N'	Menchayayem', N'	मेन्छयायेम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (86, 85, 14, N'Udayapurgadhi', N'उदयपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (87, 86, 14, N'Rautamai', N'रौतामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (88, 87, 14, N'	Tapli', N'ताप्ली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (89, 88, 14, N'Limchungbung', N'लिम्चुङबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (90, 89, 15, N'Sakhuwa Prasauni', N'सखुवा प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (91, 90, 15, N'	Jagarnathpur', N'जगरनाथपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (92, 91, 15, N'Chhipaharmai', N'छिपहरमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (93, 92, 15, N'	Bindabasini', N'बिन्दबासिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (94, 93, 15, N'Paterwa Sugauli', N'पटेर्वा सुगौली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (95, 94, 15, N'Jira Bhavani', N'जिरा भवानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (96, 95, 15, N'Kalikamai', N'कालिकामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (97, 96, 15, N'Pakaha Mainpur', N'	पकाहा मैनपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (98, 97, 15, N'	Thori', N'	ठोरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (99, 98, 15, N'Dhobini', N'	धोबीनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (100, 99, 16, N'Subarna', N'सुवर्ण ')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (101, 100, 16, N'	Adarsha Kotwal', N'आदर्श कोतवाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (102, 101, 16, N'	Baragadhi', N'	बारागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (103, 102, 16, N'Pheta', N'	फेटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (104, 103, 16, N'Karaiyamai', N'	करैयामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (105, 104, 16, N'	Prasauni', N'	प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (106, 105, 16, N'	Bishrampur', N'	विश्रामपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (107, 106, 16, N'	Devtal', N'	देवताल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (108, 107, 16, N'	Parawanipur', N'	परवानीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (109, 108, 17, N'Durga Bhagawati', N'दुर्गा भगवती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (110, 109, 17, N'	Yamunamai', N'	यमुनामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (111, 110, 18, N'Chandranagar', N'	चन्द्रनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (112, 111, 18, N'	Bramhapuri', N'	ब्रह्मपुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (113, 112, 18, N'	Ramnagar', N'	रामनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (114, 113, 18, N'Chakraghatta', N'चक्रघट्टा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (115, 114, 18, N'Kaudena', N'कौडेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (116, 115, 18, N'Dhankaul', N'धनकौल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (117, 116, 18, N'Bishnu', N'विष्णु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (118, 117, 18, N'Basbariya', N'बसबरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (119, 118, 18, N'Parsa', N'पर्सा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (120, 119, 19, N'Laksminiya', N'लक्ष्मीनिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (121, 120, 19, N'Mukhiyapatti Musaharmiya', N'मुखियापट्टी मुसहरमिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (122, 121, 19, N'Janak Nandini', N'जनकनन्दिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (123, 122, 19, N'Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (124, 123, 19, N'Bateshwar', N'बटेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (125, 124, 19, N'Dhanauji', N'धनौजी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (126, 125, 20, N'Laksmipur Patari', N'लक्ष्मीपुर पतारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (127, 126, 20, N'Bariyarpatti', N'बरियारपट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (128, 127, 20, N'Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (129, 128, 20, N'	Arnama', N'अर्नमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (130, 129, 20, N'	Bhagawanpur', N'	भगवानपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (131, 130, 20, N'	Naraha', N'	नरहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (132, 131, 20, N'	Nawarajpur', N'	नवराजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (133, 132, 20, N'	Sakhuwanankarkatti', N'	सखुवानान्कारकट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (134, 133, 20, N'	Bishnupur', N'	विष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (135, 134, 21, N'	Sonama', N'सोनमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (136, 135, 21, N'	Pipara', N'	पिपरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (137, 136, 21, N'	Samsi', N'	साम्सी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (138, 137, 21, N'	Ekdara', N'	एकडारा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (139, 138, 21, N'Mahottari', N'महोत्तरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (140, 139, 22, N'Tilathi Koiladi', N'तिलाठी कोईलाडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (141, 140, 22, N'Belhi Chapena', N'	बेल्ही चपेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (142, 141, 22, N'Chhinnamasta', N'छिन्नमस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (143, 142, 22, N'Mahadeva', N'महादेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (144, 143, 22, N'Aagnisaira Krishnasawaran', N'अग्निसाइर कृष्णासवरन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (145, 144, 22, N'	Rupani', N'	रुपनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (146, 145, 22, N'	Balan-Bihul', N'बलान-बिहुल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (147, 146, 22, N'Bishnupur', N'बिष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (148, 147, 22, N'Tirhut', N'	तिरहुत')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (149, 148, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (150, 149, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (151, 150, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblPalika] OFF
SET IDENTITY_INSERT [dbo].[tblPanjika] ON 

INSERT [dbo].[tblPanjika] ([PanjikaId], [PanjiState], [PanjiDistrict], [PanjiPalika], [PanjiWardNo], [PanjiNaamThar], [PanjiFullName], [Panji_INVId], [FiscalYear], [WorkOffice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [FaramDartaMiti], [FaramDartaDate], [PariwarLagatNo], [SifarisType], [JanmaDartaFaramNo], [MrityuDartaFaramNo], [VivahDartaFaramNo]) VALUES (1, 2, 16, 100, 1, N'आदर्श', N'aadarsh', 1, 3, 1, 1, N'04/19/2020', NULL, NULL, N'2077-01-07', N'04/19/2020 12:00:00 AM', N'12', 1, 1, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[tblWorkOffice] ON 

INSERT [dbo].[tblWorkOffice] ([WorkOfficeId], [Title], [DistrictId], [WorkOfficeAddress]) VALUES (1, N'softech', 26, N'ktm')
SET IDENTITY_INSERT [dbo].[tblWorkOffice] OFF
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
ALTER TABLE [dbo].[tblJaggaCharKillaBibaran]  WITH CHECK ADD  CONSTRAINT [FK_tblJaggaCharKillaBibaran_tblJaggaCharKillaBibaran] FOREIGN KEY([JaggaThaunBibaranId])
REFERENCES [dbo].[tblJaggaThaunBibaran] ([JaggaThaunBibaranId])
GO
ALTER TABLE [dbo].[tblJaggaCharKillaBibaran] CHECK CONSTRAINT [FK_tblJaggaCharKillaBibaran_tblJaggaCharKillaBibaran]
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
USE [master]
GO
ALTER DATABASE [Sifaris] SET  READ_WRITE 
GO

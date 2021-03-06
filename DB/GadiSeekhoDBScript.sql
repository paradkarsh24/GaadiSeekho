USE [master]
GO
/****** Object:  Database [GadiSeekho]    Script Date: 24-10-2018 06:38:50 PM ******/
CREATE DATABASE [GadiSeekho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GadiSeekho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GadiSeekho.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GadiSeekho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GadiSeekho_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GadiSeekho] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GadiSeekho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GadiSeekho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GadiSeekho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GadiSeekho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GadiSeekho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GadiSeekho] SET ARITHABORT OFF 
GO
ALTER DATABASE [GadiSeekho] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GadiSeekho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GadiSeekho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GadiSeekho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GadiSeekho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GadiSeekho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GadiSeekho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GadiSeekho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GadiSeekho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GadiSeekho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GadiSeekho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GadiSeekho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GadiSeekho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GadiSeekho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GadiSeekho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GadiSeekho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GadiSeekho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GadiSeekho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GadiSeekho] SET  MULTI_USER 
GO
ALTER DATABASE [GadiSeekho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GadiSeekho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GadiSeekho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GadiSeekho] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GadiSeekho] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GadiSeekho', N'ON'
GO
USE [GadiSeekho]
GO
/****** Object:  Table [dbo].[Alert]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[AlertId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Alert] PRIMARY KEY CLUSTERED 
(
	[AlertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetPermissions]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetPermissions](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](140) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRolePermissions]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRolePermissions](
	[RoleId] [nvarchar](128) NOT NULL,
	[PermissionId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetRolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24-10-2018 06:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24-10-2018 06:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserMobileOtp]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserMobileOtp](
	[AspNetUserMobileOtpId] [int] IDENTITY(1,1) NOT NULL,
	[MobileNumber] [decimal](18, 0) NOT NULL,
	[UserId] [nvarchar](256) NULL,
	[OTP] [int] NOT NULL,
	[OTPCreatedDateTime] [datetime] NOT NULL,
	[OTPRequestedCount] [int] NULL,
	[OTPReasonId] [int] NOT NULL,
	[OTPValidDateTime] [datetime] NOT NULL,
	[IPAddress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AspNetUserMobileOtp] PRIMARY KEY CLUSTERED 
(
	[AspNetUserMobileOtpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserPermissions]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserPermissions](
	[UserId] [nvarchar](128) NOT NULL,
	[PermissionId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserPermissions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24-10-2018 06:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[PersonnelId] [int] NULL,
	[Name] [varchar](100) NULL,
	[CentreId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetUsersAlertSchedule]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersAlertSchedule](
	[AspnetUsersAlertScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUsersId] [nvarchar](128) NOT NULL,
	[AlertId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsersAlertSchedule] PRIMARY KEY CLUSTERED 
(
	[AspnetUsersAlertScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Car]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[CityMileage] [varchar](100) NULL,
	[ARAIMileage] [varchar](100) NULL,
	[FuelType] [varchar](100) NOT NULL,
	[Engine] [int] NOT NULL,
	[MaxPower] [varchar](100) NULL,
	[MaxTorque] [varchar](100) NULL,
	[Seating] [int] NULL,
	[EngineDescription] [varchar](500) NOT NULL,
	[TransmissionType] [varchar](100) NULL,
	[CargoVolume] [varchar](100) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarType]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarType](
	[CarTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
 CONSTRAINT [PK_CarType] PRIMARY KEY CLUSTERED 
(
	[CarTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentCategory]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentCategory](
	[DocumentCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FileNameRegex] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DocumentCategory] PRIMARY KEY CLUSTERED 
(
	[DocumentCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocumentDetail]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentDetail](
	[DocumentDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentGUID] [uniqueidentifier] NOT NULL,
	[PersonnelId] [nvarchar](128) NULL,
	[FileName] [varchar](500) NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UpdatedDateUTC] [datetime] NULL,
	[CreatedDateUTC] [datetime] NOT NULL CONSTRAINT [DF_DocumentDetail_CreatedDateUTC]  DEFAULT (getutcdate()),
	[Description] [nvarchar](255) NULL,
	[DownloadedDateUtc] [datetime] NULL,
	[ApprovedDateUtc] [datetime] NULL,
	[EmailSentDateUtc] [datetime] NULL,
	[RequireApproval] [bit] NULL,
	[UncPath] [nvarchar](max) NULL,
	[RelativePath] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[ClientFileName] [nvarchar](255) NULL,
	[DocumentBatchId] [int] NULL,
 CONSTRAINT [PK_DocumentDetail] PRIMARY KEY CLUSTERED 
(
	[DocumentDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[DrivingLicenceNumber] [varchar](500) NOT NULL,
	[IssuedDate] [date] NOT NULL,
	[ValidTill] [date] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Mobile] [bigint] NOT NULL,
	[Address1] [varchar](500) NOT NULL,
	[Address2] [varchar](500) NOT NULL,
	[Address3] [varchar](500) NULL,
	[Address4] [varchar](500) NULL,
	[Pincode] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DriverFeedback]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverFeedback](
	[DriverFeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [int] NOT NULL,
	[HasYourDrivingInstructorEverBeenLateForALesson] [varchar](100) NULL,
	[HasYourDrivingInstructorEverMadeYouFeelUncomfortable] [varchar](100) NULL,
	[WouldYouRecommendThisDrivingSchoolToFriends] [varchar](100) NULL,
	[DoYouThinkThisSyllabusWillMakeYouASaferDriver] [varchar](100) NULL,
	[Comment] [varchar](max) NULL,
	[Rating] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_DriverFeedback] PRIMARY KEY CLUSTERED 
(
	[DriverFeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DrivingSchool]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DrivingSchool](
	[DrivingSchoolId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Address1] [varchar](500) NOT NULL,
	[Address2] [varchar](500) NULL,
	[Address3] [varchar](500) NULL,
	[Address4] [varchar](500) NULL,
	[Pincode] [int] NOT NULL,
	[Mobile] [bigint] NOT NULL,
	[Telephone] [varchar](100) NULL,
	[EmailId] [varchar](100) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[MinimumFeeWithLicense] [decimal](18, 0) NULL,
	[MinimumFeeWithOutLicense] [decimal](18, 0) NULL,
	[PersonnelId] [int] NOT NULL,
 CONSTRAINT [PK_DrivingSchool] PRIMARY KEY CLUSTERED 
(
	[DrivingSchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DrivingSchoolCar]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrivingSchoolCar](
	[DrivingSchoolCarId] [int] IDENTITY(1,1) NOT NULL,
	[DrivingSchoolId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_DrivingSchoolCar] PRIMARY KEY CLUSTERED 
(
	[DrivingSchoolCarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrivingSchoolCarFee]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrivingSchoolCarFee](
	[DrivingSchoolCarFeeId] [int] IDENTITY(1,1) NOT NULL,
	[DrivingSchoolCarId] [int] NOT NULL,
	[WithLicenseFee] [decimal](18, 0) NOT NULL,
	[WithoutLicenseFee] [decimal](18, 0) NOT NULL,
	[DiscountAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DrivingSchoolCarFee] PRIMARY KEY CLUSTERED 
(
	[DrivingSchoolCarFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrivingSchoolRatingAndReview]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DrivingSchoolRatingAndReview](
	[DrivingSchoolRatingAndReviewId] [int] IDENTITY(1,1) NOT NULL,
	[DrivingSchoolId] [int] NOT NULL,
	[Rating] [decimal](18, 0) NOT NULL,
	[Review] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_DrivingSchoolRatingAndReview] PRIMARY KEY CLUSTERED 
(
	[DrivingSchoolRatingAndReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personnel](
	[PersonnelId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Forenames] [nvarchar](100) NULL,
	[Surname] [nvarchar](50) NULL,
	[DOB] [datetime2](7) NULL,
	[CountryId] [int] NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[Address4] [nvarchar](100) NULL,
	[Postcode] [nvarchar](12) NULL,
	[Telephone] [varchar](15) NULL,
	[Mobile] [varchar](15) NULL,
	[PANNumber] [varchar](10) NULL,
	[BankTelephone] [varchar](15) NULL,
	[Email] [varchar](256) NULL,
	[UserId] [nvarchar](128) NULL,
	[IsDrivingSchool] [bit] NOT NULL,
 CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED 
(
	[PersonnelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonnelDocument]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonnelDocument](
	[PersonnelDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[DocumentDetailId] [int] NOT NULL,
 CONSTRAINT [PK_PersonnelDocument] PRIMARY KEY CLUSTERED 
(
	[PersonnelDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UncPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Forenames] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[Address4] [nvarchar](100) NULL,
	[Postcode] [nvarchar](12) NOT NULL,
	[Telephone] [varchar](15) NULL,
	[Mobile] [varchar](15) NULL,
	[NINumber] [varchar](10) NULL,
	[BankAccountNumber] [varchar](10) NULL,
	[BankSortCode] [varchar](6) NULL,
	[BankAccountName] [nvarchar](100) NULL,
	[BankAddress1] [nvarchar](100) NULL,
	[BankAddress2] [nvarchar](100) NULL,
	[BankAddress3] [nvarchar](100) NULL,
	[BankAddress4] [nvarchar](100) NULL,
	[BankPostcode] [nvarchar](12) NULL,
	[BankTelephone] [varchar](15) NULL,
	[Email] [varchar](256) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_[Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Template]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Template] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CarGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CarGrid]
as
select
C.CarId,
C.Name,
C.CityMileage,
C.ARAIMileage,
C.FuelType,
C.Engine,
C.MaxPower,
C.MaxTorque,
C.Seating,
C.EngineDescription,
C.TransmissionType,
C.CargoVolume,
isnull(C.Name,'')+isnull(C.FuelType,'')+CONVERT(varchar, C.Engine )  as SearchField
from Car C


GO
/****** Object:  View [dbo].[DriverFeedbackGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[DriverFeedbackGrid]
as
select
DriverFeedBackId,
DF.DriverId,
DriverName=D.Name,
HasYourDrivingInstructorEverBeenLateForALesson,
HasYourDrivingInstructorEverMadeYouFeelUncomfortable,
WouldYouRecommendThisDrivingSchoolToFriends,
DoYouThinkThisSyllabusWillMakeYouASaferDriver,
Comment,
Rating,
DF.CreatedDate,
DF.CreatedBy
from DriverFeedback DF
inner join Driver D on DF.DriverId=D.DriverId

GO
/****** Object:  View [dbo].[DriverGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DriverGrid]
as
select
D.DriverId,
D.Name,
D.DrivingLicenceNumber,
D.IssuedDate,
D.ValidTill,
D.DateOfBirth,
D.Mobile,
D.Address1,
D.Address2,
D.Address3,
D.Address4,
D.Pincode,
D.CreatedBy,
D.CreatedDate,
isnull(D.Name,'')+isnull(D.DrivingLicenceNumber,'')+CONVERT(varchar, D.Pincode )+CONVERT(varchar, D.Mobile )+isnull(D.Address1,'') as SearchField
from Driver D

GO
/****** Object:  View [dbo].[DrivingSchoolCarGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[DrivingSchoolCarGrid]
as
select
DSC.DrivingSchoolCarId,
Ds.DrivingSchoolId,
DrivingSchoolName=DS.Name,
C.CarId,
CarName=C.Name,
C.TransmissionType,
DSCF.WithLicenseFee,
DSCF.WithoutLicenseFee,
DSCF.DiscountAmount
from DrivingSchool Ds
inner join DrivingSchoolCar DSC on DS.DrivingSchoolId=DSC.DrivingSchoolId
inner join Car C on DSC.CarId=C.CarId
inner join DrivingSchoolCarFee DSCF on DSC.DrivingSchoolCarId=DSCF.DrivingSchoolCarId




GO
/****** Object:  View [dbo].[DrivingSchoolGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[DrivingSchoolGrid]
as
select
DS.DrivingSchoolId,
DS.Name,
DS.Address1,
DS.Address2,
DS.Address3,
DS.Address4,
DS.Pincode,
DS.Mobile,
DS.Telephone,
DS.EmailId,
DS.CreatedDate,
DS.Latitude,
DS.Longitude,
DS.MinimumFeeWithLicense,
DS.MinimumFeeWithOutLicense,
NumberOfCars=(select count(DrivingSchoolId) from DrivingSchoolCar D where D.DrivingSchoolId=DS.DrivingSchoolId),
DS.PersonnelId,
RelativePath=case when DD.RelativePath is null then '' else DD.RelativePath end,
isnull(DS.Name,'')+isnull(DS.Address1,'')+CONVERT(varchar, DS.Pincode )+CONVERT(varchar, DS.Mobile )+
ISNULL(CONVERT(varchar,DS.CreatedDate, 101), '') + ISNULL(CONVERT(varchar,DS.CreatedDate, 103), '') 
	  + ISNULL(CONVERT(varchar,DS.CreatedDate, 105), '') + ISNULL(CONVERT(varchar,DS.CreatedDate, 126), '') as SearchField
from DrivingSchool DS
left join DocumentDetail DD on DS.PersonnelId=DD.PersonnelId
--inner join DrivingSchoolCar DSC on DS.DrivingSchoolId=DSC.DrivingSchoolId






GO
/****** Object:  View [dbo].[StudentGrid]    Script Date: 24-10-2018 06:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[StudentGrid]
as
select
S.StudentId,
S.Title,
S.Forenames,
S.Surname,
S.DOB,
S.Address1,
S.Address2,
S.Address3,
S.Address4,
S.Postcode,
S.Telephone,
S.Mobile,
S.NINumber,
S.BankAccountNumber,
S.BankSortCode,
S.BankAccountName,
S.BankAddress1,
S.BankAddress2,
S.BankAddress3,
S.BankAddress4,
S.BankPostcode,
S.BankTelephone,
S.Email,
S.CreatedDate,
isnull(S.Forenames,'')+isnull(S.Surname,'')+isnull(S.Address1,'')+isnull(S.Postcode,'')+isnull(S.Email,'')+
ISNULL(CONVERT(varchar,S.CreatedDate, 101), '') + ISNULL(CONVERT(varchar,S.CreatedDate, 103), '') 
	  + ISNULL(CONVERT(varchar,S.CreatedDate, 105), '') + ISNULL(CONVERT(varchar,S.CreatedDate, 126), '') as SearchField
from Student S


GO
INSERT [dbo].[AspNetPermissions] ([Id], [Name], [Description]) VALUES (N'1', N'SuperUser', N'SuperUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'1', N'SuperUser', N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'2', N'Admin', N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'3', N'Personnel', N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'4', N'User', N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'5', N'DrivingSchool', N'ApplicationRole')
SET IDENTITY_INSERT [dbo].[AspNetUserMobileOtp] ON 

INSERT [dbo].[AspNetUserMobileOtp] ([AspNetUserMobileOtpId], [MobileNumber], [UserId], [OTP], [OTPCreatedDateTime], [OTPRequestedCount], [OTPReasonId], [OTPValidDateTime], [IPAddress]) VALUES (1, CAST(9773606038 AS Decimal(18, 0)), NULL, 214860, CAST(N'2018-10-10 08:10:41.847' AS DateTime), NULL, 1, CAST(N'2018-10-10 08:40:41.850' AS DateTime), N'::1')
INSERT [dbo].[AspNetUserMobileOtp] ([AspNetUserMobileOtpId], [MobileNumber], [UserId], [OTP], [OTPCreatedDateTime], [OTPRequestedCount], [OTPReasonId], [OTPValidDateTime], [IPAddress]) VALUES (2, CAST(9322992324 AS Decimal(18, 0)), NULL, 759318, CAST(N'2018-10-10 08:40:12.317' AS DateTime), NULL, 1, CAST(N'2018-10-10 09:10:12.317' AS DateTime), N'::1')
INSERT [dbo].[AspNetUserMobileOtp] ([AspNetUserMobileOtpId], [MobileNumber], [UserId], [OTP], [OTPCreatedDateTime], [OTPRequestedCount], [OTPReasonId], [OTPValidDateTime], [IPAddress]) VALUES (11, CAST(9870754355 AS Decimal(18, 0)), NULL, 204769, CAST(N'2018-10-22 12:18:51.550' AS DateTime), NULL, 1, CAST(N'2018-10-22 12:48:51.550' AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[AspNetUserMobileOtp] OFF
INSERT [dbo].[AspNetUserPermissions] ([UserId], [PermissionId]) VALUES (N'c9c1c6b3-61b0-44bb-834f-ff73be73ff60', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9acaf606-6005-4764-bdfa-03143dcbdfec', N'5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b3736c98-a252-4224-b6af-3ea3da65a2f3', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9c1c6b3-61b0-44bb-834f-ff73be73ff60', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PersonnelId], [Name], [CentreId]) VALUES (N'9acaf606-6005-4764-bdfa-03143dcbdfec', NULL, 0, N'AIsIUdu9XoWN5EJNjQdHa8X98D8TwpiYzLMeFVXGNE2s5vPsXxy8aZ3vo7ruOGVG0A==', N'c8d3de60-d745-4eaa-9ef0-fa44811ecbf7', NULL, 0, 0, NULL, 1, 0, N'9773606038', 1, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PersonnelId], [Name], [CentreId]) VALUES (N'b3736c98-a252-4224-b6af-3ea3da65a2f3', NULL, 0, N'AL7adtJT2pnWIC+UrakSzu+BTBQ8KyaptMhJS8hCtkm43CMmm5C9CCGlGjLdcw/y3w==', N'cba99fa8-854d-473a-bcbc-541c0ca26cca', NULL, 0, 0, NULL, 1, 0, N'9322992324', 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PersonnelId], [Name], [CentreId]) VALUES (N'c9c1c6b3-61b0-44bb-834f-ff73be73ff60', N'superadmin@gadiseekho.com', 1, N'AKE8YmPQDYyVK65rkJk73JJp1Zy6fzDtABvuxihKa1Ksej+08LEGjiIS/iDKS/N3Tg==', N'e905150b-246a-478c-9d09-74e19072d875', NULL, 0, 0, NULL, 0, 0, N'superadmin@gadiseekho.com', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarId], [Name], [CityMileage], [ARAIMileage], [FuelType], [Engine], [MaxPower], [MaxTorque], [Seating], [EngineDescription], [TransmissionType], [CargoVolume]) VALUES (1, N'Ertiga', N'20', N'20', N'Diesel', 1, N'1', N'1', 8, N'test', N'Manual', N'50')
INSERT [dbo].[Car] ([CarId], [Name], [CityMileage], [ARAIMileage], [FuelType], [Engine], [MaxPower], [MaxTorque], [Seating], [EngineDescription], [TransmissionType], [CargoVolume]) VALUES (2, N'Innova Crista', N'17', N'17', N'Petrol', 1, N'1', N'1', 7, N'test2', N'Automatic', N'70')
INSERT [dbo].[Car] ([CarId], [Name], [CityMileage], [ARAIMileage], [FuelType], [Engine], [MaxPower], [MaxTorque], [Seating], [EngineDescription], [TransmissionType], [CargoVolume]) VALUES (1002, N'Indica', N'15', N'15', N'Diesel', 1, N'1', N'1', 5, N'test3', N'Manual', N'40')
INSERT [dbo].[Car] ([CarId], [Name], [CityMileage], [ARAIMileage], [FuelType], [Engine], [MaxPower], [MaxTorque], [Seating], [EngineDescription], [TransmissionType], [CargoVolume]) VALUES (1003, N'Santro', N'25', N'25', N'Petrol', 1, N'1', N'1', 5, N'test4', N'manual', N'40')
INSERT [dbo].[Car] ([CarId], [Name], [CityMileage], [ARAIMileage], [FuelType], [Engine], [MaxPower], [MaxTorque], [Seating], [EngineDescription], [TransmissionType], [CargoVolume]) VALUES (1004, N'Qualis', N'16', N'16', N'Petrol', 1, N'1', N'1', 5, N'test5', N'Manual', N'10')
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[DocumentCategory] ON 

INSERT [dbo].[DocumentCategory] ([DocumentCategoryId], [Name], [FileNameRegex]) VALUES (1, N'DrivingSchoolProfile', N'-')
INSERT [dbo].[DocumentCategory] ([DocumentCategoryId], [Name], [FileNameRegex]) VALUES (2, N'DrivingStudentProfile', N'-')
INSERT [dbo].[DocumentCategory] ([DocumentCategoryId], [Name], [FileNameRegex]) VALUES (3, N'DriverProfile', N'-')
SET IDENTITY_INSERT [dbo].[DocumentCategory] OFF
SET IDENTITY_INSERT [dbo].[DocumentDetail] ON 

INSERT [dbo].[DocumentDetail] ([DocumentDetailId], [DocumentGUID], [PersonnelId], [FileName], [ProductId], [CategoryId], [UpdatedDateUTC], [CreatedDateUTC], [Description], [DownloadedDateUtc], [ApprovedDateUtc], [EmailSentDateUtc], [RequireApproval], [UncPath], [RelativePath], [UpdatedBy], [CreatedBy], [ClientFileName], [DocumentBatchId]) VALUES (9, N'9df85c98-04e7-42f9-b1cd-71cdf00ac249', N'1', N'blob.png', 1, 1, NULL, CAST(N'2018-10-22 15:46:17.033' AS DateTime), N'Vijay Raut Profile Image', NULL, NULL, NULL, NULL, N'D:\Vijay\VijayWorkArea\GadiWorkArea\GaadiSeekho\Source\Gadi', N'\Vijay_Raut_1\DrivingSchoolProfile\DrivingSchoolProfile_9df85c98-04e7-42f9-b1cd-71cdf00ac249_blob.png', NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocumentDetail] OFF
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([DriverId], [Name], [DrivingLicenceNumber], [IssuedDate], [ValidTill], [DateOfBirth], [Mobile], [Address1], [Address2], [Address3], [Address4], [Pincode], [CreatedBy], [CreatedDate]) VALUES (2, N'Driver 1', N'654321', CAST(N'2000-10-05' AS Date), CAST(N'2022-10-04' AS Date), CAST(N'1993-01-27' AS Date), 1234567890, N'Test', N'test', NULL, NULL, 400017, 1, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Driver] ([DriverId], [Name], [DrivingLicenceNumber], [IssuedDate], [ValidTill], [DateOfBirth], [Mobile], [Address1], [Address2], [Address3], [Address4], [Pincode], [CreatedBy], [CreatedDate]) VALUES (4, N'Ramesh', N'123456', CAST(N'1999-08-15' AS Date), CAST(N'2020-08-14' AS Date), CAST(N'1988-01-06' AS Date), 987456321, N'Kalyan', N'west', NULL, NULL, 421304, 2, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Driver] ([DriverId], [Name], [DrivingLicenceNumber], [IssuedDate], [ValidTill], [DateOfBirth], [Mobile], [Address1], [Address2], [Address3], [Address4], [Pincode], [CreatedBy], [CreatedDate]) VALUES (5, N'Create Driver', N'123456', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 1234568901, N'Khambdev Nagar, 90 feet road, Dharavi', N'KHA', NULL, NULL, 400017, 0, CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Driver] OFF
SET IDENTITY_INSERT [dbo].[DriverFeedback] ON 

INSERT [dbo].[DriverFeedback] ([DriverFeedBackId], [DriverId], [HasYourDrivingInstructorEverBeenLateForALesson], [HasYourDrivingInstructorEverMadeYouFeelUncomfortable], [WouldYouRecommendThisDrivingSchoolToFriends], [DoYouThinkThisSyllabusWillMakeYouASaferDriver], [Comment], [Rating], [CreatedDate], [CreatedBy]) VALUES (1, 2, N'Yes', N'yes', N'yes', N'yes', N'yes', 6, CAST(N'2018-10-06' AS Date), 1)
INSERT [dbo].[DriverFeedback] ([DriverFeedBackId], [DriverId], [HasYourDrivingInstructorEverBeenLateForALesson], [HasYourDrivingInstructorEverMadeYouFeelUncomfortable], [WouldYouRecommendThisDrivingSchoolToFriends], [DoYouThinkThisSyllabusWillMakeYouASaferDriver], [Comment], [Rating], [CreatedDate], [CreatedBy]) VALUES (2, 2, N'No', N'No', N'No', N'No', N'No', 2, CAST(N'2018-10-08' AS Date), 2)
SET IDENTITY_INSERT [dbo].[DriverFeedback] OFF
SET IDENTITY_INSERT [dbo].[DrivingSchool] ON 

INSERT [dbo].[DrivingSchool] ([DrivingSchoolId], [Name], [Address1], [Address2], [Address3], [Address4], [Pincode], [Mobile], [Telephone], [EmailId], [CreatedDate], [Latitude], [Longitude], [MinimumFeeWithLicense], [MinimumFeeWithOutLicense], [PersonnelId]) VALUES (5, N'Goodluck', N'Kalyan', NULL, NULL, NULL, 421306, 8097537537, NULL, N'sanjayp@gmail.com', CAST(N'2018-10-06 00:00:00.0000000' AS DateTime2), 1, 2, CAST(3000 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DrivingSchool] ([DrivingSchoolId], [Name], [Address1], [Address2], [Address3], [Address4], [Pincode], [Mobile], [Telephone], [EmailId], [CreatedDate], [Latitude], [Longitude], [MinimumFeeWithLicense], [MinimumFeeWithOutLicense], [PersonnelId]) VALUES (6, N'Sundaram', N'Sion', NULL, NULL, NULL, 400022, 1234567890, NULL, N'sundaram@gmail.com', CAST(N'2018-10-06 00:00:00.0000000' AS DateTime2), 1, 2, CAST(2800 AS Decimal(18, 0)), CAST(1900 AS Decimal(18, 0)), 0)
INSERT [dbo].[DrivingSchool] ([DrivingSchoolId], [Name], [Address1], [Address2], [Address3], [Address4], [Pincode], [Mobile], [Telephone], [EmailId], [CreatedDate], [Latitude], [Longitude], [MinimumFeeWithLicense], [MinimumFeeWithOutLicense], [PersonnelId]) VALUES (7, N'Milan Driving School', N'Kalyan', NULL, NULL, NULL, 421306, 9874598745, NULL, N'milan@gmail.com', CAST(N'2018-10-11 00:00:00.0000000' AS DateTime2), 1, 2, CAST(2900 AS Decimal(18, 0)), CAST(2100 AS Decimal(18, 0)), 0)
INSERT [dbo].[DrivingSchool] ([DrivingSchoolId], [Name], [Address1], [Address2], [Address3], [Address4], [Pincode], [Mobile], [Telephone], [EmailId], [CreatedDate], [Latitude], [Longitude], [MinimumFeeWithLicense], [MinimumFeeWithOutLicense], [PersonnelId]) VALUES (8, N'Create Driving School', N'Testing', N'test', NULL, NULL, 400610, 70454681254, NULL, N'mail@gmail.com', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[DrivingSchool] OFF
SET IDENTITY_INSERT [dbo].[DrivingSchoolCar] ON 

INSERT [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId], [DrivingSchoolId], [CarId]) VALUES (1, 5, 1)
INSERT [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId], [DrivingSchoolId], [CarId]) VALUES (2, 5, 2)
INSERT [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId], [DrivingSchoolId], [CarId]) VALUES (3, 5, 1002)
INSERT [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId], [DrivingSchoolId], [CarId]) VALUES (4, 5, 1003)
INSERT [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId], [DrivingSchoolId], [CarId]) VALUES (8, 5, 1004)
SET IDENTITY_INSERT [dbo].[DrivingSchoolCar] OFF
SET IDENTITY_INSERT [dbo].[DrivingSchoolCarFee] ON 

INSERT [dbo].[DrivingSchoolCarFee] ([DrivingSchoolCarFeeId], [DrivingSchoolCarId], [WithLicenseFee], [WithoutLicenseFee], [DiscountAmount]) VALUES (1, 1, CAST(3500 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DrivingSchoolCarFee] ([DrivingSchoolCarFeeId], [DrivingSchoolCarId], [WithLicenseFee], [WithoutLicenseFee], [DiscountAmount]) VALUES (2, 2, CAST(4500 AS Decimal(18, 0)), CAST(3750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DrivingSchoolCarFee] ([DrivingSchoolCarFeeId], [DrivingSchoolCarId], [WithLicenseFee], [WithoutLicenseFee], [DiscountAmount]) VALUES (3, 3, CAST(3000 AS Decimal(18, 0)), CAST(2750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DrivingSchoolCarFee] ([DrivingSchoolCarFeeId], [DrivingSchoolCarId], [WithLicenseFee], [WithoutLicenseFee], [DiscountAmount]) VALUES (4, 4, CAST(2500 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DrivingSchoolCarFee] ([DrivingSchoolCarFeeId], [DrivingSchoolCarId], [WithLicenseFee], [WithoutLicenseFee], [DiscountAmount]) VALUES (6, 8, CAST(3500 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DrivingSchoolCarFee] OFF
SET IDENTITY_INSERT [dbo].[DrivingSchoolRatingAndReview] ON 

INSERT [dbo].[DrivingSchoolRatingAndReview] ([DrivingSchoolRatingAndReviewId], [DrivingSchoolId], [Rating], [Review], [CreatedDate], [CreatedBy]) VALUES (1, 5, CAST(4 AS Decimal(18, 0)), N'Nice Driving School', CAST(N'2018-10-15 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DrivingSchoolRatingAndReview] OFF
SET IDENTITY_INSERT [dbo].[Personnel] ON 

INSERT [dbo].[Personnel] ([PersonnelId], [Title], [Forenames], [Surname], [DOB], [CountryId], [Address1], [Address2], [Address3], [Address4], [Postcode], [Telephone], [Mobile], [PANNumber], [BankTelephone], [Email], [UserId], [IsDrivingSchool]) VALUES (1, N'Mr.', N'Vijay', N'Raut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9773606038', NULL, NULL, NULL, N'9acaf606-6005-4764-bdfa-03143dcbdfec', 1)
INSERT [dbo].[Personnel] ([PersonnelId], [Title], [Forenames], [Surname], [DOB], [CountryId], [Address1], [Address2], [Address3], [Address4], [Postcode], [Telephone], [Mobile], [PANNumber], [BankTelephone], [Email], [UserId], [IsDrivingSchool]) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9322992324', NULL, NULL, NULL, N'b3736c98-a252-4224-b6af-3ea3da65a2f3', 0)
SET IDENTITY_INSERT [dbo].[Personnel] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [UncPath]) VALUES (1, N'Gadi', N'D:\Vijay\VijayWorkArea\GadiWorkArea\GaadiSeekho\Source\Gadi')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Title], [Forenames], [Surname], [DOB], [Address1], [Address2], [Address3], [Address4], [Postcode], [Telephone], [Mobile], [NINumber], [BankAccountNumber], [BankSortCode], [BankAccountName], [BankAddress1], [BankAddress2], [BankAddress3], [BankAddress4], [BankPostcode], [BankTelephone], [Email], [CreatedDate]) VALUES (2, N'Mr.', N'Vijay', N'Raut', CAST(N'1993-01-27 00:00:00.0000000' AS DateTime2), N'Dharavi', NULL, NULL, NULL, N'400017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'vijayraut33@gmail.com', CAST(N'2018-10-05 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Student] ([StudentId], [Title], [Forenames], [Surname], [DOB], [Address1], [Address2], [Address3], [Address4], [Postcode], [Telephone], [Mobile], [NINumber], [BankAccountNumber], [BankSortCode], [BankAccountName], [BankAddress1], [BankAddress2], [BankAddress3], [BankAddress4], [BankPostcode], [BankTelephone], [Email], [CreatedDate]) VALUES (3, N'Ms.', N'Shraddha', N'Paradkar', CAST(N'1993-11-24 00:00:00.0000000' AS DateTime2), N'Koperkhairane', NULL, NULL, NULL, N'400706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'paradkarsh24@gmail.com', CAST(N'2018-10-05 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Student] ([StudentId], [Title], [Forenames], [Surname], [DOB], [Address1], [Address2], [Address3], [Address4], [Postcode], [Telephone], [Mobile], [NINumber], [BankAccountNumber], [BankSortCode], [BankAccountName], [BankAddress1], [BankAddress2], [BankAddress3], [BankAddress4], [BankPostcode], [BankTelephone], [Email], [CreatedDate]) VALUES (4, N'Mr.', N'Sanjay', N'Prajapati', CAST(N'1993-01-27 00:00:00.0000000' AS DateTime2), N'Kalyan', NULL, NULL, NULL, N'421306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sunjayp88@gmail.com', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[AspNetRolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRolePermission_AspNetPermissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[AspNetPermissions] ([Id])
GO
ALTER TABLE [dbo].[AspNetRolePermissions] CHECK CONSTRAINT [FK_AspNetRolePermission_AspNetPermissions]
GO
ALTER TABLE [dbo].[AspNetRolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRolePermission_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRolePermissions] CHECK CONSTRAINT [FK_AspNetRolePermission_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserPermissions]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserPermissions_AspNetPermissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[AspNetPermissions] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserPermissions] CHECK CONSTRAINT [FK_AspNetUserPermissions_AspNetPermissions]
GO
ALTER TABLE [dbo].[AspNetUserPermissions]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserPermissions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserPermissions] CHECK CONSTRAINT [FK_AspNetUserPermissions_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersAlertSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersAlertSchedule_Alert1] FOREIGN KEY([AlertId])
REFERENCES [dbo].[Alert] ([AlertId])
GO
ALTER TABLE [dbo].[AspNetUsersAlertSchedule] CHECK CONSTRAINT [FK_AspNetUsersAlertSchedule_Alert1]
GO
ALTER TABLE [dbo].[DocumentDetail]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDetail_DocumentCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[DocumentCategory] ([DocumentCategoryId])
GO
ALTER TABLE [dbo].[DocumentDetail] CHECK CONSTRAINT [FK_DocumentDetail_DocumentCategory]
GO
ALTER TABLE [dbo].[DocumentDetail]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[DocumentDetail] CHECK CONSTRAINT [FK_DocumentDetail_Product]
GO
ALTER TABLE [dbo].[DriverFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DriverFeedback_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[DriverFeedback] CHECK CONSTRAINT [FK_DriverFeedback_Driver]
GO
ALTER TABLE [dbo].[DriverFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DriverFeedback_DriverFeedback] FOREIGN KEY([DriverFeedBackId])
REFERENCES [dbo].[DriverFeedback] ([DriverFeedBackId])
GO
ALTER TABLE [dbo].[DriverFeedback] CHECK CONSTRAINT [FK_DriverFeedback_DriverFeedback]
GO
ALTER TABLE [dbo].[DrivingSchoolCar]  WITH CHECK ADD  CONSTRAINT [FK_DrivingSchoolCar_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([CarId])
GO
ALTER TABLE [dbo].[DrivingSchoolCar] CHECK CONSTRAINT [FK_DrivingSchoolCar_Car]
GO
ALTER TABLE [dbo].[DrivingSchoolCar]  WITH CHECK ADD  CONSTRAINT [FK_DrivingSchoolCar_DrivingSchool] FOREIGN KEY([DrivingSchoolId])
REFERENCES [dbo].[DrivingSchool] ([DrivingSchoolId])
GO
ALTER TABLE [dbo].[DrivingSchoolCar] CHECK CONSTRAINT [FK_DrivingSchoolCar_DrivingSchool]
GO
ALTER TABLE [dbo].[DrivingSchoolCarFee]  WITH CHECK ADD  CONSTRAINT [FK_DrivingSchoolCarFee_DrivingSchoolCar] FOREIGN KEY([DrivingSchoolCarId])
REFERENCES [dbo].[DrivingSchoolCar] ([DrivingSchoolCarId])
GO
ALTER TABLE [dbo].[DrivingSchoolCarFee] CHECK CONSTRAINT [FK_DrivingSchoolCarFee_DrivingSchoolCar]
GO
ALTER TABLE [dbo].[DrivingSchoolRatingAndReview]  WITH CHECK ADD  CONSTRAINT [FK_DrivingSchoolRatingAndReview_DrivingSchool] FOREIGN KEY([DrivingSchoolId])
REFERENCES [dbo].[DrivingSchool] ([DrivingSchoolId])
GO
ALTER TABLE [dbo].[DrivingSchoolRatingAndReview] CHECK CONSTRAINT [FK_DrivingSchoolRatingAndReview_DrivingSchool]
GO
ALTER TABLE [dbo].[PersonnelDocument]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelDocument_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[PersonnelDocument] CHECK CONSTRAINT [FK_PersonnelDocument_Personnel]
GO
USE [master]
GO
ALTER DATABASE [GadiSeekho] SET  READ_WRITE 
GO

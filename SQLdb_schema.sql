USE [master]
GO
/****** Object:  Database [u_bkawa]    Script Date: 08/06/2021 21:36:24 ******/
CREATE DATABASE [u_bkawa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'u_bkawa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\u_bkawa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'u_bkawa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\u_bkawa_log.ldf' , SIZE = 66048KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [u_bkawa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [u_bkawa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [u_bkawa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [u_bkawa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [u_bkawa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [u_bkawa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [u_bkawa] SET ARITHABORT OFF 
GO
ALTER DATABASE [u_bkawa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [u_bkawa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [u_bkawa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [u_bkawa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [u_bkawa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [u_bkawa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [u_bkawa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [u_bkawa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [u_bkawa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [u_bkawa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [u_bkawa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [u_bkawa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [u_bkawa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [u_bkawa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [u_bkawa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [u_bkawa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [u_bkawa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [u_bkawa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [u_bkawa] SET  MULTI_USER 
GO
ALTER DATABASE [u_bkawa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [u_bkawa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [u_bkawa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [u_bkawa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [u_bkawa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'u_bkawa', N'ON'
GO
ALTER DATABASE [u_bkawa] SET QUERY_STORE = OFF
GO
USE [u_bkawa]
GO
/****** Object:  Table [dbo].[UserListing]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserListing](
	[ListingID] [int] IDENTITY(1,1) NOT NULL,
	[ProposedPrice] [money] NOT NULL,
	[SellerDescription] [text] NOT NULL,
	[ProductStatusID] [int] NOT NULL,
	[SellerID] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[ListingDate] [date] NOT NULL,
	[LuthierID] [int] NULL,
	[BuyerID] [int] NULL,
	[GuitarBrandID] [int] NOT NULL,
	[LuthierDescription] [text] NULL,
	[YearGuitarProduced] [int] NULL,
	[NOowners] [int] NULL,
 CONSTRAINT [PK_UserListing] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuitarBrand]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuitarBrand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GuitarBrand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserRoleID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[street_homeno] [varchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vWBrowseListingsCustomer]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vWBrowseListingsCustomer]
as
select  ProposedPrice,SellerDescription,CategoryName,ListingDate,
		(Users.FirstName +' ' + Users.LastName) as LuthierName,
		GuitarBrand.Name as GuitarBrand,LuthierDescription,YearGuitarProduced,NOowners
from UserListing join Categories on UserListing.CategoryID=Categories.CategoryID
				 join Users on UserListing.LuthierID=Users.UserID
				 join GuitarBrand on UserListing.GuitarBrandID=GuitarBrand.BrandID

where ProductStatusID = 1
GO
/****** Object:  Table [dbo].[LuthierService]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuthierService](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderDeadline] [date] NOT NULL,
	[GuitarBrandID] [int] NOT NULL,
	[GuitarCategoryID] [int] NOT NULL,
	[ServiceCost] [money] NULL,
	[LuthierID] [int] NULL,
	[CustomerID] [int] NULL,
	[LuthierProblemDesc] [text] NULL,
 CONSTRAINT [PK_ServiceOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatusResponses]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatusResponses](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDisplayLuthierServiceJobs]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vwDisplayLuthierServiceJobs] as 
select luthierID, statusname,OrderDate,OrderDeadline,GuitarBrand.Name as brand,Categories.CategoryName,ServiceCost,Users.FirstName+ ' ' + users.LastName as [Customer Name],LuthierProblemDesc 
from LuthierService left join GuitarBrand on Luthierservice.GuitarBrandID=GuitarBrand.BrandID
					left join Categories on LuthierService.GuitarCategoryID=Categories.CategoryID
					left join Users on LuthierService.CustomerID=Users.UserID
					left join ProductStatusResponses on LuthierService.OrderStatusID=ProductStatusResponses.StatusID
GO
/****** Object:  Table [dbo].[City]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[postalCode] [varchar](50) NOT NULL,
	[PlaceName] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[StateAbbr] [varchar](50) NOT NULL,
	[LAT_wgs84] [decimal](9, 6) NOT NULL,
	[LON_wgs84] [decimal](9, 6) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vWCustomerDetails]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vWCustomerDetails]
as
select UserID,FirstName,LastName,Phone,email,postalCode,state,placename,street_homeno 
	from Users JOIN City on Users.CityID=City.CityID
where UserRoleID = 3
GO
/****** Object:  View [dbo].[vWLuthierDetails]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vWLuthierDetails]
as
select UserID,FirstName,LastName,Phone,email,postalCode,state,placename,street_homeno 
	from Users JOIN City on Users.CityID=City.CityID
where UserRoleID = 2
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListingPictureURL]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListingPictureURL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ListingID] [int] NOT NULL,
	[pictureURL] [varchar](150) NOT NULL,
 CONSTRAINT [PK_ListingPictureURL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListingStatusHistory]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListingStatusHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[listingID] [int] NULL,
	[date] [datetime] NOT NULL,
	[ResponseIDchangedFrom] [int] NULL,
	[ResponseIDchangedTo] [int] NULL,
	[PriceChangedFrom] [money] NULL,
	[PriceChangedTo] [money] NULL,
 CONSTRAINT [PK_ListingStatusHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuthierInteractionsHist]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuthierInteractionsHist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[InteractionDate] [datetime] NOT NULL,
	[ResponseIDchangedFrom] [int] NULL,
	[ResponseIDchangedTo] [int] NULL,
	[PriceChangedFrom] [money] NULL,
	[PriceChangedTo] [money] NULL,
 CONSTRAINT [PK_LuthierInteractionsHist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 08/06/2021 21:36:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 08/06/2021 21:36:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 08/06/2021 21:36:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 08/06/2021 21:36:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 08/06/2021 21:36:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 08/06/2021 21:36:24 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserListing] ADD  CONSTRAINT [df_ProductStatusID]  DEFAULT ((0)) FOR [ProductStatusID]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[ListingPictureURL]  WITH CHECK ADD  CONSTRAINT [FK_ListingPictureURL_UserListing] FOREIGN KEY([ListingID])
REFERENCES [dbo].[UserListing] ([ListingID])
GO
ALTER TABLE [dbo].[ListingPictureURL] CHECK CONSTRAINT [FK_ListingPictureURL_UserListing]
GO
ALTER TABLE [dbo].[ListingStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_ListingStatusHistory_ProductStatusResponses] FOREIGN KEY([ResponseIDchangedFrom])
REFERENCES [dbo].[ProductStatusResponses] ([StatusID])
GO
ALTER TABLE [dbo].[ListingStatusHistory] CHECK CONSTRAINT [FK_ListingStatusHistory_ProductStatusResponses]
GO
ALTER TABLE [dbo].[ListingStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_ListingStatusHistory_UserListing] FOREIGN KEY([listingID])
REFERENCES [dbo].[UserListing] ([ListingID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ListingStatusHistory] CHECK CONSTRAINT [FK_ListingStatusHistory_UserListing]
GO
ALTER TABLE [dbo].[LuthierInteractionsHist]  WITH CHECK ADD  CONSTRAINT [FK_LuthierInteractionsHist_ProductStatusResponses] FOREIGN KEY([ResponseIDchangedFrom])
REFERENCES [dbo].[ProductStatusResponses] ([StatusID])
GO
ALTER TABLE [dbo].[LuthierInteractionsHist] CHECK CONSTRAINT [FK_LuthierInteractionsHist_ProductStatusResponses]
GO
ALTER TABLE [dbo].[LuthierInteractionsHist]  WITH CHECK ADD  CONSTRAINT [FK_LuthierInteractionsHist_ServiceOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[LuthierService] ([OrderID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[LuthierInteractionsHist] CHECK CONSTRAINT [FK_LuthierInteractionsHist_ServiceOrder]
GO
ALTER TABLE [dbo].[LuthierService]  WITH CHECK ADD  CONSTRAINT [FK_LuthierService_Categories] FOREIGN KEY([GuitarCategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[LuthierService] CHECK CONSTRAINT [FK_LuthierService_Categories]
GO
ALTER TABLE [dbo].[LuthierService]  WITH CHECK ADD  CONSTRAINT [FK_LuthierService_GuitarBrand] FOREIGN KEY([GuitarBrandID])
REFERENCES [dbo].[GuitarBrand] ([BrandID])
GO
ALTER TABLE [dbo].[LuthierService] CHECK CONSTRAINT [FK_LuthierService_GuitarBrand]
GO
ALTER TABLE [dbo].[LuthierService]  WITH CHECK ADD  CONSTRAINT [FK_LuthierService_ProductStatusResponses] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[ProductStatusResponses] ([StatusID])
GO
ALTER TABLE [dbo].[LuthierService] CHECK CONSTRAINT [FK_LuthierService_ProductStatusResponses]
GO
ALTER TABLE [dbo].[LuthierService]  WITH CHECK ADD  CONSTRAINT [FK_LuthierService_User] FOREIGN KEY([LuthierID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[LuthierService] CHECK CONSTRAINT [FK_LuthierService_User]
GO
ALTER TABLE [dbo].[LuthierService]  WITH CHECK ADD  CONSTRAINT [FK_LuthierService_User1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[LuthierService] CHECK CONSTRAINT [FK_LuthierService_User1]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_Categories1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_Categories1]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_GuitarBrand] FOREIGN KEY([GuitarBrandID])
REFERENCES [dbo].[GuitarBrand] ([BrandID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_GuitarBrand]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_ProductStatus1] FOREIGN KEY([ProductStatusID])
REFERENCES [dbo].[ProductStatusResponses] ([StatusID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_ProductStatus1]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_User] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_User]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_User1] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_User1]
GO
ALTER TABLE [dbo].[UserListing]  WITH CHECK ADD  CONSTRAINT [FK_UserListing_Users] FOREIGN KEY([LuthierID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserListing] CHECK CONSTRAINT [FK_UserListing_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_City]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
/****** Object:  StoredProcedure [dbo].[spChangeListingProductStatus]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE procedure [dbo].[spChangeListingProductStatus] 
/*
ARGUMENTS:
	1.USER ID
	2.ID OF LISTING STATUS OF YOU WANT TO CHANGE 
	3.ID OF STATUS YOU WANT LISTING TO CHANGE TO 
	4.NEW PRICE YOU WANT TO ASSIGN TO LISTING SET TO NULL
	5.TEXT LUTHIER WANT TO ADD TO LISTING SET TO NULL
*/

@userID int, -- zakładamy, że aby dokonać zmany, trzeba podać kto dokonuje zmiany --> UserID
@listingID int,  
@newStatusID int,  
@newPrice money = null,  
@LuthierText text = null  
  
as  
begin   
	declare @userRole int
	select @userrole = UserRoleID from Users where UserID= @userID
	--GET VALUE OF CURRENT STATUS, THAT STEP LIMITS THE ACTIONS YOU CAN MAKE.
	
	declare @currentStatusID int
	execute spViewProductStatusByListingID @listingID, @currentStatusID output,0
	
	
	--check if data entered is correct (for app logic purposes)
	if @newStatusID in (select StatusID from ProductStatusResponses)
	begin
		if ((@currentStatusID = 0 and @userRole = 2) or (@currentStatusID = 2 and @userRole = 3) or (@currentStatusID = 1 and @userRole = 3)
		      or (@currentStatusID = 4 and @userRole = 1))
		begin
			if (@currentStatusID = 0 and @userRole = 2)
			begin
				if @newStatusID in (1, 3, 2)
					print 'values entered correct'
				else 
				begin
					raiserror('you cannot change status. Forbidden change, check documentation1',16,1)
					return
				end
			end
			if (@currentStatusID = 2 and @userRole = 3)
			begin
				if @newStatusID in (1, 31)
					print 'values entered correct'
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation2',16,1)
					return
				end
			end
			if (@currentStatusID = 1 and @userRole = 3) --buying a guitar
			begin					
				if @newStatusID in (4)
					print 'values entered correct'
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation3',16,1)
					return
				end
			end					
			if (@currentStatusID = 4 and @userRole = 1) 
			begin
				if @newStatusID in (5)
					print 'values entered correct'
					else
					begin
						raiserror('you cannot change status. Forbidden change, check documentation4',16,1)
						return
					end
			end	
		end
		else
		begin
			raiserror('you cannot change status. Forbidden change, check documentation5',16,1)
			return
		end
	end
	else
	begin
		raiserror('wrong status name provided, check documentation',16,1)
		return
	end

-----------------------

 if @listingID in (select ListingID from UserListing)   
 begin  
 update UserListing set ProductStatusID = @newStatusID  where ListingID=@listingID  
 update UserListing set LuthierID = @userID  where ListingID=@listingID  
 if (@newPrice is not null)  
  update UserListing set ProposedPrice = @newPrice where ListingID=@listingID  
 if (@LuthierText is not null)  
  update UserListing set LuthierDescription = @LuthierText  where ListingID=@listingID 
 if ((@currentStatusID = 1 and @userRole = 3) and  @newStatusID = 4)
 update UserListing set BuyerID = @userID where ListingID=@listingID 

 end
 else  
 raiserror('Given ListingID does not exist',16,1)  
end  
GO
/****** Object:  StoredProcedure [dbo].[spChangeLuthierServiceStatus]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE procedure [dbo].[spChangeLuthierServiceStatus] 

@userID int,-- zakładamy, że aby dokonać zmany, trzeba podać kto dokonuje zmiany --> UserID
@orderID int,
@newStatusID int,
@newPrice money = null,
@LuthierText text = null

as
begin 
---
	declare @userRole int
	select @userrole = UserRoleID from Users where UserID= @userID
	--GET VALUE OF CURRENT STATUS, THAT STEP LIMITS THE ACTIONS YOU CAN MAKE.
	
	declare @currentStatusID int
	execute spViewLuthierServiceStatusByID @orderID, @currentStatusID output,0
	
	
	--check if data entered is correct (for app logic purposes)
	if @newStatusID in (select StatusID from ProductStatusResponses)
	begin
		if ((@currentStatusID = 0 and @userRole = 2) or (@currentStatusID = 11 and @userRole = 3) or (@currentStatusID = 12 and @userRole = 2)
			 or (@currentStatusID = 2 and @userRole = 3) or (@currentStatusID = 1 and @userRole = 1) or (@currentStatusID = 5 and @userRole = 2))
		begin
			if (@currentStatusID = 0 and @userRole = 2)
				if @newStatusID in (11)
					print 'values entered correct'
				else 
				begin
					raiserror('you cannot change status. Forbidden change, check documentation1',16,1)
					return
				end
			if (@currentStatusID = 11 and @userRole = 3)
			begin
				if @newStatusID in (12, 31)
					print 'values entered correct'
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation2',16,1)
					return
				end
			end
			if (@currentStatusID = 12 and @userRole = 2)
			begin
				if @newStatusID in (1, 2, 3)
					print 'values entered correct'	
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation3',16,1)
					return
				end
			end
			if (@currentStatusID = 2 and @userRole = 3)
			begin
				if @newStatusID in (1, 12)
					print 'values entered correct'	
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation4',16,1)
					return
				end
			end
			if (@currentStatusID = 1 and @userRole = 1)
			begin
				if @newStatusID in (5)
					print 'values entered correct'	
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation5',16,1)
					return
				end
			end
			if (@currentStatusID = 5 and @userRole = 2)
			begin
				if @newStatusID in (99)
					print 'values entered correct'	
				else
				begin
					raiserror('you cannot change status. Forbidden change, check documentation6',16,1)
					return
				end
			end
-----
		end
		else
		begin
			raiserror('you cannot change status. Forbidden change, check documentation7',16,1)
			return
		end
	end
	else
	begin
		raiserror('you cannot change status. Forbidden change, check documentation8',16,1)
		return
	end		  

-----


---
 if @OrderID in (select OrderID from LuthierService)
begin
	update LuthierService set OrderStatusID = @newStatusID  where OrderID=@orderID
	if (@newPrice is not null)
		update LuthierService set ServiceCost = @newPrice where OrderID=@orderID
	if (@LuthierText is not null)
		update LuthierService set LuthierProblemDesc = @LuthierText  where OrderID=@orderID
	if @newStatusID in (3,31)
		delete from LuthierService where OrderID=@orderID 
end
else
	raiserror('Given Order ID does not exist',16,1)
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUserByID]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spDeleteUserByID]
@userIDtoDelete int
as
begin
	update UserListing set sellerID=null where SellerID=@userIDtoDelete
	update UserListing set buyerID=null where buyerID=@userIDtoDelete
	update UserListing set  luthierID=null where luthierID=@userIDtoDelete
	update LuthierService set luthierID=null where luthierID=@userIDtoDelete
	update LuthierService set customerID=null where customerID=@userIDtoDelete
	
	BEGIN TRY  
     delete from Users where UserID=@userIDtoDelete
	 print('User deleted successfully')
	END TRY  
	BEGIN CATCH  
	raiserror('User with given ID do not exist in db',16,1)
	END CATCH

end
GO
/****** Object:  StoredProcedure [dbo].[spOrderByServiceJobs]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spOrderByServiceJobs]
@luthierID varchar(50) = 'not assigned',
@statusName varchar(50) = 'Pending',
@orderbywhat varchar(50) = 'date',
@asc_desc varchar(50) = 'asc'
as
begin
	if (exists(select * from Users where UserID=@luthierID) or @luthierID='not assigned')
		and exists(select * from ProductStatusResponses where StatusName=@statusName)
		and (@orderbywhat = 'date' or @orderbywhat = 'deadline' or @orderbywhat = 'brand')
		and (@asc_desc = 'asc' or @asc_desc = 'desc')
	begin
		if (@luthierID='not assigned' and @statusName='Pending')
		begin	
			print 'xd'
			if (@orderbywhat='date' and @asc_desc='asc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by OrderDate asc 
			if (@orderbywhat='date' and @asc_desc='desc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by OrderDate desc
			if (@orderbywhat='deadline' and @asc_desc='asc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by OrderDeadline asc 
			if (@orderbywhat='deadline' and @asc_desc='desc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by OrderDeadline desc
			if (@orderbywhat='brand' and @asc_desc='asc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by brand asc
			if (@orderbywhat='brand' and @asc_desc='desc')  
				select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where statusname=@statusName order by brand desc
		end
		if (@luthierID !='not assigned')
		begin
			if @statusName='Pending' --czyli wtedy jeśli nie podał argumentu @statusname tj chce wszystkie swoje (podjęte) ogloszenia ze wszystkimi statusami
			begin 
				if (@orderbywhat='date' and @asc_desc='asc')
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by OrderDate asc
				if (@orderbywhat='date' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by OrderDate desc
				if (@orderbywhat='deadline' and @asc_desc='asc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by OrderDeadline asc
				if (@orderbywhat='deadline' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by OrderDeadline desc
				if (@orderbywhat='brand' and @asc_desc='asc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by brand asc
				if (@orderbywhat='brand' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID order by brand desc
					
			end
			else
			begin
				if (@orderbywhat='date' and @asc_desc='asc')
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by OrderDate asc
				if (@orderbywhat='date' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by OrderDate desc
				if (@orderbywhat='deadline' and @asc_desc='asc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by OrderDeadline asc
				if (@orderbywhat='deadline' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by OrderDeadline desc
				if (@orderbywhat='brand' and @asc_desc='asc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by brand asc
				if (@orderbywhat='brand' and @asc_desc='desc') 
					select OrderDate,OrderDeadline,brand,CategoryName,ServiceCost,[Customer Name] from vwDisplayLuthierServiceJobs where luthierID=@luthierID and statusname= @statusName order by brand desc
			end	
		end	
	end
	else
		raiserror('incorrect argument(s) supplied',16,1)
end
GO
/****** Object:  StoredProcedure [dbo].[spViewLuthierServiceStatusByID]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spViewLuthierServiceStatusByID]
@orderid int,
@currentOrderStatus int output,
@display int = 1
as 
begin
	select @currentOrderStatus = OrderStatusID from LuthierService
	where OrderID=@orderid

if (@display in (1,0))
begin
	if (@display=1)
	begin
		select ServiceCost,StatusName
		from LuthierService join ProductStatusResponses on LuthierService.OrderStatusID=ProductStatusResponses.StatusID
		where OrderID=@orderid
	end
end
else
	raiserror('incorrect parameters given',16,1)
end
GO
/****** Object:  StoredProcedure [dbo].[spViewProductStatusByListingID]    Script Date: 08/06/2021 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spViewProductStatusByListingID]
@listingid int,
@currentListingStatus int output,
@display int = 1
as 
begin
	select @currentListingStatus = ProductStatusID from UserListing 
	where ListingID=@listingid

if (@display in (1,0))
begin
	if (@display=1)
	begin
		select Proposedprice,StatusName
		from UserListing join ProductStatusResponses on UserListing.ProductStatusID=ProductStatusResponses.StatusID
		where ListingID=@listingid
	end
end
else
	raiserror('incorrect parameters given',16,1)
end
GO
USE [master]
GO
ALTER DATABASE [u_bkawa] SET  READ_WRITE 
GO

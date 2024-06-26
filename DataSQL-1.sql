USE [master]
GO
/****** Object:  Database [ProjectFinal]    Script Date: 08/06/2024 10:19:36 PM ******/
CREATE DATABASE [ProjectFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProjectFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProjectFinal_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProjectFinal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectFinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectFinal', N'ON'
GO
ALTER DATABASE [ProjectFinal] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProjectFinal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProjectFinal]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[RecipientName] [nvarchar](max) NULL,
	[RecipientPhone] [nvarchar](max) NULL,
	[RecipientAddress] [nvarchar](max) NULL,
	[TotalAmount] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08/06/2024 10:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231213035241_DBFirst', N'6.0.23')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Address], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'19c89783-c79c-4515-8037-c82138364889', N'Phạm Hoàng', N'Tuấn Anh', N'Hồ Chí Minh', N'phta2612@gmail.com', N'PHTA2612@GMAIL.COM', N'phta2612@gmail.com', N'PHTA2612@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKXqhM5sa0jnqlypE9ilj7QPjVaHSOrLk9m3vmdmbZ0gtVmlG8APitpPxNPJW93flA==', N'K7I2WDX6KXMIOQR2LEXJJ2MBCL3ACTSA', N'81d6c3a8-a89f-453f-b3e3-5eb9d71becf7', N'0867609323', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Address], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'870632e7-5e47-47e9-b077-7c151881c74d', N'Phạm', N'Anh', N'Hồ Chí Minh', N'phta@gmail.com', N'PHTA@GMAIL.COM', N'phta@gmail.com', N'PHTA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJSo2/puYqg2irDKE8n7MyIrxiQbZz9X4+DNIA1M9RH4/t704veuyTrnUl5em+lA4Q==', N'ADYDXJE64FGVT75ISDNOKW5ISWXJEALE', N'b0e9b307-af96-4276-a79f-43bf02ca4217', N'0867609323', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Address], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cd240d07-e5b7-4807-b60e-e1939762b0cd', N'Test', N'Test', N'HCM', N'phta26@gmail.com', N'PHTA26@GMAIL.COM', N'phta26@gmail.com', N'PHTA26@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECY8YlmmSYz0ZF9HzF2zNKG05LFBb/mdorg3C2oGwAewXzZGzlrgM0y3G96u7s7rDQ==', N'SBLYHGFMW4AYMBIBCTNE47VMI4IXJPPU', N'86c7cf0c-2797-44d7-8d13-0fe34a8df76f', N'0867609323', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Giày Sneaker', N'fdsd')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Dép Lê', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Giày Lười', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (4, N'Giày Cao', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (5, N'Giày Thể Thao', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (6, N'Giày Boot', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (7, N'Giày Rọ', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (16, N'GiayTreEm', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (17, N'GiayBupBe', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (18, N'GiayMoi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (19, N'GiayKep', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (20, N'giaysapo', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([Id], [ProductId], [OrderId], [Quantity], [Price], [Total]) VALUES (10, 1, 4, 2, 56, 112)
INSERT [dbo].[OrderProducts] ([Id], [ProductId], [OrderId], [Quantity], [Price], [Total]) VALUES (11, 2, 4, 1, 56, 56)
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Status], [CreatedAt], [RecipientName], [RecipientPhone], [RecipientAddress], [TotalAmount]) VALUES (4, N'19c89783-c79c-4515-8037-c82138364889', N'Pending', CAST(N'2023-12-14T07:46:13.7458314' AS DateTime2), N'aaaa', N'425264764', N'sgsgshf', 168)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (1, N'Giày New Balance 2002R', N'Steel Lead', 120, N'/assets/images/home/product1.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (2, N'Dép Adidas Adilette', N'22 Light Brown', 70, N'/assets/images/home/product2-1.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (3, N'Giày tây Đông Hải', N'Không dây buộc', 86, N'/assets/images/home/product4.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (4, N'Giày thể thao ZUCIANI', N'Vải dệt cổ thấp', 34, N'/assets/images/home/product5.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (5, N'Giày Boot CHUKKA', N'Giày Boot CHUKKA', 87, N'/assets/images/home/product6.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (6, N'Giày Lười', N'Họa tiết đường chỉ nổi', 61, N'/assets/images/home/product3.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (7, N'Giày Nike Air Jordan', N'Washed Denim', 180, N'/assets/images/home/product1-2.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (8, N'Giày Nike Air Force', N'You White Grey Green', 129, N'/assets/images/home/product1-3.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (9, N'Giày Adidas Samba', N'Talchum Pack ‑ Scarlet', 374, N'/assets/images/home/product1-4.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (10, N'Giày New Blance 530', N'White Silver', 106, N'/assets/images/home/product1-5.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (11, N'Easy Polo Black Edition', N'P.Uni White', 31, N'/assets/images/home/product2-2.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (12, N'Dép Adidas Adilette', N'Ayoon Off White', 55, N'/assets/images/home/product2-3.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (13, N'Dép Adidas Adilette', N'Clog Black', 37, N'/assets/images/home/product2-4.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (14, N'Giày Lười Nam Đông Hải', N'Viền Chỉ Đế Phối Màu', 65, N'/assets/images/home/product3-1.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (15, N'Giày Lười Nam Zuciani', N'Viền Chỉ Đế Phối Màu', 102, N'/assets/images/home/product3-2.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (16, N'Giày Lười Nam Zuciani', N'Vân Da Kẻ Sọc Thời Trang', 111, N'/assets/images/home/product3-3.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (17, N'Giày Tây Nam Đông Hải', N'Loafer Phối Phụ Kiện', 69, N'/assets/images/home/product4-1.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (18, N'Giày Tây Derby Đông Hải', N'Viền Chỉ Tinh Xảo', 65, N'/assets/images/home/product4-2.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (19, N'Giày Tây Nam Zuciani', N'Dáng Bucks Năng Động', 111, N'/assets/images/home/product4-3.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (20, N'Giày Thể Thao Zuciani', N'Vải Dệt Hoạ Tiết Thời Trang', 40, N'/assets/images/home/product5-1.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (21, N'Giày Thể Thao Zuciani', N'Vải Dệt Hoạ Tiết Thời Trang', 40, N'/assets/images/home/product5-2.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (22, N'Giày Thể Thao Zuciani', N'Vải Dệt Thời Trang', 61, N'/assets/images/home/product5-3.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (23, N'Giày Boot Nữ Đông Hải Cổ', N'Cao Da Bóng Thời Thượng', 93, N'/assets/images/home/product6-1.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (24, N'Giày Boot Nữ Zucia', N'Mũi Nhọn Gót Đính Đá', 70, N'/assets/images/home/product6-2.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (25, N'Giày Chelsea Boot', N'Giày Chelsea Boot', 86, N'/assets/images/home/product6-3.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (26, N'Giày Sandal Rọ Đông Hải', N'Quai Đan 3 Bản Mũi Tròn', 32, N'/assets/images/home/product7.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (27, N'Giày Sandal Rọ Đông Hải', N'Quai Đan 3 Bản Mũi Tròn', 32, N'/assets/images/home/product7-1.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (28, N'Sandals Rọ', N'Đường Chỉ Nổi Thời Trang', 81, N'/assets/images/home/product7-2.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (32, N'Giày Sandal Rọ Bé Trai', N'Zucia Bít Mũi', 22, N'/assets/images/home/product21.jpg', 16)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (33, N'Dép Quai Ngang Bé Gái', N'Zucia Phối Họa Tiết', 22, N'/assets/images/home/product21-1.jpg', 16)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (34, N'Giày Thể Thao Trẻ Em', N'Cổ Dệt Thun Vải Lưới', 25, N'/assets/images/home/product21-2.jpg', 16)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (35, N'Giày Sandal Bé Trai', N'Zucia Đế Mềm Chống Trượt', 26, N'/assets/images/home/product21-3.jpg', 16)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (36, N'Giày Búp Bê Dập', N'Logo Đính Đá', 21, N'/assets/images/home/product22.jpg', 17)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (37, N'Giày Búp Bê Dập Lỗ', N'Khóa Logo Mạ Vàng', 24, N'/assets/images/home/product22-1.jpg', 17)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (38, N'Giày Búp Bê', N'Họa Tiết Nơ Đính Logo', 55, N'/assets/images/home/product22-2.jpg', 17)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (39, N'Giày Búp Bê Zuciani', N'Da Mềm Họa Tiết Nơ', 75, N'/assets/images/home/product22-3.jpg', 17)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (40, N'Giày Mọi', N'Easy Polo Black Edition', 24, N'/assets/images/home/product23.jpg', 18)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (41, N'Giày Mọi', N'Easy Polo Black Edition', 26, N'/assets/images/home/product23-1.jpg', 18)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (42, N'Giày Mọi', N'Easy Polo Black Edition', 25, N'/assets/images/home/product23-2.jpg', 18)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (43, N'Giày Mọi', N'Easy Polo Black Edition', 75, N'/assets/images/home/product23-3.jpg', 18)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (44, N'Dép Kẹp Nam', N'Đế Phylon Siêu Đàn Hồi', 24, N'/assets/images/home/product24.jpg', 19)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (45, N'Dép Kẹp Nam', N'Đế Phylon Siêu Đàn Hồi', 45, N'/assets/images/home/product24-1.jpg', 19)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (46, N'Dép Kẹp Nam', N'Đế Phylon Siêu Đàn Hồi', 56, N'/assets/images/home/product24-2.jpg', 19)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (47, N'Dép Kẹp Nam', N'Đế Phylon Siêu Đàn Hồi', 50, N'/assets/images/home/product24-3.jpg', 19)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (48, N'Dép Sapo Nam', N'Easy Polo Black Edition', 77, N'/assets/images/home/product25.jpg', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (49, N'Dép Sapo Nam', N'Easy Polo Black Edition', 85, N'/assets/images/home/product25-1.jpg', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (50, N'Dép Sapo Nam', N'Easy Polo Black Edition', 53, N'/assets/images/home/product25-2.jpg', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (51, N'Dép Sapo Nam', N'Easy Polo Black Edition', 56, N'/assets/images/home/product25-3.jpg', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Image], [CategoryId]) VALUES (52, N'Dép Sapo Nam', N'Easy Polo Black Edition', 64, N'/assets/images/home/product25-1.jpg', 20)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_OrderId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_OrderId] ON [dbo].[OrderProducts]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_ProductId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_ProductId] ON [dbo].[OrderProducts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 08/06/2024 10:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [ProjectFinal] SET  READ_WRITE 
GO

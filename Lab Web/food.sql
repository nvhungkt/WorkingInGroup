USE [master]
GO
/****** Object:  Database [RecipeWebDB]    Script Date: 04/10/2017 10:33:57 CH ******/
CREATE DATABASE [RecipeWebDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecipeWebDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RecipeWebDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RecipeWebDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RecipeWebDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RecipeWebDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecipeWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecipeWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecipeWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecipeWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecipeWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecipeWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecipeWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecipeWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecipeWebDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecipeWebDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecipeWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [RecipeWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecipeWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecipeWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecipeWebDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RecipeWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RecipeWebDB]
GO
/****** Object:  Table [dbo].[tbl_Article]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Article](
	[ArticleID] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ContentURL] [nvarchar](200) NOT NULL,
	[AuthorID] [nvarchar](10) NOT NULL,
	[ReviewerID] [nvarchar](10) NULL,
	[ApproverID] [nvarchar](10) NULL,
	[DateTime] [datetime] NOT NULL,
	[SubcategoryID] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[LastModifiedDateTime] [datetime] NULL,
	[Views] [int] NOT NULL,
	[LastEditorID] [nvarchar](10) NULL,
	[Reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Comment]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Comment](
	[CommentID] [nvarchar](10) NOT NULL,
	[GuestName] [nvarchar](50) NOT NULL,
	[GuestEmail] [nvarchar](30) NULL,
	[GuestPhone] [nvarchar](12) NULL,
	[CommentContent] [nvarchar](500) NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[ArticleID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Staff]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Staff](
	[StaffID] [nvarchar](10) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [nvarchar](13) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Role] [nvarchar](13) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Subcategory]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subcategory](
	[SubcategoryID] [nvarchar](10) NOT NULL,
	[CategoryID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Subcategory] PRIMARY KEY CLUSTERED 
(
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_WorkingSubcategory]    Script Date: 04/10/2017 10:33:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WorkingSubcategory](
	[StaffID] [nvarchar](10) NOT NULL,
	[SubcategoryID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_WorkingSubcategory] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'R0001', N'How to Make 3 Healthy Pasta Primavera Recipes', N'bai_viet_test.txt', N'04', NULL, NULL, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'15', N'Pending for Employee', NULL, 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'R0002', N'AAAAA', N'bai_viet2', N'03', NULL, NULL, CAST(N'2017-10-01 00:00:00.000' AS DateTime), N'13', N'Rejected', NULL, 0, NULL, N'sadasddsa')
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'1', N'Food news', NULL)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'2', N'Recipes', NULL)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'3', N'Restaurants', NULL)
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C0002', N'Lan Nguyen', NULL, NULL, N'Hello Thao, Viet Nam diem danh de', CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'R0001')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C019251058', N'asd', N'asdasd', N'asdasd', N'sadasd', CAST(N'2017-10-03 15:27:31.060' AS DateTime), N'R0001')
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'01', N'admin', N'admin', N'admin', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'admin@gmail.com', N'Tòa nhà HAGL Safomec, 7/1 Thành Thái, P14, Q10, TP.HCM', N'Administrator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'02', N'collaborator01', N'collaborator', N'collaborator issatsu', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'collaborator1@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'03', N'collaborator02', N'collaborator', N'collaborator nisatsu', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'collaborator2@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'04', N'collaborator03', N'collaborator', N'collaborator sansatsu', CAST(N'1990-01-01' AS Date), N'female', N'01229930112', N'collaborator3@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'05', N'collaborator04', N'collaborator', N'collaborator yonsatsu', CAST(N'1990-01-01' AS Date), N'female', N'01228837192', N'collaborator4@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'06', N'collaborator05', N'collaborator', N'collaborator gosatsu', CAST(N'1990-01-01' AS Date), N'female', N'01228871923', N'collaborator5@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'07', N'collaborator06', N'collaborator', N'collaborator rossatsu', CAST(N'1990-01-01' AS Date), N'female', N'01228232913', N'collaborator6@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'08', N'collaborator07', N'collaborator', N'collaborator nanasatsu', CAST(N'1990-01-01' AS Date), N'male', N'01239181838', N'collaborator7@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'09', N'collaborator08', N'collaborator', N'collaborator hassatsu', CAST(N'1990-01-01' AS Date), N'male', N'01239928193', N'collaborator8@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'10', N'collaborator09', N'collaborator', N'collaborator kyuusatsu', CAST(N'1990-01-01' AS Date), N'male', N'01281938193', N'collaborator9@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'11', N'collaborator10', N'collaborator', N'collaborator jussatsu', CAST(N'1990-01-01' AS Date), N'female', N'02191938191', N'collaborator10@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'12', N'employee01', N'employee', N'employee ippiki', CAST(N'1990-01-01' AS Date), N'male', N'01919238912', N'employee01@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'13', N'employee02', N'employee', N'employee nihiki', CAST(N'1990-01-01' AS Date), N'male', N'01192939123', N'employee02@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'14', N'employee03', N'employee', N'employee sanbiki', CAST(N'1990-01-01' AS Date), N'male', N'01221891823', N'employee03@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'15', N'employee04', N'employee', N'employee yonhiki', CAST(N'1990-01-01' AS Date), N'female', N'01128391813', N'employee04@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'16', N'employee05', N'employee', N'employee gohiki', CAST(N'1990-01-01' AS Date), N'male', N'01918381823', N'employee05@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'17', N'employee06', N'employee', N'employee roppiki', CAST(N'1900-01-01' AS Date), N'female', N'01283819183', N'employee06@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'18', N'manager01', N'manager', N'manager ippai', CAST(N'1990-01-01' AS Date), N'female', N'01239918391', N'manager01@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'19', N'manager02', N'manager', N'manager nihai', CAST(N'1990-01-01' AS Date), N'male', N'01283712837', N'manager02@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'20', N'manager03', N'manager', N'manager sanbai', CAST(N'1990-01-01' AS Date), N'female', N'01928381837', N'manager03@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'01', N'1', N'Masterchef', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'02', N'1', N'Chef''s advisions', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'03', N'1', N'Nutritious', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'04', N'2', N'South East Asian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'05', N'2', N'French', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'06', N'2', N'American', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'07', N'2', N'German', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'08', N'2', N'Indian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'09', N'2', N'Japanese', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'10', N'2', N'Korean', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'11', N'2', N'Spanish', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'12', N'2', N'Mexican', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'13', N'2', N'African', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'14', N'2', N'Carribean', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'15', N'2', N'Italian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'16', N'3', N'5-stars', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'17', N'3', N'4-stars', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'18', N'3', N'Home made', 1, NULL)
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'04', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'04', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'06', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'06', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'08', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'04')
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff1] FOREIGN KEY([ReviewerID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff1]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff2] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff2]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff3] FOREIGN KEY([LastEditorID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff3]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Subcategory] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[tbl_Subcategory] ([SubcategoryID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Subcategory]
GO
ALTER TABLE [dbo].[tbl_Comment]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Comment_tbl_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[tbl_Article] ([ArticleID])
GO
ALTER TABLE [dbo].[tbl_Comment] CHECK CONSTRAINT [FK_tbl_Comment_tbl_Article]
GO
ALTER TABLE [dbo].[tbl_Subcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Subcategory_tbl_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[tbl_Subcategory] CHECK CONSTRAINT [FK_tbl_Subcategory_tbl_Category]
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory] CHECK CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Subcategory] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[tbl_Subcategory] ([SubcategoryID])
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory] CHECK CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Subcategory]
GO
USE [master]
GO
ALTER DATABASE [RecipeWebDB] SET  READ_WRITE 
GO

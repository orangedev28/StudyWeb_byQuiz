USE [master]
GO
/****** Object:  Database [StudyWeb]    Script Date: 6/27/2023 11:33:50 PM ******/
CREATE DATABASE [StudyWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudyWeb', FILENAME = N'D:\Cài SQL Sever\Cài gói cilent\MSSQL15.ORANGESEVER\MSSQL\DATA\StudyWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudyWeb_log', FILENAME = N'D:\Cài SQL Sever\Cài gói cilent\MSSQL15.ORANGESEVER\MSSQL\DATA\StudyWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudyWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudyWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudyWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudyWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudyWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudyWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudyWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudyWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudyWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudyWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudyWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudyWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudyWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudyWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudyWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudyWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudyWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudyWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudyWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudyWeb] SET  MULTI_USER 
GO
ALTER DATABASE [StudyWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudyWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudyWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudyWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudyWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudyWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudyWeb', N'ON'
GO
ALTER DATABASE [StudyWeb] SET QUERY_STORE = OFF
GO
USE [StudyWeb]
GO
/****** Object:  User [bao]    Script Date: 6/27/2023 11:33:50 PM ******/
CREATE USER [bao] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/27/2023 11:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[imageUser] [nvarchar](500) NULL,
	[maill] [nvarchar](100) NOT NULL,
	[phone] [nchar](11) NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classs]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[imageClass] [nvarchar](100) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Classs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPosts] [int] NULL,
	[idUser] [int] NOT NULL,
	[idComment] [int] NULL,
	[contentComment] [nvarchar](4000) NOT NULL,
	[imageComment1] [nvarchar](500) NULL,
	[imageComment2] [nvarchar](500) NULL,
	[imageComment3] [nvarchar](500) NULL,
	[imageComment4] [nvarchar](500) NULL,
	[likeComment] [int] NULL,
	[dateComment] [datetime] NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[maill] [nvarchar](100) NOT NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](500) NULL,
	[message] [nvarchar](4000) NOT NULL,
	[dateSend] [datetime] NULL,
	[status] [nvarchar](500) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NULL,
	[contentDocument] [nvarchar](4000) NOT NULL,
	[linkDocument] [nvarchar](500) NULL,
	[imageDocument] [nvarchar](500) NULL,
	[dateUpload] [datetime] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[contentPosts] [nvarchar](4000) NOT NULL,
	[imagePosts1] [nvarchar](500) NULL,
	[imagePosts2] [nvarchar](500) NULL,
	[imagePosts3] [nvarchar](500) NULL,
	[imagePosts4] [nvarchar](500) NULL,
	[datePost] [datetime] NULL,
	[countLike] [int] NULL,
	[countComment] [int] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTest] [int] NOT NULL,
	[question] [nvarchar](4000) NOT NULL,
	[imageQuestion1] [nvarchar](500) NULL,
	[imageQuestion2] [nvarchar](500) NULL,
	[imageQuestion3] [nvarchar](500) NULL,
	[imageQuestion4] [nvarchar](500) NULL,
	[answer1] [nvarchar](4000) NULL,
	[answer2] [nvarchar](4000) NULL,
	[answer3] [nvarchar](4000) NULL,
	[answer4] [nvarchar](4000) NULL,
	[correctAnswer] [nvarchar](4000) NOT NULL,
	[imageAnswer1] [nvarchar](500) NULL,
	[imageAnswer2] [nvarchar](500) NULL,
	[imageAnswer3] [nvarchar](500) NULL,
	[imageAnswer4] [nvarchar](500) NULL,
	[score] [float] NOT NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTest] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[score] [float] NOT NULL,
	[dateAdd] [datetime] NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idClass] [int] NOT NULL,
	[subjectName] [nvarchar](500) NOT NULL,
	[imageSubjects] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NOT NULL,
	[nameTest] [nvarchar](500) NOT NULL,
	[timeTest] [int] NOT NULL,
	[dateUpload] [date] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](100) NOT NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_TypeAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/27/2023 11:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NOT NULL,
	[nameVideo] [nvarchar](200) NOT NULL,
	[describe] [nvarchar](4000) NOT NULL,
	[linkVideo] [nvarchar](500) NOT NULL,
	[dateUpload] [datetime] NULL,
	[countLike] [int] NULL,
	[countComment] [int] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (12, 3, N'LộcLord', N'user.png', N'phaybucphu9@gmail.com', N'0389832123 ', N'1127652ef513f99975283a30855cbb6a', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (13, 3, N'khanglord2', N'ba8c7fe1-bda5-4f8d-837a-cd672c79be42.jpg', N'900ae0011@gmail.com', N'0348723452 ', N'1127652ef513f99975283a30855cbb6a', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (14, 3, N'Công Khang 02', N'1f86d08c-facb-4751-b2fe-7d9807058b3a.jpg', N'bienhuynhcongkhang@gmail.com', N'0327468612 ', N'b5bba682b439f5d5899776c3b536e95b', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (16, 1, N'khangadmin', N'user.png', N'200ae0011@gmail.com', N'0342886202 ', N'202cb962ac59075b964b07152d234b70', N'Hoạt động', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Classs] ON 

INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (1, N'Năm 1', N'1.jpg', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (3, N'Năm 2', N'2.jpg', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (4, N'Năm 3', N'3.jpg', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (5, N'Năm 4', N'4.jpg', 1)
SET IDENTITY_INSERT [dbo].[Classs] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (16, 13, 13, NULL, N'Ảnh đẹp quá đi', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-27T17:29:01.003' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (7, N'Công Khang', N'bienhuynhcongkhang@gmail.com', N'0353854616', N'Trường Hutech Q9', N'Hello', CAST(N'2023-05-27T21:11:48.503' AS DateTime), N'Đã duyệt')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (5, 1, N'Giáo Trình Lập Trình C', N'giaotrinhC.pdf', NULL, CAST(N'2023-05-21T21:33:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (21, 14, N'Slide bài 1', N'Slide bài 1.pdf', NULL, CAST(N'2023-05-27T22:24:05.000' AS DateTime), N'Chưa đọc', 1)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (22, 14, N'Slide bài 2', N'Slide bài 2.pdf', N'', CAST(N'2023-05-27T22:24:22.660' AS DateTime), N'Chưa đọc', 1)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (23, 13, N'Giáo Trình CTDL và Giải Thuật', N'Giáo trình Cấu trúc dữ liệu và Giải thuật.pdf', N'', CAST(N'2023-05-27T22:24:47.940' AS DateTime), N'Chưa đọc', 1)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (24, 12, N'Thuật Toán Leo Đồi', N'Báo cáo Trí Tuệ Nhân Tạo_20DTHB5_Nhóm 5.pdf', N'', CAST(N'2023-05-27T22:27:53.110' AS DateTime), N'Chưa đọc', 1)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (25, 2, N'test tài liệu', N'Slide bài 1.pdf', N'', CAST(N'2023-06-20T04:58:11.220' AS DateTime), N'Chưa đọc', NULL)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (13, 13, N'Mọi người cho mình hỏi môn C++ thi máy hay làm giấy vậy ạ?', N'6281c2be-0aba-45fe-952b-dec0136b09bf.jpg', NULL, NULL, NULL, CAST(N'2023-05-27T23:50:31.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (14, 13, N'Mọi người cho em hỏi tài liệu môn Lập trình C đi thi có bỏ phần nào không ạ?', N'000c269f-a9b3-4604-b9ff-ce4498e12db9.png', NULL, NULL, NULL, CAST(N'2023-06-10T16:03:01.120' AS DateTime), NULL, NULL, N'', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (1, 1, N'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào:', NULL, NULL, NULL, NULL, N'Ngôn Ngữ B.', N'Ngôn Ngữ BCPL', N'Ngôn Ngữ DEC PDP.', N'Ngôn ngữ B và BCPL.', N'Ngôn ngữ B và BCPL.', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (2, 1, N'Ngôn ngữ lập trình nào dưới đây là ngôn ngữ lập trình có cấu trúc?', NULL, NULL, NULL, NULL, N'Ngôn ngữ Assembler.', N'Ngôn ngữ C và Pascal.', N'Ngôn ngữ Cobol.', N'A, B và C.', N'Ngôn ngữ C và Pascal.', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (3, 1, N'Một biến được gọi là một biến địa phương nếu:', NULL, NULL, NULL, NULL, N'Nó được khai báo bên trong các hàm hoặc thủ tục, kể cả hàm main().', N'Nó đươc khai báo bên trong các hàm ngoại trừ hàm main().', N'Nó được khai báo bên trong hàm main().', N'Nó được khai báo bên ngoài các hàm kể cả hàm main().', N'Nó đươc khai báo bên trong các hàm ngoại trừ hàm main().', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (4, 1, N'Giả sử a, b là hai số thực. Biểu thức nào dưới đây viết không đúng theo cú pháp của ngôn ngữ lập trình C:', NULL, NULL, NULL, NULL, N'(a+=b).', N'(a*=b).', N'(a=b).', N'(a&=b).', N'(a&=b).', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (12, 1, N'Kiểu dữ liệu nào dưới đây không được coi là kiểu dữ liệu cơ bản trong ngôn ngữ lập trình C :', NULL, NULL, NULL, NULL, N'Kiểu mảng.', N'Kiểu enum.', N'Kiểu short int.', N'Kiểu unsigned.', N'Kiểu mảng.', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (13, 1, N'Lệnh nào trong các lệnh sau cho phép chuyển sang vòng lặp tiếp theo mà không cần phải thực hiện phần còn lại của vòng lặp:', NULL, NULL, NULL, NULL, N'break.', N'goto.', N'continue.', N'return.', N'continue.', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (14, 1, N'Nếu hàm được gọi trước khi nó định nghĩa thì điều kiện là gì :', NULL, NULL, NULL, NULL, N'Kiểu trả về của hàm phải là kiều void.', N'Kiểu đầu vào của hàm phải là kiểu void.', N'Trước khi gọi hàm nó phải được khai báo.', N'Hàm chỉ trả về kiểu dữ liệu boolean.', N'Trước khi gọi hàm nó phải được khai báo.', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (15, 1, N'Dữ liệu kí tự bao gồm :', NULL, NULL, NULL, NULL, N'Các kí tự số chữ số.', N'Các kí tự chữ cái.', N'Các kí tự đặc biệt.', N'Cả a,b và c.', N'Cả a,b và c.', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (16, 1, N'Biến con trỏ có thể chứa :', NULL, NULL, NULL, NULL, N'Địa chỉ vùng nhớ của một biến khác.', N'Giá trị của một biến khác.', N'Cả a và b đều đúng.', N'Cả a và b đều sai.', N'Địa chỉ vùng nhớ của một biến khác.', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (17, 1, N'Trong các hàm sau, hàm nào để nhập một kí tự từ bàn phím ngay sau khi gõ, không chờ nhấn Enter và không hiện ra màn hình:', NULL, NULL, NULL, NULL, N'scanf();', N'getchar();', N'getch();', N'getche();', N'getch();', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (18, 2, N'Khai báo các biến: int m,n; float x,y; Lệnh nào sai :', NULL, NULL, NULL, NULL, N'n=5 ;', N'x=10 ;', N'y=12.5 ;', N'm=2.5 ;', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (19, 2, N'Kết quả in ra màn hình của biểu thức sau là gì:-3+4%5/2.', NULL, NULL, NULL, NULL, N'-1.', N'-3.', N'1.', N'Kết quả khác.', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (20, 2, N'Có các khai báo sau: int x=15; int *p; Muốn p là con trỏ trỏ tới x phải thực hiện lệnh nào:', NULL, NULL, NULL, NULL, N'p=x;', N'p=&x;', N'p=*x;', N'Tất cả các lệnh đều đúng.', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (21, 2, N'Nếu có các khai báo sau: char msg[10]; char value; Câu nào sau đây sẽ là đúng:', NULL, NULL, NULL, NULL, N'msg[2]=value;', N'msg=value;', N'Cả hai câu trên.', N'Không câu nào đúng.', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (22, 2, N'Kí hiệu nào là con trỏ của phẩn tử thứ 3 của màng a có 4 kí tự:', NULL, NULL, NULL, NULL, N'*(a+3);', N'*(a+2);', N'*a+3;', N'*(a+4);', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (23, 2, N'Có các khai báo sau: char tb, mang[15]; Trong các câu lệnh sau, câu nào đúng:', NULL, NULL, NULL, NULL, N'tb=”chào bạn”;', N'gets(mang);', N'mang=”chaoban”;', N'gets(tb);', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (24, 2, N'Giả sử trong ngôn ngữ C sử dụng khai báo “double a[12]”, phần tử a[7] là phần tử thứ bao nhiêu trong mảng a:', NULL, NULL, NULL, NULL, N'Thứ 6.', N'Thứ 7.', N'Thứ 8.', N'Thứ 9.', N'C', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (25, 2, N'Nếu có các khai báo sau: char msg[10]; char *ptr; char value; Câu nào sau đây là đúng:', NULL, NULL, NULL, NULL, N'ptr=value;', N'ptr=msg;', N'Cả hai câu trên đều đúng.', N'Cả hai câu trên đều sai.', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (26, 2, N'Để chú thích trên một dòng lệnh trong chương trình, ta dùng cặp dấu nào', NULL, NULL, NULL, NULL, N'\* và *\', N'<<', N'//', N'>>', N'C', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (27, 2, N'Độ ưu tiên đối với các toán tử logic là:', NULL, NULL, NULL, NULL, N'AND, NOT, OR.', N'NOT, OR, AND.', N'OR, NOT, AND.', N'NOT, AND, OR.', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (28, 6, N'Có bao nhiêu qui tắc trong giải thuật tìm kiếm theo chiều rộng? ', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'C', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (29, 6, N'Giải thuật tìm kiếm theo chiều rộng bắt đầu duyệt từ? ', NULL, NULL, NULL, NULL, N'Nút kề. ', N'Nút gốc. ', N'Nút con. ', N'Nút cha.', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (30, 6, N'“Nếu không tìm thấy đỉnh liền kề, thì xóa đỉnh đầu tiên trong hàng đợi.” là qui tắc thứ mấy trong giải thuật tìm kiếm theo chiều rộng? ', NULL, NULL, NULL, NULL, N'Qui tắc 2. ', N'Qui tắc 4. ', N'Qui tắc 1. ', N'Qui tắc 3. ', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (31, 6, N'Đâu không phải là ứng dụng của giải thuật tìm kiếm theo chiều rộng trong bài toán lý thuyết đồ thị? ', NULL, NULL, NULL, NULL, N'Tìm đường đi ngắn nhất giửa 2 đỉnh u và v. ', N'Tìm các thành phần liên thông. ', N'Tìm tất cả các đỉnh trong một thành phần liên thông. ', N'Tìm kiếm có giới hạn. ', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (32, 6, N'Giải thuật tìm kiếm theo chiều rộng có bao nhiều tính chất? ', NULL, NULL, NULL, NULL, N'3 tính chất. ', N'1 tính chất. ', N'4 tính chất. ', N'2 tính chất. ', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (33, 6, N'Đáp án nào đúng với giải thuật tìm kiếm theo chiều rộng? ', NULL, NULL, NULL, NULL, N'Duyệt tất cả các đỉnh. ', N'Duyệt một nửa số đỉnh. ', N'Chỉ duyệt đỉnh đầu của đồ thị. ', N'Chỉ duyệt đỉnh cuối của đồ thị ', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (34, 6, N'Đâu là đáp án đúng của giải thuật tìm kiếm theo chiều sâu? ', NULL, NULL, NULL, NULL, N'Sử dụng hàng đợi. ', N'Sử dụng ngăn xếp. ', N'Sử dụng mảng nhiều chiều. ', N'Sử dụng ma trận. ', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (35, 6, N'Tìm kiếm theo chiều sâu có giới hạn là gì? ', NULL, NULL, NULL, NULL, N'Là một thuật toán phát triển các nút đã xét các theo chiều sâu nhưng có giới hạn mức. ', N'Là một thuật toán phát triển các nút chưa xét các theo chiều sâu nhưng có giới hạn mức. ', N'Là một thuật toán phát triển tất cả các nút theo chiều sâu nhưng có giới hạn mức. ', N'Là một thuật toán phát triển các nút chưa xét các theo chiều rộng nhưng có giới hạn mức. ', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (36, 6, N'Tìm kiếm theo giá thành thống nhất là tối ưu vì:', NULL, NULL, NULL, NULL, N'Con đường có chi phí cao nhất được chọn. ', N'Con đường có chi phí thấp nhất được chọn. ', N'Con đường có chi phí cao nhất và thấp nhất được chọn. ', N'Con đường có chi phí thấp nhất không được chọn. ', N'B', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (37, 6, N'Giải thuật tìm kiếm Simulated Annealing sử dụng chiến lược tìm kiếm gì? ', NULL, NULL, NULL, NULL, N'Ngẫu nhiên. ', N'Tuần tự. ', N'Không ngẫu nhiên. ', N'Không tuần tự. ', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (38, 7, N'Cấu trúc dữ liệu nào tương ứng với LIFO?', NULL, NULL, NULL, NULL, N'Queue.', N'Linked List.', N'Tree.', N'Stack.', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (39, 7, N'Lựa chọn câu đúng nhất về danh sách liên kết đôi (Doubly Linked List):', NULL, NULL, NULL, NULL, N'Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 01 phần tử khác trong danh sách.', N'Vùng liên kết của một phần tử trong danh sách liên đôi có 01 mối liên kết với 02 phần tử khác trong danh sách.', N'Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 02 trước và sau nó trong danh sách.', N'Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với phần tử đầu và cuối của danh sách.', N'C', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (40, 7, N'Mối quan hệ giữa cấu trúc dữ liệu và giải thuật có thể minh họa bằng đẳng thức:', NULL, NULL, NULL, NULL, N'Cấu trúc dữ liệu + Giải thuật = Chương trình.', N'Cấu trúc dữ liệu + Chương trình = Giải thuật.', N'Chương trình + Giải thuật = Cấu trúc dữ liệu.', N'Cấu trúc dữ liệu = Chương trình.', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (41, 7, N'Các tiêu chuẩn đánh giá cấu trúc dữ liệu. Để đánh giá một cấu trúc dữ liệu chúng ta thường dựa vào một số tiêu chí:', NULL, NULL, NULL, NULL, N'Cấu trúc dữ liệu phải tiết kiệm tài nguyên (bộ nhớ trong).', N'Cấu trúc dữ liệu phải phản ảnh đúng thực tế của bài toán.', N'Cấu trúc dữ liệu phải dễ dàng trong việc thao tác dữ liệu.', N'Cả a, b, c đều đúng.', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (42, 7, N'Lựa chọn định nghĩa về danh sách đúng nhất?', NULL, NULL, NULL, NULL, N'Danh sách là tập hợp các phần tử có kiểu dữ liệu xác định và giữa chúng có một mối liên hệ nào đó.', N'Số phần tử của danh sách gọi là chiều dài của danh sách.', N'Một danh sách có chiều dài bằng 0 là một danh sách rỗng.', N' Cả a, b, c đều đúng.', N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (43, 7, N'Cấu trúc dữ liệu mảng có các ưu điểm nào?', NULL, NULL, NULL, NULL, N'Việc thêm, bớt các phần tử trong danh sách đặc có nhiều khó khăn do phải di dời các phần tử khác đi qua chỗ khác.', N'Việc truy xuất và tìm kiếm các phần tử của mảng là dễ dàng vì các phần tử đứng liền nhau nên chúng ta chỉ cần sử dụng chỉ số để định vị vị trí các phần tử trong danh sách (định vị địa chỉ các phần tử).', N'Mật độ sử dụng bộ nhớ của mảng là tối ưu tuyệt đối.', N'Câu a ,  b , c đúng.', N'D', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (44, 7, N'Định nghĩa nào là đúng với danh sách liên kết?', NULL, NULL, NULL, NULL, N'Danh sách liên kết là cấu trúc dữ liệu dạng cây.', N'Danh sách liên kết là cấu trúc dữ liệu tự định nghĩa.', N'Danh sách liên kết là tập hợp các phần tử mà giữa chúng có một sự nối kết với nhau thông qua vùng liên kết của chúng.', N'Danh sách liên kết là tập hợp các phần tử mà đặt kề cận với nhau trong vùng nhớ.', N'Danh sách liên kết là tập hợp các phần tử mà giữa chúng có một sự nối kết với nhau thông qua vùng liên kết của chúng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (45, 7, N'Thao tác nào dưới đây thực hiện trên ngăn xếp (stack):', NULL, NULL, NULL, NULL, N'Thêm phần tử vào vị trí bất kỳ.', N'Loại bỏ phần tử tại vị trí bất kỳ.', N'Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top).Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top).', N'Thêm và loại bỏ phần tử có thể thực hiện tại vị trí bất kỳ.', N'Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top).Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top).', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (46, 7, N'Nút có khóa nhỏ nhất trong cây nhị phân tìm kiếm khác rỗng là:', NULL, NULL, NULL, NULL, N'Nút gốc.', N'Tất cả các nút.', N'Nút con bên phải nhất.', N'Nút con bên trái nhất.', N'Nút con bên trái nhất.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (47, 7, N'Cây nhị phân khác rỗng là cây:', NULL, NULL, NULL, NULL, N'Mỗi nút (trừ nút lá) đều có hai nút con.', N'Tất cả các nút đều có nút con.', N'Mỗi nút có không quá 2 nút con.', N'Tất cả các nút đều có nút cha.', N'Mỗi nút có không quá 2 nút con.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (48, 8, N'Thiết bị hub thông thường nằm ở tầng nào của mô hình OSI?', NULL, NULL, NULL, NULL, N'Tầng 1.', N'Tầng 2.', N'Tầng 3.', N'Tất cả đều sai.', N'Tầng 1.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (49, 8, N'Thiết bị Hub có bao nhiêu collision domain?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'1', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (50, 8, N'Phát biểu nào sau đây là đúng nhất cho Switch:', NULL, NULL, NULL, NULL, N'Sử dụng địa chỉ vật lý và hoạt động tại tầng Physical của mô hình OSI.', N'Sử dụng địa chỉ vật lý và hoạt động tại tầng Network của mô hình OSI.', N'Sử dụng địa chỉ vật lý và hoạt động tại tầng Data Link của mô hình OSI.', N'Sử dụng địa chỉ IP và hoạt động tại tầng Network của mô hình OSI.', N'Sử dụng địa chỉ vật lý và hoạt động tại tầng Data Link của mô hình OSI.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (51, 8, N'Chọn phát biểu ĐÚNG về switch và hub:', NULL, NULL, NULL, NULL, N'Sử dụng HUB hiệu quả hơn, do HUB làm tăng kích thước của collision – domain.', N'Sử dụng SWITCH hiệu quả hơn, do SWITCH phân cách các collision – domain.', N'HUB và SWITCH đều cho hiệu suất hoạt động ngang nhau, tuy nhiên SWITCH cho phép cấu hình để thực hiện một số công việc khác nên đắt tiền hơn.', N'HUB làm tăng hiệu năng của mạng do chỉ chuyển các tín hiệu nhị phân mà không xử lý gì hết. Khác với SWITCH phải xử lý các tín hiệu trước khi truyền đi nên làm tăng độ trễ dẫn đến giảm hiệu năng mạng.', N'Sử dụng SWITCH hiệu quả hơn, do SWITCH phân cách các collision – domain.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (52, 8, N'Khi sử dụng mạng máy tính ta sẽ được các lợi ích:', NULL, NULL, NULL, NULL, N'Chia sẻ tài nguyên (ổ cứng, cơ sở dữ liệu, máy in, các phần mềm tiện ích, …).', N'Quản lý tập trung, bảo mật và backup tốt.', N'Sử dụng các dịch vụ mạng.', N'Tất cả đều đúng.', N'Tất cả đều đúng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (53, 8, N'Kĩ thuật dùng để nối kết nhiều máy tính với nhau trong phạm vi một văn phòng gọi là:', NULL, NULL, NULL, NULL, N'LAN.', N'WAN.', N'MAN.', N'Internet.', N'LAN.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (54, 8, N'Mạng Internet là sự phát triển của:', NULL, NULL, NULL, NULL, N'Các hệ thống mạng LAN.', N'Các hệ thống mạng WAN.', N'Các hệ thống mạng Internet.', N'Cả ba câu đều đúng.', N'Cả ba câu đều đúng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (55, 8, N'Kiến trúc một mạng LAN có thể là:', NULL, NULL, NULL, NULL, N'RING.', N'BUS.', N'Có thể phối hợp các mô hình trên.', N'Tất cả đáp án trên.', N'BUS.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (56, 8, N'Phát biểu nào sau đây mô tả đúng nhất cho cấu hình Star:', NULL, NULL, NULL, NULL, N'Cần ít cáp hơn nhiều so với các cấu hình khác.', N'Khi cáp đứt tại một điểm nào đó làm toàn bộ mạng ngưng hoạt động.', N'Khó tái lập cấu hình hơn so với các cấu hình khác.', N'Dễ kiểm soát và quản lý tập trung.', N'Dễ kiểm soát và quản lý tập trung.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (57, 8, N'Đơn vị của “băng thông l ”:', NULL, NULL, NULL, NULL, N'Hertz (Hz).', N' Volt (V).', N'Bit/second (bps).', N'Ohm (Ω).', N'Bit/second (bps).', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (58, 9, N'Lập trình hướng đối tượng là gì?', NULL, NULL, NULL, NULL, N'Lập trình hướng đối tượng là phương pháp đặt trọng tâm vào các đối tượng, nó không cho phép dữ liệu chuyển động một cách tự do trong hệ thống; dữ liệu được gắn với các hàm thành phần.', N'Lập trình hướng đối tượng là phương pháp lập trình cơ bản gần với mã máy.', N'Lập trình hướng đối tượng là phương pháp mới của lập trình máy tính, chia chương trình thành các hàm; quan tâm đến chức năng của hệ thống.', N'Lập trình hướng đối tượng là phương pháp đặt trọng tâm vào các chức năng, cấu trúc chương trình được xây dựng theo cách tiếp cận hướng chức năng.', N'Lập trình hướng đối tượng là phương pháp đặt trọng tâm vào các đối tượng, nó không cho phép dữ liệu chuyển động một cách tự do trong hệ thống; dữ liệu được gắn với các hàm thành phần.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (59, 9, N'Đặc điểm cơ bản của lập trình hướng đối tượng thể hiện ở', NULL, NULL, NULL, NULL, N'Tính đóng gói, tính kế thừa, tính đa hình, tính đặc biệt hóa.', N'Tính đóng gói, tính kế thừa, tính đa hình, tính trừu tượng.', N'Tính chia nhỏ, tính kế thừa.', N'Tính đóng gói, tính trừu tượng.', N'Tính đóng gói, tính kế thừa, tính đa hình, tính trừu tượng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (60, 9, N'OOP là viết tắt của:', NULL, NULL, NULL, NULL, N'Object Oriented Programming.', N'Object Open Programming.', N'Open Object Programming.', N'Object Oriented Proccessing.', N'Object Oriented Programming.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (61, 9, N'Đặc điểm của Tính bao gói trong Lập trình hướng đối tượng:', NULL, NULL, NULL, NULL, N'Cơ chế chia chương trình thành các hàm và thủ tục thực hiện các chức năng riêng rẽ.', N'Cơ chế cho thấy một hàm có thể có nhiều thể hiện khác nhau ở từng thời điểm.', N'Cơ chế ràng buộc dữ liệu và thao tác trên dữ liệu đó thành một thể thống nhất, tránh được các tác động bất ngờ từ bên ngoài. Thể thống nhất này gọi là đối tượng.', N'Cơ chế không cho phép các thành phần khác truy cập đến bên trong nó.', N'Cơ chế ràng buộc dữ liệu và thao tác trên dữ liệu đó thành một thể thống nhất, tránh được các tác động bất ngờ từ bên ngoài. Thể thống nhất này gọi là đối tượng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (62, 9, N'Tính kế thừa trong lập trình hướng đối tượng:', NULL, NULL, NULL, NULL, N'Khả năng xây dựng các lớp mới từ các lớp cũ, lớp mới được gọi là lớp dẫn xuất, lớp cũ được gọi là lớp cơ sở.', N'Khả năng sử dụng lại các hàm đã xây dựng.', N'Khả năng sử dụng lại các kiểu dữ liệu đã xây dựng.', N'Tất cả đều đúng.', N'Khả năng xây dựng các lớp mới từ các lớp cũ, lớp mới được gọi là lớp dẫn xuất, lớp cũ được gọi là lớp cơ sở.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (63, 9, N'Trong kế thừa. Lớp mới có thuật ngữ tiếng Anh là:', NULL, NULL, NULL, NULL, N'Derived Class.', N'Base Class.', N'Inheritance Class.', N'Object Class.', N'Derived Class.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (64, 9, N'Đặc điểm của Tính đa hình?', NULL, NULL, NULL, NULL, N'Khả năng một hàm, thủ tục có thể được kế thừa lại.', N'Khả năng một thông điệp có thể được truyền lại cho lớp con của nó.', N'Khả năng một hàm, thủ tục được sử dụng lại.', N'Khả năng một thông điệp có thể thay đổi cách thể hiện của nó theo lớp cụ thể của đối tượng được nhận thông điệp.', N'Khả năng một thông điệp có thể thay đổi cách thể hiện của nó theo lớp cụ thể của đối tượng được nhận thông điệp.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (65, 9, N'Sau khi khai báo và xây dựng thành công lớp đối tượng Sinh viên. Khi đó lớp đối tượng Sinh viên còn được gọi là:', NULL, NULL, NULL, NULL, N'Đối tượng.', N'Kiểu dữ liệu trừu tượng.', N'Kiểu dữ liệu cơ bản.', N'Lớp đối tượng cơ sở.', N'Kiểu dữ liệu trừu tượng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (66, 9, N'Trong các phương án sau, phương án nào mô tả đối tượng:', NULL, NULL, NULL, NULL, N'Máy tính', N'Xe đạp', N'Quả cam', N'Tất cả đều đúng', N'Tất cả đều đúng', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (67, 9, N'Muốn lập trình hướng đối tượng, bạn cần phải phân tích chương trình, bài toàn thành các:', NULL, NULL, NULL, NULL, N'Hàm, thủ tục.', N'Các module.', N'Các đối tượng từ đó xây dựng các lớp đối tượng tương ứng.', N'Các thông điệp.', N'Các đối tượng từ đó xây dựng các lớp đối tượng tương ứng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (68, 10, N'Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?', NULL, NULL, NULL, NULL, N'Cung cấp môi trường tạo lập CSDL.', N'Cung cấp môi trường cập nhật và khai thác dữ liệu.', N'Cung cấp công cụ quản lí bộ nhớ.', N'Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL.', N'Cung cấp công cụ quản lí bộ nhớ.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (69, 10, N'Ngôn ngữ định nghĩa dữ liệu thực chất là:', NULL, NULL, NULL, NULL, N'Ngôn ngữ lập trình Pascal.', N'Ngôn ngữ C.', N'Các kí hiệu toán học dùng để thực hiện các tính toán.', N'Hệ thống các kí hiệu để mô tả CSDL.', N'Hệ thống các kí hiệu để mô tả CSDL.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (70, 10, N'Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép:', NULL, NULL, NULL, NULL, N'Đảm bảo tính độc lập dữ liệu.', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL.', N'Mô tả các đối tượng được lưu trữ trong CSDL.', N'Khai báo kiểu dữ liệu của CSDL.', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (71, 10, N'Ngôn ngữ thao tác dữ liệu bao gồm các lệnh cho phép:', NULL, NULL, NULL, NULL, N'Nhập, sửa, xóa dữ liệu.', N'Khai báo kiểu, cấu trúc, các ràng buộc trên dữ liệu của CSDL.', N'Khai thác dữ liệu như: tìm kiếm, sắp xếp, kết xuất báo cáo…', N'Câu A và C.', N'Câu A và C.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (72, 10, N'Ngôn ngữ CSDL được sử dụng phổ biến hiện nay là:', NULL, NULL, NULL, NULL, N'SQL.', N'Access.', N'Foxpro.', N'Java.', N'SQL.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (73, 10, N'Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?', NULL, NULL, NULL, NULL, N'Duy trì tính nhất quán của CSDL.', N'Cập nhật (thêm, sửa, xóa dữ liệu).', N'Khôi phục CSDL khi có sự cố.', N'Phát hiện và ngăn chặn sự truy cập không được phép.', N'Cập nhật (thêm, sửa, xóa dữ liệu).', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (74, 10, N'Người nào đã tạo ra các phần mềm ứng dụng đáp ứng nhu cầu khai thác thông tin từ CSDL?', NULL, NULL, NULL, NULL, N'Người dùng.', N'Người lập trình ứng dụng.', N'Người QT CSDL.', N'Cả ba người trên.', N'Người lập trình ứng dụng.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (75, 10, N'Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?', NULL, NULL, NULL, NULL, N'Cung cấp môi trường tạo lập CSDL.', N'Cung cấp môi trường cập nhật và khai thác dữ liệu.', N'Cung cấp công cụ quản lí bộ nhớ.', N'Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL.', N'Cung cấp công cụ quản lí bộ nhớ.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (76, 10, N'Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép:', NULL, NULL, NULL, NULL, N' A. Đảm bảo tính độc lập dữ liệu.', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL.', N'Mô tả các đối tượng được lưu trữ trong CSDL.', N'Khai báo kiểu dữ liệu của CSDL.', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL.', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (77, 10, N'Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?', NULL, NULL, NULL, NULL, N'Duy trì tính nhất quán của CSDL.', N'Cập nhật (thêm, sửa, xóa dữ liệu).', N'Khôi phục CSDL khi có sự cố.', N'Phát hiện và ngăn chặn sự truy cập không được phép.', N'Cập nhật (thêm, sửa, xóa dữ liệu).', NULL, NULL, NULL, NULL, 1, N'Hoàn tất', NULL)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (80, 11, N'1 + 2 = ?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'C', NULL, NULL, NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (18, 1, 13, 3, CAST(N'2023-05-28T14:07:29.397' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (19, 11, 13, 1, CAST(N'2023-06-20T03:26:30.067' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (20, 11, 13, 1, CAST(N'2023-06-20T03:43:31.080' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (21, 11, 12, 0, CAST(N'2023-06-20T04:05:39.577' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (22, 11, 12, 0, CAST(N'2023-06-20T04:07:12.113' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (23, 11, 12, 0, CAST(N'2023-06-20T04:12:52.770' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (24, 1, 12, 0, CAST(N'2023-06-20T04:29:15.430' AS DateTime), 1)
INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (25, 1, 12, 1, CAST(N'2023-06-20T04:38:08.640' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (1, 1, N'Lập Trình C', N'c-.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (2, 1, N'Công Tác Kĩ Sư', N'software-engineer.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (3, 1, N'Tiếng Anh 1', N'eng.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (4, 1, N'Quốc Phòng 1', N'shield.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (12, 4, N'Trí Tuệ Nhân Tạo', N'5617e18c-efcc-4327-a932-8e771561139e.png', NULL)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (13, 3, N'Cấu trúc dữ liệu và giải thuật', N'3ef812d4-2f3d-4645-a794-01f6d834f2cf.png', NULL)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (14, 3, N'Cơ sở dữ liệu', N'3ebd54da-f6ff-4c5a-9e80-78a2c7a75eb9.png', NULL)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (15, 3, N'Hướng đối tượng', N'bc5cb69e-6ca1-4d9a-96f0-9b6b8acde36b.png', NULL)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (16, 4, N'Bảo mật thông tin', N'79237d5c-8689-4366-9d8e-5cf08bc0e491.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (17, 4, N'Web Java', N'9769e0b4-4f7e-4f6f-bfaa-ecd072521c4f.png', NULL)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (18, 3, N'Mạng máy tính', N'c3674849-4bd1-47b1-9a59-3e07971fc903.png', NULL)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (1, 1, N'Test C 1', 20, CAST(N'2023-08-04' AS Date), N'Chưa hoàn thành', 1)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (2, 1, N'Kiến thức code', 10, CAST(N'2023-08-04' AS Date), N'Chưa hoàn thành', 1)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (6, 12, N'Lý thuyết Trí Tuệ Nhân Tạo', 15, CAST(N'2023-05-27' AS Date), N'Chưa hoàn thành', NULL)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (7, 13, N'Lý thuyết CTDL và Giải Thuật', 15, CAST(N'2023-05-27' AS Date), N'Chưa hoàn thành', NULL)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (8, 18, N'Lý thuyết Mạng Máy Tính', 15, CAST(N'2023-05-27' AS Date), N'Chưa hoàn thành', NULL)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (9, 15, N'Lý thuyết Hướng Đối Tượng', 15, CAST(N'2023-05-27' AS Date), N'Chưa hoàn thành', NULL)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (10, 14, N'Lý thuyết Cơ Sở Dữ Liệu', 15, CAST(N'2023-05-27' AS Date), N'Chưa hoàn thành', NULL)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (11, 2, N'Công tác kĩ sư test 2', 30, CAST(N'2023-06-20' AS Date), N'Chưa hoàn thành', NULL)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeAccount] ON 

INSERT [dbo].[TypeAccount] ([id], [typeName], [display]) VALUES (1, N'Admin', 1)
INSERT [dbo].[TypeAccount] ([id], [typeName], [display]) VALUES (3, N'Student', 1)
SET IDENTITY_INSERT [dbo].[TypeAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (20, 12, N'Giải thuật tìm kiếm', N'Tối ưu BeFS', N'BeFS.mp4', CAST(N'2023-05-27T21:29:36.127' AS DateTime), NULL, NULL, N'Chưa xem', 1)
INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (21, 1, N'Hướng dẫn Lập Trình C', N'Cách in một chuỗi ra màn hình testvideo', N'inchuoi.mp4', CAST(N'2023-05-27T21:43:57.000' AS DateTime), NULL, NULL, N'Chưa xem', 1)
INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (22, 14, N'Lý thuyết Cơ sở dữ liệu', N'Lựa chọn thực thể và kiểu liên kết', N'y2meta.com - Bài giảng cơ sở dữ liệu_ 06 - Cách lựa chọn kiểu thực thể và kiểu liên kết từ yêu cầu thiết kế(360p).mp4', CAST(N'2023-05-27T21:52:52.000' AS DateTime), NULL, NULL, N'Chưa xem', 1)
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_TypeAccount] FOREIGN KEY([idType])
REFERENCES [dbo].[TypeAccount] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_TypeAccount]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Posts] FOREIGN KEY([idPosts])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Posts]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Subjects]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Account]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Test] FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Test]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Account]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Test] FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Test]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Classs] FOREIGN KEY([idClass])
REFERENCES [dbo].[Classs] ([id])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Classs]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Subjects]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Subjects]
GO
USE [master]
GO
ALTER DATABASE [StudyWeb] SET  READ_WRITE 
GO

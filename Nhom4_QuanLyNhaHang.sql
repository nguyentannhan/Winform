USE [master]
GO
/****** Object:  Database [QuanLyQuanAn]    Script Date: 10/15/2023 7:39:50 PM ******/
CREATE DATABASE [QLNH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanAn', FILENAME = N'D:\Quanlinhahang\Data\QuanLyQuanAn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanAn_log', FILENAME = N'D:\Quanlinhahang\Data\QuanLyQuanAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNH] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNH] SET  MULTI_USER 
GO
ALTER DATABASE [QLNH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLNH] SET QUERY_STORE = OFF
GO
USE [QLNH]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [nvarchar](100) NOT NULL,
	[passWord] [nvarchar](1000) NOT NULL,
	[displayName] [nvarchar](100) NOT NULL,
	[typeAccount] [int] NOT NULL,
	[idStaff] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceList]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idStaff] [varchar](5) NULL,
	[dateCheckIn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[idBill] [int] IDENTITY(1,1) NOT NULL,
	[dateCheckIn] [datetime] NOT NULL,
	[dateCheckOut] [datetime] NULL,
	[idTable] [int] NOT NULL,
	[statusBill] [int] NOT NULL,
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
	[payerId] [nvarchar](100) NULL,
 CONSTRAINT [PK__Bill__E6F93398EC160129] PRIMARY KEY CLUSTERED 
(
	[idBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[idBillInfo] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[countFood] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBillInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfoOfWareHouse]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfoOfWareHouse](
	[idBillInfoOfWareHouse] [int] IDENTITY(1,1) NOT NULL,
	[idBillOfWareHouse] [int] NULL,
	[idMaterial] [int] NULL,
	[number] [int] NULL,
	[price] [int] NOT NULL,
	[totalPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBillInfoOfWareHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillOfWareHouse]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOfWareHouse](
	[idBillOfWareHouse] [int] IDENTITY(1,1) NOT NULL,
	[dateAdded] [date] NOT NULL,
	[supplier] [nvarchar](100) NOT NULL,
	[note] [nvarchar](100) NULL,
	[userName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBillOfWareHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[idFood] [int] IDENTITY(1,1) NOT NULL,
	[nameFood] [nvarchar](100) NOT NULL,
	[idFC] [int] NOT NULL,
	[price] [float] NOT NULL,
	[imageFood] [nvarchar](100) NULL,
	[statusFood] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[idFC] [int] IDENTITY(1,1) NOT NULL,
	[nameFC] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[idMaterial] [int] IDENTITY(1,1) NOT NULL,
	[nameMaterial] [nvarchar](100) NOT NULL,
	[idUnit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[idPosition] [int] IDENTITY(1,1) NOT NULL,
	[namePosition] [nvarchar](100) NULL,
	[coefficientSalary] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPosition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[idStaff] [varchar](5) NOT NULL,
	[nameStaff] [nvarchar](100) NOT NULL,
	[sex] [nvarchar](10) NULL,
	[idPosition] [int] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[identityCard] [nvarchar](12) NOT NULL,
	[phoneNumber] [nvarchar](10) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[idTable] [int] IDENTITY(1,1) NOT NULL,
	[nameTable] [nvarchar](100) NOT NULL,
	[statusTable] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[idUnit] [int] IDENTITY(1,1) NOT NULL,
	[nameUnit] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [passWord]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Staffer') FOR [displayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [typeAccount]
GO
ALTER TABLE [dbo].[AttendanceList] ADD  DEFAULT (getdate()) FOR [dateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__dateCheckI__3D5E1FD2]  DEFAULT (getdate()) FOR [dateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__statusBill__3E52440B]  DEFAULT ((0)) FOR [statusBill]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__discount__3F466844]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__totalPrice__403A8C7D]  DEFAULT ((0)) FOR [totalPrice]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__payerId__412EB0B6]  DEFAULT ('') FOR [payerId]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [countFood]
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse] ADD  DEFAULT ((1)) FOR [number]
GO
ALTER TABLE [dbo].[BillOfWareHouse] ADD  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [nameFood]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ('') FOR [imageFood]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Đang bán') FOR [statusFood]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [nameFC]
GO
ALTER TABLE [dbo].[Position] ADD  DEFAULT ((0)) FOR [coefficientSalary]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (N'Nam') FOR [sex]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Bàn chưa có tên') FOR [nameTable]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [statusTable]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[AttendanceList]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[AttendanceList]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[AttendanceList]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[Staff] ([idStaff])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__idTable__4222D4EF] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([idTable])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__idTable__4222D4EF]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__payerId__4316F928] FOREIGN KEY([payerId])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__payerId__4316F928]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK__BillInfo__idBill__46E78A0C] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([idBill])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK__BillInfo__idBill__46E78A0C]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([idFood])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([idFood])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([idFood])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idBillOfWareHouse])
REFERENCES [dbo].[BillOfWareHouse] ([idBillOfWareHouse])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idBillOfWareHouse])
REFERENCES [dbo].[BillOfWareHouse] ([idBillOfWareHouse])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idBillOfWareHouse])
REFERENCES [dbo].[BillOfWareHouse] ([idBillOfWareHouse])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO
ALTER TABLE [dbo].[BillInfoOfWareHouse]  WITH CHECK ADD FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO
ALTER TABLE [dbo].[BillOfWareHouse]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[BillOfWareHouse]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[BillOfWareHouse]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idFC])
REFERENCES [dbo].[FoodCategory] ([idFC])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idFC])
REFERENCES [dbo].[FoodCategory] ([idFC])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idFC])
REFERENCES [dbo].[FoodCategory] ([idFC])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([idUnit])
REFERENCES [dbo].[Unit] ([idUnit])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([idUnit])
REFERENCES [dbo].[Unit] ([idUnit])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([idUnit])
REFERENCES [dbo].[Unit] ([idUnit])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([idPosition])
REFERENCES [dbo].[Position] ([idPosition])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([idPosition])
REFERENCES [dbo].[Position] ([idPosition])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([idPosition])
REFERENCES [dbo].[Position] ([idPosition])
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccount]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateAccount]
@userName nvarchar(100)  , @displayName nvarchar(100), @passWord nvarchar(100), @newpass nvarchar(100)
as
begin
	declare @count int = 0
	select @count = count(*) from account where userName = @userName and @passWord = passWord

	if(@count = 1)
	begin
		update account set displayName = @displayName where userName = @userName
	end
	else
	update account set displayName = @displayName, passWord = @newpass where userName = @userName
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateFood]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateFood]
@idFood int, @nameFood nvarchar(100)  , @idFC int, @price float, @imageFood nvarchar(100)
as
begin
	update Food set nameFood = @nameFood, idFC = @idFC, price = @price, imageFood = @imageFood where idFood = @idFood
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateFoodCategory]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateFoodCategory]

@idFoodCategory int, @nameFoodCategory nvarchar(100) 
as
begin
	update FoodCategory set nameFC = @nameFoodCategory where idFC = @idFoodCategory
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateTableFood]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateTableFood]
@idTable int, @nameTable nvarchar(100) 
as
begin
	update TableFood set nameTable = @nameTable where idTable = @idTable
end

GO
/****** Object:  StoredProcedure [dbo].[USP_CheckExitsAttendanceList]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_CheckExitsAttendanceList]
@idStaff nvarchar(5) 
as
begin
	select * from AttendanceList where cast(dateCheckIn as date) = CAST( GETDATE() AS Date ) and idStaff = @idStaff
end
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckOut]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_CheckOut]
@discount int, @totalPrice float, @payerId nvarchar(100), @id int
as
begin
	update bill set dateCheckOut = GETDATE(), statusBill = 1, discount =  @discount, totalPrice = @totalPrice, payerId =@payerId where idBill = @id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteMaterial]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DeleteMaterial]
@idMaterial int
as
begin
	delete Material where idMaterial = @idMaterial
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByName]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------
create proc [dbo].[USP_GetAccountByName]
@userName nvarchar(100)
as
begin
	select * from account where userName = @userName
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetFoodTop5]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_GetFoodTop5]
    @checkIn DATE,
    @checkOut DATE
AS
BEGIN
    SELECT TOP 5
        f.idFood,
        f.nameFood,
        SUM(bi.countFood) AS countFood,
        f.price AS unitPrice,
        SUM(bi.countFood) * f.price AS totalPrice
    FROM
        BillInfo AS bi
    INNER JOIN
        Bill AS b ON bi.idBill = b.idBill
    INNER JOIN
        Food AS f ON bi.idFood = f.idFood
    WHERE
        b.dateCheckOut >= CONVERT(DATETIME, @checkIn)
        AND b.dateCheckOut <= CONVERT(DATETIME, @checkOut)
    GROUP BY
        f.idFood,
        f.nameFood,
        f.price
    ORDER BY
        SUM(bi.countFood) DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------
create proc [dbo].[USP_GetListBillByDate]
@checkIn date, @checkOut date
as
begin
	select *
	from Bill 
	where dateCheckOut >= @checkIn and dateCheckOut <= @checkOut
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaxBill]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetMaxBill]
as
begin
	Select max(idBill) from Bill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------
--DBCC CHECKIDENT ('dbo.BillInfo', RESEED, 0) -- Reset giá trị bắt đầu về 0

-------------------------------------------------------------------
create proc [dbo].[USP_GetTableList]
as  
	select * from TableFood
exec USP_GetTableList

GO
/****** Object:  StoredProcedure [dbo].[USP_GetTopFood]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[USP_GetTopFood]
@checkIn date, @checkOut date
as
begin
	select top 5 f.nameFood nameFood,sum(bi.countFood) countFood, f.price price, sum(bi.countFood)*f.price totalPrice
	from BillInfo as bi, Bill as b, food as f 
	where b.idBill = bi.idBill and bi.idFood = f.idFood and dateCheckOut >= CONVERT(datetime, @checkIn) and dateCheckOut <= CONVERT(datetime,@checkOut)
	group by f.nameFood, f.price ORDER BY sum(bi.countFood) desc
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalAttendanceList]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetTotalAttendanceList]
as
begin
	select * from AttendanceList where cast(dateCheckIn as date) = CAST( GETDATE() AS Date )
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalBillsInDay]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetTotalBillsInDay]
as
begin
	select * from Bill where cast(dateCheckOut as date) = CAST( GETDATE() AS Date )
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAccount]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertAccount]
@userName nvarchar(100),@passWord nvarchar(100),@displayName nvarchar(100) ,@typeAccount int ,@idStaff nvarchar(5)
as
begin
	insert into account(userName,passWord,displayName,typeAccount,idStaff) values (@userName,@passWord,@displayName,@typeAccount,@idStaff)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAttendanceList]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertAttendanceList]
@idStaff nvarchar(5) 
as
begin
	insert into AttendanceList(idStaff) values(@idStaff)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBill]
@idTable int
as
begin
	insert Bill(dateCheckIn,dateCheckOut,idTable,statusBill,discount,payerId) values (GETDATE(),NULL,@idTable,0,0,null)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------
create proc [dbo].[USP_InsertBillInfo]
@idBill int, @idFood int, @countFood int
as
begin
	declare @isExitsBillInfo int
	declare @foodCount int = 1

	select @isExitsBillInfo = idBillInfo , @foodCount = b.countFood
	from BillInfo b
	where idBill = @idBill and idFood = @idFood

	if(@isExitsBillInfo >0)
		begin
			declare @newCount int = @foodCount + @countFood
			if(@newCount >0)
				UPDATE BillInfo set countFood = @countFood + @foodCount where idFood = @idFood and idBill = @idBill
			else
				delete BillInfo where idBill = @idBill and idFood = @idFood
		end
	else
		begin
			insert BillInfo(idBill,idFood,countFood) values(@idBill,@idFood,@countFood)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfoOfWareHouse]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBillInfoOfWareHouse]
@idBillOfWareHouse int,@idMaterial int, @number int, @price int, @totalPrice int
as
begin
insert into BillInfoOfWareHouse(idBillOfWareHouse,idMaterial,number,price,totalPrice) values (@idBillOfWareHouse,@idMaterial,@number,@price,@totalPrice)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillOfWareHouse]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBillOfWareHouse]
@supplier nvarchar(100),@note nvarchar(100), @userName nvarchar(100)
as
begin
insert into BillOfWareHouse(supplier,note,userName) values (@supplier,@note,@userName)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertFood]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertFood]
@nameFood nvarchar(100),@idFC int ,@price float , @imageFood nvarchar(100)
as
begin
	insert into Food(nameFood,idFC,price,imageFood) values (@nameFood,@idFC,@price,@imageFood)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertMaterial]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertMaterial]
@name nvarchar(100) , @idUnit int
as
begin
	insert into Material(nameMaterial, idUnit) values(@name,@idUnit)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertStaff]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertStaff]
@idStaff nvarchar(5),@nameStaff nvarchar(100),@sex nvarchar(20),@idPosition int,@dateOfBirth date,@identityCard nvarchar(11),@phoneNumber nvarchar(11), @address nvarchar(100)
as
begin
	insert into Staff(idStaff,nameStaff,sex,idPosition,dateOfBirth,identityCard,phoneNumber,address) values (@idStaff,@nameStaff,@sex,@idPosition,@dateOfBirth,@identityCard,@phoneNumber,@address)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertUnit]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertUnit]
@name nvarchar(100)
as
begin
insert into Unit(nameUnit) values (@name)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 10/15/2023 7:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec USP_GetAccountByName @userName = N'LAT'
-------------------------------------------------------------------
create proc [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
as
begin
	select * from account where userName = @userName AND passWord  = @passWord
end 
GO
USE [master]
GO
ALTER DATABASE [QLNH] SET  READ_WRITE 
GO

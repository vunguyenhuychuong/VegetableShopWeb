CREATE DATABASE[VegetableStore]
GO

CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[birthday] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CONSTRAINT [FK_roleID] FOREIGN KEY (roleID) REFERENCES tblRoles(roleID)

GO

ALTER TABLE [dbo].[tblUsers] ALTER COLUMN [status] [bit] null

CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [Date] NOT NULL,
	[total] [float] NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM tblUsers

UPDATE [tblUsers] SET [status] = 0 WHERE [userID] = N'Chuong2k9'
UPDATE [tblUsers] SET [roleID] = 0 WHERE [userID] = N'Hoa2k'


CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](10)  NOT NULL,
	[price] [float] NULL,
	[quantity] [int]  NULL,
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM tblProduct WHERE productId='1'

CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[image] [nvarchar](MAX) NOT NULL,
	[price] [float]  NULL,
	[quantity] [int] NULL,
	[categoryID] [nvarchar](10) NOT NULL,
	[importDate] [date] NOT NULL,
	[usingDate] [date] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](10) NOT  NULL,
	[categoryName] [nvarchar](50)  NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM tblProduct WHERE productName=N'Carrot'


/* Table tblRoles*/
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'0' , N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'1' , N'user')


/*  Table tblUser */
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Chuong2k9' ,N'Vũ Nguyễn Huy Chương', N'123', N'0', N'NinhThuan',N'10/10/2009',N'0916024635', N'ChuongVu1010@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Hiep2k8' , N'Trần Thanh Hiệp',  N'123', N'1', N'BinhThuan',N'15/03/2008', N'0967675782', N'HiepTran1503@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Thuy2k9' , N'Cao Thị Phương Thủy',  N'123', N'1', N'BinhDinh',N'01/02/2009', N'01688534475', N'ThuyCao0102@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Long2k7', N'Trần Quốc Long',  N'123', N'1', N'DakLak',N'18/09/2007', N'0986810782', N'QuocLong2809@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Hoa2k', N'Đoàn Nguyễn Thành Hòa',  N'123', N'1', N'TPHCM', N'08/09/2000',N'1900999999', N'HoaDoan0809@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[fullName], [password],[roleID],[address],[birthday],[phone],[email]) VALUES (N'Quank5', N'Lê Minh Quân',  N'123', N'1', N'BenTre',N'13/11/2005', N'0986810799', N'MinhQuan2809@gmail.com')
INSERT [dbo].[tblUsers] ([userID],[address],[fullName],[password],[birthday],[phone],[email],[roleID]) VALUES (N'Hiep2k9', N'NinhThuan',N'Trần Thanh Hiệp', N'123',N'15/03/2008',N'0967675782',N'HiepTran1503@gmail.com',N'')

SELECT fullName, roleID, address, birthday, phone, email FROM tblUsers WHERE userID=N'Hiep2k8' AND password=N'123';
/* */

/* Table tblProduct*/
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'1' , N'Tomato', N'https://images.pexels.com/photos/2899682/pexels-photo-2899682.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', N'20.00', 10,N'1', CAST(N'2021-11-04' AS Date), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'2' , N'Cherry', N'https://images.pexels.com/photos/3614942/pexels-photo-3614942.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', N'40.00', 10,N'1', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'3' , N'Garlic', N'https://images.pexels.com/photos/1087947/pexels-photo-1087947.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', N'15.00', 10,N'1',CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'4' , N'Grape',  N'https://images.pexels.com/photos/708777/pexels-photo-708777.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',  N'20.00', 10,N'1', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'5' , N'Onion',  N'https://images.pexels.com/photos/4197447/pexels-photo-4197447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',  N'20.00', 10,N'2', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'6' , N'Papaya', N'https://images.pexels.com/photos/701969/pexels-photo-701969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', N'20.00', 10,N'2', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'7' , N'Pepper', N'https://images.pexels.com/photos/128536/pexels-photo-128536.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', N'20.00', 10,N'1', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'8' , N'Pea',    N'https://images.pexels.com/photos/768090/pexels-photo-768090.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',    N'20.00', 10,N'1', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'9' , N'Meet',   N'https://images.pexels.com/photos/5774154/pexels-photo-5774154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',    N'100.00', 10,N'1', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'10' , N'Potato',N'https://images.pexels.com/photos/7774212/pexels-photo-7774212.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',    N'45.00', 10,N'3', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'11' , N'Shrimp',N'https://images.pexels.com/photos/679454/pexels-photo-679454.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',    N'83.00', 10,N'4', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))
INSERT [dbo].[tblProduct]([productID],[productName],[image],[price],[quantity], [categoryID],[importDate], [usingDate]) VALUES (N'12' , N'Fish',  N'https://images.pexels.com/photos/3296397/pexels-photo-3296397.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',    N'148.00', 10,N'4', CAST(N'2021-11-04' AS Date),CAST(N'2023-11-04' AS Date))

INSERT [dbo].[tblCategory]([categoryID], [categoryName]) VALUES(N'1', N'Frest Fruit')
INSERT [dbo].[tblCategory]([categoryID], [categoryName]) VALUES(N'2', N'Leafy Vegetables')
INSERT [dbo].[tblCategory]([categoryID], [categoryName]) VALUES(N'3', N'Meets animal')
INSERT [dbo].[tblCategory]([categoryID], [categoryName]) VALUES(N'4', N'FishWater')

SELECT * FROM tblProduct

/* Table tblCategory */



SELECT userID, fullName, roleID, address, birthday, phone, email,status FROM tblUsers WHERE fullName like '%u%'

SELECT * FROM tblUsers
SELECT * FROM tblRoles
SELECT * FROM tblOrder
SELECT * FROM tblOrderDetail
SELECT * FROM tblProduct
SELECT * FROM tblCategory
SELECT userID, fullName, roleID, address, birthday, phone, email FROM tblUsers WHERE fullName LIKE '%a%'

SELECT * FROM tblProduct where productID=N'12'
DELETE tblUsers WHERE userID=N'Hiep2k9';

SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productName like N'%a%'

/* Table tblOrder*/
SELECT CURRENT_TIMESTAMP
SELECT productID, productName, image, price, quantity, categoryID, format(importDate, 'yyyy-MM-dd') as importDate, format(usingDate, 'yyyy-MM-dd') as usingDate FROM tblProduct WHERE productName like N'%a%'







USE [AquaOne]
GO
/****** Object:  User [reiner]    Script Date: 12/01/2011 18:12:05 ******/
--CREATE USER [reiner] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/01/2011 18:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](30) NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, N'WAT', N'Prepaid Water Packages', CAST(0x00009F8D00BD72A7 AS DateTime), CAST(0x00009F9500B0F88E AS DateTime), N'rbadmin', N'rbadmin')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, N'UVS', N'uv products and systems', CAST(0x00009F8D00C29255 AS DateTime), CAST(0x00009F9500B1069A AS DateTime), N'rbadmin', N'rbadmin')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (18, N'R/O', N'reverse osmosis products and systems', CAST(0x00009F8D00C2A5C0 AS DateTime), CAST(0x00009F8D00C2A5C0 AS DateTime), N'rbadmin', N'')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(3000,1) NOT NULL,
	[ProductDescription] [varchar](50) NOT NULL,
	[ProductCode] [varchar](50) NOT NULL,
	[ProductCategory] [varchar](20) NOT NULL,
	[TopUpQty] [int] NULL,
	[UnitCost] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[UnitsOnHand] [int] NULL,
	[ReorderLevel] [int] NULL,
	[ManufacturerName] [varchar](50) NULL,
	[ItemUrl] [varchar](50) NULL,
	[IsDiscontinued] [bit] NULL,
	[IsSubProduct] [bit] NULL,
	[IsTaxExempt] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) SPARSE  NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6835, N'Chemical Solution Tank - 15 Gal - 14x24', N'CLKG21424PN7C00', N'TNK', NULL, CAST(50.00 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), 4, 1, N'Water Depot', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9500A014C9 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6836, N'Dual Temperature R.O. Faucet', N'R/O FAU DUAL TEMP', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 5, 3, N'The Water Store', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00BD1502 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6837, N'Tomlinson Contemporary RO Faucet', N'R/O FAU TOM CON', N'R/O', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 7, 3, N'Tomlinson', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6838, N'Tomlinson Designer RO Faucet', N'R/O FAU TOM DES', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 4, 3, N'Tomlinson', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F96014CBE95 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6839, N'Tri-Flow RO Faucet - Designer', N'R/O FAU TRIFLOW DES', N'R/O', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 7, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6840, N'Horizontal Float Valve', N'R/O FLOAT - HOR', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 2, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6841, N'75 GPD 5-Stage Low Pressure', N'R/O FMR05G', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 8, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600FB1925 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6842, N'RO Membrane - Special Encapsulated', N'R/O MEMB TQ56-36 FC', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 8, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6843, N'R.O. Faucet - Oil Rubbed Bronze', N'R/O MT-600-ORB', N'R/O', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 3, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F96014CCDF0 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6844, N'R.O. Faucet - All White', N'R/O MT-600-WH', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 3, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700AFE72D AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6845, N'50 GPD 4-Stage Reverse Osmosis System', N'R/O PT-4.0', N'R/O', NULL, CAST(17.00 AS Decimal(18, 2)), CAST(22.10 AS Decimal(18, 2)), 1, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6846, N'"50 GPD 4-Stage R.O. w/3/8"" JG Fittings"', N'R/O PT-4.0/JG', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 8, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6847, N'Booster Pump for RO''s', N'R/O PUMP BOOST', N'R/O', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 7, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700B3A0BC AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6848, N'Deamand Pump for RO Units', N'R/O PUMP DEM', N'R/O', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 8, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F77EEA AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6849, N'RO Permeate Pump', N'R/O PUMP PERM', N'R/O', NULL, CAST(24.00 AS Decimal(18, 2)), CAST(31.20 AS Decimal(18, 2)), 9, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6850, N'"3/8"" Saddle Valve"', N'"R/O SADDLE 3/8"""', N'R/O', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 9, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6851, N'Water Depot 75 GPD R.O. Membrane', N'R/O TFC-75', N'R/O', NULL, CAST(10.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 7, 3, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6852, N'Pura UV Addon-1 for RO Units', N'R/O UVS PURA A-1', N'R/O', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 7, 3, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6853, N'RO Valve Auto Shut Off QC', N'RO 4210QC', N'R/O', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 7, 3, N'Tomlinson', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6854, N'Safe-T-Salt 20kg', N'SLT 15907', N'SLT', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Windsor', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6855, N'Safe-T-Salt 10kg', N'SLT 16531', N'SLT', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 1, 2, N'Windsor', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6856, N'Safer-Than-Salt - 22kg', N'SLT 2165', N'SLT', NULL, CAST(28.00 AS Decimal(18, 2)), CAST(36.40 AS Decimal(18, 2)), 1, 2, N'Windsor', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6857, N'WS Salt - Potassium Chloride - 20kg', N'SLT 61850', N'SLT', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 5, 2, N'The Water Store', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6858, N'WS Salt - Premium Rock Salt  - 20kg', N'SLT 6425', N'SLT', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 5, 2, N'The Water Store', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6859, N'WS Salt - Crystal Pellets - 20kg', N'SLT 7430', N'SLT', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 5, 2, N'The Water Store', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6860, N'Pool Salt', N'SLT POOL SALT', N'SLT', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 5, 2, N'The Water Store', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6861, N'Pressure Tank - Pro Source Steel Tank', N'TNK PS42T-T02', N'TNK', NULL, CAST(50.00 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), 3, 1, N'Water Depot', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6862, N'14 Gallon RO Tank', N'TNK RO-14', N'R/O', NULL, CAST(40.00 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), 5, 4, N'Tomlinson', N'', 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA900AC09C0 AS DateTime), NULL, N'clerk1', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6863, N'120 Gallon Retention Tank', N'TNK UT120', N'TNK', NULL, CAST(45.00 AS Decimal(18, 2)), CAST(58.50 AS Decimal(18, 2)), 3, 1, N'Water Depot', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00BD237A AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6864, N'Fiberglass Pressure Tank', N'TNK WM-6', N'TNK', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 4, 1, N'Water Depot', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6865, N'Sterilight Solenoid Hook Up Assembly', N'UV STR 270142', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 5, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700AECDFA AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6866, N'Sterlilight Solenoid Valve 0.5 inch', N'UV STR SOL-0.5', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 7, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6867, N'Trojan UVMax Sleeve Bolt', N'UV TRJ PRT MAX BOLT', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 6, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F94BC4 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6868, N'Trojan UVMax B SLEEVE (602731)', N'UV TRJ QS UVM B', N'UVS', NULL, CAST(18.00 AS Decimal(18, 2)), CAST(23.40 AS Decimal(18, 2)), 1, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6869, N'Trojan UVMax B LAMP (602804)', N'UV TRJ RL UVM B', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 7, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6870, N'Trojan UVMax G2 Solenoid Kit', N'UV TRJ UVMAX SOL', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 7, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6871, N'UV Dynamics - Gland Nut 400103', N'UV UVD NUT 400103', N'UVS', NULL, CAST(18.00 AS Decimal(18, 2)), CAST(23.40 AS Decimal(18, 2)), 7, 2, N'UV Dynamics', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6872, N'UV Dynamics - O-Ring 400202', N'UV UVD O-RING 400202', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 7, 2, N'UV Dynamics', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6873, N'UVDynamics Sleeve 400151', N'UV UVD QS 400151', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 6, 2, N'UV Dynamics', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F78E3A AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6874, N'UV Dynamics - Ballast 400201', N'UV UVD RB 400201', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 7, 2, N'UV Dynamics', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6875, N'UVDynamics Lamp 400152', N'UV UVD RL 400152', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 7, 2, N'UV Dynamics', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6876, N'UVPure Power Conditioner (Power Bar)', N'UV UVP POWERCON', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 7, 2, N'UV Pure', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6877, N'UVB2 Point of use Pura', N'UVS 15013206', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 6, 2, N'UV B2', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F79BBF AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6878, N'Pura 2-sump UV System', N'UVS 15016205', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 3, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700ADD6C3 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6879, N'Pura 3-sump UV System', N'UVS 15016304', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 7, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6880, N'"UV Solenoid Valve 3/4""NPT 120v"', N'UVS 34800024', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 4, 2, N'UV Solenoid', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F96014C6076 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6881, N'Pura Bulb #11', N'UVS 36002017', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 5, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA600D247FC AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6882, N'Pura Lamp #20', N'UVS 36002018', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 5, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700AFDD57 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6883, N'Pura Quartz Sleeve #11', N'UVS 36003034', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 7, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6884, N'Pura Quartz Sleeve #20', N'UVS 36003035', N'UVS', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 5, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600FC2826 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6885, N'Pura Big Boy Quartz Sleeve', N'UVS 36003036', N'UVS', NULL, CAST(18.00 AS Decimal(18, 2)), CAST(23.40 AS Decimal(18, 2)), 9, 2, N'Pura', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6886, N'Sterilight Quartz Sleeve 12GPM', N'UVS QS-012', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 9, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6887, N'Sterelight Quartz Sleeve 5 GPM', N'UVS QS-463', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 1, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6888, N'Sterelight Quartz Sleeve 8 GPM', N'UVS QS-810', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 2, 3, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6889, N'Sterilight QS320 Sleeve', N'UVS QS320', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 1, 3, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6890, N'Sterilight 1 GPM Lamp S1RL', N'UVS S1RL', N'UVS', NULL, CAST(15.00 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), 2, 3, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6891, N'Sterilight S212 Lamp', N'UVS S212RL', N'UVS', NULL, CAST(32.00 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), 9, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6892, N'Sterilight Lamp 2GPM', N'UVS S287RL', N'UVS', NULL, CAST(32.00 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), 7, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F87227 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6893, N'Sterilight 2 GPM Lamp', N'UVS S2RL', N'UVS', NULL, CAST(32.00 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), 9, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6894, N'Sterilight S320RL-HO Lamp', N'UVS S320RL-HO', N'UVS', NULL, CAST(32.00 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), 9, 3, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6895, N'Sterilight Lamp 12 GPM', N'UVS S36RL', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 9, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6896, N'Sterelight Lamp 5 GPM', N'UVS S463RL', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 9, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6897, N'Sterelight Lamp 8 GPM', N'UVS S810RL', N'UVS', NULL, CAST(20.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), 8, 2, N'Sterilight', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600FC13F3 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6898, N'Trojan Lamp Pro20', N'UVS TRJ 602855', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 2, 3, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6899, N'Trojan UVMax H/Pro 20 Sleeve', N'UVS TRJ 602975', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 9, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6900, N'Trojan R L/S UV712 & ADV12', N'UVS TRJ 650137', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 9, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6901, N'Trojan UV MAX-C Replacement Ballast', N'UVS TRJ 650408', N'UVS', NULL, CAST(16.00 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), 9, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6902, N'Trojan UVMax C4 Power Supply', N'UVS TRJ 650713-010', N'UVS', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 9, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6903, N'Trojan Power Supply UVMax D4', N'UVS TRJ 650716-008', N'UVS', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 8, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00BD4664 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6904, N'Trojan 708 & Adv 8 Lamp', N'UVS TRJ-602141', N'UVS', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 1, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6905, N'Trojan UVMax C/D Lamp-See UVS TRJ-602805', N'UVS TRJ-602727', N'UVS', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 9, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6906, N'Trojan UV Max C/D Sleeve', N'UVS TRJ-602732', N'UVS', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 1, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6907, N'Trojan UVMax E/ Pro 7 Sleeve', N'UVS TRJ-602733', N'UVS', NULL, CAST(30.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 5, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6908, N'Trojan UVMax C/D Replacement Lamp', N'UVS TRJ-602805', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6909, N'Trojan RL UVMAX-E & PRO7', N'UVS TRJ-602806', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6910, N'Trojan UVMax H / Pro 20 Lamp', N'UVS TRJ-602855', N'UVS', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 1, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6911, N'Wyckomar Locking Nut', N'UVS WD 8-51', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Trojan', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6912, N'Water Depot 12GPM Ultraviolet', N'UVS WD-1200', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6913, N'WD-1200 Replacement Lamp', N'UVS WD-1200/RL', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 4, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F84DBB AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6914, N'Wyckomar 5 GPM Quartz Dome', N'UVS WD-250/RD', N'UVS', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), 5, 2, N'Wyckomar', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6915, N'Wyckomar 5GPM Replacement Lamp', N'UVS WD-250/RL', N'UVS', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 5, 2, N'Wyckomar', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6916, N'Water Depot UV700 UV System', N'UVS WD-700', N'UVS', NULL, CAST(18.00 AS Decimal(18, 2)), CAST(23.40 AS Decimal(18, 2)), 5, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6917, N'Water Depot UV w/Monitor', N'UVS WD-700/MS', N'UVS', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 1, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6918, N'WD-700 UV Replacement Ballast', N'UVS WD-700/RB', N'UVS', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 5, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6919, N'WD-700 UV Replacement Quartz Dome', N'UVS WD-700/RD', N'UVS', NULL, CAST(35.00 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), 5, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6920, N'WD-700 Replacement Lamp', N'UVS WD-700/RL', N'UVS', NULL, CAST(19.00 AS Decimal(18, 2)), CAST(24.70 AS Decimal(18, 2)), 5, 2, N'Water Depot', NULL, 0, 1, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6921, N'3-Stage Reverse Osmosis System', N'WTE RO 3-STAGE', N'R/O', NULL, CAST(100.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 0, 2, N'Tomlinson', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600C5DA60 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6922, N'4-stage 50 GPD RO System', N'WTE RO 4-STAGE', N'R/O', NULL, CAST(120.00 AS Decimal(18, 2)), CAST(156.00 AS Decimal(18, 2)), 0, 2, N'Tomlinson', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700B3B9B8 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6923, N'5- Stage Reverse Osmosis System', N'WTE RO 5-STAGE', N'R/O', NULL, CAST(150.00 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), 0, 2, N'Tomlinson', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9800CC2D58 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6924, N'MERLIN Reverse Osmosis System', N'WTE RO MERLIN', N'R/O', NULL, CAST(200.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), 0, 2, N'Merlin', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA300F448F9 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6925, N'Hallet 15xs NSF Ultraviolet System', N'WTE UV HALLET 15XS', N'UVS', NULL, CAST(200.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), 1, 1, N'Hallet', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00BA041D AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6926, N'Pura 2-Sump 10 GPM UV System', N'WTE UV PURA2', N'UVS', NULL, CAST(150.00 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), 2, 1, N'Pura', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC011E1EFD AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6927, N'Pura 15GPM UV System BB', N'WTE UV PURA2-BB', N'UVS', NULL, CAST(180.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, 1, N'Pura', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00AEF7C9 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6928, N'Pura 3-Sump 10 GPM UV System', N'WTE UV PURA3', N'UVS', NULL, CAST(150.00 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), 3, 1, N'Pura', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F8632F AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6929, N'Sterilight 10 GPM Ultraviolet System', N'WTE UV RCAN 10', N'UVS', NULL, CAST(250.00 AS Decimal(18, 2)), CAST(325.00 AS Decimal(18, 2)), 2, 1, N'Sterilight', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700ADBA7F AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6930, N'Sterilight 15 GPM Ultraviolet System', N'WTE UV RCAN 15', N'UVS', NULL, CAST(200.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), 2, 1, N'Sterilight', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600FB614C AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6931, N'Sterilight 6 GPM Ultraviolet System', N'WTE UV RCAN 6', N'UVS', NULL, CAST(170.00 AS Decimal(18, 2)), CAST(221.00 AS Decimal(18, 2)), 3, 1, N'Sterilight', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6932, N'Sterilight SPV-410 NSF UV System', N'WTE UV STR SPV-410', N'UVS', NULL, CAST(200.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), 3, 1, N'Sterilight', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6933, N'Trojan UVMax D4 System', N'WTE UV TRJ MAXD4', N'UVS', NULL, CAST(230.00 AS Decimal(18, 2)), CAST(299.00 AS Decimal(18, 2)), 2, 1, N'Trojan', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9600F80332 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6934, N'Trojan UVMax Pro20 UV System', N'WTE UV TRJ PRO20', N'UVS', NULL, CAST(210.00 AS Decimal(18, 2)), CAST(273.00 AS Decimal(18, 2)), 1, 1, N'Trojan', NULL, 0, 0, 0, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700B45784 AS DateTime), NULL, N'rbadmin', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6935, N'U-Fill 18L Bottles X 7 Prepaid', N'WAT PKG 18L X 7', N'WAT', 7, CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00B12F15 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6936, N'U-Fill 18L Bottles X 12 Prepaid', N'WAT PKG 18L X 12', N'WAT', 12, CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA200D26529 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6937, N'U-Fill 18L Bottles X 25 Prepaid', N'WAT PKG 18L X 25', N'WAT', 25, CAST(0.00 AS Decimal(18, 2)), CAST(61.25 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F9700EA91F4 AS DateTime), NULL, N'rbadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6938, N'U-Fill 18L Bottles X 38 Prepaid', N'WAT PKG 18L X 38', N'WAT', 38, CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00A4BE8B AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6939, N'U-Fill 11L Bottles X 11 Prepaid', N'WAT PKG 11L X 11', N'WAT', 11, CAST(0.00 AS Decimal(18, 2)), CAST(17.85 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA10125B4EB AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6940, N'U-Fill 11L Bottles X 20 Prepaid', N'WAT PKG 11L X 20', N'WAT', 20, CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6941, N'U-Fill 11L Bottles X 41 Prepaid', N'WAT PKG 11L X 41', N'WAT', 41, CAST(0.00 AS Decimal(18, 2)), CAST(61.25 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6942, N'U-Fill 11L Bottles X 62 Prepaid', N'WAT PKG 11L X 62', N'WAT', 62, CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FA200A87958 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6943, N'U-Fill 10L Bottles X 13 Prepaid', N'WAT PKG 10L X 13', N'WAT', 13, CAST(0.00 AS Decimal(18, 2)), CAST(17.85 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6944, N'U-Fill 10L Bottles X 22 Prepaid', N'WAT PKG 10L X 22', N'WAT', 22, CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00AF5254 AS DateTime), NULL, N'storeadmin', NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6945, N'U-Fill 10L Bottles X 45 Prepaid', N'WAT PKG 10L X 45', N'WAT', 45, CAST(0.00 AS Decimal(18, 2)), CAST(61.25 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009F7B00AE1C6C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductDescription], [ProductCode], [ProductCategory], [TopUpQty], [UnitCost], [UnitPrice], [UnitsOnHand], [ReorderLevel], [ManufacturerName], [ItemUrl], [IsDiscontinued], [IsSubProduct], [IsTaxExempt], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6946, N'U-Fill 10L Bottles X 68 Prepaid', N'WAT PKG 10L X 68', N'WAT', 68, CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), NULL, NULL, N'The Water Store', NULL, 0, 0, 1, CAST(0x00009F7B00AE1C6C AS DateTime), CAST(0x00009FAC00A3CD5E AS DateTime), NULL, N'storeadmin', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[PrepaidBottleType]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrepaidBottleType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[NumberOfLiters] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PrepaidType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PrepaidBottleType] ON
INSERT [dbo].[PrepaidBottleType] ([TypeID], [Name], [Description], [NumberOfLiters], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'18L', N'18L Bottles', 18, CAST(0x00009F8700EBC08C AS DateTime), CAST(0x00009F8700EBC08C AS DateTime), NULL, NULL)
INSERT [dbo].[PrepaidBottleType] ([TypeID], [Name], [Description], [NumberOfLiters], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'11L', N'11L Bottles', 11, CAST(0x00009F8700EBC08C AS DateTime), CAST(0x00009F8700EBC08C AS DateTime), NULL, NULL)
INSERT [dbo].[PrepaidBottleType] ([TypeID], [Name], [Description], [NumberOfLiters], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (4, N'10L', N'10L Bottles', 10, CAST(0x00009F8700EBC08C AS DateTime), CAST(0x00009F8700EBC08C AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PrepaidBottleType] OFF
/****** Object:  Table [dbo].[JobPosition]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPosition](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
 CONSTRAINT [PK_JobPosition] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[JobPosition] ON
INSERT [dbo].[JobPosition] ([PositionID], [PositionName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'Sales Clerk', CAST(0x00009F7300C4DAB9 AS DateTime), CAST(0x00009F7300C4DAB9 AS DateTime), N'', N'')
INSERT [dbo].[JobPosition] ([PositionID], [PositionName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, N'Technician', CAST(0x00009F7400AAEF1E AS DateTime), CAST(0x00009F7400AAEF1E AS DateTime), N'', N'')
INSERT [dbo].[JobPosition] ([PositionID], [PositionName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, N'Manager', CAST(0x00009F9700A1927F AS DateTime), CAST(0x00009F9700A1927F AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[JobPosition] OFF
/****** Object:  Table [dbo].[Ref_WaterSourceLocation]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ref_WaterSourceLocation](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_WaterSourceLocation] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ref_WaterSourceLocation] ON
INSERT [dbo].[Ref_WaterSourceLocation] ([LocationID], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'Municipal Well Water - Milton', CAST(0x00009F04015B2B29 AS DateTime), CAST(0x00009F04015B2B29 AS DateTime), NULL, NULL)
INSERT [dbo].[Ref_WaterSourceLocation] ([LocationID], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'Lake Water - Milton', CAST(0x00009F04015BC929 AS DateTime), CAST(0x00009F04015BC929 AS DateTime), NULL, NULL)
INSERT [dbo].[Ref_WaterSourceLocation] ([LocationID], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'Private Well', CAST(0x00009F04015BC929 AS DateTime), CAST(0x00009F04015BC929 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ref_WaterSourceLocation] OFF
/****** Object:  Table [dbo].[Ref_AddressType]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ref_AddressType](
	[AddressType] [varchar](30) NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_Ref_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ref_AddressType] ([AddressType], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (N'HOME', N'Home Address', CAST(0x00009F04015C620F AS DateTime), CAST(0x00009F04015C620F AS DateTime), NULL, NULL)
INSERT [dbo].[Ref_AddressType] ([AddressType], [Description], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (N'MAILING', N'Mailing Address', CAST(0x00009F04015C620F AS DateTime), CAST(0x00009F04015C620F AS DateTime), NULL, NULL)
/****** Object:  UserDefinedFunction [dbo].[GiveMeAFullDate]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GiveMeAFullDate]
( @month int
, @year int)

returns varchar(20)

as 

begin
declare @Return varchar(30)

select @Return =DATEADD(year,@year-1900,dateadd(month,@month,0))-1

return @Return
end



--2011-12-12






-- get the from month, from year tomonth, to year
-- get me a full date for From
-- get me a full date for to

-- run the select statement
GO
/****** Object:  UserDefinedFunction [dbo].[GetLastDayOfMonth]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetLastDayOfMonth]
( @month int
, @year int)

returns varchar(20)

as 

begin
	declare @FullDay varchar(30)
	declare @return varchar(10)

	select @FullDay = DATEADD(year,@year-1900,dateadd(month,@month,0))-1
	select @return = datepart(day,@fullday)

return @return  

end
GO
/****** Object:  StoredProcedure [dbo].[GetProductsBelowReorderLevelWithFilter]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetProductsBelowReorderLevelWithFilter]
(   @sortExpression varchar(30)
   ,@sortDirection varchar(10)
)
as 


begin
	exec (	'select * 	from aquaone.dbo.vw_productsBelowReorderLevel order by ' + @sortExpression + ' ' + @sortDirection );
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteServiceInvoice]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteServiceInvoice] 
(    

	 @ServiceInvoiceID int
) 

AS

declare @ReturnValue int

	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
              
       DELETE FROM AquaOne.dbo.ServiceInvoice
		 WHERE ServiceInvoiceID =@ServiceInvoiceID;
        
        
        
	select @ReturnValue = 1;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](10) NULL,
	[Firstname] [varchar](20) NOT NULL,
	[Middlename] [varchar](20) NULL,
	[Lastname] [varchar](20) NOT NULL,
	[Suffix] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Homephone] [varchar](20) NULL,
	[Mobilephone] [varchar](20) NULL,
	[Workphone] [varchar](20) NULL,
	[CustomerSince] [datetime] NULL,
	[WaterSourceLocationID] [int] NULL,
	[ContactFrequency] [varchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[IsENewsletter] [bit] NOT NULL,
	[IsNewsletter] [bit] NOT NULL,
	[IsWaterTreatmentEquipment] [bit] NOT NULL,
	[IsBottledWater] [bit] NOT NULL,
	[IsRental] [bit] NOT NULL,
	[IsService] [bit] NOT NULL,
	[IsDelivery] [bit] NOT NULL,
	[IsWaterCare] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) SPARSE  NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1, N'', N'Johnny', N'', N'Saunder', N'', N'jsaunders.earth.own@yahoo.com', N'9058777777', N'', N'', CAST(0x00009F7600000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F8700EBC08C AS DateTime), CAST(0x00009FAA00CB55CD AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (2, N'', N'William', N'', N'Gallagher', N'', N'wgallgher@yahoo.com', N'9059877755', N'', N'', CAST(0x00009F6900000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F8700ED99F1 AS DateTime), CAST(0x00009F8700EDA8E7 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (3, N'', N'Noel', N'', N'Gallagher', N'', N'ng@hotmail.com', N'9056753564', N'', N'', CAST(0x00009F6C00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F8700F0E228 AS DateTime), CAST(0x00009F8700F19257 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (4, N'', N'Arthur', N'', N'McCrank', N'', N'arthMc08@gmail.com', N'9058751346', N'', N'', CAST(0x00009F3300000000 AS DateTime), 1, N'Weekly', 1, 1, 1, 0, 0, 0, 0, 0, 0, CAST(0x00009F870118ACB2 AS DateTime), CAST(0x00009F870118ACB2 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (5, N'', N'Bradley', N'', N'Simmon', N'', N'bradsimms@yahoo.com', N'9058797970', N'', N'', CAST(0x00009F0F00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F870119B85D AS DateTime), CAST(0x00009F870119B85D AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (6, N'', N'Shirley', N'', N'Parket', N'', N'shirleyp@hotmail.com', N'9058752244', N'', N'', CAST(0x00009F8700000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F87011A3DC3 AS DateTime), CAST(0x00009F9800A96A21 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (7, N'', N'Alejandro', N'', N'Giovanni', N'', N'agiovanni@hotmail.com', N'9058754632', N'', N'', CAST(0x00009E7E00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F87011AD04E AS DateTime), CAST(0x00009F87011AD04E AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (8, N'', N'Christopher', N'', N'Alipio', N'', N'pwo808@yahoo.com', N'9058758512', N'', N'', CAST(0x00009B9E00000000 AS DateTime), 2, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F94009B3D1A AS DateTime), CAST(0x00009FAC011EBF7C AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (9, N'', N'Lakisha ', N'', N'Calmes', N'', N'lkisha@gmail.com', N'9058753255', N'', N'', CAST(0x00008ECB00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F44EF1 AS DateTime), CAST(0x00009F9600F44EF1 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (10, N'', N'Chandra ', N'', N'Sechrist', N'', N'chandra45@gmail.com', N'9058759745', N'', N'', CAST(0x0000946E00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F4A68B AS DateTime), CAST(0x00009F9800C87C71 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (11, N'', N'Erik ', N'', N'Borucki', N'', N'eboruck@hotmail.com', N'9058785643', N'', N'', CAST(0x00009ED900000000 AS DateTime), 1, N'Weekly', 1, 0, 1, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F4F8F6 AS DateTime), CAST(0x00009F9600F4F8F6 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (12, N'', N'Neil ', N'', N'Luellen', N'', N'luellenn38@gmail.com', N'9058785631', N'', N'', CAST(0x0000925300000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F5459A AS DateTime), CAST(0x00009F9600F5459A AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (13, N'', N'Guy ', N'', N'Hiers', N'', N'ghsuperfly@homail.com', N'9058788932', N'', N'', CAST(0x00009F5B00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F5880D AS DateTime), CAST(0x00009F9600F5880D AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (14, N'', N'Christian ', N'', N'Helbig', N'', N'chris2002@gmail.com', N'9058759908', N'', N'', CAST(0x0000995A00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F5E88A AS DateTime), CAST(0x00009F9600F5E88A AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (15, N'', N'Harriett ', N'', N'Fonte', N'', N'hfonte1@hotmail.com', N'9058754530', N'', N'', CAST(0x00009F1D00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F6433C AS DateTime), CAST(0x00009F9600F6433C AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (16, N'', N'Clayton ', N'', N'Mckitrick', N'', N'cmcktricky@yahoo.com', N'9058756798', N'', N'', CAST(0x00008E8E00000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F69BED AS DateTime), CAST(0x00009F9600F69BED AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (17, N'', N'Malinda ', N'', N'Statler', N'', N'malinda.statler@gmail.com', N'9058756347', N'', N'', CAST(0x0000978600000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F6EFB0 AS DateTime), CAST(0x00009FAA00A9AF31 AS DateTime), N'', N'', N'')
INSERT [dbo].[Account] ([AccountID], [Title], [Firstname], [Middlename], [Lastname], [Suffix], [Email], [Homephone], [Mobilephone], [Workphone], [CustomerSince], [WaterSourceLocationID], [ContactFrequency], [IsActive], [IsENewsletter], [IsNewsletter], [IsWaterTreatmentEquipment], [IsBottledWater], [IsRental], [IsService], [IsDelivery], [IsWaterCare], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (18, N'', N'Jessie ', N'', N'Debonis', N'', N'jdebonis@gmail.com', N'9058756231', N'', N'', CAST(0x00009F3400000000 AS DateTime), 1, N'Weekly', 1, 1, 0, 0, 0, 0, 0, 0, 0, CAST(0x00009F9600F73575 AS DateTime), CAST(0x00009F9600F73575 AS DateTime), N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  Table [dbo].[Address]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](30) NOT NULL,
	[AddressLine2] [varchar](30) NULL,
	[CityTown] [varchar](30) NOT NULL,
	[Province] [varchar](2) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (137, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A00914 AS DateTime), CAST(0x00009F7A0159D4B0 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (138, N'190 Maple Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A00916 AS DateTime), CAST(0x00009F6E014160B4 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (139, N'990 Roper Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A06430 AS DateTime), CAST(0x00009F6700A06430 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (140, N'990 Roper Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A06431 AS DateTime), CAST(0x00009F6700A06431 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (141, N'40 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A1905B AS DateTime), CAST(0x00009F6700A1905B AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (142, N'40 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A1905B AS DateTime), CAST(0x00009F6700A1905B AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (143, N'1250 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C2', N'Canada', CAST(0x00009F6700A20677 AS DateTime), CAST(0x00009F8700E50450 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (144, N'1250 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C2', N'Canada', CAST(0x00009F6700A20677 AS DateTime), CAST(0x00009F8700E50A21 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (145, N'1290 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A23E03 AS DateTime), CAST(0x00009F6700A23E03 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (146, N'1290 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A23E03 AS DateTime), CAST(0x00009F6700A23E03 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (147, N'10 Main Street', N'', N'Milton', N'ON', N'L9T6C4', N'Canada', CAST(0x00009F6700A4932B AS DateTime), CAST(0x00009F6700A4932B AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (148, N'10 Main Street', N'', N'Milton', N'ON', N'L9T6C4', N'Canada', CAST(0x00009F6700A4932C AS DateTime), CAST(0x00009F6700A4932C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (149, N'89 Main Street', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A645CD AS DateTime), CAST(0x00009F6700A645CD AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (150, N'89 Main Street', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6700A645D7 AS DateTime), CAST(0x00009F6700A645D7 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (151, N'37 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0094A1C4 AS DateTime), CAST(0x00009F6E0094A1C4 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (152, N'37 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0094A1CC AS DateTime), CAST(0x00009F6E0094A1CC AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (153, N'3 Babcock Cresent', N'', N'Milton', N'ON', N'L9T6S3', N'Canada', CAST(0x00009F6E00971455 AS DateTime), CAST(0x00009F7A00D87A4D AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (154, N'3 Babcock Cresent', N'', N'Milton', N'ON', N'L9T6S3', N'Canada', CAST(0x00009F6E00971456 AS DateTime), CAST(0x00009F6E00971456 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (155, N'43 Main st', N'', N'Milton', N'ON', N'L9T6C3', N'Canada', CAST(0x00009F6E00B11C47 AS DateTime), CAST(0x00009F6E00B11C47 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (156, N'43 Main st', N'', N'Milton', N'ON', N'L9T6C3', N'Canada', CAST(0x00009F6E00B11C4C AS DateTime), CAST(0x00009F6E00B11C4C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (157, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E014468C8 AS DateTime), CAST(0x00009F6E0144690D AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (158, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E014468C8 AS DateTime), CAST(0x00009F6E014483BE AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (159, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E014468C8 AS DateTime), CAST(0x00009F6E0144C996 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (160, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E014468C8 AS DateTime), CAST(0x00009F6E0144E0F0 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (161, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E0149A97A AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (162, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E014A19ED AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (163, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E014A6A21 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (164, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E014AA809 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (165, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E014AB160 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (166, N'190 Maple Drive', N'', N'Mississauga', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F6E0149A955 AS DateTime), CAST(0x00009F6E014AE6D3 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (167, N'35 Pearson Way', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F70015E0501 AS DateTime), CAST(0x00009F70015E0501 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (168, N'35 Pearson Way', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F70015E0507 AS DateTime), CAST(0x00009F70015E0507 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (169, N'12 Newell St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7300CB9F31 AS DateTime), CAST(0x00009F7300CB9F31 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (170, N'13 Newell St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7300CCBF5F AS DateTime), CAST(0x00009F7300CCBF5F AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (171, N'16 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7300CEB004 AS DateTime), CAST(0x00009F7300CEB004 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (172, N'4 Main Street', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400A99B24 AS DateTime), CAST(0x00009F7400A99B24 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (173, N'86 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400B01510 AS DateTime), CAST(0x00009F7400B01510 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (174, N'46 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400D79CA6 AS DateTime), CAST(0x00009F7400D79CA6 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (175, N'46 Newell Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400D79CA7 AS DateTime), CAST(0x00009F7400D79CA7 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (176, N'23 Babcock Cres', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400E25177 AS DateTime), CAST(0x00009F7400E3711A AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (177, N'23 Babcock Cres', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400E25178 AS DateTime), CAST(0x00009F7400E385E5 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (178, N'1230 Mowat Lane', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F7400E4FC43 AS DateTime), CAST(0x00009F7400E50C7E AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (179, N'45 Main St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F76014AEEA9 AS DateTime), CAST(0x00009F76014AEEA9 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (180, N'45 Main St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F76014AEEAF AS DateTime), CAST(0x00009F76014AEEAF AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (181, N'11 Mowat Lane ', N'', N'Milton', N'ON', N'L9T6C2', N'Canada', CAST(0x00009F8700EBC08E AS DateTime), CAST(0x00009F94009C2765 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (182, N'11 Mowat Lane ', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F8700EBC09A AS DateTime), CAST(0x00009FAA00CB5FD6 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (183, N'1290 Mowat lane ', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F8700ED99F2 AS DateTime), CAST(0x00009F8700ED99F2 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (184, N'1290 Mowat lane ', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F8700ED99F2 AS DateTime), CAST(0x00009F8700ED99F2 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (185, N'10 Main St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F8700F0E229 AS DateTime), CAST(0x00009F8700F0E229 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (186, N'10 Main St', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F8700F0E22A AS DateTime), CAST(0x00009F8700F0E22A AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (187, N'90 Roper Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F870118ACB9 AS DateTime), CAST(0x00009F870118ACB9 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (188, N'90 Roper Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F870118ACBA AS DateTime), CAST(0x00009F870118ACBA AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (189, N'280 Babcock Drive', N'', N'Milton', N'ON', N'L9T6C5', N'Canada', CAST(0x00009F870119B85D AS DateTime), CAST(0x00009F870119B85D AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (190, N'280 Babcock Drive', N'', N'Milton', N'ON', N'L9T6C5', N'Canada', CAST(0x00009F870119B868 AS DateTime), CAST(0x00009F870119B868 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (191, N'56 Maple Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F87011A3DC3 AS DateTime), CAST(0x00009F87011A3DC3 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (192, N'56 Maple Drive', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F87011A3DC4 AS DateTime), CAST(0x00009F87011A3DC4 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (193, N'1000 Pearson Way', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F87011AD04F AS DateTime), CAST(0x00009F87011AD04F AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (194, N'1000 Pearson Way', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F87011AD04F AS DateTime), CAST(0x00009F87011AD04F AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (195, N'10 Maple Rd', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F930112C4DD AS DateTime), CAST(0x00009F930112C4DD AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (196, N'187 Giddings Crescent', N'', N'Milton', N'ON', N'L9T6C3', N'Canada', CAST(0x00009F93011332A7 AS DateTime), CAST(0x00009F93011332A7 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (197, N'78 Roper Dr', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F94009B3D36 AS DateTime), CAST(0x00009F94009B3D36 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (198, N'78 Roper Dr', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F94009B3D3A AS DateTime), CAST(0x00009F94009B3D3A AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (199, N'253 Kingsleigh Crt', N'', N'Milton', N'ON', N'L9T1X6', N'Canada', CAST(0x00009F9600F44F04 AS DateTime), CAST(0x00009F9600F44F04 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (200, N'253 Kingsleigh Crt', N'', N'Milton', N'ON', N'L9T1X6', N'Canada', CAST(0x00009F9600F44F06 AS DateTime), CAST(0x00009F9600F44F06 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (201, N'551 Commercial St', N'', N'Milton', N'ON', N'L9T4R9', N'Canada', CAST(0x00009F9600F4A68C AS DateTime), CAST(0x00009F9600F4A68C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (202, N'551 Commercial St', N'', N'Milton', N'ON', N'L9T4R9', N'Canada', CAST(0x00009F9600F4A697 AS DateTime), CAST(0x00009F9600F4A697 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (203, N'672 Holly Ave', N'', N'Milton', N'ON', N'L9T0G2', N'Canada', CAST(0x00009F9600F4F8F8 AS DateTime), CAST(0x00009F9600F4F8F8 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (204, N'672 Holly Ave', N'', N'Milton', N'ON', N'L9T0G2', N'Canada', CAST(0x00009F9600F4F8F8 AS DateTime), CAST(0x00009F9600F4F8F8 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (205, N'544 Cusick Cir', N'', N'Milton', N'ON', N'L9T0N1', N'Canada', CAST(0x00009F9600F5459C AS DateTime), CAST(0x00009F9600F5459C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (206, N'544 Cusick Cir', N'', N'Milton', N'ON', N'L9T0N1', N'Canada', CAST(0x00009F9600F5459C AS DateTime), CAST(0x00009F9600F5459C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (207, N'7156 Appleby Line', N'', N'Milton', N'ON', N'L9T2Y1', N'Canada', CAST(0x00009F9600F5880E AS DateTime), CAST(0x00009F9600F5880E AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (208, N'7156 Appleby Line', N'', N'Milton', N'ON', N'L9T2Y1', N'Canada', CAST(0x00009F9600F58819 AS DateTime), CAST(0x00009F9600F58819 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (209, N'679 McColl Crt', N'', N'Milton', N'ON', N'L9T4C1', N'Canada', CAST(0x00009F9600F5E88C AS DateTime), CAST(0x00009F9600F5E88C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (210, N'679 McColl Crt', N'', N'Milton', N'ON', N'L9T4C1', N'Canada', CAST(0x00009F9600F5E88C AS DateTime), CAST(0x00009F9600F5E88C AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (211, N'118 Van Fleet Terrace', N'', N'Milton', N'ON', N'L9T0Y3', N'Canada', CAST(0x00009F9600F6433C AS DateTime), CAST(0x00009FAC00A52110 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (212, N'118 Van Fleet Terrace', N'', N'Milton', N'ON', N'L9T0Y3', N'Canada', CAST(0x00009F9600F6433C AS DateTime), CAST(0x00009FAC00A526EA AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (213, N'1042 McClenahan Cres', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F9600F69BEE AS DateTime), CAST(0x00009F9600F69BEE AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (214, N'1042 McClenahan Cres', N'', N'Milton', N'ON', N'L9T6C1', N'Canada', CAST(0x00009F9600F69BEE AS DateTime), CAST(0x00009F9600F69BEE AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (215, N'25 Milton Heights Cres', N'', N'Milton', N'ON', N'L9T0Y3', N'Canada', CAST(0x00009F9600F6EFB0 AS DateTime), CAST(0x00009F9600F6EFB0 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (216, N'25 Milton Heights Cres', N'', N'Milton', N'ON', N'L9T0Y3', N'Canada', CAST(0x00009F9600F6EFB1 AS DateTime), CAST(0x00009F9600F6EFB1 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (217, N'582 Holly Ave', N'', N'Milton', N'ON', N'L9T4B1', N'Canada', CAST(0x00009F9600F73575 AS DateTime), CAST(0x00009F9600F73575 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (218, N'582 Holly Ave', N'', N'Milton', N'ON', N'L9T4B1', N'Canada', CAST(0x00009F9600F73576 AS DateTime), CAST(0x00009F9600F73576 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (219, N'123 Elm Street', N'', N'Milton', N'ON', N'L9T8C8', N'Canada', CAST(0x00009F97009BE15D AS DateTime), CAST(0x00009F97009C1232 AS DateTime), N'', N'')
INSERT [dbo].[Address] ([AddressID], [AddressLine1], [AddressLine2], [CityTown], [Province], [PostalCode], [Country], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (220, N'190 Ontario St', N'', N'Milton', N'ON', N'L9T4Y3', N'Canada', CAST(0x00009F9700A21351 AS DateTime), CAST(0x00009F9700A21351 AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[Address] OFF
/****** Object:  Table [dbo].[TaxInformation]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[taxPercent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TaxInformation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaxInformation] ON
INSERT [dbo].[TaxInformation] ([id], [description], [taxPercent]) VALUES (1, N'HST', CAST(0.13 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TaxInformation] OFF
/****** Object:  Table [dbo].[STG_ServiceWork]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STG_ServiceWork](
	[stg_ServID] [int] IDENTITY(1000,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ServiceStatus] [varchar](10) NULL,
	[ServiceDate] [datetime] NULL,
	[ServiceStartTime] [time](2) NULL,
	[ServiceEndTime] [time](2) NULL,
	[Technician] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) SPARSE  NULL,
 CONSTRAINT [PK_ServiceWork] PRIMARY KEY CLUSTERED 
(
	[stg_ServID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[STG_ServiceWork] ON
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1088, 1, N'', CAST(0x00009F9D00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'admin', CAST(0x00009F9600E36714 AS DateTime), CAST(0x00009F9600E36714 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1089, 3, N'', CAST(0x00009F9700000000 AS DateTime), CAST(0x02602F3400000000 AS Time), CAST(0x02A0AD3900000000 AS Time), N'admin', CAST(0x00009F97009A4712 AS DateTime), CAST(0x00009F97009A4712 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1090, 6, N'', CAST(0x00009F9800000000 AS DateTime), CAST(0x0220AA4400000000 AS Time), CAST(0x0260284A00000000 AS Time), N'admin', CAST(0x00009F9800A9E65A AS DateTime), CAST(0x00009F9800A9E65A AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1091, 7, N'', CAST(0x00009F9B00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x02A0AD3900000000 AS Time), N'admin', CAST(0x00009F9800CBAA1B AS DateTime), CAST(0x00009F9800CBAA1B AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1092, 18, N'', CAST(0x00009F9900000000 AS DateTime), CAST(0x02E0245500000000 AS Time), CAST(0x0220A35A00000000 AS Time), N'admin', CAST(0x00009F9901332A0E AS DateTime), CAST(0x00009F9901332A0E AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1093, 12, N'', CAST(0x00009FA000000000 AS DateTime), CAST(0x0200EB4100000000 AS Time), CAST(0x0240694700000000 AS Time), N'admin', CAST(0x00009F9A013008F0 AS DateTime), CAST(0x00009F9A013008F0 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1094, 10, N'', CAST(0x00009FA000000000 AS DateTime), CAST(0x0240694700000000 AS Time), CAST(0x0280E74C00000000 AS Time), N'admin', CAST(0x00009F9F00A85184 AS DateTime), CAST(0x00009F9F00A85184 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1095, 17, N'', CAST(0x00009FA500000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'admin', CAST(0x00009FA200C4CB00 AS DateTime), CAST(0x00009FA200C4CB01 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1096, 3, N'', CAST(0x00009FAA00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'admin', CAST(0x00009FA500D46BBE AS DateTime), CAST(0x00009FA500D46BBE AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1097, 10, N'', CAST(0x00009FAD00000000 AS DateTime), CAST(0x0220A35A00000000 AS Time), CAST(0x0260216000000000 AS Time), N'admin', CAST(0x00009FAC00C50799 AS DateTime), CAST(0x00009FAC00C50799 AS DateTime), N'', N'', NULL)
INSERT [dbo].[STG_ServiceWork] ([stg_ServID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1098, 14, N'', CAST(0x00009FB000000000 AS DateTime), CAST(0x02A0AD3900000000 AS Time), CAST(0x02E02B3F00000000 AS Time), N'admin', CAST(0x00009FAC00C663C0 AS DateTime), CAST(0x00009FAC00C663C0 AS DateTime), N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[STG_ServiceWork] OFF
/****** Object:  Table [dbo].[WorkHour]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkHour](
	[24hr] [time](0) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00907E0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0098850000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00A08C0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00A8930000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00B09A0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00B8A10000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00C0A80000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00C8AF0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00D0B60000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00D8BD0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00E0C40000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00E8CB0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00F0D20000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00F8D90000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0000E10000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0008E80000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0010EF0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0018F60000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0020FD0000000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0028040100000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x00300B0100000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0038120100000000 AS Time))
INSERT [dbo].[WorkHour] ([24hr]) VALUES (CAST(0x0040190100000000 AS Time))
/****** Object:  Table [dbo].[WaterTreatmentEquipment]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaterTreatmentEquipment](
	[WTE_ID] [int] IDENTITY(2500,2) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[ProductCode] [varchar](50) NULL,
	[Manufacturer] [varchar](50) NULL,
	[DateObtained] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_WaterTreatmentEquipment] PRIMARY KEY CLUSTERED 
(
	[WTE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[WaterTreatmentEquipment] ON
INSERT [dbo].[WaterTreatmentEquipment] ([WTE_ID], [AccountID], [Description], [ProductCode], [Manufacturer], [DateObtained], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2528, 1, N'3-Stage Reverse Osmosis System', N'WTE RO 3-STAGE', N'Tomlinson', CAST(0x00009F9E00000000 AS DateTime), CAST(0x00009FAB01567759 AS DateTime), CAST(0x00009FAB0158DFEC AS DateTime), N'storeadmin', N'storeadmin')
SET IDENTITY_INSERT [dbo].[WaterTreatmentEquipment] OFF
/****** Object:  Table [dbo].[WaterAnalysis]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaterAnalysis](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[Hardness] [decimal](18, 1) NULL,
	[ClearIron] [decimal](18, 1) NULL,
	[PH_Acid] [decimal](18, 1) NULL,
	[HydrogenSulfide] [decimal](18, 1) NULL,
	[TDS] [decimal](18, 1) NULL,
	[Notes] [varchar](2000) NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
 CONSTRAINT [PK_WaterAnalysisReport] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[WaterAnalysis] ON
INSERT [dbo].[WaterAnalysis] ([ReportID], [Hardness], [ClearIron], [PH_Acid], [HydrogenSulfide], [TDS], [Notes], [AccountID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, CAST(12.0 AS Decimal(18, 1)), CAST(100.0 AS Decimal(18, 1)), CAST(13.0 AS Decimal(18, 1)), CAST(20.0 AS Decimal(18, 1)), CAST(200.0 AS Decimal(18, 1)), N'', 1, CAST(0x00009F97015A79D1 AS DateTime), CAST(0x00009F97015A79D1 AS DateTime), N'', N'')
INSERT [dbo].[WaterAnalysis] ([ReportID], [Hardness], [ClearIron], [PH_Acid], [HydrogenSulfide], [TDS], [Notes], [AccountID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, CAST(13.0 AS Decimal(18, 1)), CAST(100.0 AS Decimal(18, 1)), CAST(30.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), CAST(99.0 AS Decimal(18, 1)), N'', 18, CAST(0x00009F9E00F32310 AS DateTime), CAST(0x00009F9E00F32310 AS DateTime), N'', N'')
INSERT [dbo].[WaterAnalysis] ([ReportID], [Hardness], [ClearIron], [PH_Acid], [HydrogenSulfide], [TDS], [Notes], [AccountID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, CAST(12.0 AS Decimal(18, 1)), CAST(45.0 AS Decimal(18, 1)), CAST(10.0 AS Decimal(18, 1)), CAST(5.0 AS Decimal(18, 1)), CAST(13.0 AS Decimal(18, 1)), N'', 12, CAST(0x00009FA0015DB076 AS DateTime), CAST(0x00009FA0015DB076 AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[WaterAnalysis] OFF
/****** Object:  View [dbo].[vw_wteList]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_wteList]
as select * from product where productcode like '%wte%'
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductUnitsOnHand]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateProductUnitsOnHand]
(
	@updateQty int,
	@productID int,
	@operationtype varchar(20),
	@modifiedDate datetime,
	@modifiedBy varchar(20)
)
as 

declare @ReturnValue int
if (@operationtype = 'add') 
    -- add update qty to units on hand
    begin 
	update AquaOne.dbo.Product
		set UnitsOnHand = UnitsOnHand + @updateQty	
				,ModifiedDate = @modifiedDate
				,ModifiedBy = @modifiedBy	 
		where ProductID = @productID;
     end		
else --@operationtype ='subtract'
	-- subtract units on hand
	begin
	update AquaOne.dbo.Product
		set UnitsOnHand = UnitsOnHand - @updateQty
			    ,ModifiedDate = @modifiedDate
				,ModifiedBy = @modifiedBy	
		where ProductID = @productID;
		
		select @ReturnValue = @productID;
    end 
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[ActivateAccount]    Script Date: 12/01/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reiner Bata
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[ActivateAccount] 
(
		@AccountID int
	   ,@ModifiedDate datetime 
	   ,@ModifiedBy varchar(20) 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Account
		set IsActive=1
		,ModifiedDate = @ModifiedDate
		,ModifiedBy = @ModifiedBy
		where AccountID = @AccountID;
END
GO
/****** Object:  Table [dbo].[AccountAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountAddress](
	[AddressID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[AddressType] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
 CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (181, 1, 1, CAST(0x00009F8700EBC0AB AS DateTime), CAST(0x00009F8700EBC0AB AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (182, 1, 2, CAST(0x00009F8700EBC0AB AS DateTime), CAST(0x00009F8700EBC0AB AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (183, 2, 1, CAST(0x00009F8700ED99F2 AS DateTime), CAST(0x00009F8700ED99F2 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (184, 2, 2, CAST(0x00009F8700ED99F2 AS DateTime), CAST(0x00009F8700ED99F2 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (185, 3, 1, CAST(0x00009F8700F0E22A AS DateTime), CAST(0x00009F8700F0E22A AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (186, 3, 2, CAST(0x00009F8700F0E22A AS DateTime), CAST(0x00009F8700F0E22A AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (187, 4, 1, CAST(0x00009F870118ACBB AS DateTime), CAST(0x00009F870118ACBB AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (188, 4, 2, CAST(0x00009F870118ACBB AS DateTime), CAST(0x00009F870118ACBB AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (189, 5, 1, CAST(0x00009F870119B868 AS DateTime), CAST(0x00009F870119B868 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (190, 5, 2, CAST(0x00009F870119B868 AS DateTime), CAST(0x00009F870119B868 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (191, 6, 1, CAST(0x00009F87011A3DC4 AS DateTime), CAST(0x00009F87011A3DC4 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (192, 6, 2, CAST(0x00009F87011A3DC4 AS DateTime), CAST(0x00009F87011A3DC4 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (193, 7, 1, CAST(0x00009F87011AD050 AS DateTime), CAST(0x00009F87011AD050 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (194, 7, 2, CAST(0x00009F87011AD050 AS DateTime), CAST(0x00009F87011AD050 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (197, 8, 1, CAST(0x00009F94009B3D3B AS DateTime), CAST(0x00009F94009B3D3B AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (198, 8, 2, CAST(0x00009F94009B3D3B AS DateTime), CAST(0x00009F94009B3D3B AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (199, 9, 1, CAST(0x00009F9600F44F06 AS DateTime), CAST(0x00009F9600F44F06 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (200, 9, 2, CAST(0x00009F9600F44F06 AS DateTime), CAST(0x00009F9600F44F06 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (201, 10, 1, CAST(0x00009F9600F4A698 AS DateTime), CAST(0x00009F9600F4A698 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (202, 10, 2, CAST(0x00009F9600F4A698 AS DateTime), CAST(0x00009F9600F4A698 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (203, 11, 1, CAST(0x00009F9600F4F8F9 AS DateTime), CAST(0x00009F9600F4F8F9 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (204, 11, 2, CAST(0x00009F9600F4F8F9 AS DateTime), CAST(0x00009F9600F4F8F9 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (205, 12, 1, CAST(0x00009F9600F5459D AS DateTime), CAST(0x00009F9600F5459D AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (206, 12, 2, CAST(0x00009F9600F5459D AS DateTime), CAST(0x00009F9600F5459D AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (207, 13, 1, CAST(0x00009F9600F58819 AS DateTime), CAST(0x00009F9600F58819 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (208, 13, 2, CAST(0x00009F9600F58819 AS DateTime), CAST(0x00009F9600F58819 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (209, 14, 1, CAST(0x00009F9600F5E88D AS DateTime), CAST(0x00009F9600F5E88D AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (210, 14, 2, CAST(0x00009F9600F5E88D AS DateTime), CAST(0x00009F9600F5E88D AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (211, 15, 1, CAST(0x00009F9600F6433C AS DateTime), CAST(0x00009F9600F6433C AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (212, 15, 2, CAST(0x00009F9600F6433C AS DateTime), CAST(0x00009F9600F6433C AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (213, 16, 1, CAST(0x00009F9600F69BEF AS DateTime), CAST(0x00009F9600F69BEF AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (214, 16, 2, CAST(0x00009F9600F69BEF AS DateTime), CAST(0x00009F9600F69BEF AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (215, 17, 1, CAST(0x00009F9600F6EFB1 AS DateTime), CAST(0x00009F9600F6EFB1 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (216, 17, 2, CAST(0x00009F9600F6EFB1 AS DateTime), CAST(0x00009F9600F6EFB1 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (217, 18, 1, CAST(0x00009F9600F73576 AS DateTime), CAST(0x00009F9600F73576 AS DateTime), N'', N'')
INSERT [dbo].[AccountAddress] ([AddressID], [AccountID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (218, 18, 2, CAST(0x00009F9600F73576 AS DateTime), CAST(0x00009F9600F73576 AS DateTime), N'', N'')
/****** Object:  StoredProcedure [dbo].[DeactivateAccount]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reiner Bata
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeactivateAccount] 
(
		@AccountID int
	   ,@ModifiedDate datetime 
	   ,@ModifiedBy varchar(20) 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Account
		set IsActive=0
		,ModifiedDate = @ModifiedDate
		,ModifiedBy = @ModifiedBy
		where AccountID = @AccountID;
END
GO
/****** Object:  Table [dbo].[AuthorizedMember]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuthorizedMember](
	[AuthMemberID] [int] IDENTITY(2500,2) NOT NULL,
	[Firstname] [varchar](30) NULL,
	[Lastname] [varchar](30) NULL,
	[RelationToAccountOwner] [varchar](20) NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifedBy] [varchar](30) NULL,
 CONSTRAINT [PK_AuthorizedMember] PRIMARY KEY CLUSTERED 
(
	[AuthMemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductCategory]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductCategory] 
(    

	 @CategoryID int
) 

AS

declare @ReturnValue int

	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;    

        
       DELETE FROM AquaOne.dbo.ProductCategory
		 WHERE CategoryID =@CategoryID;
        
        
        
	select @ReturnValue = 1;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[DeleteJobPosition]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteJobPosition] 
(    

	 @PositionID int
) 

AS

declare @ReturnValue int

	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        

        
       DELETE FROM dbo.JobPosition
		 WHERE PositionID =@PositionID;
        
        
        
	select @ReturnValue = 1;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](20) NOT NULL,
	[Lastname] [varchar](20) NOT NULL,
	[Gender] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Homephone] [varchar](20) NOT NULL,
	[Mobilephone] [varchar](20) NULL,
	[EmergencyContact] [varchar](30) NULL,
	[EmergencyPhone1] [varchar](20) NULL,
	[EmergencyPhone2] [varchar](20) NULL,
	[IsEmployed] [bit] NOT NULL,
	[HireDate] [date] NOT NULL,
	[TerminatedDate] [date] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) SPARSE  NULL,
	[PositionID] [int] NULL,
	[ReHiredDate] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([EmployeeID], [Firstname], [Lastname], [Gender], [Email], [Homephone], [Mobilephone], [EmergencyContact], [EmergencyPhone1], [EmergencyPhone2], [IsEmployed], [HireDate], [TerminatedDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes], [PositionID], [ReHiredDate]) VALUES (8, N'Karl', N'Oliveros', N'Male', N'kom@yahoo.com', N'9058752311', N'', N'Fanny Oliveros', N'9058752311', N'', 1, CAST(0xC6340B00 AS Date), NULL, CAST(0xEE340B00 AS Date), CAST(0xF7340B00 AS Date), N'', N'', N'', 9, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [Firstname], [Lastname], [Gender], [Email], [Homephone], [Mobilephone], [EmergencyContact], [EmergencyPhone1], [EmergencyPhone2], [IsEmployed], [HireDate], [TerminatedDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes], [PositionID], [ReHiredDate]) VALUES (9, N'Sarah', N'Cruz', N'Female', N'scruz@gmail.com', N'9058754543', N'', N'Manny Cruz', N'9058754543', N'', 1, CAST(0xB5330B00 AS Date), NULL, CAST(0xEE340B00 AS Date), CAST(0xEE340B00 AS Date), N'', N'', N'', 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [Firstname], [Lastname], [Gender], [Email], [Homephone], [Mobilephone], [EmergencyContact], [EmergencyPhone1], [EmergencyPhone2], [IsEmployed], [HireDate], [TerminatedDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes], [PositionID], [ReHiredDate]) VALUES (10, N'John', N'Surtees', N'Male', N'john.surtees@reallylongemailaddress.com', N'9052938749', N'4166381726', N'Jack Brabham (bro)', N'9050984520', N'', 0, CAST(0xF0340B00 AS Date), CAST(0xF2340B00 AS Date), CAST(0xF2340B00 AS Date), CAST(0xF2340B00 AS Date), N'', N'rbadmin', N'', 2, CAST(0x00009F97009C39C0 AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Firstname], [Lastname], [Gender], [Email], [Homephone], [Mobilephone], [EmergencyContact], [EmergencyPhone1], [EmergencyPhone2], [IsEmployed], [HireDate], [TerminatedDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes], [PositionID], [ReHiredDate]) VALUES (11, N'Steve', N'Lorenzo', N'Male', N'stevel@thegoodwater.com', N'9058756876', N'', N'Fiona Lorenzo (Wife)', N'9058752556', N'', 1, CAST(0xED330B00 AS Date), NULL, CAST(0xF2340B00 AS Date), CAST(0xF2340B00 AS Date), N'', N'', N'', 17, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  StoredProcedure [dbo].[DiscontinueProduct]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Reiner Bata
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
create PROCEDURE [dbo].[DiscontinueProduct] 
(
@ProductID int
  ,@IsDiscontinued datetime
  ,@ModifiedBy  varchar(20)
  ,@ModifiedDate  datetime
)
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
update Product
set IsDiscontinued=1
,ModifiedDate = @ModifiedDate
,ModifiedBy = @ModifiedBy
where ProductID = @ProductID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAutocompleteSearchListForProduct]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAutocompleteSearchListForProduct]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_productid'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select distinct ProductID from AquaOne.dbo.Product 
			where  ProductID like @input + '%'
			order by 1;			
  end 
  else if @SearchCriteria='by_desc'
  	begin
  		select distinct ProductDescription from AquaOne.dbo.Product 
			where  LOWER(ProductDescription) like  '%'+ @input + '%'
			order by 1 ;
	end 
  
else if @SearchCriteria='by_productcode'
	begin
  		select distinct ProductCode from AquaOne.dbo.Product 
			where ProductCode like @input + '%' 
			order by 1;
	end
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProducts] 

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Retrieve all data from the table
--SELECT * from vw_accountWithAddress order by AccountId asc;
Select *
	from dbo.Product order by ProductCategory;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductBySearchCriteria]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductBySearchCriteria]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_productid'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select * from Product 
			where  ProductID = @input ;			
  end 
  else if @SearchCriteria='by_desc'
  	begin
  		select * from Product 
			where  LOWER(ProductDescription) like  '%'+ @input + '%' ;
	end 
  
else if @SearchCriteria='by_productcode'
	begin
  		select * from Product 
			where    ProductCode like @input + '%' ;
	end
GO
/****** Object:  StoredProcedure [dbo].[GetJobPositions]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetJobPositions] 
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

Select *
	 from JobPosition
;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePBType]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertUpdatePBType] 
(    

	 @TypeID int,
	 @Name varchar(10), 
	 @Description varchar(20), 
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@TypeID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   aquaone.dbo.PrepaidBottleType
				( Name, [Description] ,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy)
	      values ( @Name, @Description,@CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
     
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].PrepaidBottleType
		   SET Name = @Name
			  ,[Description] = @Description
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
		 WHERE TypeID =@TypeID;
        
        
        
	select @ReturnValue = @TypeID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateProductCategory]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateProductCategory] 
(    

	 @CategoryID int,
	 @CategoryName varchar(30), 
	 @Description varchar(50),
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@CategoryID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   AquaOne.dbo.ProductCategory 
        ( CategoryName, Description, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy )
       values(@CategoryName, @Description,@CreatedDate,@ModifiedDate,@CreatedBy,@ModifiedBy)
        
        select @ReturnValue = SCOPE_IDENTITY();
        
		
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE AquaOne.dbo.ProductCategory 
		   SET CategoryName = @CategoryName
		     , [Description] = @Description
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy		 
		 WHERE CategoryID =@CategoryID;
        
	select @ReturnValue = @CategoryID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateProduct]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateProduct] 
(    

	 @ProductID int,
	 @ProductDescription varchar(50), 
	 @ProductCode varchar(50),
	 @ProductCategory varchar(30), 
	 @UnitCost decimal(18,2), 
     @UnitPrice decimal(18,2),    
     @UnitsOnHand int,
     @ReorderLevel int,
     @ManufacturerName varchar(50),
     @ItemUrl varchar(1000), 
     @IsDiscontinued bit,
     @IsSubProduct bit,
     @IsTaxExempt bit,
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20), 
	 @Notes varchar(2000) = null
) 

AS

declare @ReturnValue int

if (@ProductID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  Product
        (ProductDescription, ProductCode, ProductCategory, UnitCost,UnitPrice,
        UnitsOnHand,ReorderLevel,ManufacturerName,ItemUrl,IsDiscontinued,IsSubProduct,IsTaxExempt, CreatedDate ,
        ModifiedDate, CreatedBy,ModifiedBy, Notes )
	      values ( @ProductDescription,@ProductCode, @ProductCategory,@UnitCost,@UnitPrice, 
	      @UnitsOnHand,@ReorderLevel,@ManufacturerName,@ItemUrl, @IsDiscontinued,@IsSubProduct,@IsTaxExempt, @CreatedDate, 
	      @ModifiedDate, @CreatedBy, @ModifiedBy, @Notes);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].[Product]
		   SET  ProductDescription = @ProductDescription
		      ,ProductCode = @ProductCode
		      ,ProductCategory = @ProductCategory
		      ,UnitCost  = @UnitCost
		      ,UnitPrice = @UnitPrice
			  ,UnitsOnHand = @UnitsOnHand
			  ,ReorderLevel =@ReorderLevel
			  ,ManufacturerName =@ManufacturerName
			  ,ItemUrl = @ItemUrl
			  ,IsDiscontinued = @IsDiscontinued
			  ,IsSubProduct = @IsSubProduct
			  ,IsTaxExempt=@IsTaxExempt
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
			  ,Notes = @Notes
		 WHERE ProductID =@ProductID;
        
        
        
	select @ReturnValue = @ProductID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertUpdateAddress] 
(    
     @AddressID int 
    ,@AddressLine1 varchar(30)
    ,@AddressLine2 varchar(30)
    ,@CityTown varchar(30)
    ,@Province varchar(2)
    ,@PostalCode varchar(10)
    ,@Country varchar(20)
    ,@CreatedDate datetime  
    ,@ModifiedDate datetime 
    ,@CreatedBy varchar(20) 
    ,@ModifiedBy varchar(20) 
) 

AS

declare @ReturnValue int

IF (@AddressID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		
		INSERT INTO [AquaOne].[dbo].[Address]
           ( AddressLine1 ,AddressLine2 ,CityTown ,Province ,PostalCode
            ,Country ,CreatedDate ,ModifiedDate  ,CreatedBy ,ModifiedBy )        
        VALUES
           ( @AddressLine1,@AddressLine2 ,@CityTown,@Province ,@PostalCode ,@Country ,@CreatedDate,@ModifiedDate
            ,@CreatedBy,@ModifiedBy ); 
                  
        select @ReturnValue = SCOPE_IDENTITY();
	END

ELSE
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
        update [AquaOne].[dbo].[Address]
		  set AddressLine1 = @AddressLine1,
		      AddressLine2 = @AddressLine2,
		      CityTown = @CityTown,
		      Province = @Province,
		      PostalCode = @PostalCode,
		      Country = @Country,
		      ModifiedDate = @ModifiedDate,
		      ModifiedBy = @ModifiedBy
		  where AddressID = @AddressID;
      
	    select @ReturnValue = @AddressID;

    END
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateAccount]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateAccount] 
(    

	 @AccountID int,
	 @Title varchar(10), 
	 @Firstname varchar(20), 
	 @Middlename varchar(20), 
	 @Lastname varchar(20), 
	 @Suffix varchar(10), 
	 @Email varchar(50), 
	 @Homephone varchar(20), 
	 @Mobilephone varchar(20), 
	 @Workphone varchar(20), 
	 @CustomerSince datetime, 
	 @WaterSourceLocationID int, 
	 @ContactFrequency varchar(10), 
	 @IsActive bit =1, 
	 @IsENewsletter bit, 
	 @IsNewsletter bit, 
	 @IsWaterTreatmentEquipment bit=0, 
	 @IsBottledWater bit=0, 
	 @IsRental bit=0, 
	 @IsService bit =0, 
	 @IsDelivery bit =0, 
	 @IsWaterCare bit =0, 
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20), 
	 @Notes varchar(2000) = null
) 

AS

declare @ReturnValue int

if (@AccountID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  Account
				(Title, Firstname, Middlename , Lastname, Suffix, Email, Homephone, Mobilephone ,
				 Workphone, CustomerSince, WaterSourceLocationID, ContactFrequency , IsActive, IsENewsletter,
				 IsNewsletter,IsWaterTreatmentEquipment,IsBottledWater,IsRental,IsService,IsDelivery,
				 IsWaterCare,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,Notes)
	      values ( @Title, @Firstname, @Middlename, @Lastname, @Suffix, @Email, @Homephone, @Mobilephone, 
				@Workphone, @CustomerSince, @WaterSourceLocationID, @ContactFrequency, @IsActive, @IsENewsletter,
				 @IsNewsletter, @IsWaterTreatmentEquipment, @IsBottledWater, @IsRental, @IsService, @IsDelivery, 
				@IsWaterCare, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy, @Notes);
     
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].[Account]
		   SET Title = @Title
			  ,Firstname = @Firstname
			  ,Middlename = @Middlename
			  ,Lastname = @Lastname
			  ,Suffix = @Suffix
			  ,Email = @Email
			  ,Homephone = @Homephone
			  ,Mobilephone = @Mobilephone
			  ,Workphone = @Workphone
			  ,CustomerSince = @CustomerSince
			  ,WaterSourceLocationID = @WaterSourceLocationID
			  ,ContactFrequency = @ContactFrequency
			  ,IsENewsletter = @IsENewsletter
			  ,IsNewsletter = @IsNewsletter
			  ,IsWaterTreatmentEquipment = @IsWaterTreatmentEquipment
			  ,IsBottledWater = @IsBottledWater
			  ,IsRental = @IsRental
			  ,IsService = @IsService
			  ,IsDelivery = @IsDelivery
			  ,IsWaterCare = @IsWaterCare
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
			  ,Notes = @Notes
		 WHERE AccountID =@AccountID;
        
        
        
	select @ReturnValue = @AccountID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertJobPosition]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertJobPosition] 
(    

	 @PositionID int,
	 @PositionName varchar(30), 
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@PositionID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  JobPosition ( PositionName, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)
       values(@PositionName,@CreatedDate,@ModifiedDate,@CreatedBy,@ModifiedBy)
        
        select @ReturnValue = SCOPE_IDENTITY();
        
		
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].[JobPosition]
		   SET PositionName =@PositionName
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
			 
		 WHERE PositionID =@PositionID;
        
        
        
	select @ReturnValue = @PositionID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  View [dbo].[vw_productsBelowReorderLevel]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_productsBelowReorderLevel]
as

select productid, productdescription, productcode, productcategory, unitcost,unitprice
	,unitsonhand, reorderlevel,manufacturername
 from aquaone.dbo.product 
 where unitsonhand <= reorderlevel
 and Isdiscontinued = 0 ;
GO
/****** Object:  Table [dbo].[PrepaidBottle]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrepaidBottle](
	[PrepaidBottleID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[Balance] [int] NOT NULL,
	[PrepaidBottleType] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PrepaidBalance] PRIMARY KEY CLUSTERED 
(
	[PrepaidBottleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PrepaidBottle] ON
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (16, 5, 6, 2, CAST(0x00009FA200A87CD0 AS DateTime), CAST(0x00009FAC00C4C854 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (17, 5, -3, 3, CAST(0x00009FA200A87CD3 AS DateTime), CAST(0x00009FAA01008E80 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (18, 7, 36, 2, CAST(0x00009FA200D266CA AS DateTime), CAST(0x00009FAA00FFE279 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (19, 1, 14, 2, CAST(0x00009FA200F55679 AS DateTime), CAST(0x00009FAC00D249A9 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (20, 17, 24, 4, CAST(0x00009FA300CC345B AS DateTime), CAST(0x00009FA900FE73FE AS DateTime), N'storeadmin', N'clerk1')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (21, 10, -1, 2, CAST(0x00009FA300CC4612 AS DateTime), CAST(0x00009FAA00FBE918 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (22, 2, 8, 2, CAST(0x00009FA300DBC362 AS DateTime), CAST(0x00009FAB009E216B AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (23, 18, 64, 2, CAST(0x00009FA300FE1282 AS DateTime), CAST(0x00009FA900A93411 AS DateTime), N'storeadmin', N'clerk1')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (24, 3, 21, 2, CAST(0x00009FA60094DDF8 AS DateTime), CAST(0x00009FAA00C60B6A AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (25, 8, -4, 2, CAST(0x00009FA600D1F774 AS DateTime), CAST(0x00009FAA0100DC30 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (26, 11, 38, 2, CAST(0x00009FAC00A3B3CE AS DateTime), CAST(0x00009FAC00A3B3CE AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (27, 12, 61, 4, CAST(0x00009FAC00A3CF01 AS DateTime), CAST(0x00009FAC00A3E6E3 AS DateTime), N'storeadmin', N'storeadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (28, 15, 33, 2, CAST(0x00009FAC00A4C046 AS DateTime), CAST(0x00009FAC011CD750 AS DateTime), N'storeadmin', N'rbadmin')
INSERT [dbo].[PrepaidBottle] ([PrepaidBottleID], [AccountID], [Balance], [PrepaidBottleType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (29, 15, 22, 4, CAST(0x00009FAC00AF53EB AS DateTime), CAST(0x00009FAC00AF53EB AS DateTime), N'storeadmin', N'')
SET IDENTITY_INSERT [dbo].[PrepaidBottle] OFF
/****** Object:  StoredProcedure [dbo].[InsertUpdateSTG_ServiceWork]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery6.sql|7|0|C:\Users\nei\AppData\Local\Temp\~vsEDCD.sql

CREATE PROCEDURE [dbo].[InsertUpdateSTG_ServiceWork] 
(    

	 @STG_servID  int,
	 @AccountID int,
	 @ServiceStatus varchar(10), 
	 @ServiceDate datetime, 
	 @ServiceStartTime time(2), 
	 @ServiceEndTime time(2), 
	 @Technician varchar(30),
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@STG_servID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  AquaOne.dbo.STG_ServiceWork  (  AccountID, ServiceDate, ServiceStatus, ServiceStartTime, ServiceEndTime, 
		Technician, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy )
	      values (@AccountID,@ServiceDate,  @ServiceStatus, @ServiceStartTime, @ServiceEndTime,
	      @Technician, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].STG_ServiceWOrk
		   SET  AccountID = @AccountID
		     , ServiceStatus = @ServiceStatus
			  , ServiceDate = @ServiceDate
			  ,ServiceStartTime = @ServiceStartTime
			  ,ServiceEndTime = @ServiceEndTime
			  ,Technician = @Technician
			  ,CreatedDate = @CreatedDate
			  , ModifiedDate = @ModifiedDate
			  ,CreatedBy = @CreatedBy
			  ,ModifiedBy = @ModifiedBy	
		 WHERE   STG_servID =@STG_servID;
        
        
        
	select @ReturnValue = @STG_servID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[ReactivateProduct]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Reiner Bata
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
create PROCEDURE [dbo].[ReactivateProduct] 
(
   @ProductID int
   ,@IsDiscontinued bit
  ,@ModifiedBy  varchar(20)
  ,@ModifiedDate  datetime
)
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
update Product
set IsDiscontinued=0
,ModifiedDate = @ModifiedDate
,ModifiedBy = @ModifiedBy
where ProductID = @ProductID;
END
GO
/****** Object:  Table [dbo].[ProductPartReplacement]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductPartReplacement](
	[ProductID] [int] NOT NULL,
	[SubProductID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_Assembly] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[SubProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ProductPartReplacement] ([ProductID], [SubProductID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6921, 6840, CAST(0x00009FA900C22DC7 AS DateTime), CAST(0x00009FA900C22DC7 AS DateTime), N'clerk1', N'')
INSERT [dbo].[ProductPartReplacement] ([ProductID], [SubProductID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6921, 6848, CAST(0x00009FA900AC35B6 AS DateTime), CAST(0x00009FA900AC35B6 AS DateTime), N'clerk1', N'')
/****** Object:  Table [dbo].[Invoice]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(100,1) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[AccountID] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[TotalTaxCharged] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) SPARSE  NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (162, CAST(0x00009F9600E36F6A AS DateTime), 1, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F9600E36F6A AS DateTime), CAST(0x00009F9600E36F6A AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (163, CAST(0x00009F9600E7DE15 AS DateTime), 5, CAST(277.25 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(311.05 AS Decimal(18, 2)), CAST(0x00009F9600E7DE15 AS DateTime), CAST(0x00009F9600E7DE15 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (164, CAST(0x00009F9600F773E7 AS DateTime), NULL, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(29.38 AS Decimal(18, 2)), CAST(0x00009F9600F773E7 AS DateTime), CAST(0x00009F9600F773E7 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (165, CAST(0x00009F9600F780A0 AS DateTime), NULL, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(29.38 AS Decimal(18, 2)), CAST(0x00009F9600F780A0 AS DateTime), CAST(0x00009F9600F780A0 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (166, CAST(0x00009F9600F79DC6 AS DateTime), NULL, CAST(45.50 AS Decimal(18, 2)), CAST(5.92 AS Decimal(18, 2)), CAST(51.42 AS Decimal(18, 2)), CAST(0x00009F9600F79DC6 AS DateTime), CAST(0x00009F9600F79DC6 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (167, CAST(0x00009F9600F81B29 AS DateTime), 4, CAST(299.00 AS Decimal(18, 2)), CAST(38.87 AS Decimal(18, 2)), CAST(337.87 AS Decimal(18, 2)), CAST(0x00009F9600F81B29 AS DateTime), CAST(0x00009F9600F81B29 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (168, CAST(0x00009F9600F85352 AS DateTime), 18, CAST(32.50 AS Decimal(18, 2)), CAST(4.23 AS Decimal(18, 2)), CAST(36.73 AS Decimal(18, 2)), CAST(0x00009F9600F85352 AS DateTime), CAST(0x00009F9600F85352 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (169, CAST(0x00009F9600F864AC AS DateTime), 7, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009F9600F864AC AS DateTime), CAST(0x00009F9600F864AC AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (170, CAST(0x00009F9600F87D32 AS DateTime), 16, CAST(83.20 AS Decimal(18, 2)), CAST(10.82 AS Decimal(18, 2)), CAST(94.02 AS Decimal(18, 2)), CAST(0x00009F9600F87D32 AS DateTime), CAST(0x00009F9600F87D32 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (171, CAST(0x00009F9600F94EB1 AS DateTime), NULL, CAST(19.50 AS Decimal(18, 2)), CAST(2.54 AS Decimal(18, 2)), CAST(22.04 AS Decimal(18, 2)), CAST(0x00009F9600F94EB0 AS DateTime), CAST(0x00009F9600F94EB0 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (172, CAST(0x00009F9600F9767C AS DateTime), 10, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009F9600F9767C AS DateTime), CAST(0x00009F9600F9767C AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (173, CAST(0x00009F9600F982B1 AS DateTime), NULL, CAST(45.50 AS Decimal(18, 2)), CAST(5.92 AS Decimal(18, 2)), CAST(51.42 AS Decimal(18, 2)), CAST(0x00009F9600F982B1 AS DateTime), CAST(0x00009F9600F982B1 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (174, CAST(0x00009F7000FB1E6E AS DateTime), NULL, CAST(52.00 AS Decimal(18, 2)), CAST(6.76 AS Decimal(18, 2)), CAST(58.76 AS Decimal(18, 2)), CAST(0x00009F7000FB1E6E AS DateTime), CAST(0x00009F7000FB1E6E AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (175, CAST(0x00009F7000FB5570 AS DateTime), NULL, CAST(156.00 AS Decimal(18, 2)), CAST(20.28 AS Decimal(18, 2)), CAST(176.28 AS Decimal(18, 2)), CAST(0x00009F7000FB5570 AS DateTime), CAST(0x00009F7000FB5570 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (176, CAST(0x00009F7000FB62C1 AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009F7000FB62C1 AS DateTime), CAST(0x00009F7000FB62C1 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (177, CAST(0x00009F5700FBFF1A AS DateTime), 15, CAST(156.00 AS Decimal(18, 2)), CAST(20.28 AS Decimal(18, 2)), CAST(176.28 AS Decimal(18, 2)), CAST(0x00009F5700FBFF1A AS DateTime), CAST(0x00009F5700FBFF1A AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (178, CAST(0x00009F5700FC16F8 AS DateTime), NULL, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(29.38 AS Decimal(18, 2)), CAST(0x00009F5700FC16F8 AS DateTime), CAST(0x00009F5700FC16F8 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (179, CAST(0x00009F5700FC294D AS DateTime), NULL, CAST(45.50 AS Decimal(18, 2)), CAST(5.92 AS Decimal(18, 2)), CAST(51.42 AS Decimal(18, 2)), CAST(0x00009F5700FC294D AS DateTime), CAST(0x00009F5700FC294D AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (180, CAST(0x00009F57014C729A AS DateTime), NULL, CAST(140.40 AS Decimal(18, 2)), CAST(18.25 AS Decimal(18, 2)), CAST(158.65 AS Decimal(18, 2)), CAST(0x00009F57014C729A AS DateTime), CAST(0x00009F57014C729A AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (181, CAST(0x00009F57014CD70C AS DateTime), NULL, CAST(201.50 AS Decimal(18, 2)), CAST(26.20 AS Decimal(18, 2)), CAST(227.70 AS Decimal(18, 2)), CAST(0x00009F57014CD70C AS DateTime), CAST(0x00009F57014CD70C AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (182, CAST(0x00009F97009ACB67 AS DateTime), 3, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F97009ACB67 AS DateTime), CAST(0x00009F97009ACB67 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (183, CAST(0x00009E6600ADD8C3 AS DateTime), 6, CAST(351.00 AS Decimal(18, 2)), CAST(45.63 AS Decimal(18, 2)), CAST(396.63 AS Decimal(18, 2)), CAST(0x00009E6600ADD8C3 AS DateTime), CAST(0x00009E6600ADD8C3 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (184, CAST(0x00009E6600AE4FDB AS DateTime), 8, CAST(290.25 AS Decimal(18, 2)), CAST(35.49 AS Decimal(18, 2)), CAST(325.74 AS Decimal(18, 2)), CAST(0x00009E6600AE4FDB AS DateTime), CAST(0x00009E6600AE4FDB AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (185, CAST(0x00009E9D00AED4A3 AS DateTime), NULL, CAST(39.00 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(44.07 AS Decimal(18, 2)), CAST(0x00009E9D00AED4A3 AS DateTime), CAST(0x00009E9D00AED4A3 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (186, CAST(0x00009E9D00AF25B7 AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009E9D00AF25B7 AS DateTime), CAST(0x00009E9D00AF25B7 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (187, CAST(0x00009EC000AFEC24 AS DateTime), NULL, CAST(171.60 AS Decimal(18, 2)), CAST(22.31 AS Decimal(18, 2)), CAST(193.91 AS Decimal(18, 2)), CAST(0x00009EC000AFEC24 AS DateTime), CAST(0x00009EC000AFEC24 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (188, CAST(0x00009EDE00B06D32 AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009EDE00B06D32 AS DateTime), CAST(0x00009EDE00B06D32 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (189, CAST(0x00009F1B00B0E89A AS DateTime), 9, CAST(234.00 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(264.42 AS Decimal(18, 2)), CAST(0x00009F1B00B0E89A AS DateTime), CAST(0x00009F1B00B0E89A AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (190, CAST(0x00009F3A00B3BC77 AS DateTime), 17, CAST(197.60 AS Decimal(18, 2)), CAST(25.69 AS Decimal(18, 2)), CAST(223.29 AS Decimal(18, 2)), CAST(0x00009F3A00B3BC77 AS DateTime), CAST(0x00009F3A00B3BC77 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (191, CAST(0x00009EFD00B40309 AS DateTime), NULL, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009EFD00B40309 AS DateTime), CAST(0x00009EFD00B40309 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (192, CAST(0x00009E8600B44C7E AS DateTime), NULL, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009E8600B44C7E AS DateTime), CAST(0x00009E8600B44C7E AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (193, CAST(0x00009E8600B458C3 AS DateTime), NULL, CAST(273.00 AS Decimal(18, 2)), CAST(35.49 AS Decimal(18, 2)), CAST(308.49 AS Decimal(18, 2)), CAST(0x00009E8600B458C3 AS DateTime), CAST(0x00009E8600B458C3 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (194, CAST(0x00009E2A00EA754A AS DateTime), NULL, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009E2A00EA754A AS DateTime), CAST(0x00009E2A00EA754A AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (195, CAST(0x00009E2A00EA7EF7 AS DateTime), NULL, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009E2A00EA7EF7 AS DateTime), CAST(0x00009E2A00EA7EF7 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (196, CAST(0x00009E2A00EA8855 AS DateTime), NULL, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009E2A00EA8855 AS DateTime), CAST(0x00009E2A00EA8855 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (197, CAST(0x00009E2A00EA94DC AS DateTime), NULL, CAST(61.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(61.25 AS Decimal(18, 2)), CAST(0x00009E2A00EA94DC AS DateTime), CAST(0x00009E2A00EA94DC AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (198, CAST(0x00009E2A00EA9E87 AS DateTime), NULL, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009E2A00EA9E87 AS DateTime), CAST(0x00009E2A00EA9E87 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (199, CAST(0x00009F9800A9EDA0 AS DateTime), 6, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F9800A9EDA0 AS DateTime), CAST(0x00009F9800A9EDA0 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (200, CAST(0x00009F9800AB8CFA AS DateTime), 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009F9800AB8CFA AS DateTime), CAST(0x00009F9800AB8CFA AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (201, CAST(0x00009F9800CBCE90 AS DateTime), 7, CAST(270.00 AS Decimal(18, 2)), CAST(35.10 AS Decimal(18, 2)), CAST(305.10 AS Decimal(18, 2)), CAST(0x00009F9800CBCE90 AS DateTime), CAST(0x00009F9800CBCE90 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (202, CAST(0x00009F9800CC3B79 AS DateTime), NULL, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009F9800CC3B79 AS DateTime), CAST(0x00009F9800CC3B79 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (203, CAST(0x00009F99013333C2 AS DateTime), 18, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F99013333C2 AS DateTime), CAST(0x00009F99013333C2 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (204, CAST(0x00009F9A01306377 AS DateTime), 12, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F9A01306377 AS DateTime), CAST(0x00009F9A01306377 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (205, CAST(0x00009F9C00C07A94 AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009F9C00C07A94 AS DateTime), CAST(0x00009F9C00C07A94 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (206, CAST(0x00009F9E00EF2306 AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009F9E00EF2306 AS DateTime), CAST(0x00009F9E00EF2306 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (207, CAST(0x00009F9F00A85D26 AS DateTime), 10, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009F9F00A85D26 AS DateTime), CAST(0x00009F9F00A85D26 AS DateTime), N'rbadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (208, CAST(0x00009FA0015A2CF4 AS DateTime), 8, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015A2CF4 AS DateTime), CAST(0x00009FA0015A2CF4 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (209, CAST(0x00009FA0015AC504 AS DateTime), 8, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015AC504 AS DateTime), CAST(0x00009FA0015AC504 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (210, CAST(0x00009FA0015B4727 AS DateTime), 8, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015B4727 AS DateTime), CAST(0x00009FA0015B4727 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (211, CAST(0x00009FA0015BE05B AS DateTime), 8, CAST(34.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), CAST(0x00009FA0015BE05B AS DateTime), CAST(0x00009FA0015BE05B AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (212, CAST(0x00009FA0015C475F AS DateTime), 8, CAST(34.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), CAST(0x00009FA0015C475F AS DateTime), CAST(0x00009FA0015C475F AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (213, CAST(0x00009FA100FBC470 AS DateTime), 5, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA100FBC470 AS DateTime), CAST(0x00009FA100FBC470 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (214, CAST(0x00009FA10125B7A6 AS DateTime), 5, CAST(17.85 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.85 AS Decimal(18, 2)), CAST(0x00009FA10125B7A6 AS DateTime), CAST(0x00009FA10125B7A6 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (215, CAST(0x00009FA200A76F4A AS DateTime), 5, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA200A76F4A AS DateTime), CAST(0x00009FA200A76F4A AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (216, CAST(0x00009FA200A7A2E4 AS DateTime), 5, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200A7A2E4 AS DateTime), CAST(0x00009FA200A7A2E4 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (217, CAST(0x00009FA200A87CC4 AS DateTime), 5, CAST(182.40 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(182.40 AS Decimal(18, 2)), CAST(0x00009FA200A87CC4 AS DateTime), CAST(0x00009FA200A87CC4 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (218, CAST(0x00009FA200A8E12C AS DateTime), 5, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA200A8E12C AS DateTime), CAST(0x00009FA200A8E12C AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (219, CAST(0x00009FA200C4D8AE AS DateTime), 17, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009FA200C4D8AD AS DateTime), CAST(0x00009FA200C4D8AD AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (220, CAST(0x00009FA200D266BB AS DateTime), 7, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009FA200D266BB AS DateTime), CAST(0x00009FA200D266BB AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (221, CAST(0x00009FA200F5562D AS DateTime), 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200F5562D AS DateTime), CAST(0x00009FA200F5562D AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (222, CAST(0x00009FA300CC3423 AS DateTime), 17, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300CC3423 AS DateTime), CAST(0x00009FA300CC3423 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (223, CAST(0x00009FA300CC4610 AS DateTime), 10, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300CC4610 AS DateTime), CAST(0x00009FA300CC4610 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (224, CAST(0x00009FA300DBC35A AS DateTime), 2, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300DBC35A AS DateTime), CAST(0x00009FA300DBC35A AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (225, CAST(0x00009FA300F44C3A AS DateTime), NULL, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009FA300F44C3A AS DateTime), CAST(0x00009FA300F44C3A AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (226, CAST(0x00009FA300FE127C AS DateTime), 18, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300FE127C AS DateTime), CAST(0x00009FA300FE127C AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (227, CAST(0x00009FA4009B8268 AS DateTime), 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA4009B8268 AS DateTime), CAST(0x00009FA4009B8268 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (228, CAST(0x00009FA4009BB892 AS DateTime), 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA4009BB892 AS DateTime), CAST(0x00009FA4009BB892 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (229, CAST(0x00009FA500D220DA AS DateTime), 5, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA500D220DA AS DateTime), CAST(0x00009FA500D220DA AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (230, CAST(0x00009FA500D48576 AS DateTime), 3, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009FA500D48576 AS DateTime), CAST(0x00009FA500D48576 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (231, CAST(0x00009FA60094DDDD AS DateTime), 3, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA60094DDDD AS DateTime), CAST(0x00009FA60094DDDD AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (232, CAST(0x00009FAB00D1F763 AS DateTime), 8, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAB00D1F763 AS DateTime), CAST(0x00009FAB00D1F763 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (233, CAST(0x00009FAB00D25201 AS DateTime), NULL, CAST(41.60 AS Decimal(18, 2)), CAST(5.41 AS Decimal(18, 2)), CAST(47.01 AS Decimal(18, 2)), CAST(0x00009FAB00D25201 AS DateTime), CAST(0x00009FAB00D25201 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (234, CAST(0x00009FA700AEB243 AS DateTime), 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA700AEB243 AS DateTime), CAST(0x00009FA700AEB243 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (235, CAST(0x00009FA900BF31C5 AS DateTime), 18, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA900BF31C5 AS DateTime), CAST(0x00009FA900BF31C5 AS DateTime), N'clerk1', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (236, CAST(0x00009FAA01004AB2 AS DateTime), 7, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAA01004AB2 AS DateTime), CAST(0x00009FAA01004AB2 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (237, CAST(0x00009FAC00A3B3A9 AS DateTime), 11, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAC00A3B3A9 AS DateTime), CAST(0x00009FAC00A3B3A9 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (238, CAST(0x00009FAC00A3CF00 AS DateTime), 12, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAC00A3CF00 AS DateTime), CAST(0x00009FAC00A3CF00 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (239, CAST(0x00009FAC00A4C040 AS DateTime), 15, CAST(325.20 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(355.62 AS Decimal(18, 2)), CAST(0x00009FAC00A4C040 AS DateTime), CAST(0x00009FAC00A4C040 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (240, CAST(0x00009FAC00AEFA45 AS DateTime), 15, CAST(234.00 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(264.42 AS Decimal(18, 2)), CAST(0x00009FAC00AEFA45 AS DateTime), CAST(0x00009FAC00AEFA45 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (241, CAST(0x00009FAC00AF53E8 AS DateTime), 15, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009FAC00AF53E8 AS DateTime), CAST(0x00009FAC00AF53E8 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (242, CAST(0x00009FAC00B13143 AS DateTime), 15, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FAC00B13143 AS DateTime), CAST(0x00009FAC00B13143 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (243, CAST(0x00009FAC00BA0C10 AS DateTime), 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(293.80 AS Decimal(18, 2)), CAST(0x00009FAC00BA0C10 AS DateTime), CAST(0x00009FAC00BA0C10 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (244, CAST(0x00009FAC00BD4C16 AS DateTime), 1, CAST(149.50 AS Decimal(18, 2)), CAST(19.44 AS Decimal(18, 2)), CAST(168.94 AS Decimal(18, 2)), CAST(0x00009FAC00BD4C16 AS DateTime), CAST(0x00009FAC00BD4C16 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (245, CAST(0x00009FAC00C51358 AS DateTime), 10, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009FAC00C51357 AS DateTime), CAST(0x00009FAC00C51357 AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (246, CAST(0x00009FAC00C66DBB AS DateTime), 14, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(79.10 AS Decimal(18, 2)), CAST(0x00009FAC00C66DBA AS DateTime), CAST(0x00009FAC00C66DBA AS DateTime), N'storeadmin', N'', N'')
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [AccountID], [SubTotal], [TotalTaxCharged], [TotalAmount], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (247, CAST(0x00009FAC011E23FC AS DateTime), 9, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(220.35 AS Decimal(18, 2)), CAST(0x00009FAC011E23FC AS DateTime), CAST(0x00009FAC011E23FC AS DateTime), N'rbadmin', N'', N'')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
/****** Object:  Table [dbo].[PrepaidBottleTransaction]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrepaidBottleTransaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [varchar](10) NOT NULL,
	[PrepaidBottleID] [int] NULL,
	[LastUpdatedBalance] [int] NULL,
	[DeductQty] [int] NOT NULL,
	[TopUpQty] [int] NOT NULL,
	[LastTransactionDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PrepaidTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PrepaidBottleTransaction] ON
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (29, N'topUp', 16, 38, 0, 38, CAST(0x00009FA200A87CD1 AS DateTime), CAST(0x00009FA200A87CD0 AS DateTime), CAST(0x00009FA200A87CD0 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (30, N'topUp', 17, 62, 0, 62, CAST(0x00009FA200A87CDC AS DateTime), CAST(0x00009FA200A87CDC AS DateTime), CAST(0x00009FA200A87CDC AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (31, N'deduct', 16, 33, 5, 0, CAST(0x00009FA200A89C56 AS DateTime), CAST(0x00009FA200A89C56 AS DateTime), CAST(0x00009FA200A89C56 AS DateTime), N'', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (32, N'deduct', 17, 60, 2, 0, CAST(0x00009FA200A8A103 AS DateTime), CAST(0x00009FA200A8A103 AS DateTime), CAST(0x00009FA200A8A103 AS DateTime), N'', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (33, N'topUp', 16, 40, 0, 7, CAST(0x00009FA200A8E12E AS DateTime), CAST(0x00009FA200A8E12E AS DateTime), CAST(0x00009FA200A8E12E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (34, N'deduct', 16, 37, 3, 0, CAST(0x00009FA200ABEDBA AS DateTime), CAST(0x00009FA200ABEDBA AS DateTime), CAST(0x00009FA200ABEDBA AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (35, N'deduct', 16, 35, 2, 0, CAST(0x00009FA200AE48C7 AS DateTime), CAST(0x00009FA200AE48C7 AS DateTime), CAST(0x00009FA200AE48C7 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (36, N'deduct', 16, 33, 2, 0, CAST(0x00009FA200AED0D2 AS DateTime), CAST(0x00009FA200AED0D2 AS DateTime), CAST(0x00009FA200AED0D2 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (37, N'deduct', 17, 56, 4, 0, CAST(0x00009FA200AEEE8E AS DateTime), CAST(0x00009FA200AEEE8E AS DateTime), CAST(0x00009FA200AEEE8E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (38, N'deduct', 17, 53, 3, 0, CAST(0x00009FA200B5A704 AS DateTime), CAST(0x00009FA200B5A704 AS DateTime), CAST(0x00009FA200B5A704 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (39, N'deduct', 17, 50, 3, 0, CAST(0x00009FA200B5DFC4 AS DateTime), CAST(0x00009FA200B5DFC4 AS DateTime), CAST(0x00009FA200B5DFC4 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (40, N'deduct', 17, 47, 3, 0, CAST(0x00009FA200B5FB62 AS DateTime), CAST(0x00009FA200B5FB62 AS DateTime), CAST(0x00009FA200B5FB62 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (41, N'deduct', 16, 30, 3, 0, CAST(0x00009FA200B604BF AS DateTime), CAST(0x00009FA200B604BF AS DateTime), CAST(0x00009FA200B604BF AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (42, N'deduct', 16, 25, 5, 0, CAST(0x00009FA200C07E36 AS DateTime), CAST(0x00009FA200C07E36 AS DateTime), CAST(0x00009FA200C07E36 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (43, N'topUp', 18, 12, 0, 12, CAST(0x00009FA200D266CB AS DateTime), CAST(0x00009FA200D266CB AS DateTime), CAST(0x00009FA200D266CB AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (44, N'deduct', 18, 7, 5, 0, CAST(0x00009FA200D27892 AS DateTime), CAST(0x00009FA200D27892 AS DateTime), CAST(0x00009FA200D27892 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (45, N'deduct', 16, 20, 5, 0, CAST(0x00009FA200E3CF0D AS DateTime), CAST(0x00009FA200E3CF0C AS DateTime), CAST(0x00009FA200E3CF0C AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (46, N'topUp', 19, 38, 0, 38, CAST(0x00009FA200F5567F AS DateTime), CAST(0x00009FA200F5567F AS DateTime), CAST(0x00009FA200F5567F AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (47, N'deduct', 19, 34, 4, 0, CAST(0x00009FA200F56E45 AS DateTime), CAST(0x00009FA200F56E45 AS DateTime), CAST(0x00009FA200F56E45 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (48, N'deduct', 19, 29, 5, 0, CAST(0x00009FA200FAC6D6 AS DateTime), CAST(0x00009FA200FAC6D6 AS DateTime), CAST(0x00009FA200FAC6D6 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (49, N'deduct', 16, 15, 5, 0, CAST(0x00009FA201049688 AS DateTime), CAST(0x00009FA201049687 AS DateTime), CAST(0x00009FA201049687 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (50, N'deduct', 19, 23, 6, 0, CAST(0x00009FA20144AEB0 AS DateTime), CAST(0x00009FA20144AEB0 AS DateTime), CAST(0x00009FA20144AEB0 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (51, N'deduct', 16, 10, 5, 0, CAST(0x00009FA300C2F399 AS DateTime), CAST(0x00009FA300C2F399 AS DateTime), CAST(0x00009FA300C2F399 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (52, N'topUp', 20, 68, 0, 68, CAST(0x00009FA300CC345D AS DateTime), CAST(0x00009FA300CC345D AS DateTime), CAST(0x00009FA300CC345D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (53, N'topUp', 21, 38, 0, 38, CAST(0x00009FA300CC4612 AS DateTime), CAST(0x00009FA300CC4612 AS DateTime), CAST(0x00009FA300CC4612 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (54, N'deduct', 20, 63, 5, 0, CAST(0x00009FA300CC5575 AS DateTime), CAST(0x00009FA300CC5575 AS DateTime), CAST(0x00009FA300CC5575 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (55, N'deduct', 21, 35, 3, 0, CAST(0x00009FA300D9C12F AS DateTime), CAST(0x00009FA300D9C12E AS DateTime), CAST(0x00009FA300D9C12E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (56, N'deduct', 18, 5, 2, 0, CAST(0x00009FA300DA7365 AS DateTime), CAST(0x00009FA300DA7365 AS DateTime), CAST(0x00009FA300DA7365 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (57, N'topUp', 22, 38, 0, 38, CAST(0x00009FA300DBC363 AS DateTime), CAST(0x00009FA300DBC363 AS DateTime), CAST(0x00009FA300DBC363 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (58, N'deduct', 22, 33, 5, 0, CAST(0x00009FA300DBD43E AS DateTime), CAST(0x00009FA300DBD43E AS DateTime), CAST(0x00009FA300DBD43E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (59, N'deduct', 19, 20, 3, 0, CAST(0x00009FA300DF490F AS DateTime), CAST(0x00009FA300DF490F AS DateTime), CAST(0x00009FA300DF490F AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (60, N'deduct', 22, 28, 5, 0, CAST(0x00009FA300EBD392 AS DateTime), CAST(0x00009FA300EBD392 AS DateTime), CAST(0x00009FA300EBD392 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (61, N'deduct', 19, 16, 4, 0, CAST(0x00009FA300ED2046 AS DateTime), CAST(0x00009FA300ED2045 AS DateTime), CAST(0x00009FA300ED2045 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (62, N'deduct', 16, 5, 5, 0, CAST(0x00009FA300F1C00D AS DateTime), CAST(0x00009FA300F1C00D AS DateTime), CAST(0x00009FA300F1C00D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (63, N'deduct', 21, 30, 5, 0, CAST(0x00009FA300FD4DB3 AS DateTime), CAST(0x00009FA300FD4DB3 AS DateTime), CAST(0x00009FA300FD4DB3 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (64, N'topUp', 23, 38, 0, 38, CAST(0x00009FA300FE1283 AS DateTime), CAST(0x00009FA300FE1283 AS DateTime), CAST(0x00009FA300FE1283 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (65, N'deduct', 23, 32, 6, 0, CAST(0x00009FA300FE2CDD AS DateTime), CAST(0x00009FA300FE2CDD AS DateTime), CAST(0x00009FA300FE2CDD AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (66, N'deduct', 21, 26, 4, 0, CAST(0x00009FA301560486 AS DateTime), CAST(0x00009FA301560486 AS DateTime), CAST(0x00009FA301560486 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (67, N'deduct', 19, 11, 5, 0, CAST(0x00009FA4009A5C2B AS DateTime), CAST(0x00009FA4009A5C2B AS DateTime), CAST(0x00009FA4009A5C2B AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (68, N'deduct', 19, 6, 5, 0, CAST(0x00009FA4009B27C9 AS DateTime), CAST(0x00009FA4009B27C9 AS DateTime), CAST(0x00009FA4009B27C9 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (69, N'deduct', 19, 0, 6, 0, CAST(0x00009FA4009B46BD AS DateTime), CAST(0x00009FA4009B46BD AS DateTime), CAST(0x00009FA4009B46BD AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (70, N'deduct', 19, -1, 1, 0, CAST(0x00009FA4009B6047 AS DateTime), CAST(0x00009FA4009B6047 AS DateTime), CAST(0x00009FA4009B6047 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (71, N'topUp', 19, 6, 0, 7, CAST(0x00009FA4009B8282 AS DateTime), CAST(0x00009FA4009B8282 AS DateTime), CAST(0x00009FA4009B8282 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (72, N'topUp', 19, 13, 0, 7, CAST(0x00009FA4009BB894 AS DateTime), CAST(0x00009FA4009BB894 AS DateTime), CAST(0x00009FA4009BB894 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (73, N'deduct', 21, 21, 5, 0, CAST(0x00009FA400AB2E16 AS DateTime), CAST(0x00009FA400AB2E15 AS DateTime), CAST(0x00009FA400AB2E15 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (74, N'deduct', 22, 23, 5, 0, CAST(0x00009FA400D6AC97 AS DateTime), CAST(0x00009FA400D6AC97 AS DateTime), CAST(0x00009FA400D6AC97 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (75, N'deduct', 16, 2, 3, 0, CAST(0x00009FA400F56004 AS DateTime), CAST(0x00009FA400F56003 AS DateTime), CAST(0x00009FA400F56003 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (76, N'deduct', 19, 8, 5, 0, CAST(0x00009FA400FF71AE AS DateTime), CAST(0x00009FA400FF71AE AS DateTime), CAST(0x00009FA400FF71AE AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (77, N'deduct', 19, 1, 7, 0, CAST(0x00009FA40101BC99 AS DateTime), CAST(0x00009FA40101BC99 AS DateTime), CAST(0x00009FA40101BC99 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (78, N'deduct', 20, 57, 6, 0, CAST(0x00009FA500A881C0 AS DateTime), CAST(0x00009FA500A881C0 AS DateTime), CAST(0x00009FA500A881C0 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (79, N'deduct', 17, 42, 5, 0, CAST(0x00009FA500A8CA91 AS DateTime), CAST(0x00009FA500A8CA91 AS DateTime), CAST(0x00009FA500A8CA91 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (80, N'deduct', 17, 37, 5, 0, CAST(0x00009FA500B3DD68 AS DateTime), CAST(0x00009FA500B3DD68 AS DateTime), CAST(0x00009FA500B3DD68 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (81, N'deduct', 17, 30, 7, 0, CAST(0x00009FA500B60421 AS DateTime), CAST(0x00009FA500B60421 AS DateTime), CAST(0x00009FA500B60421 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (82, N'deduct', 16, 0, 2, 0, CAST(0x00009FA500D1E102 AS DateTime), CAST(0x00009FA500D1E102 AS DateTime), CAST(0x00009FA500D1E102 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (83, N'topUp', 16, 38, 0, 38, CAST(0x00009FA500D22196 AS DateTime), CAST(0x00009FA500D22196 AS DateTime), CAST(0x00009FA500D22196 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (84, N'deduct', 16, 33, 5, 0, CAST(0x00009FA500F582A7 AS DateTime), CAST(0x00009FA500F582A7 AS DateTime), CAST(0x00009FA500F582A7 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (85, N'deduct', 20, 47, 10, 0, CAST(0x00009FA5014796F7 AS DateTime), CAST(0x00009FA5014796F7 AS DateTime), CAST(0x00009FA5014796F7 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (86, N'deduct', 20, 39, 8, 0, CAST(0x00009FA5014DEDC4 AS DateTime), CAST(0x00009FA5014DEDC4 AS DateTime), CAST(0x00009FA5014DEDC4 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (87, N'topUp', 24, 38, 0, 38, CAST(0x00009FA60094DDFC AS DateTime), CAST(0x00009FA60094DDFB AS DateTime), CAST(0x00009FA60094DDFB AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (88, N'deduct', 24, 33, 5, 0, CAST(0x00009FA60094F916 AS DateTime), CAST(0x00009FA60094F916 AS DateTime), CAST(0x00009FA60094F916 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (89, N'deduct', 22, 17, 6, 0, CAST(0x00009FA6009849DC AS DateTime), CAST(0x00009FA6009849DC AS DateTime), CAST(0x00009FA6009849DC AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (90, N'deduct', 16, 28, 5, 0, CAST(0x00009FA600D19D7A AS DateTime), CAST(0x00009FA600D19D7A AS DateTime), CAST(0x00009FA600D19D7A AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (91, N'topUp', 25, 38, 0, 38, CAST(0x00009FA600D1F776 AS DateTime), CAST(0x00009FA600D1F776 AS DateTime), CAST(0x00009FA600D1F776 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (92, N'deduct', 16, 22, 6, 0, CAST(0x00009FA600DE6752 AS DateTime), CAST(0x00009FA600DE6752 AS DateTime), CAST(0x00009FA600DE6752 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (93, N'topUp', 19, 39, 0, 38, CAST(0x00009FA700AEB2AE AS DateTime), CAST(0x00009FA700AEB2AE AS DateTime), CAST(0x00009FA700AEB2AE AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (94, N'deduct', 19, 30, 9, 0, CAST(0x00009FA700AED2FE AS DateTime), CAST(0x00009FA700AED2FE AS DateTime), CAST(0x00009FA700AED2FE AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (95, N'deduct', 18, 2, 3, 0, CAST(0x00009FA700B6B10E AS DateTime), CAST(0x00009FA700B6B10D AS DateTime), CAST(0x00009FA700B6B10D AS DateTime), N'rbadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (96, N'deduct', 16, 17, 5, 0, CAST(0x00009FA700BD353B AS DateTime), CAST(0x00009FA700BD353B AS DateTime), CAST(0x00009FA700BD353B AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (97, N'deduct', 20, 34, 5, 0, CAST(0x00009FA7010000FA AS DateTime), CAST(0x00009FA7010000FA AS DateTime), CAST(0x00009FA7010000FA AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (98, N'deduct', 19, 25, 5, 0, CAST(0x00009FA9009B1D74 AS DateTime), CAST(0x00009FA9009B1D74 AS DateTime), CAST(0x00009FA9009B1D74 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (99, N'deduct', 16, 12, 5, 0, CAST(0x00009FA900A1A221 AS DateTime), CAST(0x00009FA900A1A220 AS DateTime), CAST(0x00009FA900A1A220 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (100, N'deduct', 24, 25, 8, 0, CAST(0x00009FA900A54692 AS DateTime), CAST(0x00009FA900A54692 AS DateTime), CAST(0x00009FA900A54692 AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (101, N'deduct', 23, 26, 6, 0, CAST(0x00009FA900A93413 AS DateTime), CAST(0x00009FA900A93413 AS DateTime), CAST(0x00009FA900A93413 AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (102, N'topUp', 23, 64, 0, 38, CAST(0x00009FA900BF3210 AS DateTime), CAST(0x00009FA900BF320F AS DateTime), CAST(0x00009FA900BF320F AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (103, N'deduct', 21, 16, 5, 0, CAST(0x00009FA900F6263E AS DateTime), CAST(0x00009FA900F6263E AS DateTime), CAST(0x00009FA900F6263E AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (104, N'deduct', 20, 24, 10, 0, CAST(0x00009FA900FE7405 AS DateTime), CAST(0x00009FA900FE7404 AS DateTime), CAST(0x00009FA900FE7404 AS DateTime), N'clerk1', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (105, N'deduct', 22, 12, 5, 0, CAST(0x00009FAA00A92EEC AS DateTime), CAST(0x00009FAA00A92EEB AS DateTime), CAST(0x00009FAA00A92EEB AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (106, N'deduct', 24, 21, 4, 0, CAST(0x00009FAA00C60B6C AS DateTime), CAST(0x00009FAA00C60B6C AS DateTime), CAST(0x00009FAA00C60B6C AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (107, N'deduct', 21, -1, 17, 0, CAST(0x00009FAA00FBE97C AS DateTime), CAST(0x00009FAA00FBE97C AS DateTime), CAST(0x00009FAA00FBE97C AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (108, N'deduct', 18, -2, 4, 0, CAST(0x00009FAA00FFE283 AS DateTime), CAST(0x00009FAA00FFE283 AS DateTime), CAST(0x00009FAA00FFE283 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (109, N'topUp', 18, 36, 0, 38, CAST(0x00009FAA01004B3D AS DateTime), CAST(0x00009FAA01004B3D AS DateTime), CAST(0x00009FAA01004B3D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (110, N'deduct', 17, -3, 33, 0, CAST(0x00009FAA01008E81 AS DateTime), CAST(0x00009FAA01008E81 AS DateTime), CAST(0x00009FAA01008E81 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (111, N'deduct', 25, -4, 42, 0, CAST(0x00009FAA0100DC38 AS DateTime), CAST(0x00009FAA0100DC38 AS DateTime), CAST(0x00009FAA0100DC38 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (112, N'deduct', 22, 8, 4, 0, CAST(0x00009FAB009E2178 AS DateTime), CAST(0x00009FAB009E2178 AS DateTime), CAST(0x00009FAB009E2178 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (113, N'deduct', 19, 19, 6, 0, CAST(0x00009FAB0150C03E AS DateTime), CAST(0x00009FAB0150C03E AS DateTime), CAST(0x00009FAB0150C03E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (114, N'deduct', 16, 8, 4, 0, CAST(0x00009FAC00A234F9 AS DateTime), CAST(0x00009FAC00A234F8 AS DateTime), CAST(0x00009FAC00A234F8 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (115, N'topUp', 26, 38, 0, 38, CAST(0x00009FAC00A3B3D0 AS DateTime), CAST(0x00009FAC00A3B3D0 AS DateTime), CAST(0x00009FAC00A3B3D0 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (116, N'topUp', 27, 68, 0, 68, CAST(0x00009FAC00A3CF02 AS DateTime), CAST(0x00009FAC00A3CF02 AS DateTime), CAST(0x00009FAC00A3CF02 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (117, N'deduct', 27, 61, 7, 0, CAST(0x00009FAC00A3E6E5 AS DateTime), CAST(0x00009FAC00A3E6E5 AS DateTime), CAST(0x00009FAC00A3E6E5 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (118, N'topUp', 28, 38, 0, 38, CAST(0x00009FAC00A4C047 AS DateTime), CAST(0x00009FAC00A4C047 AS DateTime), CAST(0x00009FAC00A4C047 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (119, N'deduct', 28, 31, 7, 0, CAST(0x00009FAC00A546A8 AS DateTime), CAST(0x00009FAC00A546A8 AS DateTime), CAST(0x00009FAC00A546A8 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (120, N'topUp', 29, 22, 0, 22, CAST(0x00009FAC00AF53EC AS DateTime), CAST(0x00009FAC00AF53EC AS DateTime), CAST(0x00009FAC00AF53EC AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (121, N'topUp', 28, 38, 0, 7, CAST(0x00009FAC00B131B2 AS DateTime), CAST(0x00009FAC00B131B2 AS DateTime), CAST(0x00009FAC00B131B2 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (122, N'deduct', 16, 6, 2, 0, CAST(0x00009FAC00C4C856 AS DateTime), CAST(0x00009FAC00C4C856 AS DateTime), CAST(0x00009FAC00C4C856 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (123, N'deduct', 19, 14, 5, 0, CAST(0x00009FAC00D249AA AS DateTime), CAST(0x00009FAC00D249AA AS DateTime), CAST(0x00009FAC00D249AA AS DateTime), N'storeadmin', N'')
INSERT [dbo].[PrepaidBottleTransaction] ([TransactionID], [TransactionType], [PrepaidBottleID], [LastUpdatedBalance], [DeductQty], [TopUpQty], [LastTransactionDate], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (124, N'deduct', 28, 33, 5, 0, CAST(0x00009FAC011CD759 AS DateTime), CAST(0x00009FAC011CD759 AS DateTime), CAST(0x00009FAC011CD759 AS DateTime), N'rbadmin', N'')
SET IDENTITY_INSERT [dbo].[PrepaidBottleTransaction] OFF
/****** Object:  Table [dbo].[InvoiceLineItem]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceLineItem](
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceCharged] [decimal](18, 2) NULL,
	[TaxCharged] [decimal](18, 2) NULL,
	[ItemTotal] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_Invoice_Product] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (163, 6924, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9600E7AFAF AS DateTime), CAST(0x00009F9600E7AFAF AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (163, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009F9600E7DC2A AS DateTime), CAST(0x00009F9600E7DC2A AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (164, 6838, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F9600F75F96 AS DateTime), CAST(0x00009F9600F75F96 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (165, 6848, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F9600F77EEA AS DateTime), CAST(0x00009F9600F77EEA AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (166, 6873, 1, CAST(19.50 AS Decimal(18, 2)), CAST(2.54 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), CAST(0x00009F9600F78E3A AS DateTime), CAST(0x00009F9600F78E3A AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (166, 6877, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F9600F79BBF AS DateTime), CAST(0x00009F9600F79BBF AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (167, 6933, 1, CAST(299.00 AS Decimal(18, 2)), CAST(38.87 AS Decimal(18, 2)), CAST(299.00 AS Decimal(18, 2)), CAST(0x00009F9600F80332 AS DateTime), CAST(0x00009F9600F80332 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (168, 6913, 1, CAST(32.50 AS Decimal(18, 2)), CAST(4.23 AS Decimal(18, 2)), CAST(32.50 AS Decimal(18, 2)), CAST(0x00009F9600F84DBB AS DateTime), CAST(0x00009F9600F84DBB AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (169, 6928, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009F9600F8632F AS DateTime), CAST(0x00009F9600F8632F AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (170, 6892, 2, CAST(41.60 AS Decimal(18, 2)), CAST(10.82 AS Decimal(18, 2)), CAST(83.20 AS Decimal(18, 2)), CAST(0x00009F9600F87227 AS DateTime), CAST(0x00009F9600F87227 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (171, 6867, 1, CAST(19.50 AS Decimal(18, 2)), CAST(2.54 AS Decimal(18, 2)), CAST(19.50 AS Decimal(18, 2)), CAST(0x00009F9600F94BC4 AS DateTime), CAST(0x00009F9600F94BC4 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (172, 6926, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009F9600F9732C AS DateTime), CAST(0x00009F9600F9732C AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (173, 6884, 1, CAST(45.50 AS Decimal(18, 2)), CAST(5.92 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), CAST(0x00009F9600F98138 AS DateTime), CAST(0x00009F9600F98138 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (174, 6841, 2, CAST(26.00 AS Decimal(18, 2)), CAST(6.76 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), CAST(0x00009F9600FB1925 AS DateTime), CAST(0x00009F9600FB1925 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (175, 6922, 1, CAST(156.00 AS Decimal(18, 2)), CAST(20.28 AS Decimal(18, 2)), CAST(156.00 AS Decimal(18, 2)), CAST(0x00009F9600FB529A AS DateTime), CAST(0x00009F9600FB529A AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (176, 6930, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9600FB614C AS DateTime), CAST(0x00009F9600FB614C AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (177, 6922, 1, CAST(156.00 AS Decimal(18, 2)), CAST(20.28 AS Decimal(18, 2)), CAST(156.00 AS Decimal(18, 2)), CAST(0x00009F9600FBF551 AS DateTime), CAST(0x00009F9600FBF551 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (178, 6897, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F9600FC13F3 AS DateTime), CAST(0x00009F9600FC13F3 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (179, 6884, 1, CAST(45.50 AS Decimal(18, 2)), CAST(5.92 AS Decimal(18, 2)), CAST(45.50 AS Decimal(18, 2)), CAST(0x00009F9600FC2826 AS DateTime), CAST(0x00009F9600FC2826 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (180, 6878, 3, CAST(26.00 AS Decimal(18, 2)), CAST(10.14 AS Decimal(18, 2)), CAST(78.00 AS Decimal(18, 2)), CAST(0x00009F96014C476F AS DateTime), CAST(0x00009F96014C476F AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (180, 6880, 3, CAST(20.80 AS Decimal(18, 2)), CAST(8.11 AS Decimal(18, 2)), CAST(62.40 AS Decimal(18, 2)), CAST(0x00009F96014C6076 AS DateTime), CAST(0x00009F96014C6076 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (181, 6836, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F96014CB076 AS DateTime), CAST(0x00009F96014CB076 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (181, 6838, 3, CAST(26.00 AS Decimal(18, 2)), CAST(10.14 AS Decimal(18, 2)), CAST(78.00 AS Decimal(18, 2)), CAST(0x00009F96014CBE95 AS DateTime), CAST(0x00009F96014CBE95 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (181, 6843, 5, CAST(19.50 AS Decimal(18, 2)), CAST(12.68 AS Decimal(18, 2)), CAST(97.50 AS Decimal(18, 2)), CAST(0x00009F96014CCDF0 AS DateTime), CAST(0x00009F96014CCDF0 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (183, 6878, 1, CAST(26.00 AS Decimal(18, 2)), CAST(3.38 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), CAST(0x00009F9700ADD6C3 AS DateTime), CAST(0x00009F9700ADD6C3 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (183, 6929, 1, CAST(325.00 AS Decimal(18, 2)), CAST(42.25 AS Decimal(18, 2)), CAST(325.00 AS Decimal(18, 2)), CAST(0x00009F9700ADBA7F AS DateTime), CAST(0x00009F9700ADBA7F AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (184, 6934, 1, CAST(273.00 AS Decimal(18, 2)), CAST(35.49 AS Decimal(18, 2)), CAST(273.00 AS Decimal(18, 2)), CAST(0x00009F9700AE2F3C AS DateTime), CAST(0x00009F9700AE2F3C AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (184, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009F9700AE4AEA AS DateTime), CAST(0x00009F9700AE4AEA AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (185, 6865, 2, CAST(19.50 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), CAST(0x00009F9700AECDFA AS DateTime), CAST(0x00009F9700AECDFA AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (186, 6924, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9700AF2400 AS DateTime), CAST(0x00009F9700AF2400 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (187, 6844, 5, CAST(26.00 AS Decimal(18, 2)), CAST(16.90 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), CAST(0x00009F9700AFE72D AS DateTime), CAST(0x00009F9700AFE72D AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (187, 6882, 2, CAST(20.80 AS Decimal(18, 2)), CAST(5.41 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), CAST(0x00009F9700AFDD57 AS DateTime), CAST(0x00009F9700AFDD57 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (188, 6925, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9700B06B0F AS DateTime), CAST(0x00009F9700B06B0F AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (189, 6927, 1, CAST(234.00 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), CAST(0x00009F9700B0E68A AS DateTime), CAST(0x00009F9700B0E68A AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (190, 6847, 2, CAST(20.80 AS Decimal(18, 2)), CAST(5.41 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), CAST(0x00009F9700B3A0BC AS DateTime), CAST(0x00009F9700B3A0BC AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (190, 6922, 1, CAST(156.00 AS Decimal(18, 2)), CAST(20.28 AS Decimal(18, 2)), CAST(156.00 AS Decimal(18, 2)), CAST(0x00009F9700B3B9B8 AS DateTime), CAST(0x00009F9700B3B9B8 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (191, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009F9700B400F4 AS DateTime), CAST(0x00009F9700B400F4 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (192, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009F9700B44ACF AS DateTime), CAST(0x00009F9700B44ACF AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (193, 6934, 1, CAST(273.00 AS Decimal(18, 2)), CAST(35.49 AS Decimal(18, 2)), CAST(273.00 AS Decimal(18, 2)), CAST(0x00009F9700B45784 AS DateTime), CAST(0x00009F9700B45784 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (194, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009F9700EA7372 AS DateTime), CAST(0x00009F9700EA7372 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (195, 6936, 1, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009F9700EA7DCD AS DateTime), CAST(0x00009F9700EA7DCD AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (196, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009F9700EA8722 AS DateTime), CAST(0x00009F9700EA8722 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (197, 6937, 1, CAST(61.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(61.25 AS Decimal(18, 2)), CAST(0x00009F9700EA91F4 AS DateTime), CAST(0x00009F9700EA91F4 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (198, 6923, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009F9700EA9D41 AS DateTime), CAST(0x00009F9700EA9D41 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (200, 6923, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009F9800AB7865 AS DateTime), CAST(0x00009F9800AB7865 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (202, 6923, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009F9800CC2D58 AS DateTime), CAST(0x00009F9800CC2D58 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (205, 6924, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9C00BFFD58 AS DateTime), CAST(0x00009F9C00BFFD58 AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (206, 6925, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009F9E00EF20AD AS DateTime), CAST(0x00009F9E00EF20AD AS DateTime), N'rbadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (208, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015A26FF AS DateTime), CAST(0x00009FA0015A26FF AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (209, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015AC273 AS DateTime), CAST(0x00009FA0015AC273 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (210, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA0015B443D AS DateTime), CAST(0x00009FA0015B443D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (211, 6935, 2, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), CAST(0x00009FA0015BDAEB AS DateTime), CAST(0x00009FA0015BDAEB AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (212, 6935, 2, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), CAST(0x00009FA0015C4149 AS DateTime), CAST(0x00009FA0015C4149 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (213, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA100FBC1BD AS DateTime), CAST(0x00009FA100FBC1BD AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (214, 6939, 1, CAST(17.85 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.85 AS Decimal(18, 2)), CAST(0x00009FA10125B4EB AS DateTime), CAST(0x00009FA10125B4EB AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (215, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA200A76D8E AS DateTime), CAST(0x00009FA200A76D8E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (216, 6942, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200A7A132 AS DateTime), CAST(0x00009FA200A7A132 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (217, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200A8706B AS DateTime), CAST(0x00009FA200A8706B AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (217, 6942, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200A87958 AS DateTime), CAST(0x00009FA200A87958 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (218, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA200A8DD8D AS DateTime), CAST(0x00009FA200A8DD8D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (220, 6936, 1, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009FA200D26529 AS DateTime), CAST(0x00009FA200D26529 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (221, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA200F55396 AS DateTime), CAST(0x00009FA200F55396 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (222, 6946, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300CC32D2 AS DateTime), CAST(0x00009FA300CC32D2 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (223, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300CC448D AS DateTime), CAST(0x00009FA300CC448D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (224, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300DBC1C6 AS DateTime), CAST(0x00009FA300DBC1C6 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (225, 6924, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009FA300F448F9 AS DateTime), CAST(0x00009FA300F448F9 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (226, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA300FE1109 AS DateTime), CAST(0x00009FA300FE1109 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (227, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA4009B8056 AS DateTime), CAST(0x00009FA4009B8056 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (228, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FA4009BB56B AS DateTime), CAST(0x00009FA4009BB56B AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (229, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA500D20DA5 AS DateTime), CAST(0x00009FA500D20DA5 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (231, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA60094D725 AS DateTime), CAST(0x00009FA60094D725 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (232, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA600D1F591 AS DateTime), CAST(0x00009FA600D1F591 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (233, 6881, 2, CAST(20.80 AS Decimal(18, 2)), CAST(5.41 AS Decimal(18, 2)), CAST(41.60 AS Decimal(18, 2)), CAST(0x00009FA600D247FC AS DateTime), CAST(0x00009FA600D247FC AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (234, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA700AEAB6A AS DateTime), CAST(0x00009FA700AEAB6A AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (235, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FA900BF300B AS DateTime), CAST(0x00009FA900BF300B AS DateTime), N'clerk1', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (236, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAA0100492F AS DateTime), CAST(0x00009FAA0100492F AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (237, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAC00A3B1D8 AS DateTime), CAST(0x00009FAC00A3B1D8 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (238, 6946, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAC00A3CD5E AS DateTime), CAST(0x00009FAC00A3CD5E AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (239, 6927, 1, CAST(234.00 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), CAST(0x00009FAC00A4B304 AS DateTime), CAST(0x00009FAC00A4B304 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (239, 6938, 1, CAST(91.20 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(91.20 AS Decimal(18, 2)), CAST(0x00009FAC00A4BE8B AS DateTime), CAST(0x00009FAC00A4BE8B AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (240, 6927, 1, CAST(234.00 AS Decimal(18, 2)), CAST(30.42 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), CAST(0x00009FAC00AEF7C9 AS DateTime), CAST(0x00009FAC00AEF7C9 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (241, 6944, 1, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0x00009FAC00AF5254 AS DateTime), CAST(0x00009FAC00AF5254 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (242, 6935, 1, CAST(17.25 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)), CAST(0x00009FAC00B12F15 AS DateTime), CAST(0x00009FAC00B12F15 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (243, 6925, 1, CAST(260.00 AS Decimal(18, 2)), CAST(33.80 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0x00009FAC00BA041D AS DateTime), CAST(0x00009FAC00BA041D AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (244, 6836, 2, CAST(26.00 AS Decimal(18, 2)), CAST(6.76 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), CAST(0x00009FAC00BD1502 AS DateTime), CAST(0x00009FAC00BD1502 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (244, 6863, 1, CAST(58.50 AS Decimal(18, 2)), CAST(7.61 AS Decimal(18, 2)), CAST(58.50 AS Decimal(18, 2)), CAST(0x00009FAC00BD237A AS DateTime), CAST(0x00009FAC00BD237A AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (244, 6903, 1, CAST(39.00 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), CAST(0x00009FAC00BD4664 AS DateTime), CAST(0x00009FAC00BD4664 AS DateTime), N'storeadmin', N'')
INSERT [dbo].[InvoiceLineItem] ([InvoiceID], [ProductID], [Quantity], [UnitPriceCharged], [TaxCharged], [ItemTotal], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (247, 6926, 1, CAST(195.00 AS Decimal(18, 2)), CAST(25.35 AS Decimal(18, 2)), CAST(195.00 AS Decimal(18, 2)), CAST(0x00009FAC011E1EFD AS DateTime), CAST(0x00009FAC011E1EFD AS DateTime), N'rbadmin', N'')
/****** Object:  StoredProcedure [dbo].[InsertUpdateWTE]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateWTE] 
(    

	 @WteID int,
	 @AccountID int,
	 @Description varchar(50),
	 @ProductCode varchar(50),
	 @Manufacturer varchar(50),
	 @DateObtained datetime,
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@WteID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  aquaone.dbo.WaterTreatmentEquipment
				(  AccountID, [Description], ProductCode, Manufacturer, 
				  DateObtained,
				  CreatedDate,ModifiedDate,CreatedBy,ModifiedBy)
	      values ( @AccountID, @Description, @ProductCode, @Manufacturer, 
				  @DateObtained,
				   @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
     
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].WaterTreatmentEquipment
		   SET [description] = @Description
			  ,ProductCode = @ProductCode
			  ,Manufacturer = @Manufacturer
	   		  ,DateObtained = @DateObtained
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
		 WHERE WTE_ID =@WteID;
        
        
        
	select @ReturnValue = @WteID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateWaterAnalysis]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertUpdateWaterAnalysis]
(    @ReportID int
	,@Hardness decimal
	,@ClearIron decimal
	,@PH_Acid decimal
	,@HydrogenSulfide decimal
	,@TDS decimal
	,@AccountID int
	,@Notes varchar(2000)
	,@CreatedDate datetime  
	,@ModifiedDate datetime  
	,@CreatedBy varchar(20) 
	,@ModifiedBy varchar(20) 
)
AS

declare @ReturnValue int
if (@ReportID is null) 
	BEGIN
	   
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		-- Insert statements for procedure here
		insert into  WaterAnalysis
					( Hardness, ClearIron, PH_Acid ,HydrogenSulfide,TDS ,Notes,
					AccountID, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)
		    values (   @Hardness, @ClearIron, @PH_Acid, @HydrogenSulfide, @TDS, @Notes, 
		               @AccountID, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
		
		select @ReturnValue = SCOPE_IDENTITY();
	end       
    
else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		
       -- update        
       UPDATE [AquaOne].[dbo].WaterAnalysis
		   SET Hardness= @Hardness 
		      ,ClearIron = @ClearIron
		      ,PH_Acid = @PH_Acid
		      ,HydrogenSulfide= @HydrogenSulfide
		      ,TDS = @TDS 
		      ,Notes= @Notes
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
		   WHERE ReportID =@ReportID;

	   select @ReturnValue = @ReportID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  Table [dbo].[ServiceWork]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceWork](
	[ServiceWorkID] [int] IDENTITY(1000,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ServiceStatus] [varchar](10) NULL,
	[ServiceDate] [datetime] NULL,
	[ServiceStartTime] [time](2) NULL,
	[ServiceEndTime] [time](2) NULL,
	[Technician] [varchar](20) NULL,
	[InvoiceID] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[TaxCharged] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
	[Notes] [varchar](2000) NULL,
 CONSTRAINT [PK_ServiceWork_1] PRIMARY KEY CLUSTERED 
(
	[ServiceWorkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceWork] ON
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1002, 1, NULL, CAST(0x00009F9D00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'Karl Oliveros', 162, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F9600E36F72 AS DateTime), CAST(0x00009F9600E36F72 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1003, 3, NULL, CAST(0x00009F9700000000 AS DateTime), CAST(0x02602F3400000000 AS Time), CAST(0x02A0AD3900000000 AS Time), N'Karl Oliveros', 182, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F97009ACB80 AS DateTime), CAST(0x00009F97009ACB80 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1004, 6, NULL, CAST(0x00009F9800000000 AS DateTime), CAST(0x0220AA4400000000 AS Time), CAST(0x0260284A00000000 AS Time), N'Karl Oliveros', 199, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F9800A9EDAB AS DateTime), CAST(0x00009F9800A9EDAB AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1005, 7, NULL, CAST(0x00009F9B00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x02A0AD3900000000 AS Time), N'Karl Oliveros', 201, CAST(270.00 AS Decimal(18, 2)), CAST(35.10 AS Decimal(18, 2)), CAST(0x00009F9800CBCE91 AS DateTime), CAST(0x00009F9800CBCE91 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1006, 18, NULL, CAST(0x00009F9900000000 AS DateTime), CAST(0x02E0245500000000 AS Time), CAST(0x0220A35A00000000 AS Time), N'Karl Oliveros', 203, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F99013333D9 AS DateTime), CAST(0x00009F99013333D9 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1007, 12, NULL, CAST(0x00009FA000000000 AS DateTime), CAST(0x0200EB4100000000 AS Time), CAST(0x0240694700000000 AS Time), N'Karl Oliveros', 204, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F9A013063BD AS DateTime), CAST(0x00009F9A013063BD AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1008, 10, NULL, CAST(0x00009FA000000000 AS DateTime), CAST(0x0240694700000000 AS Time), CAST(0x0280E74C00000000 AS Time), N'Karl Oliveros', 207, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009F9F00A85D3A AS DateTime), CAST(0x00009F9F00A85D3A AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1009, 17, NULL, CAST(0x00009FA500000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'Karl Oliveros', 219, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009FA200C4D8C7 AS DateTime), CAST(0x00009FA200C4D8C7 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1010, 3, NULL, CAST(0x00009FAA00000000 AS DateTime), CAST(0x0240703100000000 AS Time), CAST(0x0280EE3600000000 AS Time), N'Karl Oliveros', 230, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009FA500D48578 AS DateTime), CAST(0x00009FA500D48578 AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1011, 10, NULL, CAST(0x00009FAD00000000 AS DateTime), CAST(0x0220A35A00000000 AS Time), CAST(0x0260216000000000 AS Time), N'Karl Oliveros', 245, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009FAC00C5135A AS DateTime), CAST(0x00009FAC00C5135A AS DateTime), N'', N'', NULL)
INSERT [dbo].[ServiceWork] ([ServiceWorkID], [AccountID], [ServiceStatus], [ServiceDate], [ServiceStartTime], [ServiceEndTime], [Technician], [InvoiceID], [SubTotal], [TaxCharged], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Notes]) VALUES (1012, 14, NULL, CAST(0x00009FB000000000 AS DateTime), CAST(0x02A0AD3900000000 AS Time), CAST(0x02E02B3F00000000 AS Time), N'Karl Oliveros', 246, CAST(70.00 AS Decimal(18, 2)), CAST(9.10 AS Decimal(18, 2)), CAST(0x00009FAC00C66DBD AS DateTime), CAST(0x00009FAC00C66DBD AS DateTime), N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[ServiceWork] OFF
/****** Object:  StoredProcedure [dbo].[GetSalesByCriteria]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSalesByCriteria] 
	-- Add the parameters for the stored procedure here
	  @fromMonth varchar(2)
     ,@fromYear varchar(4)  
     ,@toMonth varchar(2)
     ,@toYear varchar(4)


AS
BEGIN
    declare @lastday varchar(5);
    declare @fromDate varchar(30);
    declare @toDate varchar(30);
   
    select @fromDate =  @fromYear +'-' + @fromMonth  + '-'+'01';
   -- print 'hello ' + @fromDate
    
    select @toDate = @toYear  +'-'+ @toMonth  + '-'+ aquaone.dbo.GetLastDayOfMonth(@toMonth, @toYear) + ' 23:59:00';
    --  print 'to date ' +  @toDate
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
  --  print @lastday;
    -- Insert statements for procedure here
	select year(invoicedate) as [yearNumber]
		, month(invoicedate) as [monthNumber]
		, datename(month,invoicedate) as [MonthName]
		, sum(totalamount) as totalsales
	 from invoice
	 where invoicedate between @fromDate and @toDate
	   group by year(invoicedate),month(invoicedate) ,datename(month,invoicedate)
		 order by [yearNumber], [monthNumber] asc;
END
GO
/****** Object:  View [dbo].[vw_CurrentYearSalesByMonth]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_CurrentYearSalesByMonth]
as 
select   month(invoicedate) as [MonthNumber], datename(month,invoicedate) as [MonthName], sum(Totalamount) as [Totalsales]
	from aquaone.dbo.invoice
   where year(invoicedate) = year(getdate())
	  group by month(invoicedate), datename(month,invoicedate)
	;
GO
/****** Object:  View [dbo].[vw_accountWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_accountWithAddress]
AS
SELECT     a.AccountID, a.Lastname, a.Firstname, a.Homephone, LOWER(a.Email) AS Email, a.IsActive, 
                      c.AddressLine1 + ' ' + c.AddressLine2 + ' ' + c.CityTown + ' ' + c.Province + ' ' + c.PostalCode AS [Home Address]
                      , a.CreatedDate, a.Firstname + ' '+ a.Lastname as [name]
FROM         dbo.Account AS a INNER JOIN
                      dbo.AccountAddress AS b ON a.AccountID = b.AccountID INNER JOIN
                      dbo.Address AS c ON b.AddressID = c.AddressID
WHERE     (b.AddressType = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -152
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 423
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 304
               Bottom = 187
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 4
               Left = 615
               Bottom = 123
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_accountWithAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_accountWithAddress'
GO
/****** Object:  View [dbo].[vw_PrepaidPackagesOwnedByAccount]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_PrepaidPackagesOwnedByAccount] as 
select p1.prepaidBottleID , p1.AccountID, p1.Balance, p2.Name as [bottleType] ,p1.ModifiedDate as [lastUpdatedDate] from
	aquaone.dbo.PrepaidBottle p1, aquaone.dbo.prepaidBottleType p2
	where p2.typeid = p1.prepaidBottleType;
GO
/****** Object:  StoredProcedure [dbo].[GetWTEProductsBySearchCriteria]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWTEProductsBySearchCriteria]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_productid'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select * from vw_WTEList 
			where  ProductID = @input ;			
  end 
  else if @SearchCriteria='by_desc'
  	begin
  		select * from vw_WTEList 
			where  LOWER(ProductDescription) like  '%'+ @input + '%' ;
	end 
  
else if @SearchCriteria='by_productcode'
	begin
  		select * from vw_WTEList 
			where    ProductCode like @input + '%' ;
	end
GO
/****** Object:  StoredProcedure [dbo].[getTechnicians]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getTechnicians]
as 
select firstname +' ' + lastname as Technician 
from aquaone.dbo.employee e, aquaone.dbo.jobposition j
where   e.positionid = j.positionid
and j.positionName = 'technician';
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateInvoice]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateInvoice] 
(    

	 @InvoiceID int,
	 @InvoiceDate datetime,
	 @AccountID int,
	 @SubTotal decimal(18,2),
	 @TotalTaxCharged decimal(18,2),
	 @TotalAmount decimal(18,2),
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20), 
	 @Notes varchar(2000) = null
) 

AS

declare @ReturnValue int

if (@InvoiceID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  AquaOne.dbo.Invoice
       ( InvoiceDate, AccountID, SubTotal, TotalTaxCharged, TotalAmount, CreatedDate,ModifiedDate,
        CreatedBy,ModifiedBy,Notes)
	      values ( @InvoiceDate, @AccountID,@SubTotal,@TotalTaxCharged, @TotalAmount, @CreatedDate, @ModifiedDate
	      , @CreatedBy, @ModifiedBy, @Notes);
       
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].Invoice
       		   SET AccountID= @AccountID 
       		   ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
			  ,Notes = @Notes
		 WHERE  InvoiceID = @InvoiceID;
          
	select @ReturnValue = @InvoiceID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateEmployee]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateEmployee] 
(    

	 @EmployeeID int,
	 @Firstname varchar(20), 
	 @Lastname varchar(20), 
	 @Gender varchar(20),
	 @Email varchar(50), 
	 @Homephone varchar(20), 
	 @Mobilephone varchar(20), 
	 @EmergencyContact varchar(30), 
	 @EmergencyPhone1 varchar(20), 
	 @EmergencyPhone2 varchar(20), 
	 @IsEmployed bit =1,
	 @HireDate datetime, 
	-- @TerminatedDate datetime, 
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20), 
	 @Notes varchar(2000) = null,
	 @PositionID int
) 

AS

declare @ReturnValue int

if (@EmployeeID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  Employee (Firstname, Lastname, Gender, Email, Homephone, Mobilephone, 
	         EmergencyContact, EmergencyPhone1, EmergencyPhone2, IsEmployed, HireDate,
             CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, Notes ,PositionID) 
	      values ( @Firstname, @Lastname, @Gender, @Email, @Homephone, @Mobilephone, 
	         @EmergencyContact, @EmergencyPhone1, @EmergencyPhone2, @IsEmployed, @HireDate,
             @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy, @Notes ,@PositionID);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].[Employee]
		   SET Firstname = @Firstname
			  ,Lastname = @Lastname
			  ,Gender = @Gender
			  ,Email = @Email
			  ,Homephone = @Homephone
			  ,Mobilephone = @Mobilephone
			  ,EmergencyContact = @EmergencyContact
			  ,EmergencyPhone1 = @EmergencyPhone1
			  ,EmergencyPhone2 = @EmergencyPhone2
			  ,IsEmployed = @IsEmployed
			  ,HireDate = @HireDate
			  ,ModifiedDate =@ModifiedDate
			  ,ModifiedBy = @ModifiedBy
			  ,Notes = @Notes
			  ,PositionID = @PositionID
		 WHERE EmployeeID =@EmployeeID;
        
        
        
	select @ReturnValue = @EmployeeID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateAuthorizedMember]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUpdateAuthorizedMember] 
(    
  @AuthMemberID int
 ,@Firstname varchar(30)
 ,@Lastname varchar(30)
 ,@RelationToAccountOwner varchar(30)
 ,@AccountID int
 ,@CreatedDate datetime 
 ,@ModifiedDate datetime 
 ,@CreatedBy varchar(20)
 ,@ModifiedBy varchar(20)
) 

AS
 
declare @ReturnValue int

if (@AuthMemberID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into AuthorizedMember
				( Firstname, Lastname, RelationToAccountOwner,
				 AccountID,CreatedDate,ModifiedDate,CreatedBy,ModifedBy)
	      values ( @Firstname, @Lastname, @RelationToAccountOwner, 
                    @AccountID, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE AuthorizedMember
		   SET Firstname = @Firstname
		   , Lastname = @Lastname
		   , RelationToAccountOwner = @RelationToAccountOwner
		   , ModifiedDate = @ModifiedDate
		   , ModifedBy = @ModifiedBy
		 WHERE AuthMemberID = @AuthMemberID
		 and AccountID = @AccountID;
        
        
        
	select @ReturnValue = @AuthMemberID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertProductPartReplacement]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProductPartReplacement] 
(    

	 @ProductID int,
	 @SubProductID int,  
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   productPartReplacement 
			 ( ProductID, SubProductID, CreatedDate,
			   ModifiedDate, CreatedBy, ModifiedBy)
	      values ( @ProductID, @SubProductID, @CreatedDate, 
	               @ModifiedDate, @CreatedBy, @ModifiedBy);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePrepaidBottle]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdatePrepaidBottle] 
(    

	 @PrepaidBottleID int,
	 @AccountID int, 
	 @Balance int,
	 @PrepaidBottleType int,
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@PrepaidBottleID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   aquaone.dbo.PrepaidBottle
				(  AccountID, PrepaidBottleType,Balance, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)
	      values (  @AccountID, @PrepaidBottleType,@Balance, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
     
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        update aquaone.dbo.PrepaidBottle
			set balance = @Balance
				,modifiedDate = @modifiedDate
				,modifiedBy = @modifiedBy
				where PrepaidBottleID = @PrepaidBottleID;
        

        
        -- no update statement yet
        
	select @ReturnValue = @PrepaidBottleID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceBySearchCriteria]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getInvoiceBySearchCriteria]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_customer'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select i.InvoiceID, i.InvoiceDate, i.SubTotal, i.TotalAmount, i.TotalTaxCharged
		,a.Lastname + ', ' +  a.Firstname as "Name" 			
	from [aquaone].[dbo].Invoice i,  [aquaone].[dbo].Account a
	where a.AccountID=i.AccountID
	and a.Lastname like  '%' +  @input + '%' ;

			
  end 

else if lower(@SearchCriteria) = 'by_invoiceID'
	begin
	    
		select i.InvoiceID, i.InvoiceDate, i.SubTotal, i.TotalAmount, i.TotalTaxCharged, 
			isnull((select a.Lastname + ', ' +  a.Firstname as "Name" 
					from [aquaone].[dbo].Account a, [aquaone].[dbo].Invoice i 
					where a.AccountID=i.AccountID
					and i.InvoiceID=@input) , '') as "Name"
					
		from [aquaone].[dbo].Invoice i,  [aquaone].[dbo].Account a
		where (a.AccountID=i.AccountID  or i.AccountID is null )and i.InvoiceID=@input
		;
	end
GO
/****** Object:  StoredProcedure [dbo].[GetProductsBelowReorderLevel]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProductsBelowReorderLevel]
as 

select * from aquaone.dbo.vw_productsBelowReorderLevel;
GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[EmployeeID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressType] [int] NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
	[CreatedBy] [nchar](10) NULL,
	[ModifiedBy] [nchar](10) NULL,
 CONSTRAINT [PK_EmployeeAddress] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeAddress] ([EmployeeID], [AddressID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 195, 1, CAST(0xEE340B00 AS Date), CAST(0xEE340B00 AS Date), N'          ', N'          ')
INSERT [dbo].[EmployeeAddress] ([EmployeeID], [AddressID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 196, 1, CAST(0xEE340B00 AS Date), CAST(0xEE340B00 AS Date), N'          ', N'          ')
INSERT [dbo].[EmployeeAddress] ([EmployeeID], [AddressID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 219, 1, CAST(0xF2340B00 AS Date), CAST(0xF2340B00 AS Date), N'          ', N'          ')
INSERT [dbo].[EmployeeAddress] ([EmployeeID], [AddressID], [AddressType], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 220, 1, CAST(0xF2340B00 AS Date), CAST(0xF2340B00 AS Date), N'          ', N'          ')
/****** Object:  StoredProcedure [dbo].[DeleteSubPart]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Reiner Bata
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSubPart] 
(
   @ProductID int
  , @SubProductID int
)
AS
declare @ReturnValue int
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
delete from ProductPartReplacement
where ProductID = @ProductID
and SubProductID = @SubProductID;
select @ReturnValue = 1;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[DeactivateEmployee]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Reiner Bata
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeactivateEmployee] 
(
@EmployeeID int
  ,@TerminatedDate datetime
  ,@ModifiedDate datetime 
  ,@ModifiedBy varchar(20) 
)
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
update Employee
set IsEmployed=0
,TerminatedDate = @TerminatedDate
,ModifiedDate = @ModifiedDate
,ModifiedBy = @ModifiedBy
where EmployeeID = @EmployeeID;
END
GO
/****** Object:  StoredProcedure [dbo].[AddAccountAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddAccountAddress] 
(	 @AddressID int
    ,@AccountID int
    ,@AddressType int
    ,@CreatedDate datetime  
	,@ModifiedDate datetime 
	,@CreatedBy varchar(20) 
	,@ModifiedBy varchar(20)
	
)
as 

begin
	set nocount on;
	
	insert into AquaOne.dbo.AccountAddress
	  ( AddressID, AccountID, AddressType, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)
	  values (@AddressID,@AccountID,@AddressType,@CreatedDate,@ModifiedDate,@CreatedBy,@ModifiedBy);
end;
GO
/****** Object:  StoredProcedure [dbo].[ActivateEmployee]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Reiner Bata
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
create PROCEDURE [dbo].[ActivateEmployee] 
(
	@EmployeeID int
  ,@ModifiedDate datetime 
  ,@ModifiedBy varchar(20) 
  ,@RehiredDate datetime
)
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
update Employee
set IsEmployed=1
,ModifiedDate = @ModifiedDate
,ModifiedBy = @ModifiedBy
,RehiredDate = @RehiredDate
where EmployeeID = @EmployeeID;
END
GO
/****** Object:  Table [dbo].[ServiceWorkToBeDone]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceWorkToBeDone](
	[WorkToBeDoneID] [int] IDENTITY(1,1) NOT NULL,
	[WorkType] [varchar](20) NULL,
	[WorkCharge] [decimal](18, 2) NULL,
	[WorkNotes] [varchar](1000) SPARSE  NULL,
	[ServiceWorkID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](20) NULL,
	[ModifiedBy] [varchar](20) NULL,
 CONSTRAINT [PK_ServiceWorkToBeDone] PRIMARY KEY CLUSTERED 
(
	[WorkToBeDoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceWorkToBeDone] ON
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (72, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'Please inspect water hardness and Ph levels', 1002, CAST(0x00009F9600E34874 AS DateTime), CAST(0x00009F9600E34874 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (73, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'Please inspect Water Filter.', 1003, CAST(0x00009F97009A3035 AS DateTime), CAST(0x00009F97009A3035 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (74, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'', 1004, CAST(0x00009F9800A9D8C6 AS DateTime), CAST(0x00009F9800A9D8C6 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (75, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'Inspect water hardness and ph level.', 1005, CAST(0x00009F9800CB2638 AS DateTime), CAST(0x00009F9800CB2638 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (76, N'Installation', CAST(200.00 AS Decimal(18, 2)), N'Install water treatment system', 1005, CAST(0x00009F9800CB5AEF AS DateTime), CAST(0x00009F9800CB5AEF AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (77, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'', 1006, CAST(0x00009F9901332029 AS DateTime), CAST(0x00009F9901332029 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (78, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'', 1007, CAST(0x00009F9A012FEBC3 AS DateTime), CAST(0x00009F9A012FEBC3 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (79, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'', 1008, CAST(0x00009F9F00A8484F AS DateTime), CAST(0x00009F9F00A8484F AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (80, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'', 1009, CAST(0x00009FA200C4C2BE AS DateTime), CAST(0x00009FA200C4C2BE AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (81, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'INspect water hardness.', 1010, CAST(0x00009FA500D448CD AS DateTime), CAST(0x00009FA500D448CD AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (82, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'Inspect water acidity', 1011, CAST(0x00009FAC00C4F944 AS DateTime), CAST(0x00009FAC00C4F944 AS DateTime), N'', N'')
INSERT [dbo].[ServiceWorkToBeDone] ([WorkToBeDoneID], [WorkType], [WorkCharge], [WorkNotes], [ServiceWorkID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (83, N'Inspection', CAST(70.00 AS Decimal(18, 2)), N'Get water analysis data', 1012, CAST(0x00009FAC00C651BE AS DateTime), CAST(0x00009FAC00C651BE AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[ServiceWorkToBeDone] OFF
/****** Object:  View [dbo].[vw_waterUsage]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[vw_waterUsage]
as 
	select p1.createddate, datepart(hh,p1.createddate) as [HourTaken], p1.transactionid, p1.prepaidBottleid, p1.transactiontype,
		p1.deductqty, p3.name, (p3.numberofliters * p1.deductqty )as [totalLitersConsumed]
		, 	(p3.numberofliters * p1.deductqty  * 0.264172052 ) as [totalUSGallonsConsumed]
		from  aquaone.dbo.PrepaidBottleTransaction p1, 
			aquaone.dbo.PrepaidBottle p2,
			aquaone.dbo.PrepaidBottleType p3
		where p1.prepaidBottleid = p2.prepaidBottleID
			and p1.transactiontype = 'deduct'
			and p2.PrepaidBottleType = p3.typeid
	;
GO
/****** Object:  View [dbo].[vw_TopTenServiceWorkFromToday]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[vw_TopTenServiceWorkFromToday] 
as select top 10 s.*
 ,  a.Firstname + ' '+a.Lastname  as [Account Holder] 
, a.homephone, vw.[home address]
from ServiceWork s, Account a, vw_accountwithaddress vw
where ServiceDate  >= GETDATE() - 1
	and s.accountID = a.accountID
	and vw.accountID = s.accountID
order by   ServiceDate , ServiceStartTime , AccountID  asc;
GO
/****** Object:  StoredProcedure [dbo].[AddEmployeeAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddEmployeeAddress] 
(	 @AddressID int
    ,@EmployeeID int
    ,@AddressType int
    ,@CreatedDate datetime  
	,@ModifiedDate datetime 
	,@CreatedBy varchar(20) 
	,@ModifiedBy varchar(20)
	
)
as 

begin
	set nocount on;
	
	insert into AquaOne.dbo.EmployeeAddress
	( AddressID, EmployeeID,AddressType,CreatedDate, ModifiedDate, CreatedBy, ModifiedBy )
	  values (@AddressID,@EmployeeID,@AddressType,@CreatedDate,@ModifiedDate,@CreatedBy,@ModifiedBy);
end;
GO
/****** Object:  StoredProcedure [dbo].[GetAccountWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountWithAddress]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_lastname'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select vw_accountWithAddress.AccountId 
		,vw_accountWithAddress.Lastname 
		,vw_accountWithAddress.Firstname
		,vw_accountWithAddress.[Home Address]
		,vw_accountWithAddress.Homephone
		,vw_accountWithAddress.Email
		,vw_accountWithAddress.IsActive
		,vw_accountWithAddress.CreatedDate
	 from vw_accountWithAddress
	   where lastname like @input + '%'  ;

			
  end 
  else if @SearchCriteria='by_firstname'
  	begin
       Select vw_accountWithAddress.AccountId 
		  ,vw_accountWithAddress.Lastname ,  vw_accountWithAddress.Firstname 
		  ,vw_accountWithAddress.[Home Address]
		  ,vw_accountWithAddress.Homephone
		  ,vw_accountWithAddress.Email
		  ,vw_accountWithAddress.IsActive
		  ,vw_accountWithAddress.CreatedDate
	    from vw_accountWithAddress
	      where Firstname like @input +'%';
	end 
  

else if @SearchCriteria='by_homephone'
	begin
       Select vw_accountWithAddress.AccountId 
		  ,vw_accountWithAddress.Lastname 
		  ,vw_accountWithAddress.Firstname
		  ,vw_accountWithAddress.[Home Address]
		  ,vw_accountWithAddress.Homephone
		  ,vw_accountWithAddress.Email
		  ,vw_accountWithAddress.IsActive
		  ,vw_accountWithAddress.CreatedDate
	    from vw_accountWithAddress
	      where homephone = @input ;
	end 
else if @SearchCriteria = 'by_address'
    begin

       Select vw_accountWithAddress.AccountId 
		  ,vw_accountWithAddress.Lastname 
		  ,vw_accountWithAddress.Firstname 
		  ,vw_accountWithAddress.[Home Address]
		  ,vw_accountWithAddress.Homephone
		  ,vw_accountWithAddress.Email
		  ,vw_accountWithAddress.IsActive
		  ,vw_accountWithAddress.CreatedDate
	    from vw_accountWithAddress
			where [home address] like @input + '%' ;
	end 
else if lower(@SearchCriteria) = 'by_accountid'
	begin
	    
       Select vw_accountWithAddress.AccountId 
		  ,vw_accountWithAddress.Lastname 
		  ,vw_accountWithAddress.Firstname
		  ,vw_accountWithAddress.[Home Address]
		  ,vw_accountWithAddress.Homephone
		  ,vw_accountWithAddress.Email
		  ,vw_accountWithAddress.IsActive
		  ,vw_accountWithAddress.CreatedDate
	    from vw_accountWithAddress
			where accountID = cast(@input  as int);
	end
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentYearSalesByMonth]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCurrentYearSalesByMonth]	
     	as 	
	select MonthNumber, [MonthName], totalsales
		from vw_CurrentYearSalesByMonth 
		order by monthnumber asc;
GO
/****** Object:  StoredProcedure [dbo].[GetAccountsWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAccountsWithAddress] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Retrieve all data from the table
	--SELECT * from vw_accountWithAddress order by AccountId asc;
	
	
		Select vw_accountWithAddress.AccountId 
		,vw_accountWithAddress.Lastname + ', '+ vw_accountWithAddress.Firstname as Name
		,vw_accountWithAddress.[Home Address]
		,vw_accountWithAddress.Homephone
		,vw_accountWithAddress.Email
		,vw_accountWithAddress.IsActive
		,vw_accountWithAddress.CreatedDate
	 from vw_accountWithAddress
END
GO
/****** Object:  StoredProcedure [dbo].[GetAutocompleteSearchListForAccount]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAutocompleteSearchListForAccount]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_lastname'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select distinct vw_accountWithAddress.Lastname 
	 from vw_accountWithAddress
	   where lastname like @input + '%' 
	   order by 1 ;

			
  end 
  else if @SearchCriteria='by_firstname'
  	begin
       Select distinct vw_accountWithAddress.Firstname 
	    from vw_accountWithAddress
	      where Firstname like @input +'%'
	      order by 1;
	end 
  

else if @SearchCriteria='by_homephone'
	begin
       Select vw_accountWithAddress.Homephone
	    from vw_accountWithAddress
	      where homephone like @input + '%' 
	      order by 1;
	end 
else if @SearchCriteria = 'by_address'
    begin

       Select vw_accountWithAddress.[Home Address]
	    from vw_accountWithAddress
			where [home address] like @input + '%'
			order by 1 ;
	end 
else if lower(@SearchCriteria) = 'by_accountid'
	begin
	    
       Select vw_accountWithAddress.AccountId 
	    from vw_accountWithAddress
			where accountID like @input + '%' ;
	end
GO
/****** Object:  StoredProcedure [dbo].[GetPrepaidPackagesByAccount]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPrepaidPackagesByAccount]
(
	@accountID int
)	
as 

begin
	select * from vw_PrepaidPackagesOwnedByAccount
		where accountID = @accountid;	
end
GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceByID]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInvoiceByID] 
	-- Add the parameters for the stored procedure here
	  @InvoiceID int


AS
BEGIN
       
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select i.InvoiceID, i.InvoiceDate, i.SubTotal, i.TotalAmount, i.TotalTaxCharged,
		ili.Quantity, ili.UnitPriceCharged, ili.TaxCharged,
		
		p.ProductDescription, ( select a.Lastname + ', ' + a.Firstname as "Name" 
								from [aquaone].[dbo].Account a, [aquaone].[dbo].Invoice i 
								where a.AccountID=i.AccountID and i.InvoiceID=@InvoiceID) as Name
		
	from [aquaone].[dbo].Invoice i, [aquaone].[dbo].InvoiceLineItem ili,  [aquaone].[dbo].Product p
	where i.InvoiceID=ili.InvoiceID
	and p.ProductID=ili.ProductID
	and i.InvoiceID=@InvoiceID;

END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePBTransaction]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdatePBTransaction] 
(    
 
	 @TransactionID int,
	 @TransactionType varchar(10), 
	 @PrepaidBottleID int, 
	 @LastUpdatedBalance int,
	 @DeductQty int,
	 @TopUpQty int,
	 @LastTransactionDate datetime,
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@TransactionID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   aquaone.dbo.PrepaidBottleTransaction
				( TransactionType, PrepaidBottleID, LastUpdatedBalance, DeductQty, TopUpQty, 
					LastTransactionDate, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)
	      values (  @TransactionType, @PrepaidBottleID,  @LastUpdatedBalance, @DeductQty, @TopUpQty, 
			@LastTransactionDate, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
     
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        

        
        -- no update statement yet
        
	select @ReturnValue = @TransactionID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[GetServiceWorkDetailsByID]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServiceWorkDetailsByID]
(
 
	@serviceWorkID int
)
	
AS

 
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select s.ServiceWorkID
		,s.ServiceDate
		,s.ServiceStartTime
		,s.ServiceEndTime
		,s.AccountID
		,s.InvoiceID
		,vw.Firstname + ' '+ vw.Lastname  as [Account Name]
		,vw.[Home Address]
		,vw.Homephone
	from AquaOne.dbo.ServiceWork s, AquaOne.dbo.vw_accountWithAddress vw
	where s.AccountID= vw.AccountID
	and s.ServiceWorkID = @serviceWorkID;

			
  end
GO
/****** Object:  StoredProcedure [dbo].[getsalesYTD]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getsalesYTD]

as 
select * from aquaone.dbo.[vw_CurrentYearSalesByMonth] order by monthNumber;
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionHistoryByPrepaidID]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTransactionHistoryByPrepaidID] 
(
	@prepaidID int
)

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

	select top 10 * from aquaone.dbo.prepaidBottleTransaction 
		where prepaidBottleID = @prepaidID
		 order by lasttransactiondate desc
END
GO
/****** Object:  StoredProcedure [dbo].[InsertInvoiceLineItem]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertInvoiceLineItem] 
(    

	 @InvoiceID int,
	 @ProductID int,
	 @Quantity int,
	 @UnitPriceCharged decimal(18,2),
	 @TaxCharged decimal(18,2),
	 @ItemTotal decimal(18,2),
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		insert into AquaOne.dbo.InvoiceLineItem
			( invoiceID, productID, quantity, unitPriceCharged , taxCharged, itemTotal
			,createdDate, modifiedDate, createdBy, modifiedBy)
			values (@InvoiceID, @ProductID, @Quantity,@UnitPriceCharged,@TaxCharged,@ItemTotal
			,@CreatedDate,@ModifiedDate,@CreatedBy,@ModifiedBy);
      
        
        select @ReturnValue = SCOPE_IDENTITY();
	END


	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  View [dbo].[vw_GetAccountsWithNegativePrepaidBal]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[vw_GetAccountsWithNegativePrepaidBal]

as

select p.accountid,  a.firstname + + a.lastname as [accountholder]
       ,a.homephone
       ,p.balance, pb.name, pbt.lasttransactiondate
	from aquaone.dbo.PrepaidBottle p , 
		aquaone.dbo.prepaidbottletype pb  ,
		aquaone.dbo.prepaidbottletransaction pbt,
		aquaone.dbo.account a
	where p.balance < 0
		and p.accountid = a.accountid
		and p.prepaidbottletype = pb.typeid
		and p.prepaidbottleid = pbt.prepaidbottleid
		and pbt.lasttransactiondate in 
				(select max(lasttransactiondate) from aquaone.dbo.prepaidbottletransaction 
					where prepaidbottleid = p.prepaidbottleid)
	
;
GO
/****** Object:  View [dbo].[vw_employeeWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_employeeWithAddress]
AS
SELECT     e.EmployeeID, e.Firstname, e.Lastname, e.Gender, LOWER(e.Email) AS Email, e.Homephone, e.Mobilephone, e.EmergencyContact, e.EmergencyPhone1, 
                      e.EmergencyPhone2, e.IsEmployed, e.HireDate, a.AddressLine1 + ' ' + a.AddressLine2 + ' ' + a.CityTown + ' ' + a.Province + ' ' + a.PostalCode AS [Home Address], 
                      e.TerminatedDate, e.CreatedDate, dbo.JobPosition.PositionName
FROM         dbo.Employee AS e INNER JOIN
                      dbo.EmployeeAddress AS ea ON e.EmployeeID = ea.EmployeeID INNER JOIN
                      dbo.Address AS a ON ea.AddressID = a.AddressID INNER JOIN
                      dbo.JobPosition ON e.PositionID = dbo.JobPosition.PositionID
WHERE     (ea.AddressType = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ea"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 125
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JobPosition"
            Begin Extent = 
               Top = 8
               Left = 502
               Bottom = 127
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_employeeWithAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_employeeWithAddress'
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateServiceWork]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery6.sql|7|0|C:\Users\nei\AppData\Local\Temp\~vsEDCD.sql

CREATE PROCEDURE [dbo].[InsertUpdateServiceWork] 
(    

	 @ServiceWorkID  int,
	 @AccountID int,
	 @InvoiceID int,
	 --@ServiceStatus varchar(10), 
	 @ServiceDate datetime, 
	 @ServiceStartTime time(2), 
	 @ServiceEndTime time(2), 
	 @Technician varchar(30),
	 @SubTotal decimal(18,2),
	 @TaxCharged decimal(18,2),
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@ServiceWorkID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into  AquaOne.dbo.servicework  (  AccountID, ServiceDate, ServiceStartTime, ServiceEndTime, 
		Technician, invoiceID, SubTotal, TaxCharged, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy )
	      values (@AccountID,@ServiceDate,  @ServiceStartTime, @ServiceEndTime,
	      @Technician,@InvoiceID,@subtotal,@taxcharged, @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].servicework
		   SET  AccountID = @AccountID
			  , ServiceDate = @ServiceDate
			  ,ServiceStartTime = @ServiceStartTime
			  ,ServiceEndTime = @ServiceEndTime
			  ,Technician = @Technician
			  ,CreatedDate = @CreatedDate
			  , ModifiedDate = @ModifiedDate
			  ,CreatedBy = @CreatedBy
			  ,ModifiedBy = @ModifiedBy	
		 WHERE   ServiceWorkID =@ServiceWorkID;
        
        
        
	select @ReturnValue = @ServiceWorkID;

    end
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateServiceWorkToBeDone]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery6.sql|7|0|C:\Users\nei\AppData\Local\Temp\~vsEDCD.sql

CREATE PROCEDURE [dbo].[InsertUpdateServiceWorkToBeDone] 
(    
     @WorkToBeDoneID int,
     @WorkType varchar(20),
     @WorkCharge decimal(18,2),
     @WorkNotes varchar(1000),
     @ServiceWorkID int,
	 @CreatedDate datetime , 
	 @ModifiedDate datetime , 
	 @CreatedBy varchar(20), 
	 @ModifiedBy varchar(20)
) 

AS

declare @ReturnValue int

if (@WorkToBeDoneID is null) 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
       insert into   AquaOne.dbo.ServiceWorkToBeDone
		(WorkType, WorkCharge, WorkNotes, ServiceWorkID,
		CreatedDate,ModifiedDate,CreatedBy,ModifiedBy)
	      values (@WorkType, @WorkCharge,@WorkNotes,@ServiceWorkID,
			 @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy);
        
        select @ReturnValue = SCOPE_IDENTITY();
	END

else
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
        -- update
        
       UPDATE [AquaOne].[dbo].ServiceWorkToBeDone
		   SET  WorkType= @WorkType
		       ,WorkCharge=@WorkCharge
		       ,WorkNotes= @WorkNotes
			   ,ModifiedDate = @ModifiedDate
			   ,ModifiedBy = @ModifiedBy	
		 WHERE  WorkToBeDoneID =@WorkToBeDoneID;
   
	select @ReturnValue = @WorkToBeDoneID;

    end
    
	if (@@ERROR != 0)
		begin
			return -1;
		end
	else
		begin 
			return @returnValue;
		end
GO
/****** Object:  StoredProcedure [dbo].[GetWaterUsagePerHourCurrentDay]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetWaterUsagePerHourCurrentDay]
as 

declare @todaysDate varchar(10);

set @todaysDate =  CONVERT(VARCHAR(10), GETDATE(), 102);

	select [HourTaken]  , sum(totalLitersConsumed) as TotalLitersPerHour,
	  sum(totalUSGallonsConsumed) as TotalUsGallonsPerHour
	  --, CONVERT(VARCHAR(10), createddate, 102) as todaysDate
		from aquaone.dbo.vw_waterUsage
		where CONVERT(VARCHAR(10), createddate, 102)  = @todaysDate
	group by  [HourTaken] 
	
	;
GO
/****** Object:  StoredProcedure [dbo].[GetTopTenServiceWorkFromToday]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTopTenServiceWorkFromToday]
as 
select * from AquaOne.dbo.vw_TopTenServiceWorkFromToday;
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeWithAddress]
(
     @SearchCriteria varchar(20)
	,@input varchar(40)
)
	
AS


if @SearchCriteria = 'by_lastname'  
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select vw_employeeWithAddress.EmployeeId 
		,vw_employeeWithAddress.Lastname + ', '+ vw_employeeWithAddress.Firstname as Name
		,vw_employeeWithAddress.Gender
		,vw_employeeWithAddress.Email
		,vw_employeeWithAddress.HomePhone
		,vw_employeeWithAddress.MobilePhone
		,vw_employeeWithAddress.EmergencyContact
		,vw_employeeWithAddress.EmergencyPhone1
		,vw_employeeWithAddress.EmergencyPhone2
		,vw_employeeWithAddress.isEmployed
		,vw_employeeWithAddress.HireDate
		,vw_employeeWithAddress.[Home Address]
		,vw_employeeWithAddress.PositionName
	 from vw_employeeWithAddress
	   where lastname  like @input + '%' ;

			
  end 

else if lower(@SearchCriteria) = 'By_EmployeeID'
	begin
	    
       Select vw_employeeWithAddress.EmployeeId 
		,vw_employeeWithAddress.Lastname + ', '+ vw_employeeWithAddress.Firstname as Name
		,vw_employeeWithAddress.Gender
		,vw_employeeWithAddress.Email
		,vw_employeeWithAddress.HomePhone
		,vw_employeeWithAddress.MobilePhone
		,vw_employeeWithAddress.EmergencyContact
		,vw_employeeWithAddress.EmergencyPhone1
		,vw_employeeWithAddress.EmergencyPhone2
		,vw_employeeWithAddress.isEmployed
		,vw_employeeWithAddress.HireDate
		,vw_employeeWithAddress.[Home Address]
		,vw_employeeWithAddress.PositionName
	 from vw_employeeWithAddress
			where EmployeeId = cast(@input  as int);
	end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesWithAddress]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeesWithAddress] 

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Retrieve all data from the table
--SELECT * from vw_accountWithAddress order by AccountId asc;
Select vw_employeeWithAddress.EmployeeId 
		,vw_employeeWithAddress.Lastname + ', '+ vw_employeeWithAddress.Firstname as Name
		,vw_employeeWithAddress.Gender
		,vw_employeeWithAddress.Email
		,vw_employeeWithAddress.HomePhone
		,vw_employeeWithAddress.MobilePhone
		,vw_employeeWithAddress.EmergencyContact
		,vw_employeeWithAddress.EmergencyPhone1
		,vw_employeeWithAddress.EmergencyPhone2
		,vw_employeeWithAddress.isEmployed
		,vw_employeeWithAddress.HireDate
		,vw_employeeWithAddress.[Home Address]
		,vw_employeeWithAddress.TerminatedDate
		,vw_employeeWithAddress.CreatedDate
		,vw_employeeWithAddress.PositionName
		from vw_employeeWithAddress
END
GO
/****** Object:  StoredProcedure [dbo].[GetActiveEmployeeList]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetActiveEmployeeList] 
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

Select vw_employeeWithAddress.EmployeeId 
		,vw_employeeWithAddress.Lastname + ', '+ vw_employeeWithAddress.Firstname as Name
		,vw_employeeWithAddress.Gender
		,vw_employeeWithAddress.Email
		,vw_employeeWithAddress.HomePhone
		,vw_employeeWithAddress.MobilePhone
		,vw_employeeWithAddress.EmergencyContact
		,vw_employeeWithAddress.EmergencyPhone1
		,vw_employeeWithAddress.EmergencyPhone2
		,vw_employeeWithAddress.isEmployed
		,vw_employeeWithAddress.HireDate
		,vw_employeeWithAddress.[Home Address]
		,vw_employeeWithAddress.TerminatedDate
		,vw_employeeWithAddress.CreatedDate
	 from vw_employeeWithAddress
WHERE vw_employeeWithAddress.IsEmployed=1
;
end
GO
/****** Object:  StoredProcedure [dbo].[GetAccountsWithNegativePrepaidBal]    Script Date: 12/01/2011 18:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAccountsWithNegativePrepaidBal]
as 
	select * 
		from vw_GetAccountsWithNegativePrepaidBal
	order by 1,2;
GO
/****** Object:  Default [DF_Ref_AddressType_CreatedDate]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Ref_AddressType] ADD  CONSTRAINT [DF_Ref_AddressType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Ref_AddressType_ModifiedDate]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Ref_AddressType] ADD  CONSTRAINT [DF_Ref_AddressType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Acount_IsActive]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Acount_IsENewsletter]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsENewsletter]  DEFAULT ((0)) FOR [IsENewsletter]
GO
/****** Object:  Default [DF_Acount_IsNewsletter]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsNewsletter]  DEFAULT ((0)) FOR [IsNewsletter]
GO
/****** Object:  Default [DF_Acount_IsWaterTreatmentEquipment]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsWaterTreatmentEquipment]  DEFAULT ((0)) FOR [IsWaterTreatmentEquipment]
GO
/****** Object:  Default [DF_Acount_IsBottledWater]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsBottledWater]  DEFAULT ((0)) FOR [IsBottledWater]
GO
/****** Object:  Default [DF_Acount_IsRental]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsRental]  DEFAULT ((0)) FOR [IsRental]
GO
/****** Object:  Default [DF_Acount_IsService]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsService]  DEFAULT ((0)) FOR [IsService]
GO
/****** Object:  Default [DF_Acount_IsDelivery]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsDelivery]  DEFAULT ((0)) FOR [IsDelivery]
GO
/****** Object:  Default [DF_Acount_IsWaterCare]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Acount_IsWaterCare]  DEFAULT ((0)) FOR [IsWaterCare]
GO
/****** Object:  ForeignKey [FK_WaterTreatmentEquipment_Account_accountID]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[WaterTreatmentEquipment]  WITH CHECK ADD  CONSTRAINT [FK_WaterTreatmentEquipment_Account_accountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[WaterTreatmentEquipment] CHECK CONSTRAINT [FK_WaterTreatmentEquipment_Account_accountID]
GO
/****** Object:  ForeignKey [FK_WaterAnalysis_Account_AccountID]    Script Date: 12/01/2011 18:12:06 ******/
ALTER TABLE [dbo].[WaterAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_WaterAnalysis_Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[WaterAnalysis] CHECK CONSTRAINT [FK_WaterAnalysis_Account_AccountID]
GO
/****** Object:  ForeignKey [FK_AccountAddress_Account_AccountID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddress_Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_AccountAddress_Account_AccountID]
GO
/****** Object:  ForeignKey [FK_AccountAddress_AddressID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddress_AddressID] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_AccountAddress_AddressID]
GO
/****** Object:  ForeignKey [FK_AuthorizedMember_Account_accountid]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[AuthorizedMember]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizedMember_Account_accountid] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[AuthorizedMember] CHECK CONSTRAINT [FK_AuthorizedMember_Account_accountid]
GO
/****** Object:  ForeignKey [FK_Employee_JobPosition]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_JobPosition] FOREIGN KEY([PositionID])
REFERENCES [dbo].[JobPosition] ([PositionID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_JobPosition]
GO
/****** Object:  ForeignKey [FK_PrepaidBalance_Account_accountID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[PrepaidBottle]  WITH CHECK ADD  CONSTRAINT [FK_PrepaidBalance_Account_accountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[PrepaidBottle] CHECK CONSTRAINT [FK_PrepaidBalance_Account_accountID]
GO
/****** Object:  ForeignKey [FK_PrepaidBottleBalance_PrepaidBottleType_TypeID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[PrepaidBottle]  WITH CHECK ADD  CONSTRAINT [FK_PrepaidBottleBalance_PrepaidBottleType_TypeID] FOREIGN KEY([PrepaidBottleType])
REFERENCES [dbo].[PrepaidBottleType] ([TypeID])
GO
ALTER TABLE [dbo].[PrepaidBottle] CHECK CONSTRAINT [FK_PrepaidBottleBalance_PrepaidBottleType_TypeID]
GO
/****** Object:  ForeignKey [FK_Assembly_Product]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[ProductPartReplacement]  WITH CHECK ADD  CONSTRAINT [FK_Assembly_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductPartReplacement] CHECK CONSTRAINT [FK_Assembly_Product]
GO
/****** Object:  ForeignKey [FK_Assembly_SubProduct]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[ProductPartReplacement]  WITH CHECK ADD  CONSTRAINT [FK_Assembly_SubProduct] FOREIGN KEY([SubProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductPartReplacement] CHECK CONSTRAINT [FK_Assembly_SubProduct]
GO
/****** Object:  ForeignKey [FK_Invoice_Account_AccountID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account_AccountID]
GO
/****** Object:  ForeignKey [FK_PrepaidBottleTransaction_PrepaidBottleBalance_BalID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[PrepaidBottleTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PrepaidBottleTransaction_PrepaidBottleBalance_BalID] FOREIGN KEY([PrepaidBottleID])
REFERENCES [dbo].[PrepaidBottle] ([PrepaidBottleID])
GO
ALTER TABLE [dbo].[PrepaidBottleTransaction] CHECK CONSTRAINT [FK_PrepaidBottleTransaction_PrepaidBottleBalance_BalID]
GO
/****** Object:  ForeignKey [FK_Invoice_Product_Product]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[InvoiceLineItem]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[InvoiceLineItem] CHECK CONSTRAINT [FK_Invoice_Product_Product]
GO
/****** Object:  ForeignKey [FK_InvoiceProduct_Invoice_invoiceID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[InvoiceLineItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceProduct_Invoice_invoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceLineItem] CHECK CONSTRAINT [FK_InvoiceProduct_Invoice_invoiceID]
GO
/****** Object:  ForeignKey [FK_ServiceWork_Invoice_invoiceID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[ServiceWork]  WITH CHECK ADD  CONSTRAINT [FK_ServiceWork_Invoice_invoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[ServiceWork] CHECK CONSTRAINT [FK_ServiceWork_Invoice_invoiceID]
GO
/****** Object:  ForeignKey [FK_EmployeeAddress_Address]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Address]
GO
/****** Object:  ForeignKey [FK_EmployeeAddress_AddressID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_AddressID] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_AddressID]
GO
/****** Object:  ForeignKey [FK_EmployeeAddress_Employee]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Employee]
GO
/****** Object:  ForeignKey [FK_ServiceWorkToBeDone_ServiceWork_serviceWorkID]    Script Date: 12/01/2011 18:12:07 ******/
ALTER TABLE [dbo].[ServiceWorkToBeDone]  WITH CHECK ADD  CONSTRAINT [FK_ServiceWorkToBeDone_ServiceWork_serviceWorkID] FOREIGN KEY([ServiceWorkID])
REFERENCES [dbo].[ServiceWork] ([ServiceWorkID])
GO
ALTER TABLE [dbo].[ServiceWorkToBeDone] CHECK CONSTRAINT [FK_ServiceWorkToBeDone_ServiceWork_serviceWorkID]
GO

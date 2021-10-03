USE [master]
GO
/****** Object:  Database [Project_DB]    Script Date: 7/26/2021 10:34:45 PM ******/
CREATE DATABASE [Project_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Project_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project_DB] SET QUERY_STORE = OFF
GO
USE [Project_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Balance]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Get_Balance] 
(
	@Login_id int
)
RETURNS decimal(15, 3)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Balance decimal(15, 3)

	-- Add the T-SQL statements to compute the return value here
	set @Balance=(SELECT Balance FROM Passenger WHERE Login_id=@Login_id) 

	-- Return the result of the function
	RETURN @Balance

END
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Login_id]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Get_Login_id] 
(
	@Username varchar(30),
	@Password varchar(30)
)
RETURNS int
AS
BEGIN
	DECLARE @Login_id int
	SELECT @Login_id=Login_id FROM  Login WHERE   Username=@Username and Password=@Password
	Return @Login_id



End
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Name]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Get_Name] 
(
	@Login_id int
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Name varchar(50)

	-- Add the T-SQL statements to compute the return value here
	set @Name=(SELECT Name FROM Passenger WHERE Login_id=@Login_id) 

	-- Return the result of the function
	RETURN @Name

END
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Passenger_ID]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Get_Passenger_ID] 
(
	@Login_id int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Passenger_id int

	-- Add the T-SQL statements to compute the return value here
	set @Passenger_id=(SELECT Passenger_id FROM Passenger WHERE Login_id=@Login_id) 

	-- Return the result of the function
	RETURN @Passenger_id

END
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Password]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Get_Password] 
(
	@Login_id int
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Password varchar(50)

	-- Add the T-SQL statements to compute the return value here
	set @Password=(SELECT Password FROM Login WHERE Login_id=@Login_id) 

	-- Return the result of the function
	RETURN @Password

END
GO
/****** Object:  UserDefinedFunction [dbo].[User_Login]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[User_Login] 
(
	@Username varchar(30),
	@Password varchar(30)
)
RETURNS  int
AS
BEGIN
		Declare @Login_status int
		Select @Login_status=  Count(Username) from dbo.Login where Username=@Username and Password=@Password
		RETURN @Login_status

END
GO
/****** Object:  Table [dbo].[Login]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Login_id] [int] NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [Login_PK] PRIMARY KEY CLUSTERED 
(
	[Login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airlines]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airlines](
	[Airlines_id] [int] NOT NULL,
	[Airlines_name] [varchar](30) NOT NULL,
	[Origin] [varchar](30) NULL,
 CONSTRAINT [Airlines_PK] PRIMARY KEY CLUSTERED 
(
	[Airlines_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[Passenger_id] [int] NOT NULL,
	[PCR_test] [varchar](30) NOT NULL,
	[PCR_date] [date] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Proname] [varchar](30) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Age] [int] NOT NULL,
	[Nationality] [varchar](30) NOT NULL,
	[Balance] [decimal](15, 3) NOT NULL,
	[Mobile] [int] NULL,
	[Email] [varchar](50) NOT NULL,
	[Address_id] [int] NOT NULL,
	[Login_id] [int] NOT NULL,
 CONSTRAINT [Passenger_PK] PRIMARY KEY CLUSTERED 
(
	[Passenger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Passenger_Login_AK] UNIQUE NONCLUSTERED 
(
	[Login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stop]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stop](
	[Stop_id] [int] NOT NULL,
	[Stop_country] [varchar](30) NULL,
	[Stop_city] [varchar](30) NULL,
	[Stop_airport] [varchar](30) NULL,
 CONSTRAINT [Stop_PK] PRIMARY KEY CLUSTERED 
(
	[Stop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_Class]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_Class](
	[Class_id] [int] NOT NULL,
	[Class_type] [varchar](30) NOT NULL,
	[Extra_services] [varchar](30) NULL,
	[Seat_selection] [varchar](30) NULL,
 CONSTRAINT [Flight_Class_PK] PRIMARY KEY CLUSTERED 
(
	[Class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[Seat_id] [int] NOT NULL,
	[Seat_num] [varchar](30) NOT NULL,
	[Seat_size] [int] NULL,
 CONSTRAINT [Seat_PK] PRIMARY KEY CLUSTERED 
(
	[Seat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[Airplane_id] [int] NOT NULL,
	[Airplane_num] [varchar](30) NOT NULL,
	[Num_of_seats] [int] NOT NULL,
	[Model] [varchar](50) NULL,
	[MTOW] [int] NULL,
	[Range] [int] NULL,
	[Airlines_id] [int] NOT NULL,
 CONSTRAINT [Airplane_PK] PRIMARY KEY CLUSTERED 
(
	[Airplane_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[Flight_id] [int] NOT NULL,
	[Flight_num] [varchar](30) NOT NULL,
	[Flight_type] [varchar](50) NOT NULL,
	[Dep_Country] [varchar](30) NOT NULL,
	[Dep_Airport] [varchar](30) NOT NULL,
	[Arr_Country] [varchar](30) NOT NULL,
	[Arr_Airport] [varchar](30) NOT NULL,
	[Dep_Date] [date] NOT NULL,
	[Arr_Date] [date] NOT NULL,
	[Dep_time] [time](7) NOT NULL,
	[Arr_time] [time](7) NOT NULL,
	[Total_time] [time](7) NOT NULL,
	[Airplane_id] [int] NOT NULL,
 CONSTRAINT [Flight_PK] PRIMARY KEY CLUSTERED 
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_id] [int] NOT NULL,
	[Price] [decimal](15, 3) NOT NULL,
	[Ticket_Booked] [int] NOT NULL,
	[Change_or_refund] [varchar](30) NULL,
	[Refund_percentage] [decimal](18, 0) NULL,
	[Flight_id] [int] NOT NULL,
	[Class_id] [int] NOT NULL,
 CONSTRAINT [Ticket_PK] PRIMARY KEY CLUSTERED 
(
	[Ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luggage]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luggage](
	[Luggage_id] [int] NOT NULL,
	[Luggage_Type] [varchar](30) NOT NULL,
	[Weight] [int] NOT NULL,
	[Ticket_id] [int] NOT NULL,
 CONSTRAINT [Luggage_PK] PRIMARY KEY CLUSTERED 
(
	[Luggage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_Seat]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_Seat](
	[Seat_id] [int] NOT NULL,
	[Flight_id] [int] NOT NULL,
	[Ticket_id] [int] NOT NULL,
 CONSTRAINT [Flight_Seat_PK] PRIMARY KEY CLUSTERED 
(
	[Seat_id] ASC,
	[Flight_id] ASC,
	[Ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_Stop]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_Stop](
	[Stop_id] [int] NOT NULL,
	[Flight_id] [int] NOT NULL,
	[Stop_duration] [time](7) NOT NULL,
 CONSTRAINT [Flight_Stop_PK] PRIMARY KEY CLUSTERED 
(
	[Stop_id] ASC,
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Booking_id] [int] NOT NULL,
	[Booking_date] [date] NOT NULL,
	[Passenger_id] [int] NOT NULL,
	[Ticket_id] [int] NOT NULL,
 CONSTRAINT [Booking_PK] PRIMARY KEY CLUSTERED 
(
	[Booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Booking_Ticket_AK] UNIQUE NONCLUSTERED 
(
	[Ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Booked_Tickets_Description_View]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Booked_Tickets_Description_View]
AS
SELECT        dbo.Login.Username, dbo.Login.Login_id, dbo.Booking.Booking_date, dbo.Ticket.Price, dbo.Ticket.Refund_percentage, dbo.Ticket.Change_or_refund, dbo.Passenger.Balance, dbo.Flight.Flight_num, dbo.Flight.Flight_type, 
                         dbo.Flight.Dep_Country, dbo.Flight.Dep_Airport, dbo.Flight.Arr_Country, dbo.Flight.Arr_Airport, dbo.Flight.Dep_Date, dbo.Flight.Arr_Date, dbo.Flight.Dep_time, dbo.Flight.Arr_time, dbo.Airplane.Airplane_num, 
                         dbo.Airlines.Airlines_name, dbo.Flight_Class.Class_type, dbo.Flight_Class.Extra_services, dbo.Flight_Class.Seat_selection, dbo.Luggage.Luggage_Type, dbo.Luggage.Weight, dbo.Ticket.Ticket_id, dbo.Seat.Seat_num, 
                         dbo.Flight_Stop.Stop_duration, dbo.Stop.Stop_country, dbo.Stop.Stop_airport, dbo.Stop.Stop_city,dbo.Passenger.Name
FROM            dbo.Ticket INNER JOIN
                         dbo.Booking ON dbo.Ticket.Ticket_id = dbo.Booking.Ticket_id INNER JOIN
                         dbo.Passenger ON dbo.Booking.Passenger_id = dbo.Passenger.Passenger_id INNER JOIN
                         dbo.Login ON dbo.Passenger.Login_id = dbo.Login.Login_id INNER JOIN
                         dbo.Flight ON dbo.Ticket.Flight_id = dbo.Flight.Flight_id INNER JOIN
                         dbo.Airplane ON dbo.Flight.Airplane_id = dbo.Airplane.Airplane_id INNER JOIN
                         dbo.Airlines ON dbo.Airplane.Airlines_id = dbo.Airlines.Airlines_id INNER JOIN
                         dbo.Flight_Class ON dbo.Ticket.Class_id = dbo.Flight_Class.Class_id INNER JOIN
                         dbo.Luggage ON dbo.Ticket.Ticket_id = dbo.Luggage.Ticket_id INNER JOIN
                         dbo.Flight_Seat ON dbo.Ticket.Ticket_id = dbo.Flight_Seat.Ticket_id AND dbo.Flight.Flight_id = dbo.Flight_Seat.Flight_id INNER JOIN
                         dbo.Seat ON dbo.Flight_Seat.Seat_id = dbo.Seat.Seat_id INNER JOIN
                         dbo.Flight_Stop ON dbo.Flight.Flight_id = dbo.Flight_Stop.Flight_id INNER JOIN
                         dbo.Stop ON dbo.Flight_Stop.Stop_id = dbo.Stop.Stop_id
WHERE        (dbo.Ticket.Ticket_Booked = 1)
GO
/****** Object:  View [dbo].[Search_View]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Search_View]
AS
SELECT        dbo.Flight.Flight_type, dbo.Flight.Dep_Country, dbo.Flight.Dep_Airport, dbo.Flight.Arr_Country, dbo.Flight.Arr_Airport, dbo.Flight.Dep_Date, dbo.Flight.Arr_Date, dbo.Flight.Dep_time, dbo.Flight.Arr_time, dbo.Flight.Total_time, 
                         dbo.Flight_Class.Class_type, COUNT(dbo.Luggage.Luggage_Type) AS Num_of_bags, dbo.Ticket.Price, dbo.Ticket.Ticket_id, dbo.Stop.Stop_country, dbo.Stop.Stop_city, dbo.Stop.Stop_airport, dbo.Airlines.Airlines_name, 
                         dbo.Flight_Stop.Stop_duration
FROM            dbo.Flight INNER JOIN
                         dbo.Ticket ON dbo.Flight.Flight_id = dbo.Ticket.Flight_id INNER JOIN
                         dbo.Flight_Class ON dbo.Ticket.Class_id = dbo.Flight_Class.Class_id INNER JOIN
                         dbo.Luggage ON dbo.Ticket.Ticket_id = dbo.Luggage.Ticket_id INNER JOIN
                         dbo.Flight_Stop ON dbo.Flight.Flight_id = dbo.Flight_Stop.Flight_id INNER JOIN
                         dbo.Stop ON dbo.Flight_Stop.Stop_id = dbo.Stop.Stop_id INNER JOIN
                         dbo.Airplane ON dbo.Flight.Airplane_id = dbo.Airplane.Airplane_id INNER JOIN
                         dbo.Airlines ON dbo.Airplane.Airlines_id = dbo.Airlines.Airlines_id
WHERE        dbo.Ticket.Ticket_Booked = 0
GROUP BY dbo.Flight.Flight_type, dbo.Flight.Dep_Country, dbo.Flight.Dep_Airport, dbo.Flight.Arr_Country, dbo.Flight.Arr_Airport, dbo.Flight.Dep_Date, dbo.Flight.Arr_Date, dbo.Flight.Dep_time, dbo.Flight.Arr_time, dbo.Flight.Total_time, 
                         dbo.Flight_Class.Class_type, dbo.Ticket.Price, dbo.Ticket.Ticket_id, dbo.Stop.Stop_country, dbo.Stop.Stop_city, dbo.Stop.Stop_airport, dbo.Airlines.Airlines_name, dbo.Flight_Stop.Stop_duration
GO
/****** Object:  View [dbo].[Buy_View]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Buy_View]
AS
SELECT        dbo.Passenger.Name, dbo.Passenger.Proname, dbo.Passenger.PCR_date, dbo.Passenger.PCR_test, dbo.Booking.Booking_date, dbo.Ticket.Price, dbo.Passenger.Balance, dbo.Ticket.Change_or_refund, 
                         dbo.Ticket.Refund_percentage
FROM            dbo.Passenger INNER JOIN
                         dbo.Booking ON dbo.Passenger.Passenger_id = dbo.Booking.Passenger_id INNER JOIN
                         dbo.Ticket ON dbo.Booking.Ticket_id = dbo.Ticket.Ticket_id
WHERE        (dbo.Ticket.Ticket_Booked = 1)
GO
/****** Object:  View [dbo].[Description_View]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Description_View]
AS
SELECT        dbo.Flight.Flight_type, dbo.Flight.Dep_Country, dbo.Flight.Dep_Airport, dbo.Flight.Arr_Country, dbo.Flight.Arr_Airport, dbo.Flight.Dep_Date, dbo.Flight.Arr_Date, dbo.Flight.Dep_time, dbo.Flight.Arr_time, dbo.Flight.Total_time, 
                         dbo.Flight_Class.Class_type, dbo.Luggage.Luggage_Type, dbo.Ticket.Price, dbo.Ticket.Ticket_id, dbo.Stop.Stop_country, dbo.Stop.Stop_city, dbo.Stop.Stop_airport, dbo.Airlines.Airlines_name, dbo.Flight_Stop.Stop_duration, 
                         dbo.Luggage.Weight, dbo.Flight.Flight_num, dbo.Ticket.Change_or_refund, dbo.Ticket.Refund_percentage, dbo.Flight_Class.Extra_services, dbo.Flight_Class.Seat_selection
FROM            dbo.Flight INNER JOIN
                         dbo.Ticket ON dbo.Flight.Flight_id = dbo.Ticket.Flight_id INNER JOIN
                         dbo.Flight_Class ON dbo.Ticket.Class_id = dbo.Flight_Class.Class_id INNER JOIN
                         dbo.Luggage ON dbo.Ticket.Ticket_id = dbo.Luggage.Ticket_id INNER JOIN
                         dbo.Flight_Stop ON dbo.Flight.Flight_id = dbo.Flight_Stop.Flight_id INNER JOIN
                         dbo.Stop ON dbo.Flight_Stop.Stop_id = dbo.Stop.Stop_id INNER JOIN
                         dbo.Airplane ON dbo.Flight.Airplane_id = dbo.Airplane.Airplane_id INNER JOIN
                         dbo.Airlines ON dbo.Airplane.Airlines_id = dbo.Airlines.Airlines_id
WHERE        (dbo.Ticket.Ticket_Booked = 0)
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_id] [int] NOT NULL,
	[Address_country] [varchar](30) NOT NULL,
	[Address_city] [varchar](30) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[House_num] [int] NULL,
	[Floor] [int] NULL,
	[Postal_Code] [varchar](30) NULL,
 CONSTRAINT [Address_PK] PRIMARY KEY CLUSTERED 
(
	[Address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airplane]  WITH CHECK ADD  CONSTRAINT [Airplane_Airlines_FK] FOREIGN KEY([Airlines_id])
REFERENCES [dbo].[Airlines] ([Airlines_id])
GO
ALTER TABLE [dbo].[Airplane] CHECK CONSTRAINT [Airplane_Airlines_FK]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_Passenger_FK] FOREIGN KEY([Passenger_id])
REFERENCES [dbo].[Passenger] ([Passenger_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_Passenger_FK]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_Ticket0_FK] FOREIGN KEY([Ticket_id])
REFERENCES [dbo].[Ticket] ([Ticket_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_Ticket0_FK]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [Flight_Airplane_FK] FOREIGN KEY([Airplane_id])
REFERENCES [dbo].[Airplane] ([Airplane_id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [Flight_Airplane_FK]
GO
ALTER TABLE [dbo].[Flight_Seat]  WITH CHECK ADD  CONSTRAINT [Flight_Seat_Flight0_FK] FOREIGN KEY([Flight_id])
REFERENCES [dbo].[Flight] ([Flight_id])
GO
ALTER TABLE [dbo].[Flight_Seat] CHECK CONSTRAINT [Flight_Seat_Flight0_FK]
GO
ALTER TABLE [dbo].[Flight_Seat]  WITH CHECK ADD  CONSTRAINT [Flight_Seat_Seat_FK] FOREIGN KEY([Seat_id])
REFERENCES [dbo].[Seat] ([Seat_id])
GO
ALTER TABLE [dbo].[Flight_Seat] CHECK CONSTRAINT [Flight_Seat_Seat_FK]
GO
ALTER TABLE [dbo].[Flight_Seat]  WITH CHECK ADD  CONSTRAINT [Flight_Seat_Ticket1_FK] FOREIGN KEY([Ticket_id])
REFERENCES [dbo].[Ticket] ([Ticket_id])
GO
ALTER TABLE [dbo].[Flight_Seat] CHECK CONSTRAINT [Flight_Seat_Ticket1_FK]
GO
ALTER TABLE [dbo].[Flight_Stop]  WITH CHECK ADD  CONSTRAINT [Flight_Stop_Flight0_FK] FOREIGN KEY([Flight_id])
REFERENCES [dbo].[Flight] ([Flight_id])
GO
ALTER TABLE [dbo].[Flight_Stop] CHECK CONSTRAINT [Flight_Stop_Flight0_FK]
GO
ALTER TABLE [dbo].[Flight_Stop]  WITH CHECK ADD  CONSTRAINT [Flight_Stop_Stop_FK] FOREIGN KEY([Stop_id])
REFERENCES [dbo].[Stop] ([Stop_id])
GO
ALTER TABLE [dbo].[Flight_Stop] CHECK CONSTRAINT [Flight_Stop_Stop_FK]
GO
ALTER TABLE [dbo].[Luggage]  WITH CHECK ADD  CONSTRAINT [Luggage_Ticket_FK] FOREIGN KEY([Ticket_id])
REFERENCES [dbo].[Ticket] ([Ticket_id])
GO
ALTER TABLE [dbo].[Luggage] CHECK CONSTRAINT [Luggage_Ticket_FK]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [Passenger_Address0_FK] FOREIGN KEY([Address_id])
REFERENCES [dbo].[Address] ([Address_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [Passenger_Address0_FK]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [Passenger_Login1_FK] FOREIGN KEY([Login_id])
REFERENCES [dbo].[Login] ([Login_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [Passenger_Login1_FK]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [Ticket_Flight_Class0_FK] FOREIGN KEY([Class_id])
REFERENCES [dbo].[Flight_Class] ([Class_id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [Ticket_Flight_Class0_FK]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [Ticket_Flight_FK] FOREIGN KEY([Flight_id])
REFERENCES [dbo].[Flight] ([Flight_id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [Ticket_Flight_FK]
GO
/****** Object:  StoredProcedure [dbo].[BestDeals]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BestDeals] 
	@Login_id varchar(50)
AS
BEGIN
	DECLARE @Country varchar(50)

	
	set @Country=(SELECT Address_country FROM Address inner join Passenger on Address.Address_id=Passenger.Address_id
	 Where Passenger.Login_id=@Login_id) 

    SELECT TOP 5 * from Search_View Where Dep_country=@Country order by Price ASC
END
GO
/****** Object:  StoredProcedure [dbo].[Booked_Tickets_Description]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Booked_Tickets_Description] 
	@Login_id int
AS
BEGIN
	SELECT        Ticket_id,Booking_date, Price, Refund_percentage, Change_or_refund, Balance, Flight_num, Flight_type, Dep_Country, Dep_Airport, Arr_Country, Arr_Airport, Arr_Date, Dep_Date, Dep_time, Arr_time, Airlines_name, Airplane_num, 
                         Class_type, Extra_services, Seat_selection, Luggage_Type, Weight, Seat_num, Stop_duration, Stop_country, Stop_airport, Stop_city,Name
	FROM            Booked_Tickets_Description_View
	WHERE			Login_id=@Login_id
END
GO
/****** Object:  StoredProcedure [dbo].[Booking_Ticket]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Booking_Ticket]
	(	
		@Passenger_id int,
		@Ticket_id int
	)

AS
BEGIN
		DECLARE @Booking_id int
		DECLARE @Booking_date Date
		DECLARE @Balance Money
		DECLARE @Price Money
		DECLARE @New_Balance Money

		
		Select @Balance =Passenger.Balance FROM Passenger WHERE Passenger.Passenger_id=@Passenger_id
		Select @Price= Ticket.Price From Ticket where Ticket.Ticket_id=@Ticket_id
		if(@Balance >@Price)
		Begin
			Set @Booking_id = (Select Count(*) From Booking)+1
			Set @Booking_date =  cast(GETDATE() as date)
			Set @New_Balance= @Balance - @Price
		
			Insert into Booking values (@Booking_id,@Booking_date,@Passenger_id,@Ticket_id)

			UPDATE  Passenger
			SET        Balance=@New_Balance
			WHERE Passenger.Passenger_id=@Passenger_id

			UPDATE  Ticket
			SET        Ticket_Booked =1
			WHERE      Ticket.Ticket_id=@Ticket_id

			Select 1
		END
		ELSE
		SELECT 0

		END
GO
/****** Object:  StoredProcedure [dbo].[Create_Account]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Create_Account]
	(	
		@PCR_test varchar(30),
        @PCR_date date,
        @Name varchar(30),
        @Proname varchar(30),
        @Gender varchar(6),
        @Age int,
        @Nationality varchar(30),
        @Balance decimal(15,3),
        @Mobile int,
        @Email varchar(50),
		@Address_country varchar(30),
		@Address_city varchar(30),
		@Street varchar(30),
		@House_num int,
		@Floor int,
		@Postal_Code varchar(30),
		@Username varchar(30),
		@Password varchar(30)
       
	)

AS
BEGIN TRAN


	DECLARE @Address_id int
	DECLARE @Login_id int
	DECLARE @Passenger_id int

	Select @Address_id = Count(Address_id)+1 from dbo.Address
	Select @Login_id = Count(Login_id)+1 from dbo.Login
	Select @Passenger_id = Count(Passenger_id)+1 from dbo.Passenger

INSERT INTO [dbo].[Address]
           ([Address_id]
           ,[Address_country]
           ,[Address_city]
           ,[Street]
           ,[House_num]
           ,[Floor]
           ,[Postal_Code])
     VALUES
           (@Address_id
		   ,@Address_country
           ,@Address_city
           ,@Street
           ,@House_num
           ,@Floor
           ,@Postal_Code)

INSERT INTO [dbo].[Login]
           ([Login_id]
           ,[Username]
           ,[Password])
     VALUES
           (@Login_id
           ,@Username
           ,@Password)



INSERT INTO [dbo].[Passenger]
           ([Passenger_id]
           ,[PCR_test]
           ,[PCR_date]
           ,[Name]
           ,[Proname]
           ,[Gender]
           ,[Age]
           ,[Nationality]
           ,[Balance]
           ,[Mobile]
           ,[Email]
           ,[Address_id]
           ,[Login_id])
     VALUES
           (@Passenger_id,
			@PCR_test ,
			@PCR_date ,
			@Name ,
			@Proname ,
			@Gender ,
			@Age ,
			@Nationality ,
			@Balance ,
			@Mobile ,
			@Email,
			@Address_id,
			@Login_id)



IF @@ERROR > 0
Begin
ROLLBACK TRAN 
END

ELSE 
Begin
	   COMMIT TRAN

END
GO
/****** Object:  StoredProcedure [dbo].[Get_UserInfo]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_UserInfo]
	(	
        @Passenger_id int
	)

AS

	SELECT        Passenger.Name, Passenger.Proname, Passenger.Gender, Passenger.Age, Passenger.Nationality, Passenger.Mobile, Address.Address_country, Address.Address_city, Address.Postal_Code, Address.House_num, 
                         Address.Street, Address.Floor
FROM            Address INNER JOIN
                         Passenger ON Address.Address_id = Passenger.Address_id
WHERE			Passenger_id=@Passenger_id

GO
/****** Object:  StoredProcedure [dbo].[Incoming_Flights]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Incoming_Flights] 
	-- Add the parameters for the stored procedure here
	@Login_id int
AS
BEGIN
SELECT        dbo.Airlines.Airlines_name, dbo.Flight.Dep_Country, dbo.Flight.Dep_Airport, dbo.Flight.Arr_time
FROM            dbo.Airplane INNER JOIN
                         dbo.Flight ON dbo.Airplane.Airplane_id = dbo.Flight.Airplane_id INNER JOIN
                         dbo.Airlines ON dbo.Airplane.Airlines_id = dbo.Airlines.Airlines_id INNER JOIN
                         dbo.Address INNER JOIN
                         dbo.Passenger ON dbo.Address.Address_id = dbo.Passenger.Address_id ON dbo.Flight.Arr_Country = dbo.Address.Address_country INNER JOIN
                         dbo.Login ON dbo.Passenger.Login_id = dbo.Login.Login_id
WHERE        (dbo.Login.Login_id = @Login_id) AND (dbo.Flight.Arr_Date = cast(GETDATE() as date))

END
GO
/****** Object:  StoredProcedure [dbo].[Outgoing_Flights]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Outgoing_Flights]  
	@Login_id int
AS
BEGIN
	SELECT        dbo.Airlines.Airlines_name, dbo.Flight.Arr_Country, dbo.Flight.Arr_Airport, dbo.Flight.Dep_time
FROM            dbo.Airplane INNER JOIN
                         dbo.Flight ON dbo.Airplane.Airplane_id = dbo.Flight.Airplane_id INNER JOIN
                         dbo.Airlines ON dbo.Airplane.Airlines_id = dbo.Airlines.Airlines_id INNER JOIN
                         dbo.Address INNER JOIN
                         dbo.Passenger ON dbo.Address.Address_id = dbo.Passenger.Address_id ON dbo.Flight.Dep_Country = dbo.Address.Address_country INNER JOIN
                         dbo.Login ON dbo.Passenger.Login_id = dbo.Login.Login_id
WHERE        (dbo.Login.Login_id = @Login_id) AND (dbo.Flight.Dep_Date = cast(GETDATE() as date))
END
GO
/****** Object:  StoredProcedure [dbo].[Refund_Ticket]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Refund_Ticket]
	(	
		@Ticket_id int 
	)

AS
BEGIN
		DECLARE @Balance Money
		DECLARE @Price Money
		DECLARE @Refund_percentage int
		DECLARE @New_Balance Money

		Select @Balance =Passenger.Balance 
		FROM Ticket INNER JOIN Booking ON Ticket.Ticket_id = Booking.Ticket_id 
		INNER JOIN Passenger ON Booking.Passenger_id = Passenger.Passenger_id
		Where Ticket.Ticket_id=@Ticket_id

		Select @Price= Ticket.Price From Ticket where Ticket.Ticket_id=@Ticket_id
		
		Select @Refund_percentage= Ticket.Refund_percentage From Ticket where Ticket.Ticket_id=@Ticket_id

		Set @New_Balance= @Balance + 0.01*@Refund_percentage*@Price

		UPDATE  Passenger
		SET        Balance=@New_Balance
		FROM Ticket INNER JOIN Booking ON Ticket.Ticket_id = Booking.Ticket_id 
		INNER JOIN Passenger ON Booking.Passenger_id = Passenger.Passenger_id
		Where Ticket.Ticket_id=@Ticket_id

		UPDATE  Ticket
		SET        Ticket_Booked =0
		WHERE      Ticket.Ticket_id=@Ticket_id

		DELETE FROM Booking
		FROM            Booking INNER JOIN  Ticket ON Booking.Ticket_id = Ticket.Ticket_id
		Where Ticket.Ticket_id=@Ticket_id

END
GO
/****** Object:  StoredProcedure [dbo].[Ticket_Description]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ticket_Description] 
	@Ticket_id int
AS
BEGIN
	SELECT        Flight_type, Dep_Country, Dep_Airport, Arr_Country, Arr_Airport, Dep_Date, Arr_Date, Dep_time, Arr_time, Total_time, Class_type, Luggage_Type, Price, Ticket_id, Stop_country, Stop_city, Stop_airport, Airlines_name, 
                         Stop_duration, Weight, Flight_num, Change_or_refund, Refund_percentage, Extra_services, Seat_selection
	FROM            Description_View
	WHERE			Ticket_id=@Ticket_id
END
GO
/****** Object:  StoredProcedure [dbo].[Ticket_Search]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ticket_Search]

	 @Dep_Country    Varchar (30),
	 @Dep_Airport    Varchar (30),
	 @Arr_Country    Varchar (30), 
     @Arr_Airport    Varchar (30),
	 @Dep_Date       Date,
	 @Arr_Date       Date,
	 @Flight_type    Varchar (50),
	 @Class_Type     Varchar (30)


AS
BEGIN
(
	SELECT        Ticket_id,Dep_time, Arr_time,Airlines_name,Total_time, Stop_country,Stop_city, Stop_duration,Price, Flight_type,Class_type
	FROM          Search_View
	WHERE		 Search_View.Dep_Country= @Dep_Country
				and	Search_View.Dep_Airport= @Dep_Airport
				and	Search_View.Arr_Country= @Arr_Country
				and	Search_View.Arr_Airport= @Arr_Airport
				and	Search_View.Dep_Date= @Dep_Date
				and	Search_View.Arr_Date= @Arr_Date
				and	Search_View.Flight_type= @Flight_type
				and	Search_View.Class_type= @Class_Type
		)
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Password]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Password]
	(	
        @Login_id int,
		@Password varchar(50)
		
	)

AS
BEGIN TRAN
Update Login set Password=@Password WHERE Login_id=@Login_id

IF @@ERROR > 0
Begin
ROLLBACK TRAN 
END

ELSE 
Begin
	   COMMIT TRAN

END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserInfo]    Script Date: 7/26/2021 10:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_UserInfo]
	(	
        @Passenger_id int,
		@Name varchar(30),
        @Proname varchar(30),
        @Gender varchar(6),
        @Age int,
        @Nationality varchar(30),
        @Mobile int,
		@Address_country varchar(30),
		@Address_city varchar(30),
		@Postal_Code varchar(30),
		@House_num int,
		@Street varchar(30),
		@Floor int
       
	)

AS
BEGIN TRAN
Declare @Address_id int
Update Passenger set Name=@Name,Proname=@Proname,Gender=@Gender,Age=@Age,Nationality=@Nationality,Mobile=@Mobile WHERE Passenger_id=@Passenger_id
Update Address set Address_country=@Address_country,Address_city=@Address_city,Postal_Code=@Postal_Code,House_num=@House_num,Street=@Street,Floor=@Floor WHERE Address_id=(SELECT Address_id From Passenger WHERE Passenger_id=@Passenger_id)


IF @@ERROR > 0
Begin
ROLLBACK TRAN 
END

ELSE 
Begin
	   COMMIT TRAN

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[1] 3) )"
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
         Begin Table = "Passenger"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Booking"
            Begin Extent = 
               Top = 4
               Left = 304
               Bottom = 134
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 10
               Left = 558
               Bottom = 140
               Right = 749
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Buy_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Buy_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[5] 2[18] 3) )"
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
         Begin Table = "Flight"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Flight_Class"
            Begin Extent = 
               Top = 6
               Left = 507
               Bottom = 136
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Luggage"
            Begin Extent = 
               Top = 6
               Left = 731
               Bottom = 136
               Right = 917
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Flight_Stop"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stop"
            Begin Extent = 
               Top = 138
               Left = 262
               Bottom = 268
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Airplane"
            Begin Extent = 
               Top = 138
               Left = 486
               Bottom = 268
               Right = 672
            End
            DisplayFlags = 280' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Description_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            TopColumn = 0
         End
         Begin Table = "Airlines"
            Begin Extent = 
               Top = 138
               Left = 710
               Bottom = 251
               Right = 896
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
      Begin ColumnWidths = 26
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Description_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Description_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[9] 2[21] 3) )"
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
         Begin Table = "Flight"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Flight_Class"
            Begin Extent = 
               Top = 6
               Left = 507
               Bottom = 136
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Luggage"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Flight_Stop"
            Begin Extent = 
               Top = 138
               Left = 262
               Bottom = 251
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stop"
            Begin Extent = 
               Top = 138
               Left = 486
               Bottom = 268
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Airplane"
            Begin Extent = 
               Top = 252
               Left = 262
               Bottom = 382
               Right = 448
            End
            DisplayFlags = 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Search_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'80
            TopColumn = 0
         End
         Begin Table = "Airlines"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 383
               Right = 224
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Search_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Search_View'
GO
USE [master]
GO
ALTER DATABASE [Project_DB] SET  READ_WRITE 
GO

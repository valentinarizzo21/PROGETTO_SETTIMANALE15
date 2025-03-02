USE [master]
GO
/****** Object:  Database [municipale_db]    Script Date: 28/02/2025 16:05:47 ******/
CREATE DATABASE [municipale_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'municipale_db', FILENAME = N'C:\Users\rizzo\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\municipale_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'municipale_db_log', FILENAME = N'C:\Users\rizzo\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\municipale_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [municipale_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [municipale_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [municipale_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [municipale_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [municipale_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [municipale_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [municipale_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [municipale_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [municipale_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [municipale_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [municipale_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [municipale_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [municipale_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [municipale_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [municipale_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [municipale_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [municipale_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [municipale_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [municipale_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [municipale_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [municipale_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [municipale_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [municipale_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [municipale_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [municipale_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [municipale_db] SET  MULTI_USER 
GO
ALTER DATABASE [municipale_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [municipale_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [municipale_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [municipale_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [municipale_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [municipale_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [municipale_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [municipale_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [municipale_db]
GO
/****** Object:  Table [dbo].[anagrafica]    Script Date: 28/02/2025 16:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anagrafica](
	[id_anagrafica] [int] IDENTITY(1,1) NOT NULL,
	[cognome] [varchar](50) NULL,
	[nome] [varchar](50) NULL,
	[indirizzo] [varchar](100) NULL,
	[citta] [varchar](50) NULL,
	[cap] [varchar](10) NULL,
	[cf] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_anagrafica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_violazione]    Script Date: 28/02/2025 16:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_violazione](
	[id_violazione] [int] IDENTITY(1,1) NOT NULL,
	[descrizione_violazione] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_violazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[verbale]    Script Date: 28/02/2025 16:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[verbale](
	[id_verbale] [int] IDENTITY(1,1) NOT NULL,
	[data_violazione] [datetime] NULL,
	[indirizzo_violazione] [varchar](100) NULL,
	[nominativo_agente] [varchar](50) NULL,
	[data_trascrizione_verbale] [datetime] NULL,
	[importo] [decimal](10, 2) NULL,
	[decurtamento_punti] [int] NULL,
	[id_anagrafica] [int] NULL,
	[id_violazione] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_verbale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[verbale]  WITH CHECK ADD FOREIGN KEY([id_anagrafica])
REFERENCES [dbo].[anagrafica] ([id_anagrafica])
GO
ALTER TABLE [dbo].[verbale]  WITH CHECK ADD FOREIGN KEY([id_violazione])
REFERENCES [dbo].[tipo_violazione] ([id_violazione])
GO
USE [master]
GO
ALTER DATABASE [municipale_db] SET  READ_WRITE 
GO

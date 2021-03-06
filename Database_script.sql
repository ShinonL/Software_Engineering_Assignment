USE [BloodManagement]
GO

CREATE TABLE [dbo].[Appointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Hospital_ID] [int] NULL,
	[AppointmentDe] [datetime] NULL,
	[Request_ID] [int] NULL,
	[Confirmed] [bit] NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Authorizations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[CanRequest] [bit] NULL,
	[CanSupervise] [bit] NULL,
	[CanConfirmRequest] [bit] NULL,
	[CanCreateAccounts] [bit] NULL,
 CONSTRAINT [PK_Authorizations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[BloodTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_ID] [int] NULL,
	[AIDS] [bit] NULL,
	[Leukemia] [bit] NULL,
	[Hepatitis_B] [bit] NULL,
	[Hepatitis_C] [bit] NULL,
	[Pox] [bit] NULL,
	[Thrombocytes] [float] NULL,
	[Hemoglobin] [float] NULL,
	[Cholesterol] [float] NULL,
	[Leukocytes] [float] NULL,
 CONSTRAINT [PK_BloodTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[BloodType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Blood] [nvarchar](50) NULL,
	[RH] [bit] NULL,
 CONSTRAINT [PK_BloodType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Hospitals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Requests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Staff_ID] [int] NULL,
	[TargetFirstName] [nvarchar](50) NULL,
	[TargetLastName] [nvarchar](50) NULL,
	[Illness] [nvarchar](50) NULL,
	[CNP] [nvarchar](50) NULL,
	[RequestDate] [datetime] NULL,
	[Confirmed] [bit] NULL,
	[Blood_ID] [int] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nchar](10) NULL,
	[Authorization_ID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Hospital_ID] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Stocks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hospital_ID] [int] NULL,
	[Blood_ID] [int] NULL,
	[Quantity] [float] NULL,
 CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CNP] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[BloodID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Hospitals] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Hospitals]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Users]
GO
ALTER TABLE [dbo].[BloodTests]  WITH CHECK ADD  CONSTRAINT [FK_BloodTests_Appointments] FOREIGN KEY([Appointment_ID])
REFERENCES [dbo].[Appointments] ([ID])
GO
ALTER TABLE [dbo].[BloodTests] CHECK CONSTRAINT [FK_BloodTests_Appointments]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_BloodType] FOREIGN KEY([Blood_ID])
REFERENCES [dbo].[BloodType] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_BloodType]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Staff] FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Authorizations] FOREIGN KEY([Authorization_ID])
REFERENCES [dbo].[Authorizations] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Authorizations]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Hospitals] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Hospitals]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_BloodType] FOREIGN KEY([Blood_ID])
REFERENCES [dbo].[BloodType] ([ID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_BloodType]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Hospitals] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Hospitals]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_BloodType] FOREIGN KEY([BloodID])
REFERENCES [dbo].[BloodType] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_BloodType]


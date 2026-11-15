USE CollegeDB;
GO

CREATE TABLE AppUser
(
    UserID       INT IDENTITY(1,1) PRIMARY KEY,
    UserName     VARCHAR(30)  NOT NULL UNIQUE,
    PasswordSalt VARCHAR(50)  NOT NULL,
    PasswordHash VARCHAR(100) NOT NULL,
    FullName     VARCHAR(50)  NOT NULL
);
GO

-- Sample passwords: admin = Admin@2025, aman = Aman@2025
INSERT INTO AppUser (UserName, PasswordSalt, PasswordHash, FullName) VALUES
('admin', 'P5ocJ+hbTWCi9xk8XosNFA==', 'lAhAKzsPWdvqBIgB5LChJoxlHcDSCJXkUAi80CtKA1U=', 'Administrator'),
('aman',  'px5cA7lPKNbhx6BZLzuORg==', 'h/L6x3Lte6ZAyeSZTy+YbdYPDeFMVBGfz3qtI1sdmyc=', 'Aman Verma');
GO

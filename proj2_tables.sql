
CREATE TABLE Locations (
ZipCode INTEGER not null,
City CHAR(20) NOT NULL,
State CHAR(20) NOT NULL,
primary key (ZipCode)
);

CREATE TABLE Persons (
SSN INTEGER,
LastName CHAR(20) NOT NULL,
FirstName CHAR(20) NOT NULL,
Address CHAR(20),
ZipCode INTEGER,
Telephone BIGINT,
PRIMARY KEY (SSN),
FOREIGN KEY (ZipCode) REFERENCES Locations (ZipCode)
ON DELETE NO ACTION
ON UPDATE CASCADE );


CREATE TABLE Employees (
EmployeeId INTEGER auto_increment,
SSN INTEGER,
StartDate DATE,
HourlyRate INTEGER,
PRIMARY KEY (EmployeeId),
FOREIGN KEY (SSN) REFERENCES Persons (SSN)
ON DELETE NO ACTION
ON UPDATE CASCADE );



CREATE TABLE Clients (
Email CHAR(32),
Rating INTEGER,
CreditCardNumber BIGINT,
ClientId INTEGER,
PRIMARY KEY (ClientId),
FOREIGN KEY (ClientId) REFERENCES Persons(SSN)
ON DELETE NO ACTION
ON UPDATE CASCADE );

CREATE TABLE Stocks (
StockSymbol CHAR(20) NOT NULL,
CompanyName CHAR(20) NOT NULL,
Type CHAR(20) NOT NULL,
PricePerShare DECIMAL(10, 2),
NumShare int,
PRIMARY KEY (StockSymbol));

CREATE TABLE Accounts (
AccountId INTEGER auto_increment,
DateOpened DATE,
ClientId INTEGER,
PRIMARY KEY (AccountId),
Stock char(20) NOT NULL,
NumShare int,
FOREIGN KEY (ClientId) REFERENCES Clients (ClientId)
ON DELETE NO ACTION ON UPDATE CASCADE,
FOREIGN KEY (Stock) REFERENCES Stocks (StockSymbol)
ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE Transactions (
TransactionId INTEGER auto_increment,
Fee DECIMAL(10,2),
DateTimes DATETIME,
PricePerShare DECIMAL(10,2),
PRIMARY KEY (TransactionId));

CREATE TABLE Orders(
NumShare INTEGER,
PricePerShare DECIMAL(10,2),
OrderId INTEGER auto_increment,
DateTime DATETIME,
Percentage int,
PriceType CHAR(50),
OrderType CHAR(50),
PRIMARY KEY (OrderId)
);




CREATE TABLE Trade (
AccountId INTEGER,
BrokerId INTEGER,
TransactionId INTEGER,
OrderId INTEGER,
StockId CHAR(20),
PRIMARY KEY (AccountId, BrokerId, TransactionId, OrderId, StockId),
FOREIGN KEY (AccountId) REFERENCES Accounts (AccountId)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (BrokerId) REFERENCES Employees (EmployeeId)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (TransactionID) REFERENCES Transactions (TransactionId)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (OrderId) REFERENCES Orders (OrderId)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (StockId) REFERENCES Stocks (StockSymbol)
ON DELETE NO ACTION
ON UPDATE CASCADE );

create Table Passwords(
PersonId integer default null,
Password VARCHAR(32) not null,
Role VARCHAR(100) not null,
userName varchar(100) not null unique
);


-- SET foreign_key_checks = 0;
-- 
-- SET foreign_key_checks = 1;




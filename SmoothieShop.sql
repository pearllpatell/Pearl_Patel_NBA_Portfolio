CREATE DATABASE Final_Project

CREATE TABLE Vendors
(VendorID				SMALLINT NOT NULL IDENTITY(1,1),
VendorName				VARCHAR(25) NOT NULL,
VendorDescription		VARCHAR(100) NOT NULL,

CONSTRAINT PK_Vendors_VendorID PRIMARY KEY ( VendorID ),
);
INSERT INTO Vendors ( VendorName, VendorDescription )
VALUES ( 'StrawberryBlond', 'She sells perfectly ripe strawberries at a reasonable price up on the hill' ),
              ( 'ProteinPete', 'He started a protein powder company after weightlifting 14 hours a day for 30 years' ),
              ( 'AcaiAbbigale', 'She imports Acai every Tuesday from her family farm' ),
              ( 'PeanutButterPhantom', 'He mills his own peanut butter from Scandinavian Peanuts' );

CREATE TABLE Season
( SeasonID				TINYINT NOT NULL IDENTITY(1,1),
[Year]					SMALLINT NOT NULL,
BeginDate				DATE NOT NULL,
EndDate					DATE NOT NULL,
CONSTRAINT PK_Season_SeasonID PRIMARY KEY ( SeasonID ),
);
INSERT INTO Season ( [Year], BeginDate, EndDate )
VALUES ('2022', '2022-03-20', '2022-06-21' ),
               ('2022', '2022-06-21', '2022-09-22' ),
               ('2021', '2022-03-20', '2022-06-21' ),
               ( '2021', '2022-06-21', '2022-09-22'  );


CREATE TABLE Ingredient
(IngredientID			SMALLINT NOT NULL IDENTITY(1,1),
VendorID				SMALLINT NOT NULL,
SeasonID				TINYINT NOT NULL,
IngredientName			VARCHAR(25) NOT NULL,
IngredientDescription	VARCHAR(100) NOT NULL,
SalesPrice				DECIMAL(5,2) NOT NULL,
CONSTRAINT Ingredient_IngredientID PRIMARY KEY ( IngredientID ),
CONSTRAINT Ingredient_VendorID FOREIGN KEY ( VendorID ) REFERENCES Vendors ( VendorID ),
CONSTRAINT Ingredient_SeasonID FOREIGN KEY ( SeasonID ) REFERENCES Season ( SeasonID )
);
INSERT INTO Ingredient ( VendorID, SeasonID, IngredientName, IngredientDescription, SalesPrice )
VALUES ( 1, 1, 'strawberry', 'triangular red fruit that are not actually berries', '10.08'),
( 2, 2, 'whey', 'liquid by-product of cheese production', '36.36'),
( 3, 3, 'acai', 'fruit from a palm with health benefits', '28.62'),
( 4, 4, 'peanutbutter', 'sweet and savory puree of peanuts', '6.82');

CREATE TABLE Customers
( CustomerID		INT NOT NULL IDENTITY(1,1),
CustomerFirstName	VARCHAR (25) NOT NULL,
CustomerLastName	VARCHAR (25) NOT NULL
CONSTRAINT Customers_CustomerID PRIMARY KEY (CustomerID)
);

INSERT INTO Customers (CustomerFirstName, CustomerLastName)
VALUES   ( 'Theo', 'James' ),
	   ( 'Theodore' , 'Roosevelt' ),
	   ( 'Janet' , 'Jackson' ),
	   ( 'Barbie' , 'Girl' ),
	   ( 'Ida', 'Mcgullin')

CREATE TABLE Employee
( EmployeeID			SMALLINT NOT NULL IDENTITY(1,1),
  SSN					CHAR(11) NOT NULL,
  EmployeeFirstName		VARCHAR(25) NOT NULL,
  EmployeeLastName		VARCHAR(25) NOT NULL,
  StreetAddress			VARCHAR(35) NOT NULL,
  City					VARCHAR(40) NOT NULL,
  [State]				CHAR(2) NOT NULL,
  ZipCode				VARCHAR(10) NOT NULL,
  Title					VARCHAR(25) NOT NULL,
  Salary				DECIMAL(8,2) NOT NULL,
  EmailAddress			VARCHAR(254) NOT NULL,
  PhoneNumber			VARCHAR(20) NOT NULL, 
CONSTRAINT Employee_EmployeeID PRIMARY KEY (EmployeeID)
);

INSERT INTO Employee ( SSN, EmployeeFirstName, EmployeeLastName, StreetAddress, City, [State], ZipCode, Title, Salary, EmailAddress, PhoneNumber )
VALUES   ( '457-23-5705', 'Doug' , 'McIntire','34 Jackson Ave', 'Aurora', 'IL', '34993' , 'Manager', 39000, 'Dougie12@gmail.com', ' (217) 987-8901' ),
	   ('336-99-3406', 'Mary', 'Smith', '1491 S 456 W' ,'Montgomery', 'IL', '34875',  'Assistant Manager', 31000, 'marysmith9@yahoo.com', '(217) 991-7126' ),
	   ('344-89-9903', 'Jackie', 'Kelso', '25th South St.', 'Aurora', 'IL', '34993', 'Smoothie Entrepreneur', 20000, 'Jackieluv@msn.com' , '(227) 997-1267'),
	  ('414-23-8903', 'Billy', 'Mann', '349 W 2890 N', 'Mooseheart', 'IL', '33890', 'Smoothie Entrepreneur', 18000, 'BillyBob90@gmail.com', '(327) 456-9876')

CREATE TABLE Smoothie
( SmoothieID	SMALLINT NOT NULL IDENTITY (1,1)	,
  SmoothieName	VARCHAR(50),
  SmoothieDescription	VARCHAR(100),
CONSTRAINT Smoothie_SmoothieID PRIMARY KEY (SmoothieID )
);
INSERT INTO Smoothie ( SmoothieName, SmoothieDescription )
VALUES ('Radical Raspberry Roiling Boil','Raspberry and boiled gold, shaken not stirred' ),
('Peanut Butter Priestly Pancetta','Peanut butter, banana, honey, and bacon' ),
('Apple the Awesome Alligator','Apple, applesauce, amaranth leaves, and avocado' ),
('Greek Yogurt Meets Your Mother','Greek yogurt, banana, cacao nibs, chocolate almond milk, and peanut butter' );
SELECT * FROM Smoothie

CREATE TABLE Orders
( OrderID				INT NOT NULL IDENTITY(1,1),
  CustomerID			INT NOT NULL,
  SeasonID				TINYINT NOT NULL,
  EmployeeID			SMALLINT NULL,
  SmoothieID			SMALLINT NOT NULL,
  OrderDate				DATE NOT NULL,
  OrderTime				TIME NOT NULL,
 CONSTRAINT Orders_OrderID PRIMARY KEY ( OrderID ),
 CONSTRAINT Orders_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID ),
 CONSTRAINT Orders_SeasonID FOREIGN KEY ( SeasonID ) REFERENCES Season ( SeasonID ),
 CONSTRAINT Orders_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employee ( EmployeeID ),
 CONSTRAINT Orders_SmoothieID FOREIGN KEY ( SmoothieID ) REFERENCES Smoothie ( SmoothieID )
 );

INSERT INTO Orders ( CustomerID, SeasonID, SmoothieID, OrderDate, OrderTime )
VALUES ( 1, 1, '4', '2022-04-15', '01:01:01'),
( 2, 2, '2', '2022-07-04', '22:22:22'),
( 3, 3, '3', '2021-04-07', '12:34:56'),
( 4, 4, '1', '2021-07-23', '23:59:00');

CREATE TABLE Payments
(	PaymentID			INT NOT NULL  IDENTITY(1,1),
	OrderID				INT NOT NULL,
	PaymentMethod		VARCHAR(20) NOT NULL,
	Price				DECIMAL(7,2) NOT NULL,
	CreditCardNumber	BIGINT DEFAULT NULL,
CONSTRAINT Payments_PaymentID PRIMARY KEY ( PaymentID ),
CONSTRAINT Payments_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID )
);

INSERT INTO Payments ( OrderID, PaymentMethod, Price, CreditCardNumber )
VALUES ( 11, 'CreditCard', '200.52', '1234567891011'),
( 12, 'Cash', '2.00', NULL),
(13, 'Cash', '23.77', NULL),
( 14, 'Coins', '123.82', NULL);


CREATE TABLE ToGo
( OrderID		INT NOT NULL IDENTITY (1,1)	,
  PickUpTime	VARCHAR(10),
  DeliveryType	TIME,
CONSTRAINT ToGo_OrderID PRIMARY KEY ( OrderID )
);

INSERT INTO ToGo ( PickUpTime, DeliveryType )
VALUES ( '4:43:48', 'Curbside' ),
( '12:33:28', 'Counter ' );


CREATE TABLE Smoothie_AddIns
(	AddInsID		SMALLINT,
	SmoothieID		SMALLINT,	
	OrderID			INT,
	AddInQuantity	TINYINT
CONSTRAINT Smoothie_AddIns_AddInsID PRIMARY KEY (AddInsID )
CONSTRAINT Smoothie_AddIn_SmoothieID FOREIGN KEY ( SmoothieID ) REFERENCES Smoothie ( SmoothieID ),
CONSTRAINT Smoothie_AddIn_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID ),
);

INSERT INTO Smoothie_AddIns ( AddInsID, SmoothieID, OrderID, AddInQuantity)
VALUES ('1','2','11','2'),
	('4','3','12','3'),
	('3', '4','13','4'),
	('2','1','14','3')


CREATE TABLE AddIn
(	AddInsID					SMALLINT,
	AddInFee					TINYINT,	
	AddInDescription			VARCHAR(25),
CONSTRAINT PK_AddIn_AddInsID PRIMARY KEY (AddInsID )
);
INSERT INTO AddIn ( AddInsID, AddInFee, AddInDescription)
VALUES   ('1','1','Greek Yogurt'),
  ('2','1','Coconut Oil'),
   ('3','1', 'Avocado'),
   ('4','12','Goji Berries')




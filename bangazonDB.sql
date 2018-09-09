DELETE FROM Training;
DELETE FROM Computer;
DELETE FROM Department;
DELETE FROM Customer;
DELETE FROM Product_Type;
DELETE FROM Product;
DELETE FROM Employee;
DELETE FROM "Order";
DELETE FROM Payment_Type;
DELETE FROM "Employee-Computer";
DELETE FROM "Department-Supervisor";
DELETE FROM "Product-Order";
DELETE FROM "Employee-Training";


DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Payment_Type;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product_Type;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS "Order";
DROP TABLE IF EXISTS Payment_Type;
DROP TABLE IF EXISTS "Employee-Computer";
DROP TABLE IF EXISTS "Department-Supervisor";
DROP TABLE IF EXISTS "Product-Order";
DROP TABLE IF EXISTS "Employee-Training";


CREATE TABLE "Training" (
    "TrainingId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "StartDate" DATE NOT NULL,
    "EndDate" DATE NOT NULL,
    "MaxCapacity" INTEGER NOT NULL,
    "Name" TEXT NOT NULL
);

CREATE TABLE "Computer" (
    "ComputerId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "PurchaseDate" DATE NOT NULL,
    "DecommissionDate" DATE NOT NULL,
    "isWorking" BOOLEAN NOT NULL
);

CREATE TABLE "Department" (
    "DepartmentId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Budget" INTEGER NOT NULL,
    "Name" TEXT NOT NULL
);

CREATE TABLE "Customer" (
    "CustomerId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "DateCreated" DATE NOT NULL
);

CREATE TABLE "Product_Type" (
    "ProductTypeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "TypeName" TEXT NOT NULL
);

CREATE TABLE "Product" (
    "ProductId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ProductTypeId" INTEGER NOT NULL,
    "Price" FLOAT NOT NULL,
    "Title" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "CustomerId" INTEGER NOT NULL,
    FOREIGN KEY
("ProductTypeId") REFERENCES "Product_Type"
("ProductTypeId"),
    FOREIGN KEY
("CustomerId") REFERENCES "Customer"
("CustomerId")
);

CREATE TABLE "Employee" (
    "EmployeeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "DepartmentId" INTEGER NOT NULL,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    FOREIGN KEY
("DepartmentId") REFERENCES "Department"
("DepartmentId")
);

CREATE TABLE "Payment_Type" (
    "PaymentTypeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "AccountNumber" INTEGER NOT NULL,
    "TypeName" TEXT NOT NULL,
    "CustomerId" INTEGER NOT NULL,
    FOREIGN KEY
("CustomerId") REFERENCES "Customer"
("CustomerId")
);

CREATE TABLE "Employee-Computer" (
    "Employee-ComputerId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "EmployeeId" INTEGER NOT NULL,
    "ComputerId" INTEGER NOT NULL,
    "StartDate" DATE NOT NULL,
    "EndDate" DATE NOT NULL,
    FOREIGN KEY
("EmployeeId") REFERENCES "Employee"
("EmployeeId"),
    FOREIGN KEY
("ComputerId") REFERENCES "Computer"
("ComputerId")
);

CREATE TABLE "Department-Supervisor" (
    "Department-SupervisorId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "EmployeeId" INTEGER NOT NULL,
    "DepartmentId" INTEGER NOT NULL,
    FOREIGN KEY
("EmployeeId") REFERENCES "Employee"
("EmployeeId"),
    FOREIGN KEY
("DepartmentId") REFERENCES "Department"
("DepartmentId")
);

CREATE TABLE "Order" (
    "OrderId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "PaymentTypeId" INTEGER NOT NULL,
    "CustomerId" INTEGER NOT NULL,
    FOREIGN KEY
("PaymentTypeId") REFERENCES "Payment_Type"
("PaymentTypeId"),
    FOREIGN KEY
("CustomerId") REFERENCES "Customer"
("CustomerId")
);

CREATE TABLE "Product-Order" (
    "Product-OrderId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "OrderId" INTEGER NOT NULL,
    "ProductId" INTEGER NOT NULL,
    FOREIGN KEY
("OrderId") REFERENCES "Order"
("OrderId"),
    FOREIGN KEY
("ProductId") REFERENCES "Product"
("ProductId")
);

CREATE TABLE "Employee-Training" (
    "Employee-TrainingId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "EmployeeId" INTEGER NOT NULL,
    "TrainingId" INTEGER NOT NULL,
    FOREIGN KEY
("EmployeeId") REFERENCES "Employee"
("EmployeeId"),
    FOREIGN KEY
("TrainingId") REFERENCES "Training"
("TrainingId")
);

INSERT INTO Training
VALUES
    (null, 1998-04-04, 1998-06-04, 30, "Brett Snorting Training");
INSERT INTO Training
VALUES
    (null, 1998-10-16, 1998-12-16, 29, "Austin Angry Face Training");
INSERT INTO Computer
VALUES
    (null, 1998-04-04, 1998-06-04, 1);
INSERT INTO Computer
VALUES
    (null, 1998-04-04, 1998-06-04, 2);
INSERT INTO Department
VALUES
    (null, 3549302, "Ding Dong");
INSERT INTO Department
VALUES
    (null, 53582305, "Shame");
INSERT INTO Customer
VALUES
    (null, "Jenn", "Lawson", 1998-03-25);
INSERT INTO Customer
VALUES
    (null, "Alejandro", "Font", 1998-05-30);
INSERT INTO Product_Type
VALUES
    (null, "Electronic");
INSERT INTO Product_Type
VALUES
    (null, "Firearm");
INSERT INTO Product
VALUES
    (null, 1, 123.32, "Laptop", "big description", 3, 1);
INSERT INTO Product
VALUES
    (null, 2, 543.35, "1941 Luger", "Brett likes this", 1, 2);
INSERT INTO Employee
VALUES
    (null, 2, "Brett", "Shearin");
INSERT INTO Employee
VALUES
    (null, 1, "Jack", "Bob");
INSERT INTO Payment_Type
VALUES
    (null, 123456789, "Visa", 1);
INSERT INTO Payment_Type
VALUES
    (null, 234214702, "Western Union", 2);
INSERT INTO "Employee-Computer"
VALUES
    (null, 1, 2, 2005-12-05, 2008-06-25);
INSERT INTO "Employee-Computer"
VALUES
    (null, 2, 1, 2008-06-25, 2012-01-20);
INSERT INTO "Department-Supervisor"
VALUES
    (null, 1, 1);
INSERT INTO "Order"
VALUES
    (null, 1, 2);
INSERT INTO "Order"
VALUES
    (null, 2, 1);
INSERT INTO "Product-Order"
VALUES
    (null, 2, 2);
INSERT INTO "Product-Order"
VALUES
    (null, 1, 1);
INSERT INTO "Employee-Training"
VALUES
    (null, 1, 2);
INSERT INTO "Employee-Training"
VALUES
    (null, 2, 1);

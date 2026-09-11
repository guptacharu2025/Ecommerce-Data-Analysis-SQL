create database db_ecommerce;

use db_ecommerce; 

create table customers (
    customerid varchar(10) primary key,
    companyname varchar(100),
    contactname varchar(100),
    contacttitle varchar(100),
    address varchar(200),
    city varchar(50),
    region varchar(50),
    postalcode varchar(20),
    country varchar(50),
    phone varchar(50),
    fax varchar(50)
);

insert into customers values
('alfki','alfreds futterkiste','maria anders','sales representative','obere str. 57','berlin',null,'12209','germany','030-0074 321','030-0076 545'),
('anatr','ana trujillo emparedados y helados','ana trujillo','owner','avda. de la constitución 2222','méxico d.f.',null,'5021','mexico','(5) 555-4729','(5) 555-3745'),
('anton','antonio moreno taquería','antonio moreno','owner','mataderos 2312','méxico d.f.',null,'5023','mexico','(5) 555-3932',null),
('arout','around the horn','thomas hardy','sales representative','120 hanover sq.','london',null,'wa1 1dp','uk','(171) 555-7788','(171) 555-6750'),
('bergs','berglunds snabbköp','christina berglund','order administrator','berguvsvägen 8','luleå',null,'s-958 22','sweden','0921-12 34 65','0921-12 34 67');

create table order_details (
    orderid int,
    productid int,
    unitprice decimal(10,2),
    quantity int,
    discount decimal(5,2),
    primary key(orderid, productid)
);

insert into order_details values
(10248,11,14.0,12,0),
(10248,42,9.8,10,0),
(10248,72,34.8,5,0),
(10249,14,18.6,9,0),
(10249,51,42.4,40,0),
(10250,41,7.7,10,0),
(10250,51,42.4,35,0.15),
(10250,65,16.8,15,0.15),
(10251,22,16.8,6,0.05),
(10251,57,15.6,15,0.05);

create table supplier (
    supplierid int primary key,
    companyname varchar(100),
    contactname varchar(100),
    contacttitle varchar(100),
    address varchar(200),
    city varchar(50),
    region varchar(50),
    postalcode varchar(20),
    country varchar(50),
    phone varchar(50),
    fax varchar(50)
);

insert into supplier values
(1,'exotic liquids','charlotte cooper','purchasing manager','49 gilbert st.','london',null,'ec1 4sd','uk','(171) 555-2222',null),
(2,'new orleans cajun delights','shelley burke','order administrator','p.o. box 78934','new orleans','la','70117','usa','(100) 555-4822',null),
(3,'grandma kelly''s homestead','regina murphy','sales representative','707 oxford rd.','ann arbor','mi','48104','usa','(313) 555-5735','(313) 555-3349'),
(4,'tokyo traders','yoshi nagase','marketing manager','9-8 sekimai musashino-shi','tokyo',null,'100','japan','(03) 3555-5011',null),
(5,'cooperativa de quesos ''las cabras''','antonio del valle saavedra','export administrator','calle del rosal 4','oviedo','asturias','33007','spain','(98) 598 76 54',null),
(6,'heli süßwaren gmbh & co. kg','petra winkler','sales manager','tiergartenstraße 5','berlin',null,'10785','germany','(010) 9984510',null),
(7,'pavlova, ltd.','ian devling','marketing manager','74 rose st. moonie ponds','melbourne','victoria','3058','australia','(03) 444-2343','(03) 444-6588'),
(8,'specialty biscuits, ltd.','peter wilson','sales representative','29 king''s way','manchester',null,'m14 gsd','uk','(161) 555-4448',null),
(9,'pb knäckebröd ab','lars peterson','sales agent','kaloaadagatan 13','göteborg',null,'s-345 67','sweden','031-987 65 43','031-987 65 91'),
(10,'refrescos americanas ltda','carlos diaz','marketing manager','av. das americanas 12.890','são paulo',null,'5442','brazil','(11) 555 4640',null);

create table product (
    productid int primary key,
    productname varchar(100),
    supplierid int,
    categoryid int,
    quantityperunit varchar(100),
    unitprice decimal(10,2),
    unitsinstock int,
    unitsonorder int,
    reorderlevel int,
    discontinued int
);

insert into product values
(1,'chai',1,1,'10 boxes x 20 bags',18,39,0,10,0),
(2,'chang',1,1,'24 - 12 oz bottles',19,17,40,25,0),
(3,'aniseed syrup',1,2,'12 - 550 ml bottles',10,13,70,25,0),
(4,'chef anton''s cajun seasoning',2,2,'48 - 6 oz jars',22,53,0,0,0),
(5,'chef anton''s gumbo mix',2,2,'36 boxes',21.35,0,0,0,1),
(6,'grandma''s boysenberry spread',3,2,'12 - 8 oz jars',25,120,0,25,0),
(7,'uncle bob''s organic dried pears',3,4,'12 - 1 lb pkgs.',30,15,0,10,0),
(8,'northwoods cranberry sauce',3,2,'12 - 12 oz jars',40,6,0,0,0),
(9,'mishi kobe niku',4,6,'18 - 500 g pkgs.',97,29,0,0,1),
(10,'ikura',4,5,'12 - 200 ml jars',31,31,0,0,0);

 create table categories (
    categoryid int primary key,
    categoryname varchar(50),
    description varchar(255)
);

insert into categories values
(1,'beverages','soft drinks, coffees, teas, beers, and ales'),
(2,'condiments','sweet and savory sauces, relishes, spreads, and seasonings'),
(3,'confections','desserts, candies, and sweet breads'),
(4,'dairy products','cheeses'),
(5,'grains/cereals','breads, crackers, pasta, and cereal'),
(6,'seafood','seaweed and fish');
select * from product;
select * from categories;
select * from supplier;
select * from customers;
select * from order_details;



-- 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select categoryname, description from categories order by categoryname;

-- 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select contactname, companyname, contactname, contacttitle, phone from customers order by phone;

-- 3. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(customerid) as ID from customers ;

-- 4. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in 
-- descending order then by CompanyName in ascending order.
select companyname, fax, phone, country, address from supplier order by country desc, companyname asc;

-- 5. Create a report that shows CompanyName, ContactName of all customers from select * from 'buenos aried'  only.
select companyname, contactname from customers where contactname = "Buenos Aried";

-- 6. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select productname, unitprice, quantityperunit from product where unitsinstock = 0;

-- 7. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select contactname, address, city from customers where city not in ("germany", "mexico", " spain");

-- 8. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select city, companyname, contactname from customers where city like "A%" or city like "B%";

-- 9. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
select productname, unitsinstock, UnitsOnOrder, ReorderLevel from product where unitsinstock <= unitsonorder;

-- 10. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
select companyname, contactname, phone from customers where fax is null;

-- 11. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
select CompanyName, ContactName, Fax from customers where fax is null order by contactname;

-- . Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
select City, CompanyName, ContactName from customers where city like "%l%" order by contactname;

-- 13. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by
--  NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
select orderid, count(orderid) as NumberofOrders from order_details group by orderid order by NumberofOrders desc;

-- 14. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits,
--  Ltd., Escargots Nouveaux sorted by the supplier ID.
select s.SupplierID, p.ProductName, s.CompanyName from product p join supplier s on p.supplierid = s.supplierid where companyname in 
( "Exotic Liquids", "Specialty Biscuits Ltd.", "Escargots Nouveaux") order by supplierid asc;

-- 15. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has  no "Sales" in their ContactTitle.
select ContactName, ContactTitle, CompanyName from customers where contacttitle <> "sales";

-- 16. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain 
-- other than Madrid.
select  CompanyName, ContactTitle, City, Country from customers where city in ("mexico", "spain", "marid");
-- 17. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select contactname from customers where contactname not like "_a%";

-- 18. Create a report that shows the average UnitPrice rounded to the next whole number, total price of
-- UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
select round(avg(unitprice)) as AveragePrice, sum(unitsinstock) as totalstock, max(unitsonorder) from product;

-- 19. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and 
-- categories table.
select s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, UnitPrice from  product p join supplier s on p.supplierid = s.supplierid
join categories c on p.categoryid = c.categoryid;
-- 20. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and maximunprice
-- respectively.
select avg(unitprice) as AveragePrice, max(UnitPrice) as MinimumPrice, min(UnitPrice) as maximunprice from product;

-- 21. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, 
-- UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View
create view ProductDetails as select p.ProductID,s. CompanyName, p.ProductName, c.CategoryName, c.Description, p.QuantityPerUnit, 
p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued from  supplier s join product p on s.supplierid = p.supplierid
join categories c on p.categoryid = c.categoryid;
select * from ProductDetails;

-- 22. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo.
select left(categoryname, 5) as shortinfo from categories;

-- 23. Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
select s.CompanyName, p.productname, c.categoryname from product p join categories c on p.categoryid = c.categoryid join supplier s on 
s.supplierid = p.supplierid where categoryname = "seafood";

-- 24. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select s.CompanyName, p.productname, c.categoryname from product p join categories c on p.categoryid = c.categoryid join supplier s on 
s.supplierid = p.supplierid where c.categoryid = 5;

-- 25. Create a select statement that outputs the following from the product table.
select CONCAT(ProductName, ' weighs is ', QuantityPerUnit, ' and cost $', UnitPrice) AS ProductInfo FROM Product;
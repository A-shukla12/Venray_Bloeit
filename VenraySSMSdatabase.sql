
--if object_id('tempdb..Customers') is not null
	--drop table Customers

create table Customers
(
Cust_ID integer,
First_Name varchar(60) not null,
Last_Name varchar(60) not null,
Email varchar(60) not null,
Password varchar(60) not null,
Phone varchar(60) not null,
Venray_Bloeit_User varchar(20) not null,
Type_User varchar(40) not null,
Card_No varchar(60) not null,
App_Code_User varchar(60)


constraint pk_cust
	primary key (Cust_ID)
);

create table Events
(
Event_ID integer,
Month varchar(60) not null,
Days varchar(60),
Year varchar(60) not null,
Event_Desc varchar(60) not null,
Location varchar(60) not null,
Organization varchar(60),
Audience varchar(60) not null,

constraint pk_event
	primary key (Event_ID)

);

create table Stores
(
Store_ID integer,
Store_Name varchar(60) not null,
Store_Category varchar(60) not null

constraint pk_store
	primary key (Store_ID)
);


Create Table Discount
(
Discount_ID int not null,
Discount_Percent int not null,
Discount_Code varchar(60) not null,
Store_ID int not null,
Discount_Item varchar(60) not null,
Discount_Desc varchar(60) not null,


constraint pk_disc
	primary key (Discount_ID),
constraint fk_discountstore 
	foreign key(Store_ID) 
	references Stores(Store_ID)
);


create table Sales
(
Sales_ID integer,
Store_ID integer,
Discount_ID integer,
Cust_ID integer,
Code_Item varchar(60) not null,
Discount_Code varchar(60),
Amount_Desc varchar(60),
Item_Price integer not null,
No_Of_Items integer not null,
Orginial_Price integer not null,
Total_Price float not null,
Sale_Date date not null,

constraint pk_sale
	primary key (Sales_ID),
constraint fk_salesstore 
	foreign key(Store_ID) references Stores(Store_ID),
constraint fk_salesdiscount 
	foreign key(Discount_ID) references Discount(Discount_ID),
constraint fk_salescust 
	foreign key(Cust_ID) references Customers(Cust_ID)
);


insert into Customers values (1, 'Yes', 'VenrayCard', 'Mario', 'Speedwagon', 'mariorocks121@gmail.com', 'opiwjr@1240', '622651461', '78 6229 5691 73', NULL);
insert into Customers values (2, 'Yes', 'VenrayCard', 'Petey', 'Cruiser', 'crioswager11@gmail.com', 'iamthebest1201', '614428485', '21 5588 9712 21', NULL);
insert into Customers values (3, 'Yes', 'VenrayCard', 'Anna', 'Sthesia', 'annaN@gmail.com', 'poiurwq@&', '634325247', '70 7270 7731 88', NULL);
insert into Customers values (4, 'Yes', 'VenrayCard', 'Paul', 'Molive', 'paul_molive@gmail.com', 'iwantpizza', '663993891', '28 2773 7692 30', NULL);
insert into Customers values (5, 'Yes', 'VenrayCard', 'Anna', 'Mull', 'an_naa@gmail.com', '@maygodbewithall', '612308964', '32 8969 4593 11', NULL);


insert into Events values (1, '09', '5', '2020', 'Volunteer and Internship Market Match & RaaylandCollege', 'Schouwburgplein Venray', 'Match Foundation for volunteers', 'Young Adult');
insert into Events values (2, '09', '5 to 8' , '2020', 'Fair', 'Foal', NULL, 'General');
insert into Events values (3, '09', '6', '2020', 'Carpush Foal', 'Veulenseweg 49 Foal', 'Café room t Veule', '18+ event');
insert into Events values (4, '09', '11 to 15', '2020', 'Fair Oostrum', 'Tent at t Allemans café' ,'t Allemanscafé', 'General');
insert into Events values (5, '09', '11 to 13', '2020', 'Gusting Craft Beer Festival', 'Henseniusplein Venray', 'Desiring', '18+ event');


insert into Stores values (1, 'Albert Heijn', 'Groceries'); 
insert into Stores values (2, 'Van Dam', 'Groceries'); 
insert into Stores values (3, 'Etos', 'Health&Beauty');
insert into Stores values (4, 'Kruidvat', 'Health&Beauty');
insert into Stores values (5, 'Hema', 'Health&Beauty');


insert into Discount values (1, 33, 2944533568, 1, 'Bread', '3 for 2');
insert into Discount values (2, 25, 5456173342, 2, 'Fruit', '25% off on all fruit');
insert into Discount values (3, 10, 5746219432, 3, 'Body care', '10% off on all body care');
insert into Discount values (4, 50, 4401029378, 4, 'Maybeline', 'Second item of Maybeline for free');
insert into Discount values (5, 33, 3228763878, 5, 'Rookworst', '3 for 2');


insert into Sales values (1,1,1,1, '57643161', '4349084959', 33, 15, 2, 30, 20.10, '2020-01-20');
insert into Sales values (2,2,2,2, '53349756', '466572347', 25, 57, 4, 228, 171.00, '2020-01-28');
insert into Sales values (3,3,3,3, '51875475', '6857295038', 10, 22, 8, 176, 158.40, '2020-01-31');
insert into Sales values (4,4,4,4, '26774065', '8838975856', 50, 36, 7, 252, 126.00, '2020-01-24');
insert into Sales values (5,5,5,5, '75470803', '5490308839', 33, 73, 9, 657, 440.19, '2020-01-06');

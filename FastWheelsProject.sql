create database FastWheels;
use FastWheels;

create table Driver(
driverID int(8) primary key,
name varchar(30),
contactNo varchar(50),
DrivingLicenseNo varchar(30),
insuranceNo varchar(30)
);

create table Passenger(
passengerID int(8) primary key,
 name varchar(30),
 CardDetails varchar(40),
 NoOfPassengers int
 );

create table DriverSchedule(
ScheduleID int primary key,
WorkingDate date,
StartTime varchar(10),
EndTime varchar(10),
Status varchar(20)
);

create table Payment(
paymentID int primary key,
receivingMethod varchar(20),
amount int,
payingMethod varchar(20)
);

create table Vehicle(
vehicleID int primary key,
Name varchar(20),
Type varchar(20),
NoOfSeats int
);

create table VehicleMaintenance(
SerialNo int primary key,
DateOfMaintenance date,
TypeOfMaintenance varchar(20),
DescriptionOfWork varchar(255),
cost int,
NextDate date
);

create table Location(
locationID int primary key,
PickupLocation varchar(30),
Destination varchar(30)
);

create table Promotion(
PromoSerial int primary key,
PromoCode varchar(10),
ExpirationDate date
);

create table PaymentDetails(
SerialNo int primary key,
discountedAmount int,
OverTimePrice int,
TotalPrice int
);

create table Rating(
RateID int primary key,
driverRating decimal,
passengerRating decimal,
UserGeneralRating decimal
);

create table Feedback(
FeedbackNo int primary key,
rideSpecificFeedback varchar(255),
generalUserFeedback varchar(255)
);

create table User(
UserID int primary key,
UserName varchar(20)
);

create table SupportRequest(
RequestID int primary key,
IssueDescription varchar(255)
);

create table Ride(
RideID int primary key,
RideStatus varchar(20)
);


alter table Ride
add column RideDate date;



alter table Ride
add column DriverID int(8);      -- Adding Driver id as foreign key in Ride Table
alter table Ride
add foreign key(DriverID)
references Driver(DriverID);

alter table Ride
add column PassengerID int(8);
alter table Ride                    -- Adding Passenger id as Foreign key in Ride Table
add foreign key(PassengerID)
references Passenger(PassengerID);

alter table Ride
add column PaymentDetail int;
alter table Ride                     -- Adding Payment Detail as Foreign key in Ride Table
add foreign key(PaymentDetail)
references PaymentDetails(SerialNo);

alter table Ride
add column LocationID int;
alter table Ride                     -- Adding Location id as Foreign key in Ride Table
add foreign key(LocationID)
references Location(LocationID);

alter table Ride
add column FeedbackNo int;
alter table Ride                    -- Adding Feedback No. as Foreign key in Ride Table
add foreign key(FeedbackNo)
references Feedback(FeedbackNo);

alter table DriverSchedule
add column DriverID int(8);
alter table DriverSchedule          -- Adding Driver id as Foreign key in DriverSchedule Table
add foreign key(DriverID)
references Driver(DriverID);

alter table Payment
add column DriverID int(8);
alter table Payment                 -- Adding Driver id as Foreign key in Payment Table
add foreign key(DriverID)
references Driver(DriverID);

alter table Payment
add column PassengerID int(8);        -- Adding Passenger id as Foreign key in Payment Table
alter table Payment
add foreign key(PassengerID)
references Passenger(PassengerID);

alter table PaymentDetails
add column PaymentID int;
alter table PaymentDetails            -- Adding Payment id as Foreign key in PaymentDetails Table
add foreign key(PaymentID)
references Payment(PaymentID);

alter table PaymentDetails
add column PromoSerial int;
alter table PaymentDetails          -- Adding Promo Serial as Foreign key in PaymentDetails Table
add foreign key(PromoSerial)
references Promotion(PromoSerial);

alter table Location
add column PassengerID int(8);
alter table Location                -- Adding Passenger id as Foreign key in Location Table
add foreign key(PassengerID)
references Passenger(PassengerID);


alter table VehicleMaintenance
add column VehicleID int;
alter table VehicleMaintenance      -- Adding Vehicle id as Foreign key in VehicleMaintenance Table
add foreign key(VehicleID)
references Vehicle(VehicleID);

alter table SupportRequest
add column UserID int;
alter table SupportRequest        -- Adding user id as Foreign key in SupportRequest Table
add foreign key(UserID)
references User(UserID);

alter table Rating
add column DriverID int(8);      
alter table Rating              -- Adding Driver id as Foreign key in Rating Table
add foreign key(DriverID)
references Driver(DriverID);

alter table Rating
add column PassengerID int(8);
alter table Rating                 -- Adding Passenger id as Foreign key in Rating Table
add foreign key(PassengerID)
references Passenger(PassengerID);

alter table Rating
add column UserID int;
alter table Rating               -- Adding user id as Foreign key in Rating Table
add foreign key(UserID)
references User(UserID);

alter table Feedback
add column UserID int;
alter table Feedback          -- Adding user id as Foreign key in Feedback Table
add foreign key(UserID)
references User(UserID);

alter table Feedback
add column PassengerID int(8);
alter table Feedback                -- Adding Passenger id as Foreign key in Feedback Table
add foreign key(PassengerID)
references Passenger(PassengerID);

alter table Driver
add column VehicleID int;
alter table Driver                 -- Adding Vehicle id as Foreign key in Driver Table
add foreign key(VehicleID)
references Vehicle(VehicleID);


alter table user
add column passengerID int;
alter table user 
add column DriverID int;
alter table user
add foreign key(passengerID)             -- Adding DriverID and PassengerID as Foreign key in user Table
references Passenger(PassengerID);
alter table user
add foreign key(DriverID)
references Driver(DriverID);


show tables;

describe Vehicle;
insert into Vehicle
values
(1,'Car1', 'Sedan', 4),
(2,'Car2', 'SUV', 6),
(3,'Car3', 'Hatchback', 5),
(4,'Car4', 'Van', 8),
(5,'Car5', 'Convertible', 2);


describe Driver;
insert into Driver
values
(1, 'Ali', "03001234567", 'DL12345', 'INS12345', 1),
(2, 'Ahmed', "03001234568", 'DL12346', 'INS12346', 2),
(3, 'Hassan', "03001234569", 'DL12347', 'INS12347', 3),
(4, 'Fatima', "03001234570", 'DL12348', 'INS12348', 4),
(5, 'Ayesha', "03001234571", 'DL12349', 'INS12349', 5);


describe Passenger;

insert into Passenger
values
(1, 'Muhammad', '1234 5678 9012 3456', 1),
(2, 'Aisha', '2345 6789 0123 4567', 2),
(3, 'Usman', '3456 7890 1234 5678', 3),
(4, 'Sana', '4567 8901 2345 6789', 1),
(5, 'Abdullah', '5678 9012 3456 7890', 2);


describe DriverSchedule;
insert into DriverSchedule
values
(1,'2024-05-21', '08:00', '17:00', 'Active', 1),
(2,'2024-05-22', '09:00', '18:00', 'Active', 2),
(3,'2024-05-23', '07:00', '16:00', 'Active', 3),
(4,'2024-05-24', '10:00', '19:00', 'Active', 4),
(5,'2024-05-25', '11:00', '20:00', 'Active', 5);

describe Payment;
insert into Payment
values
(1,'Cash', 2000, 'Cash', 1, 1),
(2,'Credit Card', 1500, 'Card', 2, 2),
(3,'Cash', 1800, 'Cash', 3, 3),
(4,'Credit Card', 2200, 'Card', 4, 4),
(5,'Cash', 2500, 'Cash', 5, 5);


describe VehicleMaintenance;

insert into VehicleMaintenance
values
(1,'2024-05-19', 'Regular Checkup', 'Oil Change and Brake Inspection', 100, '2024-11-19', 1),
(2,'2024-05-20', 'Major Repair', 'Engine Overhaul', 1500, '2025-05-20', 2),
(3,'2024-05-21', 'Regular Checkup', 'Tire Rotation and Alignment', 80, '2024-11-21', 3),
(4,'2024-05-22', 'Minor Repair', 'Replace Spark Plugs', 200, '2024-11-22', 4),
(5,'2024-05-23', 'Regular Checkup', 'Fluid Top-up', 50, '2024-11-23', 5);


insert into Location 
values
(1,'Lahore', 'Islamabad', 1),
(2,'Karachi', 'Hyderabad', 2),
(3,'Rawalpindi', 'Faisalabad', 3),
(4,'Quetta', 'Peshawar', 4),
(5,'Multan', 'Sialkot', 5);

describe Promotion;
insert into Promotion 
values
(1,'PROMO1', '2024-06-30'),
(2,'PROMO2', '2024-07-31'),
(3,'PROMO3', '2024-08-31'),
(4,'PROMO4', '2024-09-30'),
(5,'PROMO5', '2024-10-31');


describe PaymentDetails;
insert into PaymentDetails 
values
(1,1800, 0, 1800, 1, 1),
(2,1500, 0, 1500, 2, 2),
(3,1800, 0, 1800, 3, 3),
(4,2200, 0, 2200, 4, 4),
(5,2500, 0, 2500, 5, 5);

describe User;
insert into User 
values
(1,'Mubashir',1,null),
(2,'Fatima',2,null),
(3,'Ali',3,null),
(4,'Mustafa',4,null),
(5,'Haroon',5,null),
(6,'Haider',null,1),
(7,'Salman',null,2),
(8,'Ayesha',null,3),
(9,'Asad',null,4),
(10,'Afzal',null,5);


describe Rating;
insert into Rating 
values
(1,5, 5, 5, 1, 1, 1),
(2,4, 5, 5, 2, 2, 2),
(3,5, 5, 5, 3, 3, 3),
(4,3, 4, 5, 4, 4, 4),
(5,5, 5, 5, 5, 5, 5);


describe Feedback;

insert into Feedback 
values
(1,'Smooth ride, courteous driver.', 'Overall great experience.', 1, 1),
(2,'Driver arrived late.', 'Vehicle was clean and comfortable.', 2, 2),
(3,'Driver was professional and polite.', 'Satisfied with the service.', 3, 3),
(4,'Vehicle had an issue during the ride.', 'Would appreciate better maintenance.', 4, 4),
(5,'Excellent service, will recommend.', 'No complaints.', 5, 5);


insert into SupportRequest 
values
(1,'Payment issue', 1),
(2,'Lost item in vehicle', 2),
(3,'Driver behavior concern', 3),
(4,'Lost item in vehicle', 4),
(5,'Vehicle cleanliness issue', 5);

insert into Ride
values
(1, 'Completed','2024-05-28', 1, 1, 1, 1, 1),
(2, 'Completed','2023-05-03', 2, 2, 2, 2, 2),
(3, 'Completed','2024-05-30', 2, 3, 3, 3, 3),
(4, 'Completed','2024-05-31', 4, 4, 4, 4, 4),
(5, 'Completed','2024-06-01', 5, 5, 5, 4, 5);

describe Ride;
 
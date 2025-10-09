create database Hotel_Mgt_system;
use  Hotel_Mgt_system;
create table customer(custid int primary key,custname varchar(30),address varchar(30),status varchar(30));

create table payments(paymentid int primary key,payment_date date,customerid int,foreign key(customerid) references customer(custid));

create table employees(employeeid int primary key,ename varchar(30),department varchar(30),address varchar(30),contact varchar(30),username varchar(30),password varchar(30));

create table roomclass(classid int primary key,name varchar(30));

create table roominfo(roomid int primary key,classid int,description varchar(30),price int,
foreign key(classid) references roomclass(classid));

create table reservation(reserveid int primary key,customerid int,roomid int,reservedate date,date_in date,date_out date,date_range date,
foreign key(customerid) references customer(custid),
foreign key(roomid) references roominfo(roomid));
select * from reservation;

create table transaction(tranid int primary key,tranname varchar(30),customerid int,paymentid int,employeeid int,reserveid int,trandate date,
foreign key(customerid) references customer(custid),
foreign key(paymentid) references payments(paymentid),
foreign key(employeeid) references employees(employeeid),
foreign key(reserveid) references reservation(reserveid));

create table reports(reportid int primary key,tranid int,information varchar(30),date date,
foreign key(tranid) references transaction(tranid));

INSERT INTO customer (custid, custname, address, status) VALUES
(1, 'John Doe', '123 Main St', 'Active'),(2, 'Jane Smith', '456 Elm St', 'Active'),(3, 'Robert Johnson', '789 Oak Ave', 'Inactive'),
(4, 'Emily Davis', '10 Pine Street', 'Active'),(5, 'Michael Brown', '44 Cedar Rd', 'Inactive'),(6, 'Linda Wilson', '77 Maple Lane', 'Active'),
(7, 'David Taylor', '12 Birch Blvd', 'Active'),(8, 'Barbara Moore', '58 River Way', 'Inactive'),
(9, 'James Anderson', '99 Forest St', 'Active'),(10, 'Susan Thomas', '65 Sunset Dr', 'Active'),(11, 'Kevin Jackson', '101 Hilltop Ave', 'Inactive'),
(12, 'Patricia White', '33 Meadow Ln', 'Active'),(13, 'Charles Harris', '84 Woodland Rd', 'Active'),(14, 'Jennifer Martin', '21 Valley St', 'Inactive'),
(15, 'Joseph Thompson', '109 Ridge View', 'Active'),(16, 'Karen Garcia', '66 Harbor Dr', 'Active'),(17, 'Richard Martinez', '17 Cliffside Blvd', 'Inactive'),
(18, 'Lisa Robinson', '42 Lakeside St', 'Active'),(19, 'Thomas Clark', '31 Ocean View', 'Active'),(20, 'Sandra Rodriguez', '12 Breeze Hill', 'Active'),
(21, 'Mark Lewis', '5 Grove Path', 'Inactive'),(22, 'Donna Lee', '29 Whispering Pines Rd', 'Active'),
(23, 'Steven Walker', '72 North Point Dr', 'Active'),(24, 'Deborah Hall', '13 Seaside Blvd', 'Active'),(25, 'George Allen', '98 Hill Crest', 'Inactive');
select * from customer;
INSERT INTO payments (paymentid, payment_date, customerid) VALUES
(1, '2025-09-01', 1),(2, '2025-09-03', 2),(3, '2025-09-05', 3),(4, '2025-09-07', 4),(5, '2025-09-09', 5),(6, '2025-09-11', 6),(7, '2025-09-13', 7),
(8, '2025-09-15', 8),(9, '2025-09-17', 9),(10, '2025-09-19', 10),(11, '2025-09-21', 11),(12, '2025-09-23', 12),
(13, '2025-09-25', 13),(14, '2025-09-27', 14),(15, '2025-09-29', 15),(16, '2025-10-01', 16),(17, '2025-10-03', 17),(18, '2025-10-05', 18),
(19, '2025-10-07', 19),(20, '2025-10-09', 20),(21, '2025-10-11', 21),(22, '2025-10-13', 22),(23, '2025-10-15', 23),(24, '2025-10-17', 24),(25, '2025-10-19', 25);
select * from payments;
INSERT INTO employees (employeeid, ename, department, address, contact, username, password) VALUES
(1, 'Alice Johnson', 'HR', 'New York', '1234567890', 'alicej', 'pass123'),(2, 'Bob Smith', 'Finance', 'Chicago', '2345678901', 'bobsmith', 'bob@321'),
(3, 'Carol White', 'IT', 'San Francisco', '3456789012', 'carolw', 'white#99'),(4, 'David Brown', 'Marketing', 'Los Angeles', '4567890123', 'davidb', 'dbrown88'),
(5, 'Eva Green', 'Sales', 'Houston', '5678901234', 'evag', 'eva$pass'),(6, 'Frank Black', 'IT', 'Seattle', '6789012345', 'frankb', 'black77'),
(7, 'Grace Lee', 'HR', 'Boston', '7890123456', 'gracel', 'grace123'),(8, 'Henry Kim', 'Finance', 'Denver', '8901234567', 'henryk', 'kim@456'),
(9, 'Ivy Young', 'Sales', 'Phoenix', '9012345678', 'ivyy', 'young!12'),(10, 'Jack Hill', 'IT', 'Atlanta', '1122334455', 'jackh', 'hill@789'),
(11, 'Karen Scott', 'Marketing', 'Miami', '2233445566', 'karens', 'scott123'),(12, 'Leo Adams', 'Finance', 'Dallas', '3344556677', 'leoa', 'adams321'),
(13, 'Mia Clark', 'HR', 'Austin', '4455667788', 'miac', 'clark@007'),(14, 'Nina Ford', 'Sales', 'Orlando', '5566778899', 'ninaf', 'ford$pass'),
(15, 'Owen Baker', 'IT', 'San Diego', '6677889900', 'owenb', 'baker99'),(16, 'Paul Reed', 'Marketing', 'Las Vegas', '7788990011', 'paulr', 'reed456'),
(17, 'Quinn Hall', 'HR', 'Philadelphia', '8899001122', 'quinnh', 'hall@12'),(18, 'Rachel King', 'Finance', 'Charlotte', '9900112233', 'rachelk', 'king321'),
(19, 'Steve Moore', 'IT', 'Columbus', '1010101010', 'stevem', 'moore$pass'),(20, 'Tina Gray', 'Sales', 'Indianapolis', '1111111111', 'tinag', 'gray123'),
(21, 'Uma Ray', 'Marketing', 'Jacksonville', '1212121212', 'umar', 'ray@pass'),(22, 'Victor Lane', 'HR', 'Fort Worth', '1313131313', 'victorl', 'lane321'),
(23, 'Wendy Cox', 'Finance', 'Nashville', '1414141414', 'wendyc', 'cox$007'),(24, 'Xander Bell', 'IT', 'El Paso', '1515151515', 'xanderb', 'bellpass'),
(25, 'Yara Dean', 'Sales', 'Detroit', '1616161616', 'yarad', 'dean123');
select *from employees;
INSERT INTO roomclass (classid, name) VALUES
(1, 'Standard'),(2, 'Deluxe'),(3, 'Suite'),(4, 'Executive'),(5, 'Presidential'),(6, 'Economy'),(7, 'Superior'),(8, 'Studio'),(9, 'Penthouse'),(10, 'Junior Suite'),
(11, 'Family Room'),(12, 'Business Class'),(13, 'Luxury Suite'),(14, 'Single Room'),(15, 'Double Room'),(16, 'Triple Room'),(17, 'Queen Room'),(18, 'King Room'),
(19, 'Bungalow'),(20, 'Cabana'),(21, 'Honeymoon Suite'),(22, 'Accessible Room'),(23, 'Connecting Room'),(24, 'Loft'),(25, 'Villa');
select * from roomclass;
INSERT INTO roominfo (roomid, classid, description, price) VALUES
(201, 1, 'Standard Room - Garden View', 100),(202, 2, 'Deluxe Room - Sea View', 150),(203, 3, 'Suite with Balcony', 220),(204, 4, 'Executive Floor Room', 180),
(205, 5, 'Presidential Suite', 500),(206, 6, 'Economy Room - Small Bed', 80),(207, 7, 'Superior Room - King Bed', 140),(208, 8, 'Studio - Open Layout', 120),
(209, 9, 'Penthouse - Top Floor', 450),(210, 10, 'Junior Suite - Sofa Bed', 200),(211, 11, 'Family Room - 2 Beds', 160),(212, 12, 'Business Class - Work Desk', 170),
(213, 13, 'Luxury Suite - City View', 300),(214, 14, 'Single Room', 90),(215, 15, 'Double Room', 110),(216, 16, 'Triple Room', 130),(217, 17, 'Queen Room', 125),
(218, 18, 'King Room', 135),(219, 19, 'Bungalow - Poolside', 250),(220, 20, 'Cabana - Beach Access', 270),(221, 21, 'Honeymoon Suite', 320),
(222, 22, 'Accessible Room', 100),(223, 23, 'Connecting Rooms', 180),(224, 24, 'Loft - Split Level', 210),(225, 25, 'Villa - Private Garden', 400);
select * from roominfo;
INSERT INTO reservation (customerid, reserveid, roomid, reservedate, date_in, date_out, date_range) VALUES
(1, 101, 201, '2025-09-01', '2025-09-10', '2025-09-15', '2025-09-05'),
(2, 102, 202, '2025-09-02', '2025-09-12', '2025-09-17', '2025-09-05'),
(3, 103, 203, '2025-09-03', '2025-09-14', '2025-09-18', '2025-09-04'),
(4, 104, 204, '2025-09-04', '2025-09-16', '2025-09-20', '2025-09-04'),
(5, 105, 205, '2025-09-05', '2025-09-18', '2025-09-23', '2025-09-05'),
(6, 106, 206, '2025-09-06', '2025-09-20', '2025-09-24', '2025-09-04'),
(7, 107, 207, '2025-09-07', '2025-09-22', '2025-09-26', '2025-09-04'),
(8, 108, 208, '2025-09-08', '2025-09-24', '2025-09-28', '2025-09-04'),
(9, 109, 209, '2025-09-09', '2025-09-26', '2025-09-30', '2025-09-04'),
(10, 110, 210, '2025-09-10', '2025-09-28', '2025-10-02', '2025-09-04'),
(11, 111, 201, '2025-09-11', '2025-10-01', '2025-10-05', '2025-10-04'),
(12, 112, 202, '2025-09-12', '2025-10-03', '2025-10-08', '2025-10-05'),
(13, 113, 203, '2025-09-13', '2025-10-05', '2025-10-10', '2025-10-05'),
(14, 114, 204, '2025-09-14', '2025-10-07', '2025-10-11', '2025-10-04'),
(15, 115, 205, '2025-09-15', '2025-10-09', '2025-10-13', '2025-10-04'),
(16, 116, 206, '2025-09-16', '2025-10-11', '2025-10-14', '2025-10-03'),
(17, 117, 207, '2025-09-17', '2025-10-13', '2025-10-17', '2025-10-04'),
(18, 118, 208, '2025-09-18', '2025-10-15', '2025-10-18', '2025-10-03'),
(19, 119, 209, '2025-09-19', '2025-10-17', '2025-10-21', '2025-10-04'),
(20, 120, 210, '2025-09-20', '2025-10-19', '2025-10-23', '2025-10-04'),
(21, 121, 201, '2025-09-21', '2025-10-21', '2025-10-25', '2025-10-04'),
(22, 122, 202, '2025-09-22', '2025-10-23', '2025-10-26', '2025-10-03'),
(23, 123, 203, '2025-09-23', '2025-10-25', '2025-10-28', '2025-10-03'),
(24, 124, 204, '2025-09-24', '2025-10-27', '2025-10-30', '2025-10-03'),
(25, 125, 205, '2025-09-25', '2025-10-29', '2025-11-01', '2025-10-03');
select * from reservation;
INSERT INTO transaction ( customerid,tranname, tranid,paymentid, employeeid, reserveid, trandate) VALUES
(1, 'Room Booking', 301, 1, 1, 101, '2025-09-01'),(2, 'Advance Payment', 302, 2, 2, 102, '2025-09-02'),(3, 'Full Payment', 303, 3, 3, 103, '2025-09-03'),
(4, 'Room Booking', 304, 4, 4, 104, '2025-09-04'),(5, 'Service Payment', 305, 5, 5, 105, '2025-09-05'),(6, 'Room Booking', 306, 6, 6, 106, '2025-09-06'),
(7, 'Advance Payment', 307, 7, 7, 107, '2025-09-07'),(8, 'Full Payment', 308, 8, 8, 108, '2025-09-08'),(9, 'Room Booking', 309, 9, 9, 109, '2025-09-09'),
(10, 'Room Booking', 310, 10, 10, 110, '2025-09-10'),(11, 'Service Payment', 311, 11, 11, 111, '2025-09-11'),(12, 'Full Payment', 312, 12, 12, 112, '2025-09-12'),
(13, 'Room Booking', 313, 13, 13, 113, '2025-09-13'),(14, 'Advance Payment', 314, 14, 14, 114, '2025-09-14'),(15, 'Full Payment', 315, 15, 15, 115, '2025-09-15'),
(16, 'Room Booking', 316, 16, 16, 116, '2025-09-16'),(17, 'Service Payment', 317, 17, 17, 117, '2025-09-17'),(18, 'Full Payment', 318, 18, 18, 118, '2025-09-18'),
(19, 'Advance Payment', 319, 19, 19, 119, '2025-09-19'),(20, 'Room Booking', 320, 20, 20, 120, '2025-09-20'),(21, 'Service Payment', 321, 21, 21, 121, '2025-09-21'),
(22, 'Full Payment', 322, 22, 22, 122, '2025-09-22'),(23, 'Advance Payment', 323, 23, 23, 123, '2025-09-23'),(24, 'Room Booking', 324, 24, 24, 124, '2025-09-24'),
(25, 'Full Payment', 325, 25, 25, 125, '2025-09-25');
select * from transaction;
INSERT INTO reports (reportid, tranid, information, date) VALUES
(1, 301, 'Payment Confirmed', '2025-09-01'),(2, 302, 'Booking Successful', '2025-09-02'),(3, 303, 'Invoice Generated', '2025-09-03'),(4, 304, 'Room Assigned', '2025-09-04'),
(5, 305, 'Customer Checked In', '2025-09-05'),(6, 306, 'Payment Pending', '2025-09-06'),(7, 307, 'Room Ready', '2025-09-07'),(8, 308, 'Transaction Verified', '2025-09-08'),
(9, 309, 'Partial Payment', '2025-09-09'),(10, 310, 'Full Payment Done', '2025-09-10'),(11, 311, 'Service Fee Applied', '2025-09-11'),(12, 312, 'Late Check-In', '2025-09-12'),
(13, 313, 'Early Check-Out', '2025-09-13'),(14, 314, 'Overbooking Resolved', '2025-09-14'),(15, 315, 'Tax Applied', '2025-09-15'),(16, 316, 'Payment Confirmed', '2025-09-16'),
(17, 317, 'Customer No Show', '2025-09-17'),(18, 318, 'Room Upgrade', '2025-09-18'),(19, 319, 'Complimentary Added', '2025-09-19'),(20, 320, 'Refund Issued', '2025-09-20'),
(21, 321, 'Discount Applied', '2025-09-21'),(22, 322, 'Transaction Completed', '2025-09-22'),(23, 323, 'Manual Review', '2025-09-23'),(24, 324, 'Duplicate Payment', '2025-09-24'),
(25, 325, 'Payment Reversed', '2025-09-25');
select * from reports;

 -- JOIN QUERIES --
 
 -- 1.List all customers with their reservations
SELECT c.custname, r.reservedate, r.date_in, r.date_out
FROM Customer c
INNER JOIN Reservation r ON c.custID = r.customerID;
-- 2. List all customers even if they haven’t made a reservation
SELECT c.custname, r.reservedate
FROM Customer c
LEFT JOIN Reservation r ON c.custID = r.customerID;
-- 3. Get all reservations and their associated room descriptions
SELECT r.reserveID, ri.description, ri.price
FROM Reservation r
INNER JOIN RoomInfo ri ON r.roomID = ri.roomID;
-- 4. List all rooms and include any reservation made for them
SELECT ri.roomID, ri.description, r.reservedate
FROM RoomInfo ri
LEFT JOIN Reservation r ON ri.roomID = r.roomID;
-- 5. Get reservation and corresponding room class
SELECT r.reserveID, rc.name AS roomclass
FROM Reservation r
JOIN RoomInfo ri ON r.roomID = ri.roomID
JOIN RoomClass rc ON ri.classID = rc.classID;
-- 6. Show all employees and the transactions they handled
SELECT e.ename, t.tranname
FROM Employees e
LEFT JOIN Transaction t ON e.employeeID = t.employeeID;
-- 7. Which customers completed transactions?
SELECT c.custname, t.tranname
FROM Customer c
JOIN Transaction t ON c.custID = t.customerID;
-- 8. List all payments with customer details
SELECT p.paymentID, p.payment_date, c.custname
FROM Payments p
JOIN Customer c ON p.customerID = c.custID;
-- 9. Get all transactions along with their related payment
SELECT t.tranID, t.tranname, p.payment_date
FROM Transaction t
JOIN Payments p ON t.paymentID = p.paymentID;
-- 10. Get all transactions and show employee and reservation involved
SELECT t.tranID, e.ename, r.date_in
FROM Transaction t
JOIN Employees e ON t.employeeID = e.employeeID
JOIN Reservation r ON t.reserveID = r.reserveID;
-- 11. List all reports and their related transaction
SELECT rep.reportID, rep.information, t.tranname
FROM Reports rep
INNER JOIN Transaction t ON rep.tranID = t.tranID;
-- 12. Show all reports, even those not linked to a transaction
SELECT rep.reportID, t.tranname
FROM Reports rep
LEFT JOIN Transaction t ON rep.tranID = t.tranID;
-- 13. Get room price based on room class
SELECT rc.name AS roomclass, AVG(ri.price) AS avg_price
FROM RoomClass rc
JOIN RoomInfo ri ON rc.classID = ri.classID
GROUP BY rc.name;
-- 14. List all transactions with customer, employee, and payment info
SELECT t.tranID, c.custname, e.ename, p.payment_date
FROM Transaction t
JOIN Customer c ON t.customerID = c.custID
JOIN Employees e ON t.employeeID = e.employeeID
JOIN Payments p ON t.paymentID = p.paymentID;
-- 15. List all rooms and their classes
SELECT ri.roomID, ri.description, rc.name AS classname
FROM RoomInfo ri
JOIN RoomClass rc ON ri.classID = rc.classID;
-- 16. List all reservations made after a given date
SELECT c.custname, r.date_in
FROM Customer c
JOIN Reservation r ON c.custID = r.customerID
WHERE r.date_in > '2025-01-01';
-- 17. Find reservations that have no linked transactions
SELECT r.reserveID
FROM Reservation r
LEFT JOIN Transaction t ON r.reserveID = t.reserveID
WHERE t.tranID IS NULL;
-- 18. Get list of customers who never made a payment
SELECT c.custname
FROM Customer c
LEFT JOIN Payments p ON c.custID = p.customerID
WHERE p.paymentID IS NULL;
-- 19. Find employees who never handled a transaction
SELECT e.ename
FROM Employees e
LEFT JOIN Transaction t ON e.employeeID = t.employeeID
WHERE t.tranID IS NULL;
-- 20. How many reservations per room?
SELECT r.roomID, COUNT(*) AS reservation_count
FROM Reservation r
JOIN RoomInfo ri ON r.roomID = ri.roomID
GROUP BY r.roomID;
-- 21. Get all transactions after a specific date
SELECT tranID, tranname
FROM Transaction
WHERE trandate > '2025-01-01';
-- 22. Customer with their payment and reservation info
SELECT c.custname, p.payment_date, r.date_in
FROM Customer c
JOIN Payments p ON c.custID = p.customerID
JOIN Reservation r ON c.custID = r.customerID;
-- 23. Find rooms that were never reserved
SELECT ri.roomID, ri.description
FROM RoomInfo ri
LEFT JOIN Reservation r ON ri.roomID = r.roomID
WHERE r.reserveID IS NULL;
-- 24. List customers and the total number of reservations
SELECT c.custname, COUNT(r.reserveID) AS total_reservations
FROM Customer c
LEFT JOIN Reservation r ON c.custID = r.customerID
GROUP BY c.custID, c.custname;
-- 25. Reservations and their reports
SELECT r.reserveID, rep.information, rep.date
FROM Reservation r
JOIN Transaction t ON r.reserveID = t.reserveID
JOIN Reports rep ON t.tranID = rep.tranID;



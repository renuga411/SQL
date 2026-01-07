select database();
-- SQL Dump for TVS Mini Project (MySQL Compatible)
create database tvs_orders;
-- Drop tables if they exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Bike_Master;
DROP TABLE IF EXISTS Dealer_Master;
DROP TABLE IF EXISTS Customer_Master;

-- Create Bike_Master
CREATE TABLE Bike_Master (
    Model_Code VARCHAR(20) PRIMARY KEY,
    Bike_Model VARCHAR(100),
    Category VARCHAR(50),
    Fuel_Type VARCHAR(20),
    On_Road_Price DECIMAL(10,2)
);

-- Create Dealer_Master
CREATE TABLE Dealer_Master (
    Dealer_Code VARCHAR(20) PRIMARY KEY,
    Dealer_Name VARCHAR(100),
    District VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Create Customer_Master
CREATE TABLE Customer_Master (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Create Orders table
CREATE TABLE Orders (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Dealer_Code VARCHAR(20),
    Model_Code VARCHAR(20),
    Order_Date DATE,
    Expected_Delivery_Date DATE,
    Actual_Delivery_Date DATE,
    Stages TEXT,
    Stage_Updated_Timestamp DATETIME,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Master(Customer_ID),
    FOREIGN KEY (Dealer_Code) REFERENCES Dealer_Master(Dealer_Code),
    FOREIGN KEY (Model_Code) REFERENCES Bike_Master(Model_Code)
);

-- Sample inserts (optional demo row per table)
-- Values insert in Bike_Master tables --
INSERT INTO Bike_Master VALUES ('MOD101', 'TVS Apache RTR 160', 'Street', 'Petrol', 118000.00),
('MOD102','TVS Apache RTR 200','Street','Petrol',145000.00),
('MOD103','TVS Raider 125','Commuter','Petrol',98000.00),
('MOD104','TVS Ronin 225','Cruiser','Petrol',172000.00),
('MOD105','TVS Jupiter 125','Scooter','Petrol',88000.00),

('MOD106','Bajaj Pulsar 150','Street','Petrol',112000.00),
('MOD107','Bajaj Pulsar NS200','Street','Petrol',155000.00),
('MOD108','Bajaj Pulsar RS200','Sports','Petrol',172000.00),
('MOD109','Bajaj Avenger 220','Cruiser','Petrol',140000.00),
('MOD110','Bajaj Platina 110','Commuter','Petrol',72000.00),

('MOD111','Hero Splendor Plus','Commuter','Petrol',75000.00),
('MOD112','Hero HF Deluxe','Commuter','Petrol',70000.00),
('MOD113','Hero Glamour','Commuter','Petrol',83000.00),
('MOD114','Hero Xtreme 160R','Street','Petrol',120000.00),
('MOD115','Hero Xpulse 200','Adventure','Petrol',145000.00),

('MOD116','Honda Shine 125','Commuter','Petrol',80000.00),
('MOD117','Honda Unicorn','Commuter','Petrol',110000.00),
('MOD118','Honda Hornet 2.0','Street','Petrol',135000.00),
('MOD119','Honda CB350','Cruiser','Petrol',200000.00),
('MOD120','Honda Dio','Scooter','Petrol',75000.00),

('MOD121','Yamaha FZ-S','Street','Petrol',125000.00),
('MOD122','Yamaha MT-15','Street','Petrol',165000.00),
('MOD123','Yamaha R15 V4','Sports','Petrol',185000.00),
('MOD124','Yamaha Fascino','Scooter','Petrol',78000.00),
('MOD125','Yamaha Ray ZR','Scooter','Petrol',85000.00),

('MOD126','Royal Enfield Classic 350','Cruiser','Petrol',220000.00),
('MOD127','Royal Enfield Bullet 350','Cruiser','Petrol',210000.00),
('MOD128','Royal Enfield Hunter 350','Street','Petrol',190000.00),
('MOD129','Royal Enfield Meteor 350','Cruiser','Petrol',225000.00),
('MOD130','Royal Enfield Himalayan','Adventure','Petrol',245000.00),

('MOD131','KTM Duke 200','Street','Petrol',190000.00),
('MOD132','KTM Duke 250','Street','Petrol',220000.00),
('MOD133','KTM RC 200','Sports','Petrol',215000.00),
('MOD134','KTM RC 390','Sports','Petrol',325000.00),
('MOD135','KTM Adventure 390','Adventure','Petrol',340000.00),

('MOD136','Suzuki Gixxer','Street','Petrol',135000.00),
('MOD137','Suzuki Gixxer SF','Sports','Petrol',155000.00),
('MOD138','Suzuki Access 125','Scooter','Petrol',88000.00),
('MOD139','Suzuki Burgman','Scooter','Petrol',92000.00),
('MOD140','Suzuki V-Strom SX','Adventure','Petrol',215000.00),

('MOD141','BMW G310R','Street','Petrol',295000.00),
('MOD142','BMW G310GS','Adventure','Petrol',315000.00),
('MOD143','BMW S1000RR','Sports','Petrol',2000000.00),
('MOD144','BMW F850GS','Adventure','Petrol',1250000.00),
('MOD145','BMW R1250GS','Adventure','Petrol',2100000.00),

('MOD146','Kawasaki Ninja 300','Sports','Petrol',343000.00),
('MOD147','Kawasaki Ninja 650','Sports','Petrol',715000.00),
('MOD148','Kawasaki Z650','Street','Petrol',675000.00),
('MOD149','Kawasaki Versys 650','Adventure','Petrol',780000.00),
('MOD150','Kawasaki Z900','Street','Petrol',950000.00),

('MOD151','Ola S1 Pro','Electric','Electric',135000.00),
('MOD152','Ather 450X','Electric','Electric',160000.00),
('MOD153','TVS iQube','Electric','Electric',145000.00),
('MOD154','Bajaj Chetak','Electric','Electric',150000.00),
('MOD155','Revolt RV400','Electric','Electric',140000.00),

('MOD156','Hero Electric Optima','Electric','Electric',85000.00),
('MOD157','Ampere Magnus','Electric','Electric',90000.00),
('MOD158','Simple One','Electric','Electric',145000.00),
('MOD159','Ultraviolette F77','Electric','Electric',380000.00),
('MOD160','Tork Kratos R','Electric','Electric',180000.00);

-- Values insert in Dealer_Master tables --
INSERT INTO Dealer_Master VALUES
('DLR001','Chennai Wheels','Chennai','chennaiwheels@gmail.com','9876543210'),
('DLR002','Metro Motors','Chennai','metromotors@gmail.com','9876543211'),
('DLR003','Speed Bikes','Chennai','speedbikes@gmail.com','9876543212'),
('DLR004','City Ride','Chennai','cityride@gmail.com','9876543213'),
('DLR005','Prime Motors','Chennai','primemotors@gmail.com','9876543214'),

('DLR006','Madurai Motors','Madurai','maduraimotors@gmail.com','9876543215'),
('DLR007','Vaigai Wheels','Madurai','vaigaiwheels@gmail.com','9876543216'),
('DLR008','Southern Bikes','Madurai','southernbikes@gmail.com','9876543217'),
('DLR009','Royal Ride','Madurai','royalride@gmail.com','9876543218'),
('DLR010','Fast Track Motors','Madurai','fasttrack@gmail.com','9876543219'),

('DLR011','Coimbatore Wheels','Coimbatore','cbewheels@gmail.com','9876543220'),
('DLR012','Western Motors','Coimbatore','westernmotors@gmail.com','9876543221'),
('DLR013','Auto Hub','Coimbatore','autohub@gmail.com','9876543222'),
('DLR014','Green Ride','Coimbatore','greenride@gmail.com','9876543223'),
('DLR015','Speed Zone','Coimbatore','speedzone@gmail.com','9876543224'),

('DLR016','Trichy Bikes','Trichy','trichybikes@gmail.com','9876543225'),
('DLR017','Rockfort Motors','Trichy','rockfort@gmail.com','9876543226'),
('DLR018','Highway Wheels','Trichy','highwaywheels@gmail.com','9876543227'),
('DLR019','Urban Ride','Trichy','urbanride@gmail.com','9876543228'),
('DLR020','Metro Bikes','Trichy','metrobikes@gmail.com','9876543229'),

('DLR021','Salem Motors','Salem','salemmotors@gmail.com','9876543230'),
('DLR022','Steel City Wheels','Salem','steelcity@gmail.com','9876543231'),
('DLR023','Speedy Motors','Salem','speedymotors@gmail.com','9876543232'),
('DLR024','Hill View Bikes','Salem','hillview@gmail.com','9876543233'),
('DLR025','Road King','Salem','roadking@gmail.com','9876543234'),

('DLR026','Erode Auto','Erode','erodeauto@gmail.com','9876543235'),
('DLR027','Textile City Motors','Erode','textilecity@gmail.com','9876543236'),
('DLR028','High Speed Wheels','Erode','highspeed@gmail.com','9876543237'),
('DLR029','Prime Auto','Erode','primeauto@gmail.com','9876543238'),
('DLR030','Drive Easy','Erode','driveeasy@gmail.com','9876543239'),

('DLR031','Vellore Motors','Vellore','vellore@gmail.com','9876543240'),
('DLR032','Golden Wheels','Vellore','goldenwheels@gmail.com','9876543241'),
('DLR033','Speed Line','Vellore','speedline@gmail.com','9876543242'),
('DLR034','Urban Motors','Vellore','urbanmotors@gmail.com','9876543243'),
('DLR035','Auto Drive','Vellore','autodrive@gmail.com','9876543244');
INSERT INTO Dealer_Master VALUES
('DLR036','Tirunelveli Bikes','Tirunelveli','tnvbikes@gmail.com','9876543245'),
('DLR037','Southern Wheels','Tirunelveli','southern@gmail.com','9876543246'),
('DLR038','Fast Ride','Tirunelveli','fastride@gmail.com','9876543247'),
('DLR039','City Motors','Tirunelveli','citymotors@gmail.com','9876543248'),
('DLR040','Road Runner','Tirunelveli','roadrunner@gmail.com','9876543249'),

('DLR041','Thoothukudi Auto','Thoothukudi','tuticorin@gmail.com','9876543250'),
('DLR042','Harbour Motors','Thoothukudi','harbour@gmail.com','9876543251'),
('DLR043','Sea View Wheels','Thoothukudi','seaview@gmail.com','9876543252'),
('DLR044','Blue Ocean Bikes','Thoothukudi','blueocean@gmail.com','9876543253'),
('DLR045','Port City Motors','Thoothukudi','portcity@gmail.com','9876543254'),

('DLR046','Thanjavur Motors','Thanjavur','thanjavur@gmail.com','9876543255'),
('DLR047','Chola Wheels','Thanjavur','cholawheels@gmail.com','9876543256'),
('DLR048','Heritage Bikes','Thanjavur','heritage@gmail.com','9876543257'),
('DLR049','Royal Chola','Thanjavur','royalchola@gmail.com','9876543258'),
('DLR050','Temple City Motors','Thanjavur','templecity@gmail.com','9876543259'),

('DLR051','Kanchipuram Auto','Kanchipuram','kanchi@gmail.com','9876543260'),
('DLR052','Silk City Wheels','Kanchipuram','silkcity@gmail.com','9876543261'),
('DLR053','Speed Way','Kanchipuram','speedway@gmail.com','9876543262'),
('DLR054','Urban Drive','Kanchipuram','urbandrive@gmail.com','9876543263'),
('DLR055','Auto Point','Kanchipuram','autopoint@gmail.com','9876543264'),

('DLR056','Cuddalore Motors','Cuddalore','cuddalore@gmail.com','9876543265'),
('DLR057','Coastal Wheels','Cuddalore','coastal@gmail.com','9876543266'),
('DLR058','Sea Breeze Bikes','Cuddalore','seabreeze@gmail.com','9876543267'),
('DLR059','Fast Wheels','Cuddalore','fastwheels@gmail.com','9876543268'),
('DLR060','City Auto','Cuddalore','cityauto@gmail.com','9876543269'),

('DLR061','Nagapattinam Motors','Nagapattinam','nagapattinam@gmail.com','9876543270'),
('DLR062','Delta Wheels','Nagapattinam','delta@gmail.com','9876543271'),
('DLR063','River Side Bikes','Nagapattinam','riverside@gmail.com','9876543272'),
('DLR064','East Coast Motors','Nagapattinam','eastcoast@gmail.com','9876543273'),
('DLR065','Harbour Wheels','Nagapattinam','harbourw@gmail.com','9876543274'),

('DLR066','Dindigul Motors','Dindigul','dindigul@gmail.com','9876543275'),
('DLR067','Hill City Wheels','Dindigul','hillcity@gmail.com','9876543276'),
('DLR068','Fast Track Auto','Dindigul','fasttrackauto@gmail.com','9876543277'),
('DLR069','Speed King','Dindigul','speedking@gmail.com','9876543278'),
('DLR070','Urban Wheels','Dindigul','urbanwheels@gmail.com','9876543279'),

('DLR071','Karur Motors','Karur','karur@gmail.com','9876543280'),
('DLR072','Textile Hub Auto','Karur','textilehub@gmail.com','9876543281'),
('DLR073','Road Star','Karur','roadstar@gmail.com','9876543282'),
('DLR074','Fast Lane','Karur','fastlane@gmail.com','9876543283'),
('DLR075','Auto Zone','Karur','autozone@gmail.com','9876543284'),

('DLR076','Namakkal Motors','Namakkal','namakkal@gmail.com','9876543285'),
('DLR077','Transport City Wheels','Namakkal','transportcity@gmail.com','9876543286'),
('DLR078','Speed Motors','Namakkal','speedmotors@gmail.com','9876543287'),
('DLR079','Drive Motors','Namakkal','drivemotors@gmail.com','9876543288'),
('DLR080','Highway Auto','Namakkal','highwayauto@gmail.com','9876543289'),

('DLR081','Krishnagiri Motors','Krishnagiri','krishnagiri@gmail.com','9876543290'),
('DLR082','Hill Top Wheels','Krishnagiri','hilltop@gmail.com','9876543291'),
('DLR083','Urban Speed','Krishnagiri','urbanspeed@gmail.com','9876543292'),
('DLR084','Fast Auto','Krishnagiri','fastauto@gmail.com','9876543293'),
('DLR085','City Wheels','Krishnagiri','citywheels@gmail.com','9876543294'),

('DLR086','Ramanathapuram Motors','Ramanathapuram','ramnad@gmail.com','9876543295'),
('DLR087','Coastal Auto','Ramanathapuram','coastalauto@gmail.com','9876543296'),
('DLR088','Sea Shore Wheels','Ramanathapuram','seashore@gmail.com','9876543297'),
('DLR089','Island Ride','Ramanathapuram','islandride@gmail.com','9876543298'),
('DLR090','Bay Motors','Ramanathapuram','baymotors@gmail.com','9876543299'),

('DLR091','Kanyakumari Motors','Kanyakumari','kanyakumari@gmail.com','9876543300'),
('DLR092','Cape Wheels','Kanyakumari','capewheels@gmail.com','9876543301'),
('DLR093','Ocean Drive','Kanyakumari','oceandrive@gmail.com','9876543302'),
('DLR094','Sunrise Motors','Kanyakumari','sunrise@gmail.com','9876543303'),
('DLR095','Tri Sea Wheels','Kanyakumari','trisea@gmail.com','9876543304'),

('DLR096','Pudukkottai Motors','Pudukkottai','pudukottai@gmail.com','9876543305'),
('DLR097','Heritage Auto','Pudukkottai','heritageauto@gmail.com','9876543306'),
('DLR098','Royal Drive','Pudukkottai','royaldrive@gmail.com','9876543307'),
('DLR099','Speed Wheels','Pudukkottai','speedw@gmail.com','9876543308'),
('DLR100','City Point','Pudukkottai','citypoint@gmail.com','9876543309');

-- Values insert in Customer_Master Values --
INSERT INTO Customer_Master VALUES
('CUS001','Arun Kumar','Male',28,'Chennai','arunk@gmail.com','9999988888'),
('CUS002','Priya Sharma','Female',26,'Chennai','priya@gmail.com','9999988889'),
('CUS003','Ramesh Iyer','Male',35,'Chennai','ramesh@gmail.com','9999988890'),
('CUS004','Sneha R','Female',24,'Chennai','sneha@gmail.com','9999988891'),
('CUS005','Vijay Anand','Male',31,'Chennai','vijay@gmail.com','9999988892'),

('CUS006','Karthik S','Male',29,'Coimbatore','karthik@gmail.com','9999988893'),
('CUS007','Anitha Devi','Female',34,'Coimbatore','anitha@gmail.com','9999988894'),
('CUS008','Suresh Babu','Male',42,'Coimbatore','suresh@gmail.com','9999988895'),
('CUS009','Divya N','Female',27,'Coimbatore','divya@gmail.com','9999988896'),
('CUS010','Manoj Kumar','Male',33,'Coimbatore','manoj@gmail.com','9999988897'),

('CUS011','Senthil Raj','Male',38,'Madurai','senthil@gmail.com','9999988898'),
('CUS012','Meena Lakshmi','Female',30,'Madurai','meena@gmail.com','9999988899'),
('CUS013','Prakash M','Male',45,'Madurai','prakash@gmail.com','9999988900'),
('CUS014','Revathi S','Female',29,'Madurai','revathi@gmail.com','9999988901'),
('CUS015','Ravi Teja','Male',26,'Madurai','raviteja@gmail.com','9999988902'),

('CUS016','Saravanan K','Male',34,'Trichy','saravanan@gmail.com','9999988903'),
('CUS017','Anjali P','Female',23,'Trichy','anjali@gmail.com','9999988904'),
('CUS018','Muthukumar','Male',41,'Trichy','muthu@gmail.com','9999988905'),
('CUS019','Kavitha R','Female',36,'Trichy','kavitha@gmail.com','9999988906'),
('CUS020','Balaji M','Male',28,'Trichy','balaji@gmail.com','9999988907'),

('CUS021','Praveen Kumar','Male',32,'Salem','praveen@gmail.com','9999988908'),
('CUS022','Lakshmi Priya','Female',27,'Salem','lakshmi@gmail.com','9999988909'),
('CUS023','Ganesh R','Male',39,'Salem','ganesh@gmail.com','9999988910'),
('CUS024','Deepa S','Female',35,'Salem','deepa@gmail.com','9999988911'),
('CUS025','Kannan V','Male',44,'Salem','kannan@gmail.com','9999988912'),

('CUS026','Naveen Raj','Male',24,'Erode','naveen@gmail.com','9999988913'),
('CUS027','Bhavya Sri','Female',22,'Erode','bhavya@gmail.com','9999988914'),
('CUS028','Raghavendra','Male',37,'Erode','raghav@gmail.com','9999988915'),
('CUS029','Mahalakshmi','Female',41,'Erode','maha@gmail.com','9999988916'),
('CUS030','Sathish Kumar','Male',30,'Erode','sathish@gmail.com','9999988917'),

('CUS031','Arvind R','Male',29,'Vellore','arvind@gmail.com','9999988918'),
('CUS032','Keerthana','Female',25,'Vellore','keerthana@gmail.com','9999988919'),
('CUS033','Sivakumar','Male',48,'Vellore','sivakumar@gmail.com','9999988920'),
('CUS034','Pavithra','Female',34,'Vellore','pavithra@gmail.com','9999988921'),
('CUS035','Harish K','Male',27,'Vellore','harish@gmail.com','9999988922'),

('CUS036','Vignesh','Male',31,'Thanjavur','vignesh@gmail.com','9999988923'),
('CUS037','Poornima','Female',28,'Thanjavur','poornima@gmail.com','9999988924'),
('CUS038','Rajesh','Male',43,'Thanjavur','rajesh@gmail.com','9999988925'),
('CUS039','Sowmiya','Female',26,'Thanjavur','sowmiya@gmail.com','9999988926'),
('CUS040','Mohan','Male',52,'Thanjavur','mohan@gmail.com','9999988927'),

('CUS041','Sandeep','Male',34,'Tirunelveli','sandeep@gmail.com','9999988928'),
('CUS042','Kalai Selvi','Female',29,'Tirunelveli','kalai@gmail.com','9999988929'),
('CUS043','Bharath','Male',36,'Tirunelveli','bharath@gmail.com','9999988930'),
('CUS044','Sharmila','Female',41,'Tirunelveli','sharmila@gmail.com','9999988931'),
('CUS045','Rajan','Male',47,'Tirunelveli','rajan@gmail.com','9999988932'),

('CUS046','Nithin','Male',25,'Thoothukudi','nithin@gmail.com','9999988933'),
('CUS047','Suganya','Female',33,'Thoothukudi','suganya@gmail.com','9999988934'),
('CUS048','Selvaraj','Male',55,'Thoothukudi','selvaraj@gmail.com','9999988935'),
('CUS049','Aishwarya','Female',23,'Thoothukudi','aishu@gmail.com','9999988936'),
('CUS050','Karthi','Male',28,'Thoothukudi','karthi@gmail.com','9999988937'),

('CUS051','Ajith','Male',35,'Kanchipuram','ajith@gmail.com','9999988938'),
('CUS052','Janani','Female',27,'Kanchipuram','janani@gmail.com','9999988939'),
('CUS053','Prabhu','Male',42,'Kanchipuram','prabhu@gmail.com','9999988940'),
('CUS054','Dhivya','Female',31,'Kanchipuram','dhivya@gmail.com','9999988941'),
('CUS055','Rohit','Male',24,'Kanchipuram','rohit@gmail.com','9999988942'),

('CUS056','Vimal','Male',39,'Cuddalore','vimal@gmail.com','9999988943'),
('CUS057','Anu','Female',26,'Cuddalore','anu@gmail.com','9999988944'),
('CUS058','Shankar','Male',49,'Cuddalore','shankar@gmail.com','9999988945'),
('CUS059','Preethi','Female',34,'Cuddalore','preethi@gmail.com','9999988946'),
('CUS060','Ashok','Male',41,'Cuddalore','ashok@gmail.com','9999988947'),

('CUS061','Sathya','Male',28,'Karur','sathya@gmail.com','9999988948'),
('CUS062','Nandhini','Female',22,'Karur','nandhini@gmail.com','9999988949'),
('CUS063','Gopinath','Male',46,'Karur','gopi@gmail.com','9999988950'),
('CUS064','Revathi','Female',37,'Karur','revathi@gmail.com','9999988951'),
('CUS065','Ramesh','Male',53,'Karur','ramesh2@gmail.com','9999988952'),

('CUS066','Lokesh','Male',31,'Namakkal','lokesh@gmail.com','9999988953'),
('CUS067','Swetha','Female',24,'Namakkal','swetha@gmail.com','9999988954'),
('CUS068','Murugan','Male',50,'Namakkal','murugan@gmail.com','9999988955'),
('CUS069','Saranya','Female',29,'Namakkal','saranya@gmail.com','9999988956'),
('CUS070','Dinesh','Male',34,'Namakkal','dinesh@gmail.com','9999988957'),

('CUS071','Prakash','Male',45,'Krishnagiri','prakash@gmail.com','9999988958'),
('CUS072','Monisha','Female',21,'Krishnagiri','monisha@gmail.com','9999988959'),
('CUS073','Subramanian','Male',56,'Krishnagiri','subbu@gmail.com','9999988960'),
('CUS074','Kavya','Female',26,'Krishnagiri','kavya@gmail.com','9999988961'),
('CUS075','Nagaraj','Male',39,'Krishnagiri','nagaraj@gmail.com','9999988962'),

('CUS076','Siva','Male',33,'Ramanathapuram','siva@gmail.com','9999988963'),
('CUS077','Mahalakshmi','Female',44,'Ramanathapuram','mahalakshmi@gmail.com','9999988964'),
('CUS078','Kannan','Male',51,'Ramanathapuram','kannan@gmail.com','9999988965'),
('CUS079','Sindhu','Female',27,'Ramanathapuram','sindhu@gmail.com','9999988966'),
('CUS080','Arjun','Male',23,'Ramanathapuram','arjun@gmail.com','9999988967'),

('CUS081','Suresh','Male',47,'Kanyakumari','suresh@gmail.com','9999988968'),
('CUS082','Neethu','Female',25,'Kanyakumari','neethu@gmail.com','9999988969'),
('CUS083','Joseph','Male',41,'Kanyakumari','joseph@gmail.com','9999988970'),
('CUS084','Anita','Female',32,'Kanyakumari','anita@gmail.com','9999988971'),
('CUS085','Princy','Female',28,'Kanyakumari','princy@gmail.com','9999988972'),

('CUS086','Baskar','Male',36,'Pudukkottai','baskar@gmail.com','9999988973'),
('CUS087','Meenakshi','Female',29,'Pudukkottai','meenakshi@gmail.com','9999988974'),
('CUS088','Raja','Male',48,'Pudukkottai','raja@gmail.com','9999988975'),
('CUS089','Soundarya','Female',24,'Pudukkottai','soundarya@gmail.com','9999988976'),
('CUS090','Sridhar','Male',40,'Pudukkottai','sridhar@gmail.com','9999988977'),

('CUS091','Vinoth','Male',34,'Dindigul','vinoth@gmail.com','9999988978'),
('CUS092','Pooja','Female',27,'Dindigul','pooja@gmail.com','9999988979'),
('CUS093','Manikandan','Male',45,'Dindigul','mani@gmail.com','9999988980'),
('CUS094','Keerthi','Female',22,'Dindigul','keerthi@gmail.com','9999988981'),
('CUS095','Raghul','Male',26,'Dindigul','raghul@gmail.com','9999988982'),

('CUS096','Madhan','Male',31,'Nagapattinam','madhan@gmail.com','9999988983'),
('CUS097','Abinaya','Female',28,'Nagapattinam','abinaya@gmail.com','9999988984'),
('CUS098','Selvi','Female',52,'Nagapattinam','selvi@gmail.com','9999988985'),
('CUS099','Kumar','Male',38,'Nagapattinam','kumar@gmail.com','9999988986'),
('CUS100','Deepak','Male',24,'Nagapattinam','deepak@gmail.com','9999988987');

-- Values insert in Orders Values --

INSERT INTO Orders VALUES
('ORD1001','CUS001','DLR001','MOD101','2024-01-15','2024-02-28','2024-02-25',
'Stage_1:Quotation:2024-01-10;Stage_2:Confirmed:2024-01-15;Stage_3:Engine_Setup:2024-01-20;Stage_4:Body_Setup:2024-01-25;Stage_5:Final_Assembly:2024-02-10;Stage_6:Quality_Check:2024-02-18;Stage_7:Delivery_Started:2024-02-22;Stage_8:Delivery_Date:2024-02-25',
'2024-02-25 10:35:00'),

('ORD1002','CUS002','DLR002','MOD102','2024-01-18','2024-03-01','2024-02-28',
'Stage_1:Quotation:2024-01-13;Stage_2:Confirmed:2024-01-18;Stage_3:Engine_Setup:2024-01-23;Stage_4:Body_Setup:2024-01-28;Stage_5:Final_Assembly:2024-02-12;Stage_6:Quality_Check:2024-02-20;Stage_7:Delivery_Started:2024-02-24;Stage_8:Delivery_Date:2024-02-28',
'2024-02-28 11:10:00'),

('ORD1003','CUS003','DLR003','MOD103','2024-01-20','2024-03-05','2024-03-06',
'Stage_1:Quotation:2024-01-15;Stage_2:Confirmed:2024-01-20;Stage_3:Engine_Setup:2024-01-25;Stage_4:Body_Setup:2024-02-01;Stage_5:Final_Assembly:2024-02-18;Stage_6:Quality_Check:2024-02-26;Stage_7:Delivery_Started:2024-03-03;Stage_8:Delivery_Date:2024-03-06',
'2024-03-06 15:40:00'),

('ORD1004','CUS004','DLR004','MOD104','2024-01-22','2024-03-08','2024-03-05',
'Stage_1:Quotation:2024-01-17;Stage_2:Confirmed:2024-01-22;Stage_3:Engine_Setup:2024-01-28;Stage_4:Body_Setup:2024-02-03;Stage_5:Final_Assembly:2024-02-20;Stage_6:Quality_Check:2024-02-27;Stage_7:Delivery_Started:2024-03-02;Stage_8:Delivery_Date:2024-03-05',
'2024-03-05 09:55:00'),

('ORD1005','CUS005','DLR005','MOD105','2024-01-25','2024-03-10','2024-03-09',
'Stage_1:Quotation:2024-01-20;Stage_2:Confirmed:2024-01-25;Stage_3:Engine_Setup:2024-01-30;Stage_4:Body_Setup:2024-02-05;Stage_5:Final_Assembly:2024-02-22;Stage_6:Quality_Check:2024-02-28;Stage_7:Delivery_Started:2024-03-05;Stage_8:Delivery_Date:2024-03-09',
'2024-03-09 14:20:00'),

('ORD1006','CUS006','DLR006','MOD106','2024-02-01','2024-03-15','2024-03-14',
'Stage_1:Quotation:2024-01-28;Stage_2:Confirmed:2024-02-01;Stage_3:Engine_Setup:2024-02-06;Stage_4:Body_Setup:2024-02-12;Stage_5:Final_Assembly:2024-02-26;Stage_6:Quality_Check:2024-03-05;Stage_7:Delivery_Started:2024-03-10;Stage_8:Delivery_Date:2024-03-14',
'2024-03-14 12:00:00'),

('ORD1007','CUS007','DLR007','MOD107','2024-02-05','2024-03-20','2024-03-22',
'Stage_1:Quotation:2024-02-01;Stage_2:Confirmed:2024-02-05;Stage_3:Engine_Setup:2024-02-10;Stage_4:Body_Setup:2024-02-16;Stage_5:Final_Assembly:2024-03-01;Stage_6:Quality_Check:2024-03-08;Stage_7:Delivery_Started:2024-03-18;Stage_8:Delivery_Date:2024-03-22',
'2024-03-22 16:45:00'),

('ORD1008','CUS008','DLR008','MOD108','2024-02-08','2024-03-25','2024-03-24',
'Stage_1:Quotation:2024-02-03;Stage_2:Confirmed:2024-02-08;Stage_3:Engine_Setup:2024-02-13;Stage_4:Body_Setup:2024-02-18;Stage_5:Final_Assembly:2024-03-05;Stage_6:Quality_Check:2024-03-12;Stage_7:Delivery_Started:2024-03-20;Stage_8:Delivery_Date:2024-03-24',
'2024-03-24 11:30:00'),

('ORD1009','CUS009','DLR009','MOD109','2024-02-12','2024-03-28','2024-03-28',
'Stage_1:Quotation:2024-02-07;Stage_2:Confirmed:2024-02-12;Stage_3:Engine_Setup:2024-02-17;Stage_4:Body_Setup:2024-02-22;Stage_5:Final_Assembly:2024-03-08;Stage_6:Quality_Check:2024-03-15;Stage_7:Delivery_Started:2024-03-22;Stage_8:Delivery_Date:2024-03-28',
'2024-03-28 10:10:00'),

('ORD1010','CUS010','DLR010','MOD110','2024-02-15','2024-03-30','2024-03-29',
'Stage_1:Quotation:2024-02-10;Stage_2:Confirmed:2024-02-15;Stage_3:Engine_Setup:2024-02-20;Stage_4:Body_Setup:2024-02-25;Stage_5:Final_Assembly:2024-03-10;Stage_6:Quality_Check:2024-03-18;Stage_7:Delivery_Started:2024-03-25;Stage_8:Delivery_Date:2024-03-29',
'2024-03-29 13:00:00'),

('ORD1011','CUS011','DLR011','MOD111','2024-01-18','2024-03-01','2024-02-28',
'Stage_1:Quotation:2024-01-13;Stage_2:Confirmed:2024-01-18;Stage_3:Engine_Setup:2024-01-23;Stage_4:Body_Setup:2024-01-28;Stage_5:Final_Assembly:2024-02-12;Stage_6:Quality_Check:2024-02-20;Stage_7:Delivery_Started:2024-02-24;Stage_8:Delivery_Date:2024-02-28',
'2024-02-28 11:05:00'),

('ORD1012','CUS012','DLR012','MOD112','2024-01-20','2024-03-04','2024-03-05',
'Stage_1:Quotation:2024-01-15;Stage_2:Confirmed:2024-01-20;Stage_3:Engine_Setup:2024-01-25;Stage_4:Body_Setup:2024-02-01;Stage_5:Final_Assembly:2024-02-15;Stage_6:Quality_Check:2024-02-22;Stage_7:Delivery_Started:2024-03-02;Stage_8:Delivery_Date:2024-03-05',
'2024-03-05 14:20:00'),

('ORD1013','CUS013','DLR013','MOD113','2024-01-22','2024-03-06','2024-03-04',
'Stage_1:Quotation:2024-01-17;Stage_2:Confirmed:2024-01-22;Stage_3:Engine_Setup:2024-01-27;Stage_4:Body_Setup:2024-02-03;Stage_5:Final_Assembly:2024-02-18;Stage_6:Quality_Check:2024-02-25;Stage_7:Delivery_Started:2024-03-01;Stage_8:Delivery_Date:2024-03-04',
'2024-03-04 09:40:00'),

('ORD1014','CUS014','DLR014','MOD114','2024-01-25','2024-03-08','2024-03-09',
'Stage_1:Quotation:2024-01-20;Stage_2:Confirmed:2024-01-25;Stage_3:Engine_Setup:2024-01-30;Stage_4:Body_Setup:2024-02-05;Stage_5:Final_Assembly:2024-02-20;Stage_6:Quality_Check:2024-02-27;Stage_7:Delivery_Started:2024-03-04;Stage_8:Delivery_Date:2024-03-09',
'2024-03-09 16:10:00'),

('ORD1015','CUS015','DLR015','MOD115','2024-01-28','2024-03-12','2024-03-11',
'Stage_1:Quotation:2024-01-23;Stage_2:Confirmed:2024-01-28;Stage_3:Engine_Setup:2024-02-02;Stage_4:Body_Setup:2024-02-07;Stage_5:Final_Assembly:2024-02-22;Stage_6:Quality_Check:2024-03-01;Stage_7:Delivery_Started:2024-03-08;Stage_8:Delivery_Date:2024-03-11',
'2024-03-11 12:30:00'),

('ORD1016','CUS016','DLR016','MOD116','2024-02-01','2024-03-15','2024-03-14',
'Stage_1:Quotation:2024-01-27;Stage_2:Confirmed:2024-02-01;Stage_3:Engine_Setup:2024-02-06;Stage_4:Body_Setup:2024-02-12;Stage_5:Final_Assembly:2024-02-25;Stage_6:Quality_Check:2024-03-03;Stage_7:Delivery_Started:2024-03-10;Stage_8:Delivery_Date:2024-03-14',
'2024-03-14 10:50:00'),

('ORD1017','CUS017','DLR017','MOD117','2024-02-05','2024-03-18','2024-03-20',
'Stage_1:Quotation:2024-01-31;Stage_2:Confirmed:2024-02-05;Stage_3:Engine_Setup:2024-02-10;Stage_4:Body_Setup:2024-02-15;Stage_5:Final_Assembly:2024-03-01;Stage_6:Quality_Check:2024-03-07;Stage_7:Delivery_Started:2024-03-15;Stage_8:Delivery_Date:2024-03-20',
'2024-03-20 15:00:00'),

('ORD1018','CUS018','DLR018','MOD118','2024-02-08','2024-03-22','2024-03-21',
'Stage_1:Quotation:2024-02-03;Stage_2:Confirmed:2024-02-08;Stage_3:Engine_Setup:2024-02-13;Stage_4:Body_Setup:2024-02-18;Stage_5:Final_Assembly:2024-03-05;Stage_6:Quality_Check:2024-03-12;Stage_7:Delivery_Started:2024-03-18;Stage_8:Delivery_Date:2024-03-21',
'2024-03-21 11:15:00'),

('ORD1019','CUS019','DLR019','MOD119','2024-02-12','2024-03-25','2024-03-25',
'Stage_1:Quotation:2024-02-07;Stage_2:Confirmed:2024-02-12;Stage_3:Engine_Setup:2024-02-17;Stage_4:Body_Setup:2024-02-22;Stage_5:Final_Assembly:2024-03-08;Stage_6:Quality_Check:2024-03-15;Stage_7:Delivery_Started:2024-03-22;Stage_8:Delivery_Date:2024-03-25',
'2024-03-25 10:10:00'),

('ORD1020','CUS020','DLR020','MOD120','2024-01-18','2024-03-01','2024-02-27',
'Stage_1:Quotation:2024-01-13;Stage_2:Confirmed:2024-01-18;Stage_3:Engine_Setup:2024-01-23;Stage_4:Body_Setup:2024-01-28;Stage_5:Final_Assembly:2024-02-12;Stage_6:Quality_Check:2024-02-19;Stage_7:Delivery_Started:2024-02-24;Stage_8:Delivery_Date:2024-02-27',
'2024-02-27 11:20:00'),

('ORD1021','CUS021','DLR021','MOD121','2024-01-20','2024-03-03','2024-03-04',
'Stage_1:Quotation:2024-01-15;Stage_2:Confirmed:2024-01-20;Stage_3:Engine_Setup:2024-01-25;Stage_4:Body_Setup:2024-01-30;Stage_5:Final_Assembly:2024-02-15;Stage_6:Quality_Check:2024-02-22;Stage_7:Delivery_Started:2024-03-01;Stage_8:Delivery_Date:2024-03-04',
'2024-03-04 15:10:00'),

('ORD1022','CUS022','DLR022','MOD122','2024-01-22','2024-03-05','2024-03-05',
'Stage_1:Quotation:2024-01-17;Stage_2:Confirmed:2024-01-22;Stage_3:Engine_Setup:2024-01-27;Stage_4:Body_Setup:2024-02-02;Stage_5:Final_Assembly:2024-02-18;Stage_6:Quality_Check:2024-02-25;Stage_7:Delivery_Started:2024-03-02;Stage_8:Delivery_Date:2024-03-05',
'2024-03-05 09:45:00'),

('ORD1023','CUS023','DLR023','MOD123','2024-01-25','2024-03-08','2024-03-07',
'Stage_1:Quotation:2024-01-20;Stage_2:Confirmed:2024-01-25;Stage_3:Engine_Setup:2024-01-30;Stage_4:Body_Setup:2024-02-04;Stage_5:Final_Assembly:2024-02-20;Stage_6:Quality_Check:2024-02-27;Stage_7:Delivery_Started:2024-03-04;Stage_8:Delivery_Date:2024-03-07',
'2024-03-07 14:00:00'),

('ORD1024','CUS024','DLR024','MOD124','2024-01-28','2024-03-10','2024-03-11',
'Stage_1:Quotation:2024-01-23;Stage_2:Confirmed:2024-01-28;Stage_3:Engine_Setup:2024-02-02;Stage_4:Body_Setup:2024-02-07;Stage_5:Final_Assembly:2024-02-22;Stage_6:Quality_Check:2024-03-01;Stage_7:Delivery_Started:2024-03-07;Stage_8:Delivery_Date:2024-03-11',
'2024-03-11 16:30:00'),

('ORD1025','CUS025','DLR025','MOD125','2024-02-01','2024-03-15','2024-03-14',
'Stage_1:Quotation:2024-01-27;Stage_2:Confirmed:2024-02-01;Stage_3:Engine_Setup:2024-02-06;Stage_4:Body_Setup:2024-02-11;Stage_5:Final_Assembly:2024-02-26;Stage_6:Quality_Check:2024-03-05;Stage_7:Delivery_Started:2024-03-10;Stage_8:Delivery_Date:2024-03-14',
'2024-03-14 12:15:00'),

('ORD1026','CUS026','DLR026','MOD126','2024-01-18','2024-03-01','2024-02-27',
'Stage_1:Quotation:2024-01-13;Stage_2:Confirmed:2024-01-18;Stage_3:Engine_Setup:2024-01-23;Stage_4:Body_Setup:2024-01-28;Stage_5:Final_Assembly:2024-02-12;Stage_6:Quality_Check:2024-02-19;Stage_7:Delivery_Started:2024-02-24;Stage_8:Delivery_Date:2024-02-27',
'2024-02-27 11:15:00'),

('ORD1027','CUS027','DLR027','MOD127','2024-01-20','2024-03-03','2024-03-04',
'Stage_1:Quotation:2024-01-15;Stage_2:Confirmed:2024-01-20;Stage_3:Engine_Setup:2024-01-25;Stage_4:Body_Setup:2024-01-30;Stage_5:Final_Assembly:2024-02-15;Stage_6:Quality_Check:2024-02-22;Stage_7:Delivery_Started:2024-03-01;Stage_8:Delivery_Date:2024-03-04',
'2024-03-04 15:10:00'),

('ORD1028','CUS028','DLR028','MOD128','2024-01-22','2024-03-05','2024-03-05',
'Stage_1:Quotation:2024-01-17;Stage_2:Confirmed:2024-01-22;Stage_3:Engine_Setup:2024-01-27;Stage_4:Body_Setup:2024-02-02;Stage_5:Final_Assembly:2024-02-18;Stage_6:Quality_Check:2024-02-25;Stage_7:Delivery_Started:2024-03-02;Stage_8:Delivery_Date:2024-03-05',
'2024-03-05 09:45:00'),

('ORD1029','CUS029','DLR029','MOD129','2024-01-25','2024-03-08','2024-03-07',
'Stage_1:Quotation:2024-01-20;Stage_2:Confirmed:2024-01-25;Stage_3:Engine_Setup:2024-01-30;Stage_4:Body_Setup:2024-02-04;Stage_5:Final_Assembly:2024-02-20;Stage_6:Quality_Check:2024-02-27;Stage_7:Delivery_Started:2024-03-04;Stage_8:Delivery_Date:2024-03-07',
'2024-03-07 14:00:00'),

('ORD1030','CUS030','DLR030','MOD130','2024-01-28','2024-03-10','2024-03-11',
'Stage_1:Quotation:2024-01-23;Stage_2:Confirmed:2024-01-28;Stage_3:Engine_Setup:2024-02-02;Stage_4:Body_Setup:2024-02-07;Stage_5:Final_Assembly:2024-02-22;Stage_6:Quality_Check:2024-03-01;Stage_7:Delivery_Started:2024-03-07;Stage_8:Delivery_Date:2024-03-11',
'2024-03-11 16:30:00'),

('ORD1031','CUS031','DLR031','MOD131','2024-02-01','2024-03-15','2024-03-14',
'Stage_1:Quotation:2024-01-27;Stage_2:Confirmed:2024-02-01;Stage_3:Engine_Setup:2024-02-06;Stage_4:Body_Setup:2024-02-11;Stage_5:Final_Assembly:2024-02-26;Stage_6:Quality_Check:2024-03-05;Stage_7:Delivery_Started:2024-03-10;Stage_8:Delivery_Date:2024-03-14',
'2024-03-14 12:15:00');

select * from Bike_Master;
select * from Dealer_Master;
select * from Customer_Master;
select * from Orders;







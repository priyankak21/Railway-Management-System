CREATE DATABASE RAILWAY_DATABASE;
USE RAILWAY_DATABASE;

-- Table to store information about trains
CREATE TABLE Train (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(50) NOT NULL,
    DepartureStationID INT,
    ArrivalStationID INT,
    DepartureTime TIME,
    ArrivalTime TIME,
    DepartureDate DATE,
    ArrivalDate DATE,
    CONSTRAINT fk_DepartureStation FOREIGN KEY (DepartureStationID) REFERENCES Station(StationID),
    CONSTRAINT fk_ArrivalStation FOREIGN KEY (ArrivalStationID) REFERENCES Station(StationID)
);

-- Table to store information about routes
CREATE TABLE Route (
    RouteID INT PRIMARY KEY,
    TrainID INT,
    StationID INT,
    StopOrder INT,
    CONSTRAINT fk_TrainID FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    CONSTRAINT fk_StationID FOREIGN KEY (StationID) REFERENCES Station(StationID)
);

-- Table to store information about passengers
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Table to store information about tickets
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    TrainID INT,
    PassengerID INT,
    DepartureStationID INT,
    ArrivalStationID INT,
    DepartureTime TIME,
    ArrivalTime TIME,
    DepartureDate DATE,
    ArrivalDate DATE,
    SeatNumber INT,
    Fare DECIMAL(10, 2),
    CONSTRAINT fk_TrainID_Ticket FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
    CONSTRAINT fk_PassengerID FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    CONSTRAINT fk_DepartureStation_Ticket FOREIGN KEY (DepartureStationID) REFERENCES Station(StationID),
    CONSTRAINT fk_ArrivalStation_Ticket FOREIGN KEY (ArrivalStationID) REFERENCES Station(StationID)
);

-- Table to store information about stations
CREATE TABLE Station (
    StationID INT PRIMARY KEY,
    StationName VARCHAR(50) NOT NULL
);

-- Insert values into the Station table
INSERT INTO Station (StationID, StationName)
VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chennai'),
(4, 'Kolkata'),
(5, 'Bangalore'),
(6, 'Hyderabad'),
(7, 'Ahmedabad'),
(8, 'Pune'),
(9, 'Jaipur'),
(10, 'Lucknow'),
(11, 'Kanpur'),
(12, 'Nagpur'),
(13, 'Patna'),
(14, 'Indore'),
(15, 'Thane'),
(16, 'Bhopal'),
(17, 'Visakhapatnam'),
(18, 'Agra'),
(19, 'Varanasi'),
(20, 'Coimbatore'),
(21, 'Vadodara'),
(22, 'Ludhiana'),
(23, 'Madurai'),
(24, 'Ranchi'),
(25, 'Jabalpur');


INSERT INTO Train (TrainID, TrainName, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime, DepartureDate, ArrivalDate)
VALUES
(1, 'Mumbai Express', 1, 5, '08:00:00', '14:00:00', '2024-03-01', '2024-03-01'),
(2, 'Delhi Superfast', 2, 3, '09:30:00', '16:30:00', '2024-03-02', '2024-03-02'),
(3, 'Chennai Express', 3, 1, '11:45:00', '18:45:00', '2024-03-03', '2024-03-03'),
(4, 'Kolkata Express', 4, 2, '14:15:00', '21:15:00', '2024-03-04', '2024-03-04'),
(5, 'Bangalore Superfast', 5, 4, '16:30:00', '23:30:00', '2024-03-05', '2024-03-05'),
(6, 'Hyderabad Express', 6, 5, '18:45:00', '01:45:00', '2024-03-06', '2024-03-06'),
(7, 'Ahmedabad Superfast', 7, 6, '20:00:00', '03:00:00', '2024-03-07', '2024-03-07'),
(8, 'Pune Express', 8, 7, '22:30:00', '05:30:00', '2024-03-08', '2024-03-08'),
(9, 'Jaipur Superfast', 9, 8, '01:00:00', '08:00:00', '2024-03-09', '2024-03-09'),
(10, 'Lucknow Express', 10, 9, '03:15:00', '10:15:00', '2024-03-10', '2024-03-10'),
(11, 'Kanpur Superfast', 11, 10, '05:30:00', '12:30:00', '2024-03-11', '2024-03-11'),
(12, 'Nagpur Express', 12, 11, '07:45:00', '14:45:00', '2024-03-12', '2024-03-12'),
(13, 'Patna Superfast', 13, 12, '10:00:00', '17:00:00', '2024-03-13', '2024-03-13'),
(14, 'Indore Express', 14, 13, '12:15:00', '19:15:00', '2024-03-14', '2024-03-14'),
(15, 'Thane Superfast', 15, 14, '14:30:00', '21:30:00', '2024-03-15', '2024-03-15'),
(16, 'Bhopal Express', 16, 15, '16:45:00', '23:45:00', '2024-03-16', '2024-03-16'),
(17, 'Visakhapatnam Superfast', 17, 16, '19:00:00', '02:00:00', '2024-03-17', '2024-03-17'),
(18, 'Agra Express', 18, 17, '21:15:00', '04:15:00', '2024-03-18', '2024-03-18'),
(19, 'Varanasi Superfast', 19, 18, '23:30:00', '06:30:00', '2024-03-19', '2024-03-19'),
(20, 'Coimbatore Express', 20, 19, '01:45:00', '08:45:00', '2024-03-20', '2024-03-20'),
(21, 'Vadodara Superfast', 21, 20, '04:00:00', '11:00:00', '2024-03-21', '2024-03-21'),
(22, 'Ludhiana Express', 22, 21, '06:15:00', '13:15:00', '2024-03-22', '2024-03-22'),
(23, 'Madurai Superfast', 23, 22, '08:30:00', '15:30:00', '2024-03-23', '2024-03-23'),
(24, 'Ranchi Express', 24, 23, '10:45:00', '17:45:00', '2024-03-24', '2024-03-24'),
(25, 'Jabalpur Superfast', 25, 24, '13:00:00', '20:00:00', '2024-03-25', '2024-03-25');

#PASSENGER 1
-- Insert 100 random values into the Passenger table
INSERT INTO Passenger (PassengerID, FirstName, LastName, Email, Phone)
VALUES
(1, 'Aarav', 'Kumar', 'aarav.kumar@example.com', '9876543210'),
(2, 'Isha', 'Sharma', 'isha.sharma@example.com', '8765432109'),
(3, 'Advait', 'Patel', 'advait.patel@example.com', '7654321098'),
(4, 'Ananya', 'Nair', 'ananya.nair@example.com', '6543210987'),
(5, 'Arjun', 'Mohan', 'arjun.mohan@example.com', '5432109876'),
(6, 'Aisha', 'Singh', 'aisha.singh@example.com', '4321098765'),
(7, 'Kabir', 'Chopra', 'kabir.chopra@example.com', '3210987654'),
(8, 'Avani', 'Iyer', 'avani.iyer@example.com', '2109876543'),
(9, 'Vihaan', 'Shah', 'vihaan.shah@example.com', '1098765432'),
(10, 'Zara', 'Verma', 'zara.verma@example.com', '9876543210'),
(11, 'Aryan', 'Bose', 'aryan.bose@example.com', '8765432109'),
(12, 'Anika', 'Choudhury', 'anika.choudhury@example.com', '7654321098'),
(13, 'Avinash', 'Desai', 'avinash.desai@example.com', '6543210987'),
(14, 'Bhavana', 'Gupta', 'bhavana.gupta@example.com', '5432109876'),
(15, 'Dhruv', 'Iyer', 'dhruv.iyer@example.com', '4321098765'),
(16, 'Dia', 'Joshi', 'dia.joshi@example.com', '3210987654'),
(17, 'Esha', 'Kapoor', 'esha.kapoor@example.com', '2109876543'),
(18, 'Farhan', 'Lal', 'farhan.lal@example.com', '1098765432'),
(19, 'Gauri', 'Mehra', 'gauri.mehra@example.com', '9876543210'),
(20, 'Harsh', 'Nanda', 'harsh.nanda@example.com', '8765432109'),
(21, 'Ishika', 'Oberoi', 'ishika.oberoi@example.com', '7654321098'),
(22, 'Jai', 'Pandey', 'jai.pandey@example.com', '6543210987'),
(23, 'Kavya', 'Rajput', 'kavya.rajput@example.com', '5432109876'),
(24, 'Laksh', 'Shah', 'laksh.shah@example.com', '4321098765'),
(25, 'Mira', 'Thakur', 'mira.thakur@example.com', '3210987654'),
(26, 'Neha', 'Upadhyay', 'neha.upadhyay@example.com', '2109876543'),
(27, 'Omkar', 'Varma', 'omkar.varma@example.com', '1098765432'),
(28, 'Pari', 'Yadav', 'pari.yadav@example.com', '9876543210'),
(29, 'Qadir', 'Zafar', 'qadir.zafar@example.com', '8765432109'),
(30, 'Ria', 'Arora', 'ria.arora@example.com', '7654321098'),
(31, 'Rohan', 'Bhat', 'rohan.bhat@example.com', '6543210987'),
(32, 'Saisha', 'Chauhan', 'saisha.chauhan@example.com', '5432109876'),
(33, 'Samar', 'Dutta', 'samar.dutta@example.com', '4321098765'),
(34, 'Tara', 'Gill', 'tara.gill@example.com', '3210987654'),
(35, 'Uday', 'Hegde', 'uday.hegde@example.com', '2109876543'),
(36, 'Vaishnavi', 'Iyengar', 'vaishnavi.iyengar@example.com', '1098765432'),
(37, 'Vihaan', 'Jain', 'vihaan.jain@example.com', '9876543210'),
(38, 'Wafa', 'Kumar', 'wafa.kumar@example.com', '8765432109'),
(39, 'Xena', 'Lamba', 'xena.lamba@example.com', '7654321098'),
(40, 'Yash', 'Mishra', 'yash.mishra@example.com', '6543210987'),
(41, 'Zain', 'Narang', 'zain.narang@example.com', '5432109876'),
(42, 'Aanya', 'Ojha', 'aanya.ojha@example.com', '4321098765'),
(43, 'Aarush', 'Puri', 'aarush.puri@example.com', '3210987654'),
(44, 'Anvi', 'Qureshi', 'anvi.qureshi@example.com', '2109876543'),
(45, 'Ahaan', 'Rathore', 'ahaan.rathore@example.com', '1098765432'),
(46, 'Bhavya', 'Sachdeva', 'bhavya.sachdeva@example.com', '9876543210'),
(47, 'Chahat', 'Taneja', 'chahat.taneja@example.com', '8765432109'),
(48, 'Daksh', 'Uppal', 'daksh.uppal@example.com', '7654321098'),
(49, 'Eesha', 'Verma', 'eesha.verma@example.com', '6543210987'),
(50, 'Fahad', 'Walia', 'fahad.walia@example.com', '5432109876'),
(51, 'Gitanjali', 'Xavier', 'gitanjali.xavier@example.com', '4321098765'),
(52, 'Harith', 'Yadav', 'harith.yadav@example.com', '3210987654'),
(53, 'Ishpreet', 'Zaidi', 'ishpreet.zaidi@example.com', '2109876543'),
(54, 'Jagdish', 'Ahluwalia', 'jagdish.ahluwalia@example.com', '1098765432'),
(55, 'Kamini', 'Biswas', 'kamini.biswas@example.com', '9876543210'),
(56, 'Lakshay', 'Chakraborty', 'lakshay.chakraborty@example.com', '8765432109'),
(57, 'Meher', 'Das', 'meher.das@example.com', '7654321098'),
(58, 'Navya', 'Eswar', 'navya.eswar@example.com', '6543210987'),
(59, 'Ojas', 'Fernandes', 'ojas.fernandes@example.com', '5432109876'),
(60, 'Preeti', 'Ghosh', 'preeti.ghosh@example.com', '4321098765'),
(61, 'Qamar', 'Haque', 'qamar.haque@example.com', '3210987654'),
(62, 'Radhika', 'Iyer', 'radhika.iyer@example.com', '2109876543'),
(63, 'Shlok', 'Jha', 'shlok.jha@example.com', '1098765432'),
(64, 'Tanvi', 'Kulkarni', 'tanvi.kulkarni@example.com', '9876543210'),
(65, 'Utkarsh', 'Lal', 'utkarsh.lal@example.com', '8765432109'),
(66, 'Varun', 'Malhotra', 'varun.malhotra@example.com', '7654321098'),
(67, 'Wanita', 'Naidu', 'wanita.naidu@example.com', '6543210987'),
(68, 'Xavier', 'Oberoi', 'xavier.oberoi@example.com', '5432109876'),
(69, 'Yamini', 'Pandit', 'yamini.pandit@example.com', '4321098765'),
(70, 'Zainab', 'Qadri', 'zainab.qadri@example.com', '3210987654'),
(71, 'Aakash', 'Rai', 'aakash.rai@example.com', '2109876543'),
(72, 'Bhargavi', 'Seth', 'bhargavi.seth@example.com', '1098765432'),
(73, 'Chirag', 'Tiwari', 'chirag.tiwari@example.com', '9876543210'),
(74, 'Divya', 'Upadhyay', 'divya.upadhyay@example.com', '8765432109'),
(75, 'Ekta', 'Vaid', 'ekta.vaid@example.com', '7654321098'),
(76, 'Faisal', 'Wagh', 'faisal.wagh@example.com', '6543210987'),
(77, 'Gayatri', 'Yadav', 'gayatri.yadav@example.com', '5432109876'),
(78, 'Himanshu', 'Zala', 'himanshu.zala@example.com', '4321098765'),
(79, 'Ishita', 'Agarwal', 'ishita.agarwal@example.com', '3210987654'),
(80, 'Jatin', 'Bhatia', 'jatin.bhatia@example.com', '2109876543'),
(81, 'Kirti', 'Chopra', 'kirti.chopra@example.com', '1098765432'),
(82, 'Luv', 'Dewan', 'luv.dewan@example.com', '9876543210'),
(83, 'Mehak', 'Fernandes', 'mehak.fernandes@example.com', '8765432109'),
(84, 'Nehal', 'Gupta', 'nehal.gupta@example.com', '7654321098'),
(85, 'Ojaswi', 'Hegde', 'ojaswi.hegde@example.com', '6543210987'),
(86, 'Pranav', 'Iyer', 'pranav.iyer@example.com', '5432109876'),
(87, 'Qasim', 'Joshi', 'qasim.joshi@example.com', '4321098765'),
(88, 'Rhea', 'Kapoor', 'rhea.kapoor@example.com', '3210987654'),
(89, 'Sarthak', 'Lal', 'sarthak.lal@example.com', '2109876543'),
(90, 'Tanishka', 'Mishra', 'tanishka.mishra@example.com', '1098765432'),
(91, 'Ujjwal', 'Narang', 'ujjwal.narang@example.com', '9876543210'),
(92, 'Vidisha', 'Ojha', 'vidisha.ojha@example.com', '8765432109'),
(93, 'Wasiq', 'Patil', 'wasiq.patil@example.com', '7654321098'),
(94, 'Xyla', 'Qureshi', 'xyla.qureshi@example.com', '6543210987'),
(95, 'Yuvika', 'Rathore', 'yuvika.rathore@example.com', '5432109876'),
(96, 'Zaara', 'Singh', 'zaara.singh@example.com', '4321098765'),
(97, 'Aadi', 'Thakur', 'aadi.thakur@example.com', '3210987654'),
(98, 'Bhavya', 'Upadhyay', 'bhavya.upadhyay@example.com', '2109876543'),
(99, 'Chetan', 'Varma', 'chetan.varma@example.com', '1098765432'),
(100, 'Drishti', 'Yadav', 'drishti.yadav@example.com', '9876543210');

# PASSENGER 2
-- Insert 100 more random values into the Passenger table
INSERT INTO Passenger (PassengerID, FirstName, LastName, Email, Phone)
VALUES
(101, 'Anaya', 'Agarwal', 'anaya.agarwal@example.com', '8765432109'),
(102, 'Brijesh', 'Bansal', 'brijesh.bansal@example.com', '7654321098'),
(103, 'Chitra', 'Choudhury', 'chitra.choudhury@example.com', '6543210987'),
(104, 'Disha', 'Deshpande', 'disha.deshpande@example.com', '5432109876'),
(105, 'Eshan', 'Eswar', 'eshan.eswar@example.com', '4321098765'),
(106, 'Fiona', 'Fernandes', 'fiona.fernandes@example.com', '3210987654'),
(107, 'Girish', 'Gupta', 'girish.gupta@example.com', '2109876543'),
(108, 'Harini', 'Hegde', 'harini.hegde@example.com', '1098765432'),
(109, 'Ishan', 'Iyengar', 'ishan.iyengar@example.com', '9876543210'),
(110, 'Jiya', 'Joshi', 'jiya.joshi@example.com', '8765432109'),
(111, 'Kabir', 'Kumar', 'kabir.kumar@example.com', '7654321098'),
(112, 'Lavanya', 'Lal', 'lavanya.lal@example.com', '6543210987'),
(113, 'Manan', 'Mehra', 'manan.mehra@example.com', '5432109876'),
(114, 'Navya', 'Nair', 'navya.nair@example.com', '4321098765'),
(115, 'Omkara', 'Ojha', 'omkara.ojha@example.com', '3210987654'),
(116, 'Pari', 'Patel', 'pari.patel@example.com', '2109876543'),
(117, 'Qamar', 'Qureshi', 'qamar.qureshi@example.com', '1098765432'),
(118, 'Riaan', 'Rathore', 'riaan.rathore@example.com', '9876543210'),
(119, 'Saisha', 'Singh', 'saisha.singh@example.com', '8765432109'),
(120, 'Tara', 'Thakur', 'tara.thakur@example.com', '7654321098'),
(121, 'Utkarsh', 'Upadhyay', 'utkarsh.upadhyay@example.com', '6543210987'),
(122, 'Vivaan', 'Verma', 'vivaan.verma@example.com', '5432109876'),
(123, 'Wahi', 'Walia', 'wahi.walia@example.com', '4321098765'),
(124, 'Xena', 'Xavier', 'xena.xavier@example.com', '3210987654'),
(125, 'Yashika', 'Yadav', 'yashika.yadav@example.com', '2109876543'),
(126, 'Zainab', 'Zaidi', 'zainab.zaidi@example.com', '1098765432'),
(127, 'Aarush', 'Arora', 'aarush.arora@example.com', '9876543210'),
(128, 'Bhavya', 'Bhatia', 'bhavya.bhatia@example.com', '8765432109'),
(129, 'Chahat', 'Chauhan', 'chahat.chauhan@example.com', '7654321098'),
(130, 'Daksh', 'Das', 'daksh.das@example.com', '6543210987'),
(131, 'Eesha', 'Eswar', 'eesha.eswar@example.com', '5432109876'),
(132, 'Farhan', 'Fernandes', 'farhan.fernandes@example.com', '4321098765'),
(133, 'Gitanjali', 'Gupta', 'gitanjali.gupta@example.com', '3210987654'),
(134, 'Harith', 'Hegde', 'harith.hegde@example.com', '2109876543'),
(135, 'Ishpreet', 'Iyer', 'ishpreet.iyer@example.com', '1098765432'),
(136, 'Jagdish', 'Jha', 'jagdish.jha@example.com', '9876543210'),
(137, 'Kamini', 'Kulkarni', 'kamini.kulkarni@example.com', '8765432109'),
(138, 'Lakshay', 'Lamba', 'lakshay.lamba@example.com', '7654321098'),
(139, 'Meher', 'Mishra', 'meher.mishra@example.com', '6543210987'),
(140, 'Navya', 'Narang', 'navya.narang@example.com', '5432109876'),
(141, 'Ojas', 'Oberoi', 'ojas.oberoi@example.com', '4321098765'),
(142, 'Preeti', 'Pandey', 'preeti.pandey@example.com', '3210987654'),
(143, 'Qasim', 'Qadri', 'qasim.qadri@example.com', '2109876543'),
(144, 'Radhika', 'Rai', 'radhika.rai@example.com', '1098765432'),
(145, 'Shlok', 'Seth', 'shlok.seth@example.com', '9876543210'),
(146, 'Tanvi', 'Tiwari', 'tanvi.tiwari@example.com', '8765432109'),
(147, 'Uday', 'Upadhyay', 'uday.upadhyay@example.com', '7654321098'),
(148, 'Vaishnavi', 'Varma', 'vaishnavi.varma@example.com', '6543210987'),
(149, 'Vihaan', 'Verma', 'vihaan.verma@example.com', '5432109876'),
(150, 'Wafa', 'Wagh', 'wafa.wagh@example.com', '4321098765'),
(151, 'Xyla', 'Xavier', 'xyla.xavier@example.com', '3210987654'),
(152, 'Yuvika', 'Yadav', 'yuvika.yadav@example.com', '2109876543'),
(153, 'Zaara', 'Zala', 'zaara.zala@example.com', '1098765432'),
(154, 'Aadi', 'Agarwal', 'aadi.agarwal@example.com', '9876543210'),
(155, 'Bhavya', 'Bansal', 'bhavya.bansal@example.com', '8765432109'),
(156, 'Chitra', 'Choudhury', 'chitra.choudhury@example.com', '7654321098'),
(157, 'Disha', 'Deshpande', 'disha.deshpande@example.com', '6543210987'),
(158, 'Eshan', 'Eswar', 'eshan.eswar@example.com', '5432109876'),
(159, 'Fiona', 'Fernandes', 'fiona.fernandes@example.com', '4321098765'),
(160, 'Girish', 'Gupta', 'girish.gupta@example.com', '3210987654'),
(161, 'Harini', 'Hegde', 'harini.hegde@example.com', '2109876543'),
(162, 'Ishan', 'Iyengar', 'ishan.iyengar@example.com', '1098765432'),
(163, 'Jiya', 'Joshi', 'jiya.joshi@example.com', '9876543210'),
(164, 'Kabir', 'Kumar', 'kabir.kumar@example.com', '8765432109'),
(165, 'Lavanya', 'Lal', 'lavanya.lal@example.com', '7654321098'),
(166, 'Manan', 'Mehra', 'manan.mehra@example.com', '6543210987'),
(167, 'Navya', 'Nair', 'navya.nair@example.com', '5432109876'),
(168, 'Omkara', 'Ojha', 'omkara.ojha@example.com', '3210987654'),
(169, 'Pari', 'Patel', 'pari.patel@example.com', '2109876543'),
(170, 'Qamar', 'Qureshi', 'qamar.qureshi@example.com', '1098765432'),
(171, 'Riaan', 'Rathore', 'riaan.rathore@example.com', '9876543210'),
(172, 'Saisha', 'Singh', 'saisha.singh@example.com', '8765432109'),
(173, 'Tara', 'Thakur', 'tara.thakur@example.com', '7654321098'),
(174, 'Utkarsh', 'Upadhyay', 'utkarsh.upadhyay@example.com', '6543210987'),
(175, 'Vivaan', 'Verma', 'vivaan.verma@example.com', '5432109876'),
(176, 'Wahi', 'Walia', 'wahi.walia@example.com', '4321098765'),
(177, 'Xena', 'Xavier', 'xena.xavier@example.com', '3210987654'),
(178, 'Yashika', 'Yadav', 'yashika.yadav@example.com', '2109876543'),
(179, 'Zainab', 'Zaidi', 'zainab.zaidi@example.com', '1098765432'),
(180, 'Aarush', 'Arora', 'aarush.arora@example.com', '9876543210'),
(181, 'Bhavya', 'Bhatia', 'bhavya.bhatia@example.com', '8765432109'),
(182, 'Chahat', 'Chauhan', 'chahat.chauhan@example.com', '7654321098'),
(183, 'Daksh', 'Das', 'daksh.das@example.com', '6543210987'),
(184, 'Eesha', 'Eswar', 'eesha.eswar@example.com', '5432109876'),
(185, 'Farhan', 'Fernandes', 'farhan.fernandes@example.com', '4321098765'),
(186, 'Gitanjali', 'Gupta', 'gitanjali.gupta@example.com', '3210987654'),
(187, 'Harith', 'Hegde', 'harith.hegde@example.com', '2109876543'),
(188, 'Ishpreet', 'Iyer', 'ishpreet.iyer@example.com', '1098765432'),
(189, 'Jagdish', 'Jha', 'jagdish.jha@example.com', '9876543210'),
(190, 'Kamini', 'Kulkarni', 'kamini.kulkarni@example.com', '8765432109'),
(191, 'Lakshay', 'Lamba', 'lakshay.lamba@example.com', '7654321098'),
(192, 'Meher', 'Mishra', 'meher.mishra@example.com', '6543210987'),
(193, 'Navya', 'Narang', 'navya.narang@example.com', '5432109876'),
(194, 'Ojas', 'Oberoi', 'ojas.oberoi@example.com', '4321098765'),
(195, 'Preeti', 'Pandey', 'preeti.pandey@example.com', '3210987654'),
(196, 'Qasim', 'Qadri', 'qasim.qadri@example.com', '2109876543'),
(197, 'Radhika', 'Rai', 'radhika.rai@example.com', '1098765432'),
(198, 'Shlok', 'Seth', 'shlok.seth@example.com', '9876543210'),
(199, 'Tanvi', 'Tiwari', 'tanvi.tiwari@example.com', '8765432109'),
(200, 'Uday', 'Upadhyay', 'uday.upadhyay@example.com', '7654321098');

#PASSENGER 3

-- Insert 100 more random values into the Passenger table
INSERT INTO Passenger (PassengerID, FirstName, LastName, Email, Phone)
VALUES
(201, 'Anushka', 'Agarwal', 'anushka.agarwal@example.com', '8765432109'),
(202, 'Bhuvan', 'Bansal', 'bhuvan.bansal@example.com', '7654321098'),
(203, 'Charvi', 'Choudhury', 'charvi.choudhury@example.com', '6543210987'),
(204, 'Dilip', 'Deshpande', 'dilip.deshpande@example.com', '5432109876'),
(205, 'Eshaan', 'Eswar', 'eshaan.eswar@example.com', '4321098765'),
(206, 'Farida', 'Fernandes', 'farida.fernandes@example.com', '3210987654'),
(207, 'Gopal', 'Gupta', 'gopal.gupta@example.com', '2109876543'),
(208, 'Harleen', 'Hegde', 'harleen.hegde@example.com', '1098765432'),
(209, 'Ishani', 'Iyengar', 'ishani.iyengar@example.com', '9876543210'),
(210, 'Jatin', 'Joshi', 'jatin.joshi@example.com', '8765432109'),
(211, 'Kavya', 'Kumar', 'kavya.kumar@example.com', '7654321098'),
(212, 'Lekha', 'Lal', 'lekha.lal@example.com', '6543210987'),
(213, 'Maya', 'Mehra', 'maya.mehra@example.com', '5432109876'),
(214, 'Nikhil', 'Nair', 'nikhil.nair@example.com', '4321098765'),
(215, 'Ojasvi', 'Ojha', 'ojasvi.ojha@example.com', '3210987654'),
(216, 'Prisha', 'Patel', 'prisha.patel@example.com', '2109876543'),
(217, 'Qureshi', 'Qureshi', 'qureshi.qureshi@example.com', '1098765432'),
(218, 'Rohan', 'Rathore', 'rohan.rathore@example.com', '9876543210'),
(219, 'Saumya', 'Singh', 'saumya.singh@example.com', '8765432109'),
(220, 'Tanishka', 'Thakur', 'tanishka.thakur@example.com', '7654321098'),
(221, 'Udita', 'Upadhyay', 'udita.upadhyay@example.com', '6543210987'),
(222, 'Vansh', 'Verma', 'vansh.verma@example.com', '5432109876'),
(223, 'Yatharth', 'Walia', 'yatharth.walia@example.com', '4321098765'),
(224, 'Zoya', 'Xavier', 'zoya.xavier@example.com', '3210987654'),
(225, 'Aanya', 'Yadav', 'aanya.yadav@example.com', '2109876543'),
(226, 'Bhavya', 'Zaidi', 'bhavya.zaidi@example.com', '1098765432'),
(227, 'Chahat', 'Arora', 'chahat.arora@example.com', '9876543210'),
(228, 'Daksh', 'Bhatia', 'daksh.bhatia@example.com', '8765432109'),
(229, 'Eesha', 'Chauhan', 'eesha.chauhan@example.com', '7654321098'),
(230, 'Farhan', 'Das', 'farhan.das@example.com', '6543210987'),
(231, 'Gitanjali', 'Eswar', 'gitanjali.eswar@example.com', '5432109876'),
(232, 'Harith', 'Fernandes', 'harith.fernandes@example.com', '4321098765'),
(233, 'Ishpreet', 'Gupta', 'ishpreet.gupta@example.com', '3210987654'),
(234, 'Jagdish', 'Hegde', 'jagdish.hegde@example.com', '2109876543'),
(235, 'Kamini', 'Kulkarni', 'kamini.kulkarni@example.com', '1098765432'),
(236, 'Lakshay', 'Lamba', 'lakshay.lamba@example.com', '9876543210'),
(237, 'Meher', 'Mishra', 'meher.mishra@example.com', '8765432109'),
(238, 'Navya', 'Narang', 'navya.narang@example.com', '7654321098'),
(239, 'Ojas', 'Oberoi', 'ojas.oberoi@example.com', '6543210987'),
(240, 'Preeti', 'Pandey', 'preeti.pandey@example.com', '5432109876'),
(241, 'Qasim', 'Qadri', 'qasim.qadri@example.com', '4321098765'),
(242, 'Radhika', 'Rai', 'radhika.rai@example.com', '3210987654'),
(243, 'Shlok', 'Seth', 'shlok.seth@example.com', '2109876543'),
(244, 'Tanvi', 'Tiwari', 'tanvi.tiwari@example.com', '1098765432'),
(245, 'Uday', 'Upadhyay', 'uday.upadhyay@example.com', '9876543210'),
(246, 'Vaishnavi', 'Varma', 'vaishnavi.varma@example.com', '8765432109'),
(247, 'Vihaan', 'Verma', 'vihaan.verma@example.com', '7654321098'),
(248, 'Wafa', 'Wagh', 'wafa.wagh@example.com', '6543210987'),
(249, 'Xyla', 'Xavier', 'xyla.xavier@example.com', '5432109876'),
(250, 'Yuvika', 'Yadav', 'yuvika.yadav@example.com', '4321098765'),
(251, 'Zaara', 'Zala', 'zaara.zala@example.com', '3210987654'),
(252, 'Aadi', 'Agarwal', 'aadi.agarwal@example.com', '9876543210'),
(253, 'Bhavya', 'Bansal', 'bhavya.bansal@example.com', '8765432109'),
(254, 'Charvi', 'Choudhury', 'charvi.choudhury@example.com', '7654321098'),
(255, 'Dilip', 'Deshpande', 'dilip.deshpande@example.com', '6543210987'),
(256, 'Eshaan', 'Eswar', 'eshaan.eswar@example.com', '5432109876'),
(257, 'Farida', 'Fernandes', 'farida.fernandes@example.com', '4321098765'),
(258, 'Gopal', 'Gupta', 'gopal.gupta@example.com', '3210987654'),
(259, 'Harleen', 'Hegde', 'harleen.hegde@example.com', '2109876543'),
(260, 'Ishani', 'Iyengar', 'ishani.iyengar@example.com', '1098765432'),
(261, 'Jatin', 'Joshi', 'jatin.joshi@example.com', '9876543210'),
(262, 'Kavya', 'Kumar', 'kavya.kumar@example.com', '8765432109'),
(263, 'Lekha', 'Lal', 'lekha.lal@example.com', '7654321098'),
(264, 'Maya', 'Mehra', 'maya.mehra@example.com', '6543210987'),
(265, 'Nikhil', 'Nair', 'nikhil.nair@example.com', '5432109876'),
(266, 'Ojasvi', 'Ojha', 'ojasvi.ojha@example.com', '4321098765'),
(267, 'Prisha', 'Patel', 'prisha.patel@example.com', '3210987654'),
(268, 'Qureshi', 'Qureshi', 'qureshi.qureshi@example.com', '2109876543'),
(269, 'Rohan', 'Rathore', 'rohan.rathore@example.com', '1098765432'),
(270, 'Saumya', 'Singh', 'saumya.singh@example.com', '9876543210'),
(271, 'Tanishka', 'Thakur', 'tanishka.thakur@example.com', '8765432109'),
(272, 'Udita', 'Upadhyay', 'udita.upadhyay@example.com', '7654321098'),
(273, 'Vansh', 'Verma', 'vansh.verma@example.com', '6543210987'),
(274, 'Yatharth', 'Walia', 'yatharth.walia@example.com', '5432109876'),
(275, 'Zoya', 'Xavier', 'zoya.xavier@example.com', '4321098765'),
(276, 'Aarav', 'Agarwal', 'aarav.agarwal@example.com', '8765432109'),
(277, 'Bhavana', 'Bansal', 'bhavana.bansal@example.com', '7654321098'),
(278, 'Chirag', 'Choudhury', 'chirag.choudhury@example.com', '6543210987'),
(279, 'Divya', 'Deshpande', 'divya.deshpande@example.com', '5432109876'),
(280, 'Eva', 'Eswar', 'eva.eswar@example.com', '4321098765'),
(281, 'Farhan', 'Fernandes', 'farhan.fernandes@example.com', '3210987654'),
(282, 'Gaurav', 'Gupta', 'gaurav.gupta@example.com', '2109876543'),
(283, 'Hiral', 'Hegde', 'hiral.hegde@example.com', '1098765432'),
(284, 'Ishika', 'Iyengar', 'ishika.iyengar@example.com', '9876543210'),
(285, 'Jai', 'Joshi', 'jai.joshi@example.com', '8765432109'),
(286, 'Kiran', 'Kumar', 'kiran.kumar@example.com', '7654321098'),
(287, 'Lalit', 'Lal', 'lalit.lal@example.com', '6543210987'),
(288, 'Mira', 'Mehra', 'mira.mehra@example.com', '5432109876'),
(289, 'Nandini', 'Nair', 'nandini.nair@example.com', '4321098765'),
(290, 'Omkar', 'Ojha', 'omkar.ojha@example.com', '3210987654'),
(291, 'Pranav', 'Patel', 'pranav.patel@example.com', '2109876543'),
(292, 'Queenie', 'Qureshi', 'queenie.qureshi@example.com', '1098765432'),
(293, 'Rajat', 'Rathore', 'rajat.rathore@example.com', '9876543210'),
(294, 'Simran', 'Singh', 'simran.singh@example.com', '8765432109'),
(295, 'Tanya', 'Thakur', 'tanya.thakur@example.com', '7654321098'),
(296, 'Udai', 'Upadhyay', 'udai.upadhyay@example.com', '6543210987'),
(297, 'Varsha', 'Verma', 'varsha.verma@example.com', '5432109876'),
(298, 'Veer', 'Walia', 'veer.walia@example.com', '4321098765'),
(299, 'Xena', 'Xavier', 'xena.xavier@example.com', '3210987654'),
(300, 'Yash', 'Yadav', 'yash.yadav@example.com', '2109876543');

SELECT * FROM PASSENGER;

-- Insert 25 values into the Route table
-- Insert values into the Route table
INSERT INTO Route (RouteID, TrainID, StationID, StopOrder) VALUES
-- Train 1
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
-- Train 2
(6, 2, 5, 1),
(7, 2, 4, 2),
(8, 2, 3, 3),
(9, 2, 2, 4),
(10, 2, 1, 5),
-- Train 3
(11, 3, 1, 1),
(12, 3, 3, 2),
(13, 3, 5, 3),
(14, 3, 2, 4),
(15, 3, 4, 5),
-- Train 4
(16, 4, 4, 1),
(17, 4, 2, 2),
(18, 4, 5, 3),
(19, 4, 3, 4),
(20, 4, 1, 5),
-- Train 5
(21, 5, 1, 1),
(22, 5, 3, 2),
(23, 5, 2, 3),
(24, 5, 4, 4),
(25, 5, 5, 5),
-- Train 6
(26, 6, 5, 1),
(27, 6, 4, 2),
(28, 6, 3, 3),
(29, 6, 2, 4),
(30, 6, 1, 5),
-- Train 7
(31, 7, 1, 1),
(32, 7, 3, 2),
(33, 7, 5, 3),
(34, 7, 2, 4),
(35, 7, 4, 5),
-- Train 8
(36, 8, 4, 1),
(37, 8, 2, 2),
(38, 8, 5, 3),
(39, 8, 3, 4),
(40, 8, 1, 5),
-- Train 9
(41, 9, 1, 1),
(42, 9, 3, 2),
(43, 9, 2, 3),
(44, 9, 4, 4),
(45, 9, 5, 5),
-- Train 10
(46, 10, 5, 1),
(47, 10, 4, 2),
(48, 10, 3, 3),
(49, 10, 2, 4),
(50, 10, 1, 5),
-- Insert more values into the Route table
-- Train 11
(51, 11, 1, 1),
(52, 11, 3, 2),
(53, 11, 5, 3),
(54, 11, 2, 4),
(55, 11, 4, 5),
-- Train 12
(56, 12, 4, 1),
(57, 12, 2, 2),
(58, 12, 5, 3),
(59, 12, 3, 4),
(60, 12, 1, 5),
-- Train 13
(61, 13, 1, 1),
(62, 13, 3, 2),
(63, 13, 5, 3),
(64, 13, 2, 4),
(65, 13, 4, 5),
-- Train 14
(66, 14, 5, 1),
(67, 14, 4, 2),
(68, 14, 3, 3),
(69, 14, 2, 4),
(70, 14, 1, 5),
-- Train 15
(71, 15, 1, 1),
(72, 15, 3, 2),
(73, 15, 2, 3),
(74, 15, 4, 4),
(75, 15, 5, 5),
-- Train 16
(76, 16, 5, 1),
(77, 16, 4, 2),
(78, 16, 3, 3),
(79, 16, 2, 4),
(80, 16, 1, 5),
-- Train 17
(81, 17, 1, 1),
(82, 17, 3, 2),
(83, 17, 5, 3),
(84, 17, 2, 4),
(85, 17, 4, 5),
-- Train 18
(86, 18, 4, 1),
(87, 18, 2, 2),
(88, 18, 5, 3),
(89, 18, 3, 4),
(90, 18, 1, 5),
-- Train 19
(91, 19, 1, 1),
(92, 19, 3, 2),
(93, 19, 2, 3),
(94, 19, 4, 4),
(95, 19, 5, 5),
-- Train 20
(96, 20, 5, 1),
(97, 20, 4, 2),
(98, 20, 3, 3),
(99, 20, 2, 4),
(100, 20, 1, 5),
-- Insert more values into the Route table
-- Train 21
(101, 21, 1, 1),
(102, 21, 3, 2),
(103, 21, 5, 3),
(104, 21, 2, 4),
(105, 21, 4, 5),
-- Train 22
(106, 22, 4, 1),
(107, 22, 2, 2),
(108, 22, 5, 3),
(109, 22, 3, 4),
(110, 22, 1, 5),
-- Train 23
(111, 23, 1, 1),
(112, 23, 3, 2),
(113, 23, 5, 3),
(114, 23, 2, 4),
(115, 23, 4, 5),
-- Train 24
(116, 24, 5, 1),
(117, 24, 4, 2),
(118, 24, 3, 3),
(119, 24, 2, 4),
(120, 24, 1, 5),
-- Train 25
(121, 25, 1, 1),
(122, 25, 3, 2),
(123, 25, 2, 3),
(124, 25, 4, 4),
(125, 25, 5, 5);






#TICKETS

-- Insert values into the Ticket table
-- Insert 100 values into the Ticket table
INSERT INTO Ticket (TicketID, TrainID, PassengerID, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime, DepartureDate, ArrivalDate, SeatNumber, Fare)
VALUES
-- Values 1 to 50
(11, 6, 11, 1, 5, '09:00:00', '19:30:00', '2024-03-11', '2024-03-11', 40, 310.00),
(12, 7, 12, 2, 4, '11:30:00', '21:00:00', '2024-03-12', '2024-03-12', 45, 350.00),
(13, 8, 13, 3, 3, '14:00:00', '22:30:00', '2024-03-13', '2024-03-13', 50, 120.00),
(14, 9, 14, 4, 2, '16:30:00', '01:00:00', '2024-03-14', '2024-03-14', 5, 150.00),
(15, 10, 15, 5, 1, '19:00:00', '03:30:00', '2024-03-15', '2024-03-15', 10, 200.00),
(16, 11, 16, 1, 5, '08:00:00', '18:00:00', '2024-03-16', '2024-03-16', 15, 180.00),
(17, 12, 17, 2, 4, '09:30:00', '17:00:00', '2024-03-17', '2024-03-17', 20, 220.00),
(18, 13, 18, 3, 3, '11:45:00', '19:15:00', '2024-03-18', '2024-03-18', 25, 250.00),
(19, 14, 19, 4, 2, '14:15:00', '21:45:00', '2024-03-19', '2024-03-19', 30, 280.00),
(20, 15, 20, 5, 1, '16:30:00', '02:30:00', '2024-03-20', '2024-03-20', 35, 320.00),
(21, 16, 21, 1, 5, '08:30:00', '18:30:00', '2024-03-21', '2024-03-21', 40, 160.00),
(22, 17, 22, 2, 4, '11:00:00', '16:00:00', '2024-03-22', '2024-03-22', 45, 210.00),
(23, 18, 23, 3, 3, '13:30:00', '23:30:00', '2024-03-23', '2024-03-23', 50, 190.00),
(24, 19, 24, 4, 2, '16:00:00', '02:00:00', '2024-03-24', '2024-03-24', 5, 240.00),
(25, 20, 25, 5, 1, '18:30:00', '04:30:00', '2024-03-25', '2024-03-25', 10, 270.00),
(26, 21, 26, 1, 5, '09:00:00', '19:30:00', '2024-03-26', '2024-03-26', 15, 310.00),
(27, 22, 27, 2, 4, '11:30:00', '21:00:00', '2024-03-27', '2024-03-27', 20, 350.00),
(28, 23, 28, 3, 3, '14:00:00', '22:30:00', '2024-03-28', '2024-03-28', 25, 120.00),
(29, 24, 29, 4, 2, '16:30:00', '01:00:00', '2024-03-29', '2024-03-29', 30, 150.00),
(30, 25, 30, 5, 1, '19:00:00', '03:30:00', '2024-03-30', '2024-03-30', 35, 200.00),
(31, 1, 31, 1, 5, '08:00:00', '18:00:00', '2024-03-31', '2024-03-31', 40, 180.00),
(32, 2, 32, 2, 4, '09:30:00', '17:00:00', '2024-04-01', '2024-04-01', 45, 220.00),
(33, 3, 33, 3, 3, '11:45:00', '19:15:00', '2024-04-02', '2024-04-02', 50, 250.00),
(34, 4, 34, 4, 2, '14:15:00', '21:45:00', '2024-04-03', '2024-04-03', 5, 280.00),
(35, 5, 35, 5, 1, '16:30:00', '02:30:00', '2024-04-04', '2024-04-04', 10, 320.00),
(36, 6, 36, 1, 5, '08:30:00', '18:30:00', '2024-04-05', '2024-04-05', 15, 160.00),
(37, 7, 37, 2, 4, '11:00:00', '16:00:00', '2024-04-06', '2024-04-06', 20, 210.00),
(38, 8, 38, 3, 3, '13:30:00', '23:30:00', '2024-04-07', '2024-04-07', 25, 190.00),
(39, 9, 39, 4, 2, '16:00:00', '02:00:00', '2024-04-08', '2024-04-08', 30, 240.00),
(40, 10, 40, 5, 1, '18:30:00', '04:30:00', '2024-04-09', '2024-04-09', 35, 270.00),
(41, 11, 41, 1, 5, '09:00:00', '19:30:00', '2024-04-10', '2024-04-10', 40, 310.00),
(42, 12, 42, 2, 4, '11:30:00', '21:00:00', '2024-04-11', '2024-04-11', 45, 350.00),
(43, 13, 43, 3, 3, '14:00:00', '22:30:00', '2024-04-12', '2024-04-12', 50, 120.00),
(44, 14, 44, 4, 2, '16:30:00', '01:00:00', '2024-04-13', '2024-04-13', 5, 150.00),
(45, 15, 45, 5, 1, '19:00:00', '03:30:00', '2024-04-14', '2024-04-14', 10, 200.00),
(46, 16, 46, 1, 5, '08:00:00', '18:00:00', '2024-04-15', '2024-04-15', 15, 180.00),
(47, 17, 47, 2, 4, '09:30:00', '17:00:00', '2024-04-16', '2024-04-16', 20, 220.00),
(48, 18, 48, 3, 3, '11:45:00', '19:15:00', '2024-04-17', '2024-04-17', 25, 250.00),
(49, 19, 49, 4, 2, '14:15:00', '21:45:00', '2024-04-18', '2024-04-18', 30, 280.00),
(50, 20, 50, 5, 1, '16:30:00', '02:30:00', '2024-04-19', '2024-04-19', 35, 320.00),
(51, 6, 51, 1, 5, '08:30:00', '18:30:00', '2024-07-01', '2024-07-01', 12, 160.00),
(52, 7, 52, 2, 4, '11:00:00', '16:00:00', '2024-07-02', '2024-07-02', 18, 210.00),
(53, 8, 53, 3, 3, '13:30:00', '23:30:00', '2024-07-03', '2024-07-03', 22, 190.00),
(54, 9, 54, 4, 2, '16:00:00', '02:00:00', '2024-07-04', '2024-07-04', 28, 240.00),
(55, 10, 55, 5, 1, '18:30:00', '04:30:00', '2024-07-05', '2024-07-05', 34, 270.00),
(56, 11, 56, 1, 5, '09:00:00', '19:30:00', '2024-07-06', '2024-07-06', 40, 310.00),
(57, 12, 57, 2, 4, '11:30:00', '21:00:00', '2024-07-07', '2024-07-07', 45, 350.00),
(58, 13, 58, 3, 3, '14:00:00', '22:30:00', '2024-07-08', '2024-07-08', 50, 120.00),
(59, 14, 59, 4, 2, '16:30:00', '01:00:00', '2024-07-09', '2024-07-09', 5, 150.00),
(60, 15, 60, 5, 1, '19:00:00', '03:30:00', '2024-07-10', '2024-07-10', 10, 200.00),
(61, 16, 61, 1, 5, '08:00:00', '18:00:00', '2024-07-11', '2024-07-11', 15, 180.00),
(62, 17, 62, 2, 4, '09:30:00', '17:00:00', '2024-07-12', '2024-07-12', 20, 220.00),
(63, 18, 63, 3, 3, '11:45:00', '19:15:00', '2024-07-13', '2024-07-13', 25, 250.00),
(64, 19, 64, 4, 2, '14:15:00', '21:45:00', '2024-07-14', '2024-07-14', 30, 280.00),
(65, 20, 65, 5, 1, '16:30:00', '02:30:00', '2024-07-15', '2024-07-15', 35, 320.00),
(66, 21, 66, 1, 5, '08:30:00', '18:30:00', '2024-07-16', '2024-07-16', 40, 160.00),
(67, 22, 67, 2, 4, '11:00:00', '16:00:00', '2024-07-17', '2024-07-17', 45, 210.00),
(68, 23, 68, 3, 3, '13:30:00', '23:30:00', '2024-07-18', '2024-07-18', 50, 190.00),
(69, 24, 69, 4, 2, '16:00:00', '02:00:00', '2024-07-19', '2024-07-19', 5, 240.00),
(70, 25, 70, 5, 1, '18:30:00', '04:30:00', '2024-07-20', '2024-07-20', 10, 270.00),
(71, 1, 71, 1, 5, '09:00:00', '19:30:00', '2024-07-21', '2024-07-21', 15, 310.00),
(72, 2, 72, 2, 4, '11:30:00', '21:00:00', '2024-07-22', '2024-07-22', 20, 350.00),
(73, 3, 73, 3, 3, '14:00:00', '22:30:00', '2024-07-23', '2024-07-23', 25, 120.00),
(74, 4, 74, 4, 2, '16:30:00', '01:00:00', '2024-07-24', '2024-07-24', 30, 150.00),
(75, 5, 75, 5, 1, '19:00:00', '03:30:00', '2024-07-25', '2024-07-25', 35, 200.00),
(76, 6, 76, 1, 5, '08:00:00', '18:00:00', '2024-07-26', '2024-07-26', 40, 180.00),
(77, 7, 77, 2, 4, '09:30:00', '17:00:00', '2024-07-27', '2024-07-27', 45, 220.00),
(78, 8, 78, 3, 3, '11:45:00', '19:15:00', '2024-07-28', '2024-07-28', 50, 250.00),
(79, 9, 79, 4, 2, '14:15:00', '21:45:00', '2024-07-29', '2024-07-29', 5, 280.00),
(80, 10, 80, 5, 1, '16:30:00', '02:30:00', '2024-07-30', '2024-07-30', 10, 320.00),
(81, 11, 81, 1, 5, '08:30:00', '18:30:00', '2024-07-31', '2024-07-31', 15, 160.00),
(82, 12, 82, 2, 4, '11:00:00', '16:00:00', '2024-08-01', '2024-08-01', 20, 210.00),
(83, 13, 83, 3, 3, '13:30:00', '23:30:00', '2024-08-02', '2024-08-02', 25, 190.00),
(84, 14, 84, 4, 2, '16:00:00', '02:00:00', '2024-08-03', '2024-08-03', 30, 240.00),
(85, 15, 85, 5, 1, '18:30:00', '04:30:00', '2024-08-04', '2024-08-04', 35, 270.00),
(86, 16, 86, 1, 5, '09:00:00', '19:30:00', '2024-08-05', '2024-08-05', 40, 310.00),
(87, 17, 87, 2, 4, '11:30:00', '21:00:00', '2024-08-06', '2024-08-06', 45, 350.00),
(88, 18, 88, 3, 3, '14:00:00', '22:30:00', '2024-08-07', '2024-08-07', 50, 120.00),
(89, 19, 89, 4, 2, '16:30:00', '01:00:00', '2024-08-08', '2024-08-08', 5, 150.00),
(90, 20, 90, 5, 1, '19:00:00', '03:30:00', '2024-08-09', '2024-08-09', 10, 200.00),
(91, 21, 91, 1, 5, '22:00:00', '06:30:00', '2024-08-10', '2024-08-10', 15, 180.00),
(92, 22, 92, 2, 4, '00:30:00', '08:00:00', '2024-08-11', '2024-08-11', 20, 220.00),
(93, 23, 93, 3, 3, '03:00:00', '11:30:00', '2024-08-12', '2024-08-12', 25, 250.00),
(94, 24, 94, 4, 2, '05:30:00', '14:00:00', '2024-08-13', '2024-08-13', 30, 280.00),
(95, 25, 95, 5, 1, '08:00:00', '16:30:00', '2024-08-14', '2024-08-14', 35, 320.00),
(96, 1, 96, 1, 5, '09:00:00', '19:30:00', '2024-08-15', '2024-08-15', 40, 310.00),
(97, 2, 97, 2, 4, '11:30:00', '21:00:00', '2024-08-16', '2024-08-16', 45, 350.00),
(98, 3, 98, 3, 3, '14:00:00', '22:30:00', '2024-08-17', '2024-08-17', 50, 120.00),
(99, 4, 99, 4, 2, '16:30:00', '01:00:00', '2024-08-18', '2024-08-18', 5, 150.00),
(100,5, 100, 5, 1, '19:00:00', '03:30:00', '2024-08-19', '2024-08-19', 10, 200.00),
-- Insert values into the Ticket table
-- Ticket 101-110
(101, 1, 101, 1, 5, '08:30:00', '18:30:00', '2024-06-01', '2024-06-01', 12, 160.00),
(102, 2, 102, 2, 4, '11:00:00', '16:00:00', '2024-06-02', '2024-06-02', 18, 210.00),
(103, 3, 103, 3, 3, '13:30:00', '23:30:00', '2024-06-03', '2024-06-03', 22, 190.00),
(104, 4, 104, 4, 2, '16:00:00', '02:00:00', '2024-06-04', '2024-06-04', 28, 240.00),
(105, 5, 105, 5, 1, '18:30:00', '04:30:00', '2024-06-05', '2024-06-05', 34, 270.00),
(106, 6, 106, 1, 5, '09:00:00', '19:30:00', '2024-06-06', '2024-06-06', 40, 310.00),
(107, 7, 107, 2, 4, '11:30:00', '21:00:00', '2024-06-07', '2024-06-07', 45, 350.00),
(108, 8, 108, 3, 3, '14:00:00', '22:30:00', '2024-06-08', '2024-06-08', 50, 120.00),
(109, 9, 109, 4, 2, '16:30:00', '01:00:00', '2024-06-09', '2024-06-09', 5, 150.00),
(110, 10, 110, 5, 1, '19:00:00', '03:30:00', '2024-06-10', '2024-06-10', 10, 200.00),
-- Ticket 111-120
(111, 11, 111, 1, 5, '08:00:00', '18:00:00', '2024-06-11', '2024-06-11', 15, 180.00),
(112, 12, 112, 2, 4, '09:30:00', '17:00:00', '2024-06-12', '2024-06-12', 20, 220.00),
(113, 13, 113, 3, 3, '11:45:00', '19:15:00', '2024-06-13', '2024-06-13', 25, 250.00),
(114, 14, 114, 4, 2, '14:15:00', '21:45:00', '2024-06-14', '2024-06-14', 30, 280.00),
(115, 15, 115, 5, 1, '16:30:00', '02:30:00', '2024-06-15', '2024-06-15', 35, 320.00),
(116, 16, 116, 1, 5, '08:30:00', '18:30:00', '2024-06-16', '2024-06-16', 40, 160.00),
(117, 17, 117, 2, 4, '11:00:00', '16:00:00', '2024-06-17', '2024-06-17', 45, 210.00),
(118, 18, 118, 3, 3, '13:30:00', '23:30:00', '2024-06-18', '2024-06-18', 50, 190.00),
(119, 19, 119, 4, 2, '16:00:00', '02:00:00', '2024-06-19', '2024-06-19', 5, 240.00),
(120, 20, 120, 5, 1, '18:30:00', '04:30:00', '2024-06-20', '2024-06-20', 10, 270.00),
-- Ticket 121-130
(121, 21, 121, 1, 5, '09:00:00', '19:30:00', '2024-06-21', '2024-06-21', 15, 310.00),
(122, 22, 122, 2, 4, '11:30:00', '21:00:00', '2024-06-22', '2024-06-22', 20, 350.00),
(123, 23, 123, 3, 3, '14:00:00', '22:30:00', '2024-06-23', '2024-06-23', 25, 120.00),
(124, 24, 124, 4, 2, '16:30:00', '01:00:00', '2024-06-24', '2024-06-24', 30, 150.00),
(125, 25, 125, 5, 1, '19:00:00', '03:30:00', '2024-06-25', '2024-06-25', 35, 200.00),
(126, 1, 126, 1, 5, '08:00:00', '18:00:00', '2024-06-26', '2024-06-26', 40, 180.00),
(127, 2, 127, 2, 4, '09:30:00', '17:00:00', '2024-06-27', '2024-06-27', 45, 220.00),
(128, 3, 128, 3, 3, '11:45:00', '19:15:00', '2024-06-28', '2024-06-28', 50, 250.00),
(129, 4, 129, 4, 2, '14:15:00', '21:45:00', '2024-06-29', '2024-06-29', 5, 280.00),
(130, 5, 130, 5, 1, '16:30:00', '02:30:00', '2024-06-30', '2024-06-30', 10, 320.00),
-- Ticket 131-140
(131, 6, 131, 1, 5, '08:30:00', '18:30:00', '2024-07-01', '2024-07-01', 15, 160.00),
(132, 7, 132, 2, 4, '11:00:00', '16:00:00', '2024-07-02', '2024-07-02', 20, 210.00),
(133, 8, 133, 3, 3, '13:30:00', '23:30:00', '2024-07-03', '2024-07-03', 25, 190.00),
(134, 9, 134, 4, 2, '16:00:00', '02:00:00', '2024-07-04', '2024-07-04', 30, 240.00),
(135, 10, 135, 5, 1, '18:30:00', '04:30:00', '2024-07-05', '2024-07-05', 35, 270.00),
(136, 11, 136, 1, 5, '09:00:00', '19:30:00', '2024-07-06', '2024-07-06', 40, 310.00),
(137, 12, 137, 2, 4, '11:30:00', '21:00:00', '2024-07-07', '2024-07-07', 45, 350.00),
(138, 13, 138, 3, 3, '14:00:00', '22:30:00', '2024-07-08', '2024-07-08', 50, 120.00),
(139, 14, 139, 4, 2, '16:30:00', '01:00:00', '2024-07-09', '2024-07-09', 5, 150.00),
(140, 15, 140, 5, 1, '19:00:00', '03:30:00', '2024-07-10', '2024-07-10', 10, 200.00),
-- Ticket 141-150
(141, 16, 141, 1, 5, '08:30:00', '18:30:00', '2024-07-11', '2024-07-11', 15, 180.00),
(142, 17, 142, 2, 4, '09:30:00', '17:00:00', '2024-07-12', '2024-07-12', 20, 220.00),
(143, 18, 143, 3, 3, '11:45:00', '19:15:00', '2024-07-13', '2024-07-13', 25, 250.00),
(144, 19, 144, 4, 2, '14:15:00', '21:45:00', '2024-07-14', '2024-07-14', 30, 280.00),
(145, 20, 145, 5, 1, '16:30:00', '02:30:00', '2024-07-15', '2024-07-15', 35, 320.00),
(146, 21, 146, 1, 5, '08:00:00', '18:00:00', '2024-07-16', '2024-07-16', 40, 160.00),
(147, 22, 147, 2, 4, '09:30:00', '17:00:00', '2024-07-17', '2024-07-17', 45, 210.00),
(148, 23, 148, 3, 3, '11:45:00', '19:15:00', '2024-07-18', '2024-07-18', 50, 190.00),
(149, 24, 149, 4, 2, '14:15:00', '21:45:00', '2024-07-19', '2024-07-19', 5, 240.00),
(150, 25, 150, 5, 1, '16:30:00', '02:30:00', '2024-07-20', '2024-07-20', 10, 270.00),
-- Insert more values into the Ticket table
-- Ticket 151-160
(151, 1, 151, 1, 5, '08:30:00', '18:30:00', '2024-07-21', '2024-07-21', 12, 160.00),
(152, 2, 152, 2, 4, '11:00:00', '16:00:00', '2024-07-22', '2024-07-22', 18, 210.00),
(153, 3, 153, 3, 3, '13:30:00', '23:30:00', '2024-07-23', '2024-07-23', 22, 190.00),
(154, 4, 154, 4, 2, '16:00:00', '02:00:00', '2024-07-24', '2024-07-24', 28, 240.00),
(155, 5, 155, 5, 1, '18:30:00', '04:30:00', '2024-07-25', '2024-07-25', 34, 270.00),
(156, 6, 156, 1, 5, '09:00:00', '19:30:00', '2024-07-26', '2024-07-26', 40, 310.00),
(157, 7, 157, 2, 4, '11:30:00', '21:00:00', '2024-07-27', '2024-07-27', 45, 350.00),
(158, 8, 158, 3, 3, '14:00:00', '22:30:00', '2024-07-28', '2024-07-28', 50, 120.00),
(159, 9, 159, 4, 2, '16:30:00', '01:00:00', '2024-07-29', '2024-07-29', 5, 150.00),
(160, 10, 160, 5, 1, '19:00:00', '03:30:00', '2024-07-30', '2024-07-30', 10, 200.00),
-- Ticket 161-170
(161, 11, 161, 1, 5, '08:00:00', '18:00:00', '2024-07-31', '2024-07-31', 15, 180.00),
(162, 12, 162, 2, 4, '09:30:00', '17:00:00', '2024-08-01', '2024-08-01', 20, 220.00),
(163, 13, 163, 3, 3, '11:45:00', '19:15:00', '2024-08-02', '2024-08-02', 25, 250.00),
(164, 14, 164, 4, 2, '14:15:00', '21:45:00', '2024-08-03', '2024-08-03', 30, 280.00),
(165, 15, 165, 5, 1, '16:30:00', '02:30:00', '2024-08-04', '2024-08-04', 35, 320.00),
(166, 16, 166, 1, 5, '08:30:00', '18:30:00', '2024-08-05', '2024-08-05', 40, 160.00),
(167, 17, 167, 2, 4, '11:00:00', '16:00:00', '2024-08-06', '2024-08-06', 45, 210.00),
(168, 18, 168, 3, 3, '13:30:00', '23:30:00', '2024-08-07', '2024-08-07', 50, 190.00),
(169, 19, 169, 4, 2, '16:00:00', '02:00:00', '2024-08-08', '2024-08-08', 5, 240.00),
(170, 20, 170, 5, 1, '18:30:00', '04:30:00', '2024-08-09', '2024-08-09', 10, 270.00),
-- Ticket 171-180
(171, 21, 171, 1, 5, '09:00:00', '19:30:00', '2024-08-10', '2024-08-10', 15, 310.00),
(172, 22, 172, 2, 4, '11:30:00', '21:00:00', '2024-08-11', '2024-08-11', 20, 350.00),
(173, 23, 173, 3, 3, '14:00:00', '22:30:00', '2024-08-12', '2024-08-12', 25, 120.00),
(174, 24, 174, 4, 2, '16:30:00', '01:00:00', '2024-08-13', '2024-08-13', 30, 150.00),
(175, 25, 175, 5, 1, '19:00:00', '03:30:00', '2024-08-14', '2024-08-14', 35, 200.00),
(176, 1, 176, 1, 5, '08:00:00', '18:00:00', '2024-08-15', '2024-08-15', 40, 180.00),
(177, 2, 177, 2, 4, '09:30:00', '17:00:00', '2024-08-16', '2024-08-16', 45, 220.00),
(178, 3, 178, 3, 3, '11:45:00', '19:15:00', '2024-08-17', '2024-08-17', 50, 250.00),
(179, 4, 179, 4, 2, '14:15:00', '21:45:00', '2024-08-18', '2024-08-18', 5, 280.00),
(180, 5, 180, 5, 1, '16:30:00', '02:30:00', '2024-08-19', '2024-08-19', 10, 320.00),
-- Ticket 181-190
(181, 6, 181, 1, 5, '08:30:00', '18:30:00', '2024-08-20', '2024-08-20', 15, 160.00),
(182, 7, 182, 2, 4, '11:00:00', '16:00:00', '2024-08-21', '2024-08-21', 20, 210.00),
(183, 8, 183, 3, 3, '13:30:00', '23:30:00', '2024-08-22', '2024-08-22', 25, 190.00),
(184, 9, 184, 4, 2, '16:00:00', '02:00:00', '2024-08-23', '2024-08-23', 30, 240.00),
(185, 10, 185, 5, 1, '18:30:00', '04:30:00', '2024-08-24', '2024-08-24', 35, 270.00),
(186, 11, 186, 1, 5, '09:00:00', '19:30:00', '2024-08-25', '2024-08-25', 40, 310.00),
(187, 12, 187, 2, 4, '11:30:00', '21:00:00', '2024-08-26', '2024-08-26', 45, 350.00),
(188, 13, 188, 3, 3, '14:00:00', '22:30:00', '2024-08-27', '2024-08-27', 50, 120.00),
(189, 14, 189, 4, 2, '16:30:00', '01:00:00', '2024-08-28', '2024-08-28', 5, 150.00),
(190, 15, 190, 5, 1, '19:00:00', '03:30:00', '2024-08-29', '2024-08-29', 10, 200.00),
-- Ticket 191-200
(191, 16, 191, 1, 5, '08:30:00', '18:30:00', '2024-08-30', '2024-08-30', 15, 180.00),
(192, 17, 192, 2, 4, '09:30:00', '17:00:00', '2024-08-31', '2024-08-31', 20, 220.00),
(193, 18, 193, 3, 3, '11:45:00', '19:15:00', '2024-09-01', '2024-09-01', 25, 250.00),
(194, 19, 194, 4, 2, '14:15:00', '21:45:00', '2024-09-02', '2024-09-02', 30, 280.00),
(195, 20, 195, 5, 1, '16:30:00', '02:30:00', '2024-09-03', '2024-09-03', 35, 320.00),
(196, 21, 196, 1, 5, '08:00:00', '18:00:00', '2024-09-04', '2024-09-04', 40, 160.00),
(197, 22, 197, 2, 4, '09:30:00', '17:00:00', '2024-09-05', '2024-09-05', 45, 210.00),
(198, 23, 198, 3, 3, '11:45:00', '19:15:00', '2024-09-06', '2024-09-06', 50, 190.00),
(199, 24, 199, 4, 2, '14:15:00', '21:45:00', '2024-09-07', '2024-09-07', 5, 240.00),
(200, 25, 200, 5, 1, '16:30:00', '02:30:00', '2024-09-08', '2024-09-08', 10, 270.00),
-- Insert more values into the Ticket table
-- Ticket 201-210
(201, 1, 201, 1, 5, '08:30:00', '18:30:00', '2024-09-09', '2024-09-09', 12, 160.00),
(202, 2, 202, 2, 4, '11:00:00', '16:00:00', '2024-09-10', '2024-09-10', 18, 210.00),
(203, 3, 203, 3, 3, '13:30:00', '23:30:00', '2024-09-11', '2024-09-11', 22, 190.00),
(204, 4, 204, 4, 2, '16:00:00', '02:00:00', '2024-09-12', '2024-09-12', 28, 240.00),
(205, 5, 205, 5, 1, '18:30:00', '04:30:00', '2024-09-13', '2024-09-13', 34, 270.00),
(206, 6, 206, 1, 5, '09:00:00', '19:30:00', '2024-09-14', '2024-09-14', 40, 310.00),
(207, 7, 207, 2, 4, '11:30:00', '21:00:00', '2024-09-15', '2024-09-15', 45, 350.00),
(208, 8, 208, 3, 3, '14:00:00', '22:30:00', '2024-09-16', '2024-09-16', 50, 120.00),
(209, 9, 209, 4, 2, '16:30:00', '01:00:00', '2024-09-17', '2024-09-17', 5, 150.00),
(210, 10, 210, 5, 1, '19:00:00', '03:30:00', '2024-09-18', '2024-09-18', 10, 200.00),
-- Ticket 211-220
(211, 11, 211, 1, 5, '08:00:00', '18:00:00', '2024-09-19', '2024-09-19', 15, 180.00),
(212, 12, 212, 2, 4, '09:30:00', '17:00:00', '2024-09-20', '2024-09-20', 20, 220.00),
(213, 13, 213, 3, 3, '11:45:00', '19:15:00', '2024-09-21', '2024-09-21', 25, 250.00),
(214, 14, 214, 4, 2, '14:15:00', '21:45:00', '2024-09-22', '2024-09-22', 30, 280.00),
(215, 15, 215, 5, 1, '16:30:00', '02:30:00', '2024-09-23', '2024-09-23', 35, 320.00),
(216, 16, 216, 1, 5, '08:30:00', '18:30:00', '2024-09-24', '2024-09-24', 40, 160.00),
(217, 17, 217, 2, 4, '11:00:00', '16:00:00', '2024-09-25', '2024-09-25', 45, 210.00),
(218, 18, 218, 3, 3, '13:30:00', '23:30:00', '2024-09-26', '2024-09-26', 50, 190.00),
(219, 19, 219, 4, 2, '16:00:00', '02:00:00', '2024-09-27', '2024-09-27', 5, 240.00),
(220, 20, 220, 5, 1, '18:30:00', '04:30:00', '2024-09-28', '2024-09-28', 10, 270.00),
-- Ticket 221-230
(221, 21, 221, 1, 5, '09:00:00', '19:30:00', '2024-09-29', '2024-09-29', 15, 310.00),
(222, 22, 222, 2, 4, '11:30:00', '21:00:00', '2024-09-30', '2024-09-30', 20, 350.00),
(223, 23, 223, 3, 3, '14:00:00', '22:30:00', '2024-10-01', '2024-10-01', 25, 120.00),
(224, 24, 224, 4, 2, '16:30:00', '01:00:00', '2024-10-02', '2024-10-02', 30, 150.00),
(225, 25, 225, 5, 1, '19:00:00', '03:30:00', '2024-10-03', '2024-10-03', 35, 200.00),
(226, 1, 226, 1, 5, '08:00:00', '18:00:00', '2024-10-04', '2024-10-04', 40, 180.00),
(227, 2, 227, 2, 4, '09:30:00', '17:00:00', '2024-10-05', '2024-10-05', 45, 220.00),
(228, 3, 228, 3, 3, '11:45:00', '19:15:00', '2024-10-06', '2024-10-06', 50, 250.00),
(229, 4, 229, 4, 2, '14:15:00', '21:45:00', '2024-10-07', '2024-10-07', 5, 280.00),
(230, 5, 230, 5, 1, '16:30:00', '02:30:00', '2024-10-08', '2024-10-08', 10, 320.00),
-- Ticket 231-240
(231, 6, 231, 1, 5, '08:30:00', '18:30:00', '2024-10-09', '2024-10-09', 15, 160.00),
(232, 7, 232, 2, 4, '11:00:00', '16:00:00', '2024-10-10', '2024-10-10', 20, 210.00),
(233, 8, 233, 3, 3, '13:30:00', '23:30:00', '2024-10-11', '2024-10-11', 25, 190.00),
(234, 9, 234, 4, 2, '16:00:00', '02:00:00', '2024-10-12', '2024-10-12', 30, 240.00),
(235, 10, 235, 5, 1, '18:30:00', '04:30:00', '2024-10-13', '2024-10-13', 35, 270.00),
(236, 11, 236, 1, 5, '09:00:00', '19:30:00', '2024-10-14', '2024-10-14', 40, 310.00),
(237, 12, 237, 2, 4, '11:30:00', '21:00:00', '2024-10-15', '2024-10-15', 45, 350.00),
(238, 13, 238, 3, 3, '14:00:00', '22:30:00', '2024-10-16', '2024-10-16', 50, 120.00),
(239, 14, 239, 4, 2, '16:30:00', '01:00:00', '2024-10-17', '2024-10-17', 5, 150.00),
(240, 15, 240, 5, 1, '19:00:00', '03:30:00', '2024-10-18', '2024-10-18', 10, 200.00),
-- Ticket 241-250
(241, 16, 241, 1, 5, '08:30:00', '18:30:00', '2024-10-19', '2024-10-19', 15, 180.00),
(242, 17, 242, 2, 4, '09:30:00', '17:00:00', '2024-10-20', '2024-10-20', 20, 220.00),
(243, 18, 243, 3, 3, '11:45:00', '19:15:00', '2024-10-21', '2024-10-21', 25, 250.00),
(244, 19, 244, 4, 2, '14:15:00', '21:45:00', '2024-10-22', '2024-10-22', 30, 280.00),
(245, 20, 245, 5, 1, '16:30:00', '02:30:00', '2024-10-23', '2024-10-23', 35, 320.00),
(246, 21, 246, 1, 5, '08:00:00', '18:00:00', '2024-10-24', '2024-10-24', 40, 160.00),
(247, 22, 247, 2, 4, '09:30:00', '17:00:00', '2024-10-25', '2024-10-25', 45, 210.00),
(248, 23, 248, 3, 3, '11:45:00', '19:15:00', '2024-10-26', '2024-10-26', 50, 190.00),
(249, 24, 249, 4, 2, '14:15:00', '21:45:00', '2024-10-27', '2024-10-27', 5, 240.00),
(250, 25, 250, 5, 1, '16:30:00', '02:30:00', '2024-10-28', '2024-10-28', 10, 270.00),
-- Insert more values into the Ticket table
-- Ticket 251-260
(251, 1, 251, 1, 5, '08:30:00', '18:30:00', '2024-10-29', '2024-10-29', 12, 160.00),
(252, 2, 252, 2, 4, '11:00:00', '16:00:00', '2024-10-30', '2024-10-30', 18, 210.00),
(253, 3, 253, 3, 3, '13:30:00', '23:30:00', '2024-10-31', '2024-10-31', 22, 190.00),
(254, 4, 254, 4, 2, '16:00:00', '02:00:00', '2024-11-01', '2024-11-01', 28, 240.00),
(255, 5, 255, 5, 1, '18:30:00', '04:30:00', '2024-11-02', '2024-11-02', 34, 270.00),
(256, 6, 256, 1, 5, '09:00:00', '19:30:00', '2024-11-03', '2024-11-03', 40, 310.00),
(257, 7, 257, 2, 4, '11:30:00', '21:00:00', '2024-11-04', '2024-11-04', 45, 350.00),
(258, 8, 258, 3, 3, '14:00:00', '22:30:00', '2024-11-05', '2024-11-05', 50, 120.00),
(259, 9, 259, 4, 2, '16:30:00', '01:00:00', '2024-11-06', '2024-11-06', 5, 150.00),
(260, 10, 260, 5, 1, '19:00:00', '03:30:00', '2024-11-07', '2024-11-07', 10, 200.00),
-- Ticket 261-270
(261, 11, 261, 1, 5, '08:00:00', '18:00:00', '2024-11-08', '2024-11-08', 15, 180.00),
(262, 12, 262, 2, 4, '09:30:00', '17:00:00', '2024-11-09', '2024-11-09', 20, 220.00),
(263, 13, 263, 3, 3, '11:45:00', '19:15:00', '2024-11-10', '2024-11-10', 25, 250.00),
(264, 14, 264, 4, 2, '14:15:00', '21:45:00', '2024-11-11', '2024-11-11', 30, 280.00),
(265, 15, 265, 5, 1, '16:30:00', '02:30:00', '2024-11-12', '2024-11-12', 35, 320.00),
(266, 16, 266, 1, 5, '08:30:00', '18:30:00', '2024-11-13', '2024-11-13', 40, 160.00),
(267, 17, 267, 2, 4, '11:00:00', '16:00:00', '2024-11-14', '2024-11-14', 45, 210.00),
(268, 18, 268, 3, 3, '13:30:00', '23:30:00', '2024-11-15', '2024-11-15', 50, 190.00),
(269, 19, 269, 4, 2, '16:00:00', '02:00:00', '2024-11-16', '2024-11-16', 5, 240.00),
(270, 20, 270, 5, 1, '18:30:00', '04:30:00', '2024-11-17', '2024-11-17', 10, 270.00),
-- Ticket 271-280
(271, 21, 271, 1, 5, '09:00:00', '19:30:00', '2024-11-18', '2024-11-18', 15, 310.00),
(272, 22, 272, 2, 4, '11:30:00', '21:00:00', '2024-11-19', '2024-11-19', 20, 350.00),
(273, 23, 273, 3, 3, '14:00:00', '22:30:00', '2024-11-20', '2024-11-20', 25, 120.00),
(274, 24, 274, 4, 2, '16:30:00', '01:00:00', '2024-11-21', '2024-11-21', 30, 150.00),
(275, 25, 275, 5, 1, '19:00:00', '03:30:00', '2024-11-22', '2024-11-22', 35, 200.00),
(276, 1, 276, 1, 5, '08:00:00', '18:00:00', '2024-11-23', '2024-11-23', 40, 180.00),
(277, 2, 277, 2, 4, '09:30:00', '17:00:00', '2024-11-24', '2024-11-24', 45, 220.00),
(278, 3, 278, 3, 3, '11:45:00', '19:15:00', '2024-11-25', '2024-11-25', 50, 250.00),
(279, 4, 279, 4, 2, '14:15:00', '21:45:00', '2024-11-26', '2024-11-26', 5, 280.00),
(280, 5, 280, 5, 1, '16:30:00', '02:30:00', '2024-11-27', '2024-11-27', 10, 320.00),
-- Ticket 281-290
(281, 6, 281, 1, 5, '08:30:00', '18:30:00', '2024-11-28', '2024-11-28', 15, 160.00),
(282, 7, 282, 2, 4, '11:00:00', '16:00:00', '2024-11-29', '2024-11-29', 20, 210.00),
(283, 8, 283, 3, 3, '13:30:00', '23:30:00', '2024-11-30', '2024-11-30', 25, 190.00),
(284, 9, 284, 4, 2, '16:00:00', '02:00:00', '2024-12-01', '2024-12-01', 30, 240.00),
(285, 10, 285, 5, 1, '18:30:00', '04:30:00', '2024-12-02', '2024-12-02', 35, 270.00),
(286, 11, 286, 1, 5, '09:00:00', '19:30:00', '2024-12-03', '2024-12-03', 40, 310.00),
(287, 12, 287, 2, 4, '11:30:00', '21:00:00', '2024-12-04', '2024-12-04', 45, 350.00),
(288, 13, 288, 3, 3, '14:00:00', '22:30:00', '2024-12-05', '2024-12-05', 50, 120.00),
(289, 14, 289, 4, 2, '16:30:00', '01:00:00', '2024-12-06', '2024-12-06', 5, 150.00),
(290, 15, 290, 5, 1, '19:00:00', '03:30:00', '2024-12-07', '2024-12-07', 10, 200.00),
-- Ticket 291-300
(291, 16, 291, 1, 5, '08:30:00', '18:30:00', '2024-12-08', '2024-12-08', 15, 180.00),
(292, 17, 292, 2, 4, '09:30:00', '17:00:00', '2024-12-09', '2024-12-09', 20, 220.00),
(293, 18, 293, 3, 3, '11:45:00', '19:15:00', '2024-12-10', '2024-12-10', 25, 250.00),
(294, 19, 294, 4, 2, '14:15:00', '21:45:00', '2024-12-11', '2024-12-11', 30, 280.00),
(295, 20, 295, 5, 1, '16:30:00', '02:30:00', '2024-12-12', '2024-12-12', 35, 320.00),
(296, 21, 296, 1, 5, '08:00:00', '18:00:00', '2024-12-13', '2024-12-13', 40, 160.00),
(297, 22, 297, 2, 4, '09:30:00', '17:00:00', '2024-12-14', '2024-12-14', 45, 210.00),
(298, 23, 298, 3, 3, '11:45:00', '19:15:00', '2024-12-15', '2024-12-15', 50, 190.00),
(299, 24, 299, 4, 2, '14:15:00', '21:45:00', '2024-12-16', '2024-12-16', 5, 240.00),
(300, 25, 300, 5, 1, '16:30:00', '02:30:00', '2024-12-17', '2024-12-17', 10, 270.00);


SELECT * FROM TICKET;

# 1. Query to display reveneue generated per month
SELECT 
    MONTH(Ticket.DepartureDate) AS Month,
    YEAR(Ticket.DepartureDate) AS Year,
    SUM(Ticket.Fare) AS MonthlyRevenue
FROM Ticket
GROUP BY Month, Year
ORDER BY Year, Month;

# 2. Query to display the passenger details along with Booking history ordered by booking date
SELECT 
    Passenger.PassengerID,
    Passenger.FirstName,
    Passenger.LastName,
    GROUP_CONCAT(CONCAT(Train.TrainName, ' (', Ticket.DepartureDate, ')') ORDER BY Ticket.DepartureDate) AS BookingHistory
FROM Passenger
LEFT JOIN Ticket ON Passenger.PassengerID = Ticket.PassengerID
LEFT JOIN Train ON Ticket.TrainID = Train.TrainID
GROUP BY Passenger.PassengerID
ORDER BY Passenger.PassengerID;

# 3. Query to display details related to the train for each station
SELECT Route.StopOrder, Station.StationName, Train.DepartureTime, Train.ArrivalTime, Train.DepartureDate, Train.ArrivalDate
FROM Route
INNER JOIN Station ON Route.StationID = Station.StationID
INNER JOIN Train ON Route.TrainID = Train.TrainID
WHERE Route.TrainID = 1
ORDER BY Route.StopOrder;

# 4. Query to display top 5 revenue generated by each route along with their staiton name 
SELECT Route.StationID, Station.StationName, SUM(Ticket.Fare) AS RouteRevenue
FROM Route
INNER JOIN Ticket ON Route.TrainID = Ticket.TrainID
INNER JOIN Station ON Route.StationID = Station.StationID
GROUP BY Route.StationID, Station.StationName
ORDER BY RouteRevenue DESC
LIMIT 5;

# 5. Query to disaply passenger name along with their total fare
SELECT Passenger.PassengerID, Passenger.FirstName, Passenger.LastName, SUM(Ticket.Fare) AS TotalFare
FROM Passenger
INNER JOIN Ticket ON Passenger.PassengerID = Ticket.PassengerID
GROUP BY Passenger.PassengerID
ORDER BY TotalFare DESC;

# 6. Query to display average fare for all trains
SELECT TrainName, AVG(Fare) AS AverageFare
FROM Ticket
JOIN Train ON Ticket.TrainID = Train.TrainID
GROUP BY TrainName;

# 7. Query to display all Train names along with the count of their routes
SELECT Train.TrainName, COUNT(Route.RouteID) AS NumRoutes
FROM Train
JOIN Route ON Train.TrainID = Route.TrainID
GROUP BY Train.TrainName;

# 8. Stored procedure to display all the trains on a specific date
call GetAvailableTrains('2024-03-11');

# 9. Query to display total revenue generated on weekdays and weekends
SELECT
    CASE WHEN DAYOFWEEK(DepartureDate) IN (1, 7) THEN 'Weekend' ELSE 'Weekday' END AS DayType,
    SUM(Fare) AS TotalRevenue
FROM Ticket
GROUP BY DayType;

# 10. Query to display the busiest station
SELECT Station.StationName, COUNT(Route.TrainID) AS TrainCount
FROM Station
LEFT JOIN Route ON Station.StationID = Route.StationID
GROUP BY Station.StationName
ORDER BY TrainCount DESC
LIMIT 1;

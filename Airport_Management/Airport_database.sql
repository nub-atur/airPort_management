drop database airport_management;
create database airPort_management;
use airPort_management;

-- global ----------------------------------------------------------------------
CREATE TABLE airports (
    airport_id VARCHAR(20) PRIMARY KEY,
    city VARCHAR(50) NOT NULL ,
    airport_name VARCHAR(50) NOT NULL UNIQUE
);

insert into airports 
	values ("SGN", "Ho Chi Minh", "Cang hang khong Quoc te Tan Son Nhat"),
	       ("HAN", "Ha Noi", "Cang hang khong Quoc te Noi Bai"),
               ("PXU", "Pleiku", "Cang hang khong Pleiku"),
               ("ZSAQ", "China", "San bay Thien Tru Son An Khanh"),
               ('JFK', 'New York', 'John F. Kennedy International Airport'),
	       ('LAX', 'Los Angeles', 'Los Angeles International Airport'),
               ('ATL', 'Atlanta', 'Hartsfield-Jackson Atlanta International Airport'),
               ('ORD', 'Chicago', "'O'Hare International Airport'"),
               ('DFW', 'Dallas', 'Dallas/Fort Worth International Airport');
    
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL ,
    age INT NOT NULL,
    job VARCHAR(50) NOT NULL,
    payment DECIMAL(10, 2) NOT NULL
);

insert into employees 
	values (1, "DANG VIET HOANG", 23, "Airport staff", 30.32),
               (2, "DANG QUOC KY ANH", 23, "Pilot", 100.23),
               (3, "DANG VAN TRUNG NHAN", 23, "Airport Security", 15.4),
               (4, "DANG DUC THANG", 23, "Ground staff", 50.66),
               (5, "DANG TRAN THAO VY", 23, "Ground staff", 55.84),
               (6, "DANG QUOC MINH", 23, "Selling ticket", 30.29);
    
CREATE TABLE airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL
);

insert into airlines 
	values (1, "Vietnam Airlines", "Vietnam"),
	       (2, "Vietjet Air", "Vietnam"),
               (3, "Bamboo Airways", "Vietnam"),
               (4, "Hainan Airlines", "China"),
               (5, 'Delta Air Lines', 'USA'),
	       (6, 'American Airlines', 'USA'),
               (7, 'United Airlines', 'USA'),
               (8, 'British Airways', 'UK'),
               (9, 'Lufthansa', 'Germany');

CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    flight_number VARCHAR(20) NOT NULL UNIQUE,
    departure_airport_id VARCHAR(20) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_airport_id VARCHAR(20) NOT NULL,
    arrival_time DATETIME NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id)
);

insert into flights 
	values (1, 2, 'VJ120', 'SGN', "2023-11-20 14:30:00", 'HAN', "2023-11-20 16:30:00"),
	       (2, 3, 'BB487', 'HAN', "2023-11-20 14:30:00", 'SGN', "2023-11-20 16:30:00"),
               (3, 4, 'HA666', 'ZSAQ', "2023-11-20 14:30:00", 'SGN', "2023-11-20 18:30:00"),
               (4, 1, 'VA232', 'PXU', "2023-11-20 14:30:00", 'ZSAQ', "2023-11-20 20:30:00"),
               (5, 1, 'E123', 'JFK', '2023-11-20 08:00:00', 'LAX', '2023-11-20 10:30:00'),
	       (6, 2, 'A456', 'LAX', '2023-11-20 12:00:00', 'DFW', '2023-11-20 15:30:00'),
               (7, 1, 'B789', 'ATL', '2023-11-20 14:30:00', 'ORD', '2023-11-20 17:00:00'),
               (8, 3, 'C101', 'DFW', '2023-11-20 18:45:00', 'ORD', '2023-11-20 20:15:00'),
               (9, 2, 'P323', 'PXU', "2023-11-20 14:30:00", 'HAN', "2023-11-20 16:30:00"),
	       (10, 3, 'HZ12', 'PXU', "2023-11-20 14:30:00", 'SGN', "2023-11-20 16:30:00"),
               (11, 4, 'PK213', 'PXU', "2023-11-20 14:30:00", 'SGN', "2023-11-20 18:30:00"),
               (12, 1, 'MK222', 'LAX', "2023-11-20 14:30:00", 'ZSAQ', "2023-11-20 20:30:00"),
               (13, 1, 'FG455', 'PXU', '2023-11-20 08:00:00', 'LAX', '2023-11-20 10:30:00'),
	       (14, 2, 'PU909', 'PXU', '2023-11-20 12:00:00', 'DFW', '2023-11-20 15:30:00'),
               (15, 1, 'B7889', 'PXU', '2023-11-20 14:30:00', 'ORD', '2023-11-20 17:00:00'),
               (16, 3, 'C1015', 'PXU', '2023-11-20 18:45:00', 'ORD', '2023-11-20 20:15:00');


-- myAirport ----------------------------------------------------------------------
CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) NOT NULL
);

insert into passengers
	values (1, "LE QUANG", "HUY", "2000-01-18", "M"),
	       (2, "THAI QUANG", "THINH", "2001-07-20", "M"),
               (3, "TRAN HAI ANH", "DIEN", "2001-10-23", "M");
           
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL UNIQUE,
    ticket_price DECIMAL(10, 2) NOT NULL,
    issue_date DATETIME NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

insert into tickets 
	values (1, 4, 3, "A32", 240.5, "2023-11-20"),
	       (2, 1, 1, "B33", 50.44, "2023-11-20"),
               (3, 1, 2, "B32", 50.44, "2023-11-20");

CREATE TABLE arrival_log(
    id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    flight_number VARCHAR(20) NOT NULL UNIQUE,
    arrival_airport_id VARCHAR(20) NOT NULL,
    arrival_time DATETIME NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number),
    FOREIGN KEY (arrival_airport_id) REFERENCES flights(arrival_airport_id),
    FOREIGN KEY (airline_id) REFERENCES flights(airline_id)
);

CREATE TABLE departure_log(
    id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    flight_number VARCHAR(20) NOT NULL UNIQUE,
    departure_airport_id VARCHAR(20) NOT NULL,
    departure_time DATETIME NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number),
    FOREIGN KEY (airline_id) REFERENCES flights(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES flights(departure_airport_id)
);

CREATE TABLE myAirport(
    id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    airline_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (airline_name) REFERENCES airlines(airline_name)
);

-- Managing functions ----------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE ManageGlobalFlights(IN airline_id_param INT, 
				     IN flight_number_param VARCHAR(20),
                                     IN departure_airport_id_param VARCHAR(20),
				     IN departure_time_param DATETIME,
		        	     IN arrival_airport_id_param VARCHAR(20),
                                     IN arrival_time_param DATETIME
                                     )
BEGIN
    select max(flight_id) into @max_flight_id from flights;
    INSERT INTO flights 
    VALUES (@max_flight_id + 1, airline_id_param, flight_number_param, departure_airport_id_param, departure_time_param, arrival_airport_id_param, arrival_time_param);
END //

CREATE PROCEDURE BookTicket( IN flight_id_param INT,
                             IN passenger_id_param INT,
                             IN seat_number_param VARCHAR(10),
                             IN ticket_price_param DECIMAL(10, 2)
	                     )
BEGIN
    select max(ticket_id) into @max_ticket_id from tickets;
    INSERT INTO tickets
    VALUES (@max_ticket_id+1, flight_id_param, passenger_id_param, seat_number_param, ticket_price_param, NOW());
END //

DELIMITER ;

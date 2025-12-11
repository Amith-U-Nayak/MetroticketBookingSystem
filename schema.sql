-- Metro Ticket Booking System Database Schema - Hyderabad Metro

CREATE DATABASE IF NOT EXISTS metro_booking;
USE metro_booking;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Admin table
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Stations table
CREATE TABLE IF NOT EXISTS stations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    station_code VARCHAR(10) UNIQUE NOT NULL,
    line_color VARCHAR(20) NOT NULL,
    position_x INT NOT NULL,
    position_y INT NOT NULL
);

-- Routes table (connections between stations)
CREATE TABLE IF NOT EXISTS routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    from_station_id INT NOT NULL,
    to_station_id INT NOT NULL,
    distance DECIMAL(10,2) NOT NULL,
    travel_time INT NOT NULL, -- in minutes
    FOREIGN KEY (from_station_id) REFERENCES stations(id),
    FOREIGN KEY (to_station_id) REFERENCES stations(id)
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    from_station_id INT NOT NULL,
    to_station_id INT NOT NULL,
    booking_date DATE NOT NULL,
    travel_date DATE NOT NULL,
    number_of_tickets INT NOT NULL DEFAULT 1,
    total_fare DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'confirmed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (from_station_id) REFERENCES stations(id),
    FOREIGN KEY (to_station_id) REFERENCES stations(id)
);

-- Insert default admin (password: admin123)
INSERT INTO admin (username, email, password) VALUES 
('admin', 'admin@metro.com', '$2y$10$FtjNs/MVF4gc6VTENZIlKOZcSCxsSuA7IjObj9Y9pLDVmI1j6VkTq');

-- Insert Hyderabad Metro stations (57 unique stations)
-- Red Line: Miyapur to L.B. Nagar (27 stations)
INSERT INTO stations (station_name, station_code, line_color, position_x, position_y) VALUES
('Miyapur', 'MYP', 'Red', 50, 100),
('JNTU College', 'JNT', 'Red', 100, 120),
('KPHB Colony', 'KPH', 'Red', 150, 140),
('Kukatpally', 'KUK', 'Red', 200, 160),
('Dr. B. R. Ambedkar Balanagar', 'AMB', 'Red', 250, 180),
('Moosapet', 'MOO', 'Red', 300, 200),
('Bharat Nagar', 'BHN', 'Red', 350, 220),
('Erragadda', 'ERR', 'Red', 400, 240),
('ESI Hospital', 'ESI', 'Red', 450, 260),
('S.R. Nagar', 'SRN', 'Red', 500, 280),
('Ameerpet', 'AMP', 'Red', 550, 300),
('Punjagutta', 'PNG', 'Red', 600, 320),
('Irrum Manzil', 'IRM', 'Red', 650, 340),
('Khairatabad', 'KHA', 'Red', 700, 360),
('Lakdi-ka-pul', 'LKP', 'Red', 750, 380),
('Assembly', 'ASM', 'Red', 800, 400),
('Nampally', 'NAP', 'Red', 850, 420),
('Gandhi Bhavan', 'GAN', 'Red', 900, 440),
('Osmania Medical College', 'OMC', 'Red', 950, 460),
('MG Bus Station', 'MGB', 'Red', 1000, 480),
('Malakpet', 'MAL', 'Red', 1050, 500),
('New Market', 'NEM', 'Red', 1100, 520),
('Musarambagh', 'MUS', 'Red', 1150, 540),
('Dilsukhnagar', 'DIL', 'Red', 1200, 560),
('Chaitanyapuri', 'CHT', 'Red', 1250, 580),
('Victoria Memorial', 'VIC', 'Red', 1300, 600),
('L.B. Nagar', 'LBN', 'Red', 1350, 620),

-- Blue Line: Raidurg to Nagole (23 stations, Ameerpet is shared - id 11)
('Raidurg', 'RDG', 'Blue', 550, 50),
('HITEC City', 'HTC', 'Blue', 550, 100),
('Durgam Cheruvu', 'DUR', 'Blue', 550, 150),
('Madhapur', 'MAD', 'Blue', 550, 200),
('Peddamma Gudi', 'PED', 'Blue', 550, 250),
('Jubilee Hills Check Post', 'JUB', 'Blue', 550, 300),
('Road No 5 Jubilee Hills', 'R05', 'Blue', 550, 350),
('Yusufguda', 'YUS', 'Blue', 550, 400),
('Madhura Nagar', 'MNA', 'Blue', 550, 450),
-- Ameerpet (id 11) is shared, skip here
('Begumpet', 'BGP', 'Blue', 550, 550),
('Prakash Nagar', 'PRA', 'Blue', 550, 600),
('Rasoolpura', 'RAS', 'Blue', 550, 650),
('Paradise', 'PRD', 'Blue', 550, 700),
('Parade Ground', 'PAG', 'Blue', 550, 750),
('Secunderabad West', 'SCW', 'Blue', 550, 800),
('Secunderabad East', 'SCE', 'Blue', 550, 850),
('Mettuguda', 'MET', 'Blue', 550, 900),
('Tarnaka', 'TAR', 'Blue', 550, 950),
('Habsiguda', 'HAB', 'Blue', 550, 1000),
('NGRI', 'NGR', 'Blue', 550, 1050),
('Stadium', 'STA', 'Blue', 550, 1100),
('Uppal', 'UPP', 'Blue', 550, 1150),
('Nagole', 'NAG', 'Blue', 550, 1200),

-- Green Line: Parade Ground to Falaknuma (9 stations, Parade Ground id 40 and MG Bus Station id 20 are shared)
('Gandhi Hospital', 'GHO', 'Green', 600, 750),
('Musheerabad', 'MSH', 'Green', 650, 750),
('RTC X Roads', 'RTC', 'Green', 700, 750),
('Chikkadpally', 'CHI', 'Green', 750, 750),
('Narayanaguda', 'NAR', 'Green', 800, 750),
('Sultan Bazaar', 'SUL', 'Green', 850, 750),
-- Parade Ground (id 40) and MG Bus Station (id 20) are shared
('Falaknuma', 'FAL', 'Green', 950, 750);

-- Insert routes for Red Line (Miyapur to L.B. Nagar) - stations 1-27
INSERT INTO routes (from_station_id, to_station_id, distance, travel_time) VALUES
(1, 2, 2.0, 4), (2, 3, 2.5, 5), (3, 4, 2.0, 4), (4, 5, 2.5, 5),
(5, 6, 2.0, 4), (6, 7, 2.5, 5), (7, 8, 2.0, 4), (8, 9, 2.5, 5),
(9, 10, 2.0, 4), (10, 11, 2.5, 5), (11, 12, 2.0, 4), (12, 13, 2.5, 5),
(13, 14, 2.0, 4), (14, 15, 2.5, 5), (15, 16, 2.0, 4), (16, 17, 2.5, 5),
(17, 18, 2.0, 4), (18, 19, 2.5, 5), (19, 20, 2.0, 4), (20, 21, 2.5, 5),
(21, 22, 2.0, 4), (22, 23, 2.5, 5), (23, 24, 2.0, 4), (24, 25, 2.5, 5),
(25, 26, 2.0, 4), (26, 27, 2.5, 5);

-- Insert routes for Blue Line (Raidurg to Nagole) - stations 28-50, with Ameerpet (11) in between
INSERT INTO routes (from_station_id, to_station_id, distance, travel_time) VALUES
(28, 29, 2.5, 5), (29, 30, 2.5, 5), (30, 31, 2.5, 5), (31, 32, 2.5, 5),
(32, 33, 2.5, 5), (33, 34, 2.5, 5), (34, 35, 2.5, 5), (35, 36, 2.5, 5),
(36, 11, 2.5, 5), (11, 37, 2.5, 5), (37, 38, 2.5, 5), (38, 39, 2.5, 5),
(39, 40, 2.5, 5), (40, 41, 2.5, 5), (41, 42, 2.5, 5), (42, 43, 2.5, 5),
(43, 44, 2.5, 5), (44, 45, 2.5, 5), (45, 46, 2.5, 5), (46, 47, 2.5, 5),
(47, 48, 2.5, 5), (48, 49, 2.5, 5), (49, 50, 2.5, 5);

-- Insert routes for Green Line (Parade Ground to Falaknuma) - stations 40 (Parade Ground), 51-56, 20 (MG Bus Station), 57 (Falaknuma)
INSERT INTO routes (from_station_id, to_station_id, distance, travel_time) VALUES
(40, 51, 2.5, 5), (51, 52, 2.5, 5), (52, 53, 2.5, 5), (53, 54, 2.5, 5),
(54, 55, 2.5, 5), (55, 56, 2.5, 5), (56, 20, 2.5, 5), (20, 57, 2.5, 5);

-- Reverse routes (bidirectional) - for all routes
INSERT INTO routes (from_station_id, to_station_id, distance, travel_time)
SELECT to_station_id, from_station_id, distance, travel_time FROM routes;

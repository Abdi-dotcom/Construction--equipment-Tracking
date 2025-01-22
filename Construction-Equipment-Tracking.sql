USE construction_equipment;

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_name VARCHAR(255),
    equipment_type VARCHAR(255),
    purchase_date DATE,
    initial_cost DECIMAL(10, 2)
);
-- Usage Table
CREATE TABLE Equipment_Usage (
    usage_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_id INT,
    start_time DATETIME,
    end_time DATETIME,
    hours_used DECIMAL(5, 2),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
-- Cost Table
CREATE TABLE Cost (
    cost_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_id INT,
    cost_type VARCHAR(255),
    cost_amount DECIMAL(10, 2),
    date_incurred DATE,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
-- Insert Equipment Data
INSERT INTO Equipment (equipment_name, equipment_type, purchase_date, initial_cost)
VALUES ('Excavator', 'Excavator', '2020-03-15', 50000.00),
       ('Bulldozer', 'Bulldozer', '2021-06-22', 75000.00);

-- Insert Usage Data
INSERT INTO Equipment_Usag (equipment_id, start_time, end_time, hours_used)
VALUES (1, '2025-01-01 08:00:00', '2025-01-01 16:00:00', 8),
       (2, '2025-01-02 09:00:00', '2025-01-02 17:00:00', 8);

-- Insert Cost Data
INSERT INTO Cost (equipment_id, cost_type, cost_amount, date_incurred)
VALUES (1, 'Fuel', 200.00, '2025-01-01'),
       (2, 'Maintenance', 500.00, '2025-01-02');
       
SELECT equipment_name, SUM(cost_amount) AS total_cost
FROM Equipment
JOIN Cost ON Equipment.equipment_id = Cost.equipment_id
GROUP BY equipment_name;
	
      
SELECT equipment_name, SUM(hours_used) AS total_usage
FROM Equipment
JOIN Equipment_Usage ON Equipment.equipment_id = Equipment_Usage.equipment_id
GROUP BY equipment_name;

select *
from Equipment_Usage ;



-- Insert Usage Data for Two Years
INSERT INTO Equipment_Usage (equipment_id, start_time, end_time, hours_used)
VALUES 
(1, '2025-01-01 08:00:00', '2025-01-01 16:00:00', 8),
(2, '2025-01-02 09:00:00', '2025-01-02 17:00:00', 8),
(1, '2025-01-05 08:00:00', '2025-01-05 16:00:00', 8),
(2, '2025-01-06 09:00:00', '2025-01-06 17:00:00', 8),
(1, '2025-01-10 08:00:00', '2025-01-10 16:00:00', 8),
(2, '2025-01-12 09:00:00', '2025-01-12 17:00:00', 8),
(1, '2025-01-15 08:00:00', '2025-01-15 16:00:00', 8),
(2, '2025-01-17 09:00:00', '2025-01-17 17:00:00', 8),
(1, '2025-02-01 08:00:00', '2025-02-01 16:00:00', 8),
(2, '2025-02-03 09:00:00', '2025-02-03 17:00:00', 8),
(1, '2025-02-07 08:00:00', '2025-02-07 16:00:00', 8),
(2, '2025-02-09 09:00:00', '2025-02-09 17:00:00', 8),
(1, '2025-02-15 08:00:00', '2025-02-15 16:00:00', 8),
(2, '2025-02-18 09:00:00', '2025-02-18 17:00:00', 8),
(1, '2025-03-01 08:00:00', '2025-03-01 16:00:00', 8),
(2, '2025-03-03 09:00:00', '2025-03-03 17:00:00', 8),
(1, '2025-03-07 08:00:00', '2025-03-07 16:00:00', 8),
(2, '2025-03-09 09:00:00', '2025-03-09 17:00:00', 8),
(1, '2025-03-12 08:00:00', '2025-03-12 16:00:00', 8),
(2, '2025-03-15 09:00:00', '2025-03-15 17:00:00', 8);

-- Insert Cost Data for Two Years
INSERT INTO Cost (equipment_id, cost_type, cost_amount, date_incurred)
VALUES
(1, 'Fuel', 200.00, '2025-01-01'),
(2, 'Fuel', 250.00, '2025-01-02'),
(1, 'Maintenance', 500.00, '2025-01-05'),
(2, 'Fuel', 230.00, '2025-01-06'),
(1, 'Fuel', 210.00, '2025-01-10'),
(2, 'Maintenance', 450.00, '2025-01-12'),
(1, 'Fuel', 215.00, '2025-01-15'),
(2, 'Fuel', 240.00, '2025-01-17'),
(1, 'Maintenance', 550.00, '2025-02-01'),
(2, 'Fuel', 220.00, '2025-02-03'),
(1, 'Fuel', 230.00, '2025-02-07'),
(2, 'Maintenance', 470.00, '2025-02-09'),
(1, 'Fuel', 225.00, '2025-02-15'),
(2, 'Fuel', 240.00, '2025-02-18'),
(1, 'Fuel', 210.00, '2025-03-01'),
(2, 'Maintenance', 500.00, '2025-03-03'),
(1, 'Fuel', 220.00, '2025-03-07'),
(2, 'Fuel', 230.00, '2025-03-09'),
(1, 'Maintenance', 600.00, '2025-03-12'),
(2, 'Fuel', 250.00, '2025-03-15');

select *
from cost;
SELECT equipment_name, SUM(cost_amount) AS total_fuel_cost
FROM Equipment
JOIN Cost ON Equipment.equipment_id = Cost.equipment_id
WHERE cost_type = 'Fuel'
GROUP BY equipment_name;

-- Insert More Equipment Data
INSERT INTO Equipment (equipment_name, equipment_type, purchase_date, initial_cost)
VALUES
    ('Loader', 'Loader', '2021-01-10', 40000.00),
    ('Crane', 'Crane', '2019-07-25', 120000.00),
    ('Dump Truck', 'Dump Truck', '2022-11-15', 95000.00);
    
-- Insert Usage Data for All Equipment
INSERT INTO Equipment_Usage (equipment_id, start_time, end_time, hours_used)
VALUES
    -- Excavator
    (1, '2025-01-01 07:00:00', '2025-01-01 15:00:00', 8),
    (1, '2025-01-03 08:00:00', '2025-01-03 16:00:00', 8),
    (1, '2025-02-10 08:00:00', '2025-02-10 16:00:00', 8),

    -- Bulldozer
    (2, '2025-01-02 09:00:00', '2025-01-02 17:00:00', 8),
    (2, '2025-02-15 07:30:00', '2025-02-15 15:30:00', 8),
    (2, '2025-03-10 08:00:00', '2025-03-10 16:00:00', 8),

    -- Loader
    (3, '2025-01-07 07:00:00', '2025-01-07 15:00:00', 8),
    (3, '2025-02-18 09:00:00', '2025-02-18 17:00:00', 8),
    (3, '2025-03-01 07:30:00', '2025-03-01 15:30:00', 8),

    -- Crane
    (4, '2025-01-12 08:00:00', '2025-01-12 16:00:00', 8),
    (4, '2025-02-22 09:00:00', '2025-02-22 17:00:00', 8),
    (4, '2025-03-15 07:30:00', '2025-03-15 15:30:00', 8),

    -- Dump Truck
    (5, '2025-01-15 08:00:00', '2025-01-15 16:00:00', 8),
    (5, '2025-02-25 07:30:00', '2025-02-25 15:30:00', 8),
    (5, '2025-03-20 09:00:00', '2025-03-20 17:00:00', 8);
    
-- Insert Cost Data for All Equipment
INSERT INTO Cost (equipment_id, cost_type, cost_amount, date_incurred)
VALUES
    -- Excavator Costs
    (1, 'Fuel', 200.00, '2025-01-01'),
    (1, 'Maintenance', 500.00, '2025-02-10'),
    (1, 'Repairs', 300.00, '2025-03-01'),

    -- Bulldozer Costs
    (2, 'Fuel', 250.00, '2025-01-02'),
    (2, 'Insurance', 800.00, '2025-02-15'),
    (2, 'Repairs', 600.00, '2025-03-10'),

    -- Loader Costs
    (3, 'Fuel', 180.00, '2025-01-07'),
    (3, 'Maintenance', 450.00, '2025-02-18'),
    (3, 'Operator Fees', 300.00, '2025-03-01'),

    -- Crane Costs
    (4, 'Fuel', 400.00, '2025-01-12'),
    (4, 'Insurance', 1200.00, '2025-02-22'),
    (4, 'Maintenance', 600.00, '2025-03-15'),

    -- Dump Truck Costs
    (5, 'Fuel', 300.00, '2025-01-15'),
    (5, 'Repairs', 700.00, '2025-02-25'),
    (5, 'Operator Fees', 350.00, '2025-03-20');

SELECT equipment_name, SUM(cost_amount) AS total_cost
FROM Equipment
JOIN Cost ON Equipment.equipment_id = Cost.equipment_id
GROUP BY equipment_name;

SELECT equipment_name, SUM(hours_used) AS total_usage_hours
FROM Equipment
JOIN Equipment_Usage ON Equipment.equipment_id = Equipment_Usage.equipment_id
GROUP BY equipment_name;

-- find the most expensive cost type for each equipment:
SELECT 
    e.equipment_name,
    c.cost_type,
    MAX(c.cost_amount) AS max_cost
FROM 
    Equipment e
JOIN 
    Cost c ON e.equipment_id = c.equipment_id
GROUP BY 
    e.equipment_name, c.cost_type
ORDER BY 
    e.equipment_name;

Select *
from Equipment_Usage;
    
-- Rank Equipment Based on Total Usage Hours:

select
e.equipment_name,
sum(u.hours_used) as total_usage_hours,
rank()over(order by sum(u.hours_used) desc) as usage_rank
from
Equipment e
join
Equipment_Usage u on e.equipment_id = u.equipment_id
group by
e.equipment_name;

-- Monthly Cost Breakdown for Each Equipment:
SELECT 
    e.equipment_name,
    DATE_FORMAT(c.date_incurred, '%Y-%m') AS cost_month,
    SUM(c.cost_amount) AS total_monthly_cost
FROM 
    Equipment e
JOIN 
    Cost c ON e.equipment_id = c.equipment_id
GROUP BY 
    e.equipment_name, cost_month
ORDER BY 
    cost_month, e.equipment_name;

WITH DailyUsage AS (
    SELECT 
        equipment_id,
        DATE(start_time) AS usage_date,
        SUM(hours_used) AS daily_hours
    FROM 
        Equipment_Usage
    GROUP BY 
        equipment_id, DATE(start_time)
)
SELECT 
    e.equipment_name,
    AVG(d.daily_hours) AS avg_daily_usage
FROM 
    Equipment e
JOIN 
    DailyUsage d ON e.equipment_id = d.equipment_id
GROUP BY 
    e.equipment_name
HAVING 
    AVG(d.daily_hours) < 5;


SELECT 
    e.equipment_name,
    SUM(c.cost_amount) AS total_fuel_cost,
    RANK() OVER (ORDER BY SUM(c.cost_amount) DESC) AS fuel_cost_rank
FROM 
    Equipment e
JOIN 
    Cost c ON e.equipment_id = c.equipment_id
WHERE 
    c.cost_type = 'Fuel'
GROUP BY 
    e.equipment_name;



-- Identify Underutilized Equipment

WITH DailyUsage AS(
SELECT 
 equipment_id,
 DATE(start_time) AS Usage_date,
 SUM(hours_used) AS daily_hours
FROM
 Equipment_Usage 
GROUP BY
 equipment_id,DATE(start_time)
 )
 SELECT 
    e.equipment_name,
    AVG(d.daily_hours) AS avg_daily_usage
FROM 
    Equipment e
JOIN 
    DailyUsage d ON e.equipment_id = d.equipment_id
GROUP BY 
    e.equipment_name
HAVING 
    AVG(d.daily_hours) < 6;
    
-- Compare Fuel Costs Across Equipment

SELECT 
    e.equipment_name,
    SUM(c.cost_amount) AS total_fuel_cost,
    RANK() OVER (ORDER BY SUM(c.cost_amount) DESC) AS fuel_cost_rank
FROM 
    Equipment e
JOIN 
    Cost c ON e.equipment_id = c.equipment_id
WHERE 
    c.cost_type = 'Fuel'
GROUP BY 
    e.equipment_name;


--  Find the Day with the Highest Usage Across All Equipment
SELECT 
    DATE(start_time) AS usage_date,
    SUM(hours_used) AS total_hours
FROM 
    Equipment_Usage
GROUP BY 
    DATE(start_time)
ORDER BY 
    total_hours DESC
LIMIT 1;


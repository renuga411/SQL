-- Q1: Count total number of orders
select count(Order_id) as Total_Order from orders ;

-- Q2: List all unique dealers
select distinct Dealer_Name from Dealer_Master;

-- Q3: Get total orders per dealer
select d.dealer_code , d.dealer_name,count(o.order_id) as total_orders from dealer_master d
 left join orders o 
 on d.dealer_code=o.dealer_code
 group by d.dealer_code,d.dealer_name; 

-- Q4: Find distinct bike models ordered
select distinct model_code from orders;

-- Q5: Get customer names who ordered from Chennai
select c.customer_name from customer_master c
left join orders o
on c.Customer_ID=o.Customer_ID
where city="chennai";

-- Q6: Count how many orders are incomplete
select count(*) from orders where Actual_Delivery_Date is null;

-- Q7: Get orders placed in 2023
 select * from orders where order_date between 01-01-2023 and 31-12-2023;

-- Q8: List orders with Expected_Delivery_Date in Jan 2024
select * from orders where Expected_Delivery_Date between 01-01-2024 and 31-01-2024;

-- Q9: Show dealer-wise order count sorted by count descending
select * from orders order by dealer_code desc;

-- Q10: Find how many customers have placed more than 1 order
select customer_id, count(order_id) from orders group by customer_id having count(order_id) >1;
-- Q11: List orders with Actual_Delivery_Date IS NULL
select * from orders where Actual_Delivery_Date is null;

-- Q12: Get top 5 models by order count
select b.bike_model,o.model_code,count(*)as order_count from orders o
left join bike_master b on o.model_code=b.Model_Code
group by b.Bike_Model,o.Model_Code
order by order_count  desc
limit 5;

-- Q13: Find customers from 'Madurai' district
select * from customer_master where city="madurai";

-- Q14: Count orders per month in 2024
select month(order_date)as order_month,count(*)as order_count from orders
where year(Order_Date)=2024
group by month(Order_Date)
order by order_month;

-- Q15: Show all columns for the most recent order
select * from orders 
order by Order_Date desc limit 5;

-- Q16: Calculate delivery duration for each order
select order_id,order_date,actual_delivery_date,datediff(Actual_Delivery_Date,order_date) from orders;

-- Q17: List delayed orders where Actual > Expected
select order_id,Expected_Delivery_Date,actual_delivery_date,datediff(Actual_Delivery_Date,Expected_Delivery_Date) from orders 
WHERE  Actual_Delivery_Date > Expected_Delivery_Date;

-- Q18: Join Orders and Dealers and show Order_ID, Dealer_Name
select o.order_id,d.dealer_name from orders o
left join dealer_master d on o.dealer_code=d.Dealer_Code;

-- Q19: List customers who purchased the same model more than once
select customer_id,model_code,count(*) as purchase_list from orders
group by Customer_ID,model_code
having purchase_list>1;

-- Q20: Count orders per bike category
select b.category,count(o.order_id) as total_orders from orders o
join bike_master b  on o.model_code=b.Model_Code
group by b.Category
order by total_orders desc;

-- Q21: Get model-wise average delivery duration
select b.model_code,b.bike_model,avg(datediff(o.actual_delivery_date,o.order_date)) as avg_delivery_days from orders o
join bike_master b on o.model_code=b.model_code
group by b.model_code,b.bike_model
order by avg_delivery_days desc;

-- Q22: Use CASE WHEN to create Delivery_Status column
select order_id,order_date,expected_delivery_date,actual_delivery_date,
case
when actual_delivery_date is null then 'pending'
when actual_delivery_date<=Expected_Delivery_Date then 'on time'
else 'delayed'
end as delivery_status
from orders; 

-- Q23: Join Orders with Bike_Master and calculate total revenue per model
select b.model_code,b.bike_model, sum(b.on_road_price)as total_revenue from orders o
join bike_master b on o.Model_Code=b.model_code
group by b.model_code, b.Bike_Model
order by total_revenue desc;

-- Q24: Count orders per customer gender
select c.gender,count(o.order_id) as total_orders from orders o
join customer_master c on o.Customer_ID=c.Customer_ID
group by c.gender;

-- Q25: Show latest stage updated date per order 
select order_id, max(stage_updated_timestamp) as latest_stage_updated from orders
group by order_id;

-- Q26: Find all orders where stage update is older than 7 days
select order_id,max(stage_updated_timestamp) as last_stage_update from orders 
group by order_id
having max(Stage_Updated_Timestamp)< date_sub(curdate(),interval 7 day);

-- Q27: Calculate monthly revenue 
select month(o.order_date),sum(b.on_road_price) from orders o
join bike_master b on o.Model_Code=b.Model_Code
group by month(o.order_date);

-- Q28: Count how many dealers have > 100 orders
 select count(*) as dealer_over_100_orders 
 from (select dealer_code
 from orders 
 group by dealer_code
 having count(order_id)>100)d;

-- Q29: Rank models by order count using window function
 select b.model_code,b.bike_model, count(o.order_id) as order_count,rank() over (order by count(o.order_id) desc)as model_rank from orders o
 join bike_master b on o.model_code=b.Model_Code
 group by b.Model_Code,b.bike_model
 order by model_rank;

-- Q30: Retrieve top 3 districts by total sales
select d.district, sum(b.on_road_price) as total_sales from orders o
join bike_master b on o.model_code=b.model_code
join dealer_master d on o.dealer_code=d.Dealer_Code
group by d.District
order by total_sales desc
limit 3; 

-- Q31: Get % of delayed orders per dealer
select o.dealer_code,round(100*sum(case 
when o.actual_delivery_date>o.expected_delivery_date then 1
else 0
end)/count(o.order_id),2) as order_delay_percentage from orders o
group by o.dealer_code
order by order_delay_percentage desc; 

-- Q32: Use CTE to get monthly order trend and YoY growth
WITH Monthly_Orders AS (
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        COUNT(Order_ID) AS Total_Orders
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
),
YoY_Calc AS (
    SELECT
        curr.Order_Year,
        curr.Order_Month,
        curr.Total_Orders AS Current_Year_Orders,
        prev.Total_Orders AS Previous_Year_Orders,
        ROUND(
            (curr.Total_Orders - prev.Total_Orders) * 100.0 
            / prev.Total_Orders,
            2
        ) AS YoY_Growth_Percentage
    FROM Monthly_Orders curr
    LEFT JOIN Monthly_Orders prev
        ON curr.Order_Month = prev.Order_Month
       AND curr.Order_Year = prev.Order_Year + 1
)
SELECT
    Order_Year,
    Order_Month,
    Current_Year_Orders,
    Previous_Year_Orders,
    YoY_Growth_Percentage
FROM YoY_Calc
ORDER BY Order_Year, Order_Month;
-- Q33: Create a view of all completed orders with full info
CREATE VIEW Completed_Orders_Full AS
SELECT
    o.Order_ID,
    o.Order_Date,
    o.Expected_Delivery_Date,
    o.Actual_Delivery_Date,
    c.Customer_ID,
    c.Customer_Name,
    c.Gender,
    c.City AS Customer_City,
    d.Dealer_Code,
    d.Dealer_Name,
    d.District AS Dealer_District,
    b.Model_Code,
    b.Bike_Model,
    b.Category AS Bike_Category,
    b.Fuel_Type,
    b.On_Road_Price,
    CASE
        WHEN o.Actual_Delivery_Date <= o.Expected_Delivery_Date THEN 'On Time'
        ELSE 'Delayed'
    END AS Delivery_Status,
    o.Stages,
    o.Stage_Updated_Timestamp
FROM Orders o
JOIN Customer_Master c
    ON o.Customer_ID = c.Customer_ID
JOIN Dealer_Master d
    ON o.Dealer_Code = d.Dealer_Code
JOIN Bike_Master b
    ON o.Model_Code = b.Model_Code
WHERE o.Actual_Delivery_Date IS NOT NULL;

SELECT * FROM Completed_Orders_Full
WHERE Dealer_District = 'Chennai';

-- Q34: Use window functions to calculate running total of orders
SELECT Order_Date,
    COUNT(Order_ID) AS Orders_Per_Day,
    SUM(COUNT(Order_ID)) OVER (
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total_Orders
FROM Orders
GROUP BY Order_Date
ORDER BY Order_Date;

-- Q35: Find average delivery days by district and model
SELECT d.District,b.Model_Code,b.Bike_Model,
    ROUND(AVG(DATEDIFF(o.Actual_Delivery_Date, o.Order_Date)), 2) AS Avg_Delivery_Days
FROM Orders o
JOIN Dealer_Master d ON o.Dealer_Code = d.Dealer_Code
JOIN Bike_Master b ON o.Model_Code = b.Model_Code
WHERE o.Actual_Delivery_Date IS NOT NULL
GROUP BY d.District,b.Model_Code,b.Bike_Model
ORDER BY d.District,Avg_Delivery_Days;

-- Q36: Join 3 tables to get full order info with bike and dealer
SELECT
    o.Order_ID,o.Order_Date,o.Expected_Delivery_Date,o.Actual_Delivery_Date,
    c.Customer_ID,c.Customer_Name,c.Gender,c.City,
    d.Dealer_Code,d.Dealer_Name,d.District,
    b.Model_Code,b.Bike_Model,b.Category AS Bike_Category,b.Fuel_Type,b.On_Road_Price,
    CASE
        WHEN o.Actual_Delivery_Date IS NULL THEN 'Pending'
        WHEN o.Actual_Delivery_Date <= o.Expected_Delivery_Date THEN 'On Time'
        ELSE 'Delayed'
    END AS Delivery_Status,o.Stages,o.Stage_Updated_Timestamp
FROM Orders o
JOIN Customer_Master c ON o.Customer_ID = c.Customer_ID
JOIN Dealer_Master d ON o.Dealer_Code = d.Dealer_Code
JOIN Bike_Master b ON o.Model_Code = b.Model_Code
ORDER BY o.Order_Date DESC;

-- Q37: Create a flag for repeat customers using subquery
 SELECT o.Order_ID,o.Customer_ID,o.Order_Date,o.Model_Code, c.Customer_Name,
    CASE
        WHEN (
            SELECT COUNT(*)
            FROM Orders o2
            WHERE o2.Customer_ID = o.Customer_ID
        ) > 1 THEN 'Repeat'
        ELSE 'New'
    END AS Customer_Flag
FROM Orders o
JOIN Customer_Master c ON o.Customer_ID = c.Customer_ID
ORDER BY o.Customer_ID, o.Order_Date;

-- Q38: Use DATEDIFF to segment delivery time buckets
SELECT Order_ID,Expected_Delivery_Date,Actual_Delivery_Date,
    DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) AS delivery_days,
    CASE
        WHEN Actual_Delivery_Date IS NULL THEN 'Not Delivered'
        WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) BETWEEN 0 AND 2
            THEN '0-2 Days'
        WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) BETWEEN 3 AND 5
            THEN '3-5 Days'
        WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) BETWEEN 6 AND 10
            THEN '6-10 Days'
        ELSE '>10 Days'
    END AS delivery_bucket
FROM Orders;

-- Q39: Get top 5 customers by revenue
SELECT c.Customer_ID,c.Customer_Name,
    SUM(b.On_Road_Price) AS total_revenue
FROM Orders o
JOIN Customer_Master c ON o.Customer_ID = c.Customer_ID
JOIN Bike_Master b ON o.Model_Code = b.Model_Code
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY total_revenue DESC
LIMIT 5;

-- Q40: Find which bike has most on-time deliveries
SELECT b.Model_Code,b.Bike_Model,
    COUNT(*) AS on_time_deliveries
FROM Orders o
JOIN Bike_Master b ON o.Model_Code = b.Model_Code
where o.actual_delivery_date <= o.expected_delivery_date
GROUP BY b.Model_Code, b.Bike_Model
ORDER BY on_time_deliveries DESC
LIMIT 1;

-- Q41: Create monthly performance summary with aggregates
SELECT DATE_FORMAT(o.Order_Date, '%Y-%m') AS order_month,
COUNT(*) AS total_orders,
COUNT(o.Actual_Delivery_Date) AS completed_orders,
SUM(
CASE
WHEN o.Actual_Delivery_Date <= o.Expected_Delivery_Date THEN 1
ELSE 0
END
) AS on_time_orders,
SUM(
CASE
WHEN o.Actual_Delivery_Date > o.Expected_Delivery_Date THEN 1
ELSE 0
END
) AS delayed_orders,
ROUND(
AVG(DATEDIFF(o.Actual_Delivery_Date, o.Expected_Delivery_Date)), 2) AS avg_delivery_days,
ROUND(
100.0 *SUM(
CASE
WHEN o.Actual_Delivery_Date <= o.Expected_Delivery_Date THEN 1
ELSE 0
END
) / NULLIF(COUNT(o.Actual_Delivery_Date), 0),2) AS on_time_percentage
FROM Orders o
GROUP BY DATE_FORMAT(o.Order_Date, '%Y-%m')
ORDER BY order_month;

-- Q42: Use LAG() to compare order dates of same customer
SELECT Order_ID,Customer_ID,Order_Date,
LAG(Order_Date) OVER (
	PARTITION BY Customer_ID
	ORDER BY Order_Date
) AS previous_order_date,
DATEDIFF(
	Order_Date,
	LAG(Order_Date) OVER (PARTITION BY Customer_ID
		ORDER BY Order_Date)) AS days_since_last_order
FROM Orders
ORDER BY Customer_ID, Order_Date; 

-- Q43: Find dealers who improved their SLA month over month
SELECT o.Dealer_Code,DATE_FORMAT(o.Order_Date, '%Y-%m') AS order_month,
ROUND(
100.0 *SUM(
CASE
	WHEN o.Actual_Delivery_Date <= o.Expected_Delivery_Date THEN 1
	ELSE 0
END
) / NULLIF(COUNT(o.Actual_Delivery_Date), 0),2) AS sla_percentage
FROM Orders o
WHERE o.Actual_Delivery_Date IS NOT NULL
GROUP BY o.Dealer_Code, DATE_FORMAT(o.Order_Date, '%Y-%m');

-- Q44: Create a report of average days per stage (engine, body, final)
WITH stage_durations AS (
SELECT Order_ID,Stages,Stage_Updated_Timestamp,
LAG(Stage_Updated_Timestamp) OVER (
	PARTITION BY Order_ID
	ORDER BY Stage_Updated_Timestamp
) AS prev_stage_timestamp
FROM Orders
)
SELECT Stages AS stage_name,
ROUND(
AVG(
DATEDIFF(
	Stage_Updated_Timestamp,
	prev_stage_timestamp)),2) AS avg_days_in_stage
FROM stage_durations
WHERE prev_stage_timestamp IS NOT NULL
GROUP BY Stages
ORDER BY stage_name;

-- Q45: Write a query to estimate delay impact on total sales by dealer
SELECT d.Dealer_Code,d.Dealer_Name,
SUM(b.On_Road_Price) AS total_sales,
SUM(
CASE
	WHEN o.Actual_Delivery_Date > o.Expected_Delivery_Date
		THEN b.On_Road_Price
	ELSE 0
END
) AS delayed_sales,
ROUND(
100.0 *SUM(
CASE
	WHEN o.Actual_Delivery_Date > o.Expected_Delivery_Date
		THEN b.On_Road_Price
	ELSE 0
END
) / NULLIF(SUM(b.On_Road_Price), 0),2) AS delay_impact_percentage
FROM Orders o
JOIN Dealer_Master d ON o.Dealer_Code = d.Dealer_Code
JOIN Bike_Master b ON o.Model_Code = b.Model_Code
WHERE o.Actual_Delivery_Date IS NOT NULL
GROUP BY d.Dealer_Code, d.Dealer_Name
ORDER BY delay_impact_percentage DESC;


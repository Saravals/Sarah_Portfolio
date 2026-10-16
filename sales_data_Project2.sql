SELECT * FROM sales_data_project2;

SELECT 
	Sale_Date,
	   STR_TO_DATE(Sale_Date, '%m/%d/%Y %H:%i') AS date_convert
FROM sales_data_project2
LIMIT 10;

ALTER TABLE sales_data_project2
ADD COLUMN date_convert DATE;

SELECT
    Sale_Date,
    STR_TO_DATE(Sale_Date, '%m/%d/%Y %H:%i') AS converted_datetime,
    DATE(STR_TO_DATE(Sale_Date, '%m/%d/%Y %H:%i')) AS converted_date
FROM sales_data_project2
LIMIT 10;

UPDATE sales_data_project2
SET date_convert = DATE(
    STR_TO_DATE(Sale_Date, '%m/%d/%Y %H:%i')
);

SELECT Sale_Date, date_convert
FROM sales_data_project2
LIMIT 10;

ALTER TABLE sales_data_project2
DROP COLUMN Sale_Date;


ALTER TABLE sales_data_project2
RENAME COLUMN date_convert TO Sale_Date;

DESCRIBE sales_data_project2;

#Determining date range
SELECT
    COUNT(*) AS total_records,
    MIN(Sale_Date) AS first_sale_date,
    MAX(Sale_Date) AS last_sale_date
FROM sales_data_project2;

#Calculate total net sales
SELECT  
	SUM(`Calculated Net Sales`) as Net_sales
FROM sales_data_project2;

#Calculate total gross profit
SELECT  
	SUM(`Calculated Gross Profit`) as total_gross_profit
FROM sales_data_project2;

#Calculate gross profit margin
SELECT
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2;

#Calculate total units sold
SELECT
	SUM(Quantity_Sold) AS total_units_sold
FROM sales_data_project2;

#Calculate average net sales per record
SELECT ROUND (AVG(`Calculated Net Sales`),2) AS avg_net_sales
FROM sales_data_project2;

#Compare sales across regions
SELECT
	Region,
    ROUND(SUM(`Calculated Net Sales`),2) as total_sales
FROM sales_data_project2
GROUP BY region
ORDER BY total_sales DESC;

#Net sales by product category
SELECT
	Product_Category,
    ROUND(SUM(`Calculated Net Sales`),2) AS net_sales
FROM sales_data_project2
GROUP BY Product_Category
ORDER BY net_sales DESC;

#Net sales by sales representative
SELECT
	Sales_Rep,
    ROUND(SUM(`Calculated Net Sales`),2) AS net_sales
FROM sales_data_project2
GROUP BY Sales_Rep
ORDER BY net_sales DESC;

#Net sales by customer type
SELECT
	Customer_Type,
    ROUND(SUM(`Calculated Net Sales`),2) AS net_sales
FROM sales_data_project2
GROUP BY Customer_Type
ORDER BY net_sales DESC;

#Net sales by sales channel
SELECT
	Sales_Channel,
    ROUND(SUM(`Calculated Net Sales`),2) AS net_sales
FROM sales_data_project2
GROUP BY Sales_Channel
ORDER BY net_sales DESC;

#Net sales by payment method
SELECT
	Payment_Method,
    ROUND(SUM(`Calculated Net Sales`),2) AS net_sales
FROM sales_data_project2
GROUP BY Payment_Method
ORDER BY net_sales DESC;

#Investigate profitability by product category

SELECT
    Product_Category,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Product_Category
ORDER BY Total_Gross_Profit DESC;

#Profitability by region
SELECT
	Region,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Region
ORDER BY Total_Gross_Profit DESC;

#profitability by sales representative
SELECT
	Sales_Rep,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Sales_Rep
ORDER BY Total_Gross_Profit DESC;

#profitability by customer type

SELECT
    Customer_Type,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Customer_Type
ORDER BY Total_Gross_Profit DESC;

#Profitability by sales channel

SELECT
    Sales_Channel,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Sales_Channel
ORDER BY Total_Gross_Profit DESC;

#Profitability by payment method

SELECT
    Payment_Method,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated COGS`), 2) AS Total_COGS,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Payment_Method
ORDER BY Total_Gross_Profit DESC;

##The discount impact

SELECT
    Discount,
    COUNT(*) AS Record_Count,
    ROUND(AVG(Discount) * 100, 2) AS Discount_Percent,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Discount
ORDER BY Discount;

#Analyze monthly sales trends

SELECT
    DATE_FORMAT(Sale_Date, '%Y-%m') AS Sales_Month,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY DATE_FORMAT(Sale_Date, '%Y-%m')
ORDER BY Sales_Month;

#Check the number of records per month

SELECT
    DATE_FORMAT(Sale_Date, '%Y-%m') AS Sales_Month,
    COUNT(*) AS Record_Count,
    ROUND(SUM(`Calculated Net Sales`), 2) AS Total_Net_Sales
FROM sales_data_project2
GROUP BY DATE_FORMAT(Sale_Date, '%Y-%m')
ORDER BY Sales_Month;

#Analyze gross profit margin by product category

SELECT
    Product_Category,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Product_Category
ORDER BY Gross_Profit_Margin_Percent DESC;

##Check the gross profit margin by region

SELECT
    Region,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Region
ORDER BY Gross_Profit_Margin_Percent DESC;


##Gross profit margin by sales representative
SELECT
    Sales_Rep,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Sales_Rep
ORDER BY Gross_Profit_Margin_Percent DESC;

#Gross profit margin by sales channel

SELECT
    Sales_Channel,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Sales_Channel
ORDER BY Gross_Profit_Margin_Percent DESC;

#Gross Profit by customer type

SELECT
    Customer_Type,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Customer_Type
ORDER BY Gross_Profit_Margin_Percent DESC;

#Gross profit margin by payment method

SELECT
    Payment_Method,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Payment_Method
ORDER BY Gross_Profit_Margin_Percent DESC;

#average gross profit margin at each discount level

SELECT
    Discount,
    COUNT(*) AS Record_Count,
    ROUND(
        SUM(`Calculated Gross Profit`)
        / SUM(`Calculated Net Sales`) * 100,
        2
    ) AS Gross_Profit_Margin_Percent
FROM sales_data_project2
GROUP BY Discount
ORDER BY Discount;

#check how many records have negative gross profit, zero gross profit, or positive gross profit.

SELECT
    CASE
        WHEN `Calculated Gross Profit` < 0 THEN 'Loss'
        WHEN `Calculated Gross Profit` = 0 THEN 'Break-even'
        ELSE 'Profit'
    END AS Profit_Status,
    COUNT(*) AS Record_Count,
    ROUND(SUM(`Calculated Gross Profit`), 2) AS Total_Gross_Profit
FROM sales_data_project2
GROUP BY Profit_Status
ORDER BY Total_Gross_Profit;

#compare the average discount for profitable and loss-making records. This will help us determine whether the loss-making group generally receives larger discounts.

SELECT
    CASE
        WHEN `Calculated Gross Profit` < 0 THEN 'Loss'
        ELSE 'Profit'
    END AS Profit_Status,
    COUNT(*) AS Record_Count,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
    ROUND(AVG(Unit_Price), 2) AS Average_Unit_Price,
    ROUND(AVG(Unit_Cost), 2) AS Average_Unit_Cost,
    ROUND(AVG(`Calculated Gross Profit`), 2) AS Average_Gross_Profit
FROM sales_data_project2
GROUP BY Profit_Status;

#Check whether unit cost exceeds the discounted selling price

SELECT 
    COUNT(*) AS Loss_Record_Count,
    SUM(CASE
        WHEN Unit_Price * (1 - Discount) < Unit_Cost THEN 1
        ELSE 0
    END) AS Unit_Price_Below_Cost_Count,
    SUM(CASE
        WHEN Unit_Price * (1 - Discount) >= Unit_Cost THEN 1
        ELSE 0
    END) AS Unit_Price_At_Or_Above_Cost_Count
FROM
    sales_data_project2
WHERE
    `Calculated Gross Profit` < 0;

#Find the discount level at which records start making losses

SELECT
    ROUND(AVG(Discount) * 100, 2) AS Average_Actual_Discount_Percent,
    ROUND(
        AVG((Unit_Price - Unit_Cost) / Unit_Price) * 100,
        2
    ) AS Average_Break_Even_Discount_Percent,
    ROUND(
        MIN((Unit_Price - Unit_Cost) / Unit_Price) * 100,
        2
    ) AS Lowest_Break_Even_Discount_Percent,
    ROUND(
        MAX((Unit_Price - Unit_Cost) / Unit_Price) * 100,
        2
    ) AS Highest_Break_Even_Discount_Percent
FROM sales_data_project2
WHERE Unit_Price > 0;

#compare the actual discount with the maximum discount that would leave the selling price equal to unit cost.
SELECT
    COUNT(*) AS Total_Records,
    SUM(
        CASE
            WHEN Discount > (Unit_Price - Unit_Cost) / Unit_Price
            THEN 1 ELSE 0
        END
    ) AS Above_Break_Even,
    SUM(
        CASE
            WHEN ABS(
                Discount - (Unit_Price - Unit_Cost) / Unit_Price
            ) < 0.000001
            THEN 1 ELSE 0
        END
    ) AS At_Break_Even,
    SUM(
        CASE
            WHEN Discount < (Unit_Price - Unit_Cost) / Unit_Price
            THEN 1 ELSE 0
        END
    ) AS Below_Break_Even
FROM sales_data_project2
WHERE Unit_Price > 0;
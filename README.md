# Serah-s-Portfolio

# End to End Sales Analysis Project

## Project Overview
This project analyzes a synthetic sales dataset containing 1,000 records to understand sales performance and profitability. The goal is to identify patterns in sales, compare business segments, and highlight potential areas for improvement.

## Tools Used
- Microsoft Excel 2016
- Power Query
- MySQL Workbench and SQL
- Power BI

  ### Project Files
* [Power BI Report File](PBI%20sales-data-project2.pbix)
*  [SQL Data Cleaning & Analysis Queries](sales_data_Project2.sql)
*  [Raw Dataset (CSV)](sales_data_Project2.csv)

## Data Cleaning and Preparation
Using Excel Power Query, I:
- Checked for duplicate records and missing values.
- Cleaned text fields and reviewed date formats.
- Validated data types.
- Recalculated sales, net sales, cost of goods sold (COGS), and gross profit because the original sales amount required correction.

I then imported the prepared dataset into MySQL and corrected the date column to support date-based analysis.

## Key Analysis and Findings
Using SQL, I analyzed sales and profitability by region, product category, sales representative, customer type, sales channel, and month.

Key findings included:
- Total net sales were approximately $59.69 million.
- Overall gross profit was approximately -$4.16 million.
- 60.4% of records generated a gross loss under the calculation assumptions used.
- North recorded the highest net sales among the regions.
- Clothing recorded the highest net sales among product categories but also the largest gross loss.
- Higher discount levels generally coincided with lower gross profit margins.

### Key SQL Queries

Here is an example query used to analyze **Gross Profit Margin by Region**, which helped identify high-performing versus loss-making territories:

```sql
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
```
## Dashboard
The Power BI dashboard presents sales and profitability metrics through visualizations and interactive filters, allowing users to explore performance across different business segments.

### Dashboard Views

#### Page 1: Sales Performance Overview
![Dashboard Page 1](pbi1.png)

#### Page 2: Profitability & Discount Analysis
![Dashboard Page 2](pbi2.png)

## Recommendations
- Review discounts that result in selling prices below unit cost.
- Monitor sales revenue alongside gross profit and profit margins.
- Investigate differences in profitability across regions and product categories.
- Validate pricing and cost assumptions before making business decisions.

## Limitations
The dataset is synthetic, and monetary amounts are assumed to be in USD because the original currency has not been verified. Gross profit excludes operating expenses and other costs not included in the dataset. The findings demonstrate the analytical process and should not be treated as verified results from a real business.

## Conclusion
This project demonstrates my ability to clean and prepare data, use SQL to analyze business performance, identify potential profitability issues, and communicate findings through data visualization.

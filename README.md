# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis

**Level**: Beginner

**Database**: retail_db

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
  
2. **Data Cleaning**: Identify and remove any records with missing or null values.

3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.

4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named retail_db.

- **Table Creation**: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

create database sql_project_p1;

drop table if exists retail_sales;

create table retail_sales(

transactions_id	int primary key,

sale_date date,

sale_time time,

customer_id int,

gender varchar(15),

age int,

category varchar(15),

quantity int,

price_per_unit float,	

cogs float,

total_sale float

);

  ### 2. Data Exploration and Cleaning

  - **Record Count**: Determine the total number of records in the dataset.
  
  - **Customer Count**: Find out how many unique customers are in the dataset.
  
  - **Category Count**: Identify all unique product categories in the dataset.
  
  - **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

select count(*)from retail_sales

select*from retail_sales

where transactions_id is null or sale_date is null or sale_time is null or customer_id is null or 

gender is null or age is null or category is null or quantity is null or 

price_per_unit is null or cogs is null or total_sale is null 

delete from retail_sales

where transactions_id is null or sale_date is null or sale_time is null or customer_id is null or 

gender is null or age is null or category is null or quantity is null or price_per_unit is null or cogs is null or total_sale is null

**How many sales we have?**

select count(*)as total_sales from retail_sales;

**How many unique customers we have?**

select count(distinct customer_id)as total_sales from retail_sales;

**How many unique category?**

select distinct category from retail_sales;

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

**1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:**

 select*from retail_sales
 
 where sale_date='2022-11-05'

 **2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:**

 select*from retail_sales
 
 where category='Clothing'
 
 and 
 
 to_char(sale_date,'yyyy-mm')='2022-11'
 
 and
 
 quantity>=4

 **3. Write a SQL query to calculate the total sales (total_sale) for each category:**

 select 
 
category,

sum(total_sale)as net_sale,

count(transactions_id) as total_orders

from retail_sales

group by 1

**4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:**

select

round(avg(age),2)as average_age

from retail_sales

where category='Beauty'

**5. Write a SQL query to find all transactions where the total_sale is greater than 1000:**

select* from retail_sales

where total_sale>1000

**6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category:**

select category, gender, count(transactions_id) as total_no_of_transactions

from retail_sales

group by 1,2

order by 1

**7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:**

with t1 as(

select extract(year from sale_date)as year, extract(month from sale_date)as month, avg(total_sale)as avg_sale, rank()over(partition by extract(year from sale_date) order by avg(total_sale)desc)as rank

from retail_sales

group by 1,2

)

select year, month, avg_sale

from t1

where rank=1

**8. Write a SQL query to find the top 5 customers based on the highest total sales:**

select customer_id, sum(total_sale)as total_sales

from retail_sales

group by 1

order by 2 desc

limit 5

**9. Write a SQL query to find the number of unique customers who purchased items from each category:**

select category, count(distinct customer_id)as unique_customers

from retail_sales

group by 1

**10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):**

with hourly_sale as(

select*,

case

when extract(hour from sale_time)<=12 then 'Morning'

when extract(hour from sale_time)between 12 and 17 then'Afternoon'

else'Evening'

end as shift

from retail_sales)

select shift, count(transactions_id)as total_orders

from hourly_sale

group by 1

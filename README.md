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


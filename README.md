# ETL-with-MySQL-PostgreSQL-and-Bash
## Introduction
This project focuses on building an Extract, Transform, and Load (ETL) process using MySQL, PostgreSQL, and Bash scripting. The ETL process aims to synchronize data between different databases and data warehouses, automating the data synchronization tasks to save time and ensure consistency.

## Objective
The main objective of this project is to develop a robust ETL pipeline using Bash scripting to:

+ Extract data from a MySQL database.
+ Load the extracted data into a PostgreSQL staging data warehouse.
+ Perform necessary transformations on the data.
+ Create dimension and fact tables within the staging warehouse.
+ Export the transformed data as CSV files for loading into the production warehouse.

## The project consists of the following components:

ETL Script (ETL.sh):
 + Shell script responsible for orchestrating the ETL process.
 + Extracts data from MySQL, transforms it, and loads it into PostgreSQL.
 + Creates dimension and fact tables in the staging warehouse.
 + Exports tables as CSV files.
Cron Job:
 + Schedule tasks in the ETL process to run at specified intervals using cron.

## To execute the ETL process and schedule tasks using cron, follow these steps:

1. Ensure that the MySQL and PostgreSQL databases are set up and accessible.
2. Configure the connection parameters for MySQL and PostgreSQL in the ETL script (ETL.sh).
3. Set up the necessary tables in MySQL and PostgreSQL databases.
4. Grant execute permissions to the ETL.sh script using the chmod +x ETL.sh command.
5. Set up a cron job to automate the ETL process by adding the appropriate cron schedule to the crontab.
#!/bin/sh

## Write your code here to load the data from sales_data table in Mysql server to a sales.csv.
## Select the data which is not more than 4 hours old from the current time.

# Export data from MySQL to CSV
mysql --host=127.0.0.1 --port=3306 --user=root --password=MjU2MjgtbG9uZ2R2 sales -e 'SELECT rowid, product_id, customer_id, price, quantity, timestamp FROM sales_data WHERE timestamp >= NOW() - INTERVAL 4 HOUR' --batch --raw --skip-column-names | sed 's/\t/,/g' > /home/project/sales.csv

# Import data from CSV into PostgreSQL
export PGPASSWORD=MTQyMjMtbG9uZ2R2;

psql --username=postgres --host=localhost --dbname=sales_new -c "\COPY sales_data(rowid,product_id,customer_id,price,quantity,timestamp) FROM '/home/project/sales.csv' delimiter ',' csv header;" 


 ## Delete sales.csv present in location /home/project

 ## Write your code here to load the DimDate table from the data present in sales_data table

psql --username=postgres --host=localhost --dbname=sales_new -c  "INSERT INTO DimDate (dateid, day, month, year)
SELECT DISTINCT
	dateid,
    EXTRACT(DAY FROM timestamp) AS day,
    EXTRACT(MONTH FROM timestamp) AS month,
    EXTRACT(YEAR FROM timestamp) AS year
FROM sales_data"

## Write your code here to load the FactSales table from the data present in sales_data table

psql --username=postgres --host=localhost --dbname=sales_new -c  "INSERT INTO FactSales (rowid, product_id, custome_id, price, total_price)
SELECT rowid, product_id, customer_id, price, price*quantity as total_price
FROM sales_data;"

 ## Write your code here to export DimDate table to a csv

 psql --username=postgres --host=localhost --dbname=sales_new -c "\\COPY DimDate TO '/home/project/dimdate.csv' DELIMITER ',' CSV HEADER;"

 ## Write your code here to export FactSales table to a csv
 
 psql --username=postgres --host=localhost --dbname=sales_new -c "\\COPY FactSales TO '/home/project/factsales.csv' DELIMITER ',' CSV HEADER;"


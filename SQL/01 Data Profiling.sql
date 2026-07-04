-- migrating tables of raw_data schema to staging schema for data profiling.

-- rd_customers table to clean_customers table
create table staging.clean_customers as
select * from raw_data.rd_customers;

-- rd_orders table to clean_orders table
create table staging.clean_orders as
select * from raw_data.rd_orders;

-- rd_orderitems table to clean_orderitems table
create table staging.clean_orderitems as
select * from raw_data.rd_orderitems;

-- rd_products table to clean_products table
create table staging.clean_products as
select * from raw_data.rd_products;

-- rd_payments table to clean_payments table
create table staging.clean_payments as
select * from raw_data.rd_payments;

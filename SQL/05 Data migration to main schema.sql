-- cleaned data migration to the main schema

-- customers table
insert into main.customers 
select * from staging.clean_customers;

-- orders table
insert into main.orders
select * from staging.clean_orders

-- products table
insert into main.products 
select * from staging.clean_products;

--orderitems table
insert into main.orderitems
select * from staging.clean_orderitems;

--payments table
insert into main.payments 
select * from staging.clean_payments;

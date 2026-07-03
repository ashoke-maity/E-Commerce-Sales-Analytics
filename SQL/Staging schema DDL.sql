--customer table
alter table staging.clean_customers 
alter column customer_id type VARCHAR(100),
alter column customer_id set not null,
alter column customer_city type VARCHAR(100),
alter column customer_city set not null;

--order item table
alter table staging.clean_orderitems
alter column order_id type VARCHAR(100),
alter column order_id set not null,
alter column product_id type VARCHAR(100),
alter column product_id set not null,
alter column seller_id type VARCHAR(100),
alter column seller_id set not null,
alter column price type NUMERIC(10,2),
alter column price set not null,
alter column shipping_charges type NUMERIC(10,2),
alter column shipping_charges set not null;

--orders table
alter table staging.clean_orders
alter column order_id type VARCHAR(100),
alter column order_id set not null,
alter column customer_id type VARCHAR(100),
alter column customer_id set not null,
alter column order_purchase_timestamp type TIMESTAMP using order_purchase_timestamp::TIMESTAMP,
alter column order_purchase_timestamp set not null,
alter column order_approved_at type TIMESTAMP using order_approved_at::TIMESTAMP,
alter column order_delivered_timestamp type TIMESTAMP using order_delivered_timestamp::TIMESTAMP,
alter column order_estimated_delivery_date type DATE using order_estimated_delivery_date::DATE,
alter column order_estimated_delivery_date set not null;


--payments table
alter table staging.clean_payments
alter column order_id type VARCHAR(100),
alter column payment_value type NUMERIC(10,2);

--products table
alter table staging.clean_products
alter column product_id type VARCHAR(100),
alter column product_weight_g type NUMERIC(10,2),
alter column product_length_cm type NUMERIC(10,2),
alter column product_height_cm type NUMERIC(10,2),
alter column product_width_cm type NUMERIC(10,2);
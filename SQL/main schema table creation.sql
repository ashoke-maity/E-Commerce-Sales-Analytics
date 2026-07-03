--Customers table
create table main.Customers(
customer_id VARCHAR(100) not null,
customer_zip_code_prefix INT not null,
customer_city VARCHAR(100) not null,
customer_state VARCHAR(50) not null,
constraint PK_Customers primary key (customer_id)
);

--Orders table
create table main.Orders(
  order_id VARCHAR(100) not null ,
  customer_id VARCHAR(100) not null,
  order_status VARCHAR(100),
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivery_timestamp TIMESTAMP,
  order_estimated_delivery_date DATE not null,
  constraint PK_Orders primary key (order_id),
  constraint FK_Orders_Customers foreign key (customer_id) references main.Customers(customer_id)
);

--product table
create  table main.Products(
  product_id VARCHAR(100) not null,
  product_category_name VARCHAR(100) not null,
  product_weight_g NUMERIC(10,2) not null,
  product_length_cm NUMERIC(10,2) not null,
  product_height_cm NUMERIC(10,2) not null,
  product_width_cm NUMERIC(10,2) not null,
  constraint  PK_Products primary key (product_id)
);

-- for few toys the values are unknown that why droping the not null
alter table main.products
alter column product_length_cm drop not null,
alter column product_weight_g drop not null,
alter column  product_height_cm drop not null,
alter column product_width_cm drop not null;

--order items table
create table main.OrderItems(
  order_id VARCHAR(100) not null,
  product_id VARCHAR(100) not null,
  seller_id VARCHAR(100) not null,
  price NUMERIC(10,2) not null,
  shipping_charges NUMERIC(10,2) not null,
  constraint PK_OrderItems primary key (order_id, product_id),
  constraint FK_OrderItems_Orders foreign key (order_id) references main.Orders(order_id),
  constraint FK_OrderItems_Products foreign key (product_id) references main.Products(product_id)
);

--payments table
create table main.Payments(
  order_id VARCHAR(100) not null,
  payment_sequential INT not null,
  payment_type VARCHAR(50) not null,
  payment_installments INT not null,
  payment_value BIGINT not null,
  constraint PK_Payments primary key (order_id, payment_sequential),
  constraint FK_Payments_Orders foreign key (order_id) references main.Orders(order_id)
);


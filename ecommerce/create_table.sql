--CREATE A CUSTOMERS TABLE
create  table customers(
  customer_id int primary key,
  first_name varchar(40) not null,
  last_name varchar(40) not null,
  email varchar(40) not null ,
  city varchar(40)
);

--CREATE A ORDERS TABLE
create table orders(
  order_id int primary key,
  customer_id int,
  order_date date,
  foreign key(customer_id) references customers(customer_id)
);


--CREATE A PRODUCTS TABLE
create table products(
  product_id int primary key,
  product_name varchar(40),
  category varchar(40),
  price int
);

--CREATE A ORDER_ITEMS TABLE
create table order_items(
  order_item_id int primary key,
  order_id int,
  product_id int,
  quantity int,
  foreign key(order_id) references orders(order_id),
  foreign key(product_id) references products(product_id)
);

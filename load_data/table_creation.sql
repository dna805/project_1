
create table public.products (
    product_id varchar PRIMARY key,
    category_name VARCHAR,
    weight_g INT,
    length_cm INT,
    height_cm INT,
    width_cm INT
);

create table public.customers(
    customer_id varchar PRIMARY KEY,
    customer_unique_id varchar,
    customer_city varchar,
    customer_state varchar
);

CREATE table public.sellers(
    seller_id varchar PRIMARY KEY ,
    seller_city varchar,
    seller_state varchar  
);

create table public.Orders(
    order_id VARCHAR PRIMARY KEY,
    customer_id varchar,
    order_status varchar (20),
    order_purchase_timestamp DATE,
    order_delivered_timestamp DATE,
    FOREIGN KEY (customer_id) REFERENCES public.customers
);


/*create table public.order_items(
    order_id varchar,
    order_item_id int PRIMARY KEY,
    product_id varchar,
    seller_id varchar,
    price DECIMAL ,
    freight_value DECIMAL ,
    FOREIGN KEY (order_id) REFERENCES public.Orders ,
    FOREIGN KEY (product_id) REFERENCES public.products,
    FOREIGN KEY (seller_id) REFERENCES public.sellers
);*/

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id VARCHAR(10),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY (order_id, order_item_id),  -- Composite PK
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);



ALTER TABLE public.Orders OWNER to postgres;
ALTER TABLE public.products OWNER to postgres;
ALTER TABLE public.sellers OWNER to postgres;
ALTER TABLE public.order_items OWNER to postgres;


CREATE INDEX idx_customer_id ON public.customers (customer_id);
CREATE INDEX idx_order_id ON public.Orders (order_id);
CREATE INDEX idx_product_id ON public.products (product_id);
CREATE INDEX indx_seller_id ON public.sellers(seller_id);



drop table order_items;
drop table Orders;
drop table sellers;
drop table products;
drop table customers;
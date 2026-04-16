TRUNCATE TABLE customers,Orders,order_items,products,sellers 
RESTART IDENTITY 
CASCADE;

COPY products
FROM 'E:\SQL projects\project_1\archive\project_data\products_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY customers
FROM 'E:\SQL projects\project_1\archive\project_data\customers_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY sellers
FROM 'E:\SQL projects\project_1\archive\project_data\sellers_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY Orders
FROM 'E:\SQL projects\project_1\archive\project_data\orders_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY order_items 
FROM 'E:\SQL projects\project_1\archive\project_data\order_items_dataset.csv'
DELIMITER ',' CSV HEADER;


SELECT * from customers 
limit 25;
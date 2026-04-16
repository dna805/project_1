SELECT 
    products.category_name, 
    avg(order_items.price) as avg_price
FROM
    order_items
JOIN products on products.product_id=order_items.product_id
GROUP BY
    category_name
ORDER BY
    avg_price DESC
LIMIT 10;
SELECT 
    products.category_name,sum(order_items.price) as revenue
FROM 
    order_items 
join products on products.product_id=order_items.product_id
GROUP BY
    category_name
ORDER BY
    revenue DESC
LIMIT 3;

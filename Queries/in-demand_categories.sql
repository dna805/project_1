SELECT
    products.category_name,
    count(order_items.order_id) as order_count
FROM
    order_items
JOIN products on products.product_id=order_items.product_id
GROUP BY
    category_name
ORDER BY
    order_count DESC
LIMIT 3;

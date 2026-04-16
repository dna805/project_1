select 
    products.category_name,
    sellers.seller_id,
    sum(order_items.price) as sellers_revenue
FROM
    order_items
INNER JOIN products ON products.product_id=order_items.product_id
INNER JOIN sellers ON sellers.seller_id=order_items.seller_id
GROUP BY
    products.category_name,sellers.seller_id
ORDER BY
    sellers_revenue DESC
LIMIT 10;


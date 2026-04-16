WITH product_metrics AS(
    select 
        products.category_name,count(DISTINCT order_items.order_id) as demand_score,
        round (avg(order_items.price)* sum(order_items.price)/count(DISTINCT order_items.order_id), 0) as 
        revenue_per_order 
    FROM
        order_items
    JOIN products on products.product_id=order_items.product_id
    GROUP BY
        products.category_name
)
SELECT 
   * ,round((demand_score * revenue_per_order), 0) as optimality_score
FROM 
   product_metrics
ORDER BY 
   optimality_score DESC 
LIMIT 3;

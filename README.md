# INRODUCTION 

 GitHub repo link here: [Live Demo](https://github.com/dna805/olist-ecommerce-sql-analysis)

This project analyzes real Brazilian e-commerce sales (2016-2018) to identify revenue drivers, demand patterns, and optimal inventory strategies. Using 5 normalized SQL tables.
#### Key Question: Which product categories deliver maximum revenue while maintaining high demand?

# Background 
Olist operates Brazil's largest e-commerce platform, partnering with 1,000+ active sellers. The dataset captures 100k orders across 82 categories, mirroring Flipkart/Amazon India growth patterns.

[Olist Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

#### Business Goal: Apply Pareto principle (80/20 rule) to focus inventory on top revenue categories while balancing order volume.

## Tools Used
```bash
-  PostgreSQL 15 - Database engine
-  DBeaver 24.1 - Query interface  
-  Kaggle - Data source
-  VS Code + Git - Development
-  Git/GitHub - Version control

```
## Analysis & Key Queries

### 1. Top Revenue Categories (Query 1)
```sql
SELECT p.product_category_name, 
       ROUND(SUM(oi.price), 1) as total_revenue
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name 
ORDER BY total_revenue DESC LIMIT 5;
```

**Results**:
| Rank | Category | Revenue | 
|------|----------|---------|
| 1 | beleza_saude | 1258681.34 | 
| 2 | relogios_presentes | 1205005.68 |
| 3 | sport_leisure | 1036988.68 | 

### 2. Demand by Order Volume (Query 2)
### 2. Demand by Order Volume (Query 2)
**Top 5 categories**

| Category | Orders |
|----------|--------|
| cama_mesa_banho | 11115 |
| beleza_saude | 9670 |
| esporte_lazer | 8641 |

### 3. High-Value Niches (Avg Price)

| Category Name | Avg Price |
|---------------|-----------|
| pcs           | 1098 |
|portaties_casa_forno_e_cafe| 624|
|eletrodomesticos_2|476|

```sql
SELECT p.product_category_name, 
       COUNT(DISTINCT oi.order_id) as order_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY order_count DESC LIMIT 5;
```
### Query 4: High-Value Categories (Avg Price)
```sql
SELECT p.product_category_name, 
       ROUND(AVG(oi.price), 1) as avg_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_price DESC LIMIT 10;
```

### Query 5: Optimal Categories (Demand × Revenue)
```sql
WITH category_metrics AS (
  SELECT p.product_category_name,
         COUNT(DISTINCT oi.order_id) as demand_score,
         AVG(oi.price) * SUM(oi.price) / COUNT(DISTINCT oi.order_id) as revenue_per_order
  FROM order_items oi 
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY p.product_category_name
)
SELECT *, (demand_score * revenue_per_order) as optimality_score
FROM category_metrics
ORDER BY optimality_score DESC LIMIT 10;
```


## What I Learned (SQL Skills Gained)
1. **Table Aliases**: `oi.price`, `p.category_name` (required for multi-table queries)
2. **INNER JOIN**: Links tables on `product_id`, excludes incomplete data
3. **ROUND(SUM(price), 1)**: Professional number formatting
4. **GROUP BY + ORDER BY**: Business rankings (revenue, demand)
5. **Real Dataset**: 100k+ rows vs. course examples


**Komal Bist** | SQL Beginner → Business Analyst | Indore  
**April 2026** | CC0 Dataset

--Total quantity sold per product
SELECT p.product_name, sum(s.quantity) as total_quantity
from products p 
join sales s 
on p.product_id = s.product_id
GROUP by p.product_name;

-- Q: Calculate total revenue (price × quantity) for each product
SELECT p.product_name, sum(p.price*s.quantity) as revenue
from products p 
join sales s 
on p.product_id = s.product_id
group by p.product_name;

-- Q: List the top 3 selling products based on revenue
SELECT p.product_name, sum(p.price*s.quantity) as revenue
from products p 
join sales s 
on p.product_id = s.product_id
group by p.product_name
ORDER by revenue DESC limit 3;

-- Q: For each sale_date, find the product that sold the most units
SELECT p.product_name, s.sale_date
FROM products p 
JOIN sales s 
on p.product_id = s.product_id
qualify rank() over(partition by s.sale_date ORDER by s.quantity desc) = 1;


-- Q: Show cumulative revenue per product across all sales (use window function)
SELECT 
  p.product_name,
  s.sale_date,
  s.quantity,
  p.price * s.quantity AS current_sale_revenue,
  SUM(p.price * s.quantity) OVER (
    PARTITION BY p.product_id 
    ORDER BY s.sale_date
  ) AS cumulative_revenue
FROM products p 
JOIN sales s ON p.product_id = s.product_id
ORDER BY p.product_name, s.sale_date;
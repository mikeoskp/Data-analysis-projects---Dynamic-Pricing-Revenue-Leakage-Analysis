-- 1. Total Revenue & Discount Loss
SELECT 
    SUM(base_price * quantity) AS potential_revenue,
    SUM(revenue) AS actual_revenue,
    SUM(base_price * quantity - revenue) AS revenue_leakage
FROM transactions;
-- 📌 Shows how much money is lost due to discounting.

-- 2. Revenue Leakage by Discount Level
SELECT 
    discount_pct,
    COUNT(*) AS orders,
    SUM(base_price * quantity - revenue) AS leakage
FROM transactions
GROUP BY discount_pct
ORDER BY leakage DESC;


-- 📌 Identifies over-discounting problem.


-- 3. Demand vs Pricing Inefficiency
SELECT 
    demand_level,
    AVG(discount_pct) AS avg_discount,
    SUM(revenue) AS total_revenue
FROM transactions
GROUP BY demand_level;


-- 📌 High demand + high discount = bad pricing strategy.


-- 4. Device-wise Revenue Loss
SELECT 
    device,
    SUM(base_price * quantity - revenue) AS revenue_leakage
FROM transactions
GROUP BY device;


-- 📌 Mobile vs Desktop pricing inefficiency.

-- 5. Region-wise Leakage (Key Interview Query)
SELECT 
    region,
    SUM(revenue) AS revenue,
    SUM(base_price * quantity - revenue) AS leakage
FROM transactions
GROUP BY region
ORDER BY leakage DESC;
































































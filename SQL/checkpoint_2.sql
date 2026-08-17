-- CHECKPOINT 2
-- SQL Queries for Necessary Data Extraction / Aggregation
-- Business Question: How effective are the marketing campaigns, and how has their performance changed over time?


-- 1. OVERALL MARKETING PERFORMANCE
-- Business Question: What is the overall performance of the marketing campaigns?

SELECT sum(sessions) as	total_sessions,
	   sum(conversions) as total_conversions,
	   sum(spend) as total_spend,
	   sum(revenue) as total_revenue
FROM marketing_events;


-- 2. MARKETING PERFORMANCE BY CHANNEL
-- Business Question: Which marketing channels generate the highest traffic, conversions, and revenue?

SELECT channel,
	   sum(sessions) as total_sessions,
	   sum(conversions) as total_conversions,
	   sum(spend) as total_spend,
	   sum(revenue) as total_revenue
FROM marketing_events
GROUP BY channel;


-- 3. MARKETING EFFICIENCY BY CHANNEL (ROAS)
-- Business Question: Which marketing channels generate the highest return relative to their marketing spend?
-- ROAS = Revenue / Spend

SELECT channel,
	   sum(revenue)/sum(spend) as ROAS
FROM marketing_events
GROUP BY channel;


-- 4. MARKETING PERFORMANCE BY CHANNEL AND REGION
-- Business Question: How does the performance of each marketing channel vary across regions?

SELECT channel,
	   region,
	   sum(sessions) as total_sessions,
	   sum(conversions) as total_conversions,
	   sum(spend) as total_spend,
	   sum(revenue) as total_revenue
FROM marketing_events
GROUP BY channel,
	     region;


-- 5. MARKETING PERFORMANCE OVER TIME
-- Business Question: How has overall marketing performance changed month by month?

SELECT strftime('%Y-%m' ,date) as Month,
       sum(sessions) as total_sessions,
	   sum(conversions) as total_conversions,
	   sum(spend) as total_spend,
	   sum(revenue) as total_revenue
FROM marketing_events
GROUP BY Month
ORDER BY Month;


-- 6. CONVERSION EFFECTIVENESS OVER TIME
-- Business Question: How has the rate of converting marketing traffic into conversions changed over time?
-- Conversion Rate = Conversions / Sessions * 100

SELECT strftime('%Y-%m' ,date) as Month,
       sum(conversions)* 1.0/sum(sessions)*100 as Conversion_Rate
FROM marketing_events
GROUP BY Month
ORDER BY Month;
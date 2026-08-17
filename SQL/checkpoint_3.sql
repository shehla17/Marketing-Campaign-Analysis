-- CHECKPOINT 3
-- Root-Cause Analysis
-- Business Question: How effective are the marketing campaigns, and how has their performance changed over time?


-- 1. ROAS BY CHANNEL AND REGION
-- Business Question: How does ROAS for each marketing channel vary across regions?
-- Purpose: Determine whether the low ROAS of paid channels is driven by specific regions.

SELECT channel,
       region,
       SUM(revenue) / SUM(spend) AS ROAS
FROM marketing_events
GROUP BY channel, region;


-- 2. ROAS BY CHANNEL AND MONTH
-- Business Question: How has ROAS for each marketing channel changed over time?
-- Purpose: Determine whether the performance gap is limited to specific time periods.

SELECT channel,
       strftime('%Y-%m', date) AS Month,
       SUM(revenue) / SUM(spend) AS ROAS
FROM marketing_events
GROUP BY channel, Month
ORDER BY Month;


-- 3. CONVERSION RATE BY CHANNEL AND MONTH
-- Business Question: How does conversion effectiveness vary across marketing channels over time?
-- Conversion Rate = Conversions / Sessions * 100
-- Purpose: Determine whether lower conversion effectiveness contributes to the lower performance of paid channels.

SELECT channel,
       strftime('%Y-%m', date) AS Month,
       SUM(conversions) * 1.0 / SUM(sessions) * 100 AS Conversion_Rate
FROM marketing_events
GROUP BY channel, Month
ORDER BY Month;


-- 4. CONVERSION RATE BY CHANNEL AND REGION
-- Business Question: How does conversion effectiveness for each marketing channel vary across regions?
-- Purpose: Determine whether the lower conversion effectiveness of paid channels is region-specific.

SELECT channel,
       region,
       SUM(conversions) * 1.0 / SUM(sessions) * 100 AS Conversion_Rate
FROM marketing_events
GROUP BY channel, region;


-- 5. CPA BY CHANNEL
-- Business Question: How does the cost of acquiring a conversion vary across marketing channels?
-- CPA = Spend / Conversions
-- Purpose: Compare the acquisition cost and efficiency of different marketing channels.

SELECT channel,
       SUM(spend) / SUM(conversions) AS CPA
FROM marketing_events
GROUP BY channel;


-- 6. CPA BY CHANNEL AND REGION
-- Business Question: How does the cost of acquiring a conversion for each marketing channel vary across regions?
-- Purpose: Determine whether the high CPA of paid channels is driven by specific regions.

SELECT channel,
       region,
       SUM(spend) / SUM(conversions) AS CPA
FROM marketing_events
GROUP BY channel, region;
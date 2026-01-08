-- Analyzing 

WITH Metrics AS (
    -- 1. Calculate the 'Elite' threshold (Top 1% of citations)
    SELECT PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY citation_count) AS p99_cutoff
    FROM public.search_opinioncluster
    -- FIX: Exclude Supreme Court by checking for BOTH NULL and Empty Strings
    WHERE scdb_id IS NULL OR scdb_id = ''
)
SELECT 
    -- 2. Define the Cohorts
    CASE 
        -- Supreme Court (Must match View logic)
        WHEN scdb_id IS NOT NULL AND scdb_id != '' THEN '1. Supreme Court (The Apex)'
        
        -- High Impact Lower Courts
        WHEN citation_count >= (SELECT p99_cutoff FROM Metrics) THEN '2. High-Impact Lower (Top 1%)'
        
        -- Everyone else
        ELSE '3. General Population (Bottom 99%)'
    END AS legal_tier,
    
    -- 3. The Metrics
    COUNT(*) AS total_cases,
    ROUND(AVG(citation_count), 1) AS avg_citations,
    MAX(citation_count) AS max_citations,
    
    -- 4. Transparency Metric
    ROUND(COUNT(*) FILTER (WHERE precedential_status = 'Published') * 100.0 / COUNT(*), 1) AS pct_published

FROM public.search_opinioncluster
GROUP BY 1
ORDER BY 1 ASC;







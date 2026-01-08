-- Module 1: The "Litigation Explosion" (Time-Series)
-- Objective: Visualize the exponential growth of the American legal system. SQL Skill: Date Truncation, Aggregation, filtering.

/*SELECT
	DATE_TRUNC('year', date_filed) :: DATE AS year,
	COUNT(*) AS total_cases, 
	ROUND(COUNT(*) FILTER (WHERE precedential_status = 'Published') * 100.0 / COUNT(*), 1) AS pct_published
FROM
	public.search_opinioncluster
WHERE 
	date_filed BETWEEN '1658-01-01' AND '2026-01-01'
GROUP BY 1
ORDER BY 1 DESC;

*/


-- CHART --
/* SELECT 
    -- Mathematical logic: (Year / 5) rounded down * 5
    CAST(FLOOR(EXTRACT(YEAR FROM date_filed) / 5) * 5 AS INT) AS interval_start,
    
    COUNT(*) AS total_cases,
    
    COUNT(*) FILTER (WHERE precedential_status = 'Published') AS published
    
FROM public.search_opinioncluster
WHERE 
    date_filed BETWEEN '1900-01-01' AND '2025-01-01' 
GROUP BY 1
ORDER BY 1 ASC;
*/
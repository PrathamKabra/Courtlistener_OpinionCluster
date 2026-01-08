SELECT 
    nature_of_suit,
    COUNT(*) as case_count,
    -- Calculate percentage within this non-null subset
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as pct_of_subset
FROM public.search_opinioncluster
WHERE nature_of_suit IS NOT NULL 
  AND nature_of_suit != ''
GROUP BY 1
ORDER BY 2 DESC
LIMIT 20;
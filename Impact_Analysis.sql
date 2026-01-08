/* Module 2: Impact Analytics (The "Power Law")
Strategic Objective: Demonstrate proficiency with Window Functions (RANK, PERCENTILE) and Statistical Segmentation (NTILE, Bucketing). The Narrative: "Proof that legal influence follows a Pareto Distribution (80/20 rule)."

Prerequisite: Ensure CREATE INDEX idx_citation_count ON public.search_opinioncluster(citation_count DESC); is active.
*/

-- PRE-REQUISITE: Create Index on citation_count (Descending order for rankings)
-- CREATE INDEX idx_citation_count ON public.search_opinioncluster(citation_count DESC);

/*Step 2: Run Module 2 Analysis (Impact Distribution)
Query A: The "Influence Pyramid" Segments the dataset to visualize the Pareto distribution (80/20 rule).*/

/*
WITH CitationTiers AS (
    SELECT 
        CASE 
            WHEN citation_count = 0 THEN 'Tier 5: Zero Impact (0)'
            WHEN citation_count BETWEEN 1 AND 5 THEN 'Tier 4: Low Impact (1-5)'
            WHEN citation_count BETWEEN 6 AND 20 THEN 'Tier 3: Moderate (6-20)'
            WHEN citation_count BETWEEN 21 AND 100 THEN 'Tier 2: High Impact (21-100)'
            ELSE 'Tier 1: Super Precedent (>100)' 
        END AS impact_tier,
        id
    FROM public.search_opinioncluster
)
SELECT 
    impact_tier,
    COUNT(*) AS case_volume,
    -- Calculate vertical percentage
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CitationTiers), 2) AS pct_of_total
FROM CitationTiers
GROUP BY 1
ORDER BY 1 ASC;
*/

/*
Query B: Decadal "Hall of Fame" Identifies the top 3 most cited cases for every decade.
*/

/* WITH RankedCases AS (
    SELECT 
        -- Creates the decade bucket (e.g., "2020" covers 2020-2029)
        TO_CHAR(DATE_TRUNC('decade', date_filed), 'YYYY') AS decade,
        id,
		case_name, 
		source,
		precedential_status,
        case_name_full,
		judges,
		docket_id,
        citation_count,
		filepath_json_harvard,
	    filepath_pdf_harvard,
        date_filed, -- Added so you can verify the exact year (e.g., 2023)
        
        -- Restart the ranking counter (1,2,3...) for every new decade
        RANK() OVER (
            PARTITION BY DATE_TRUNC('decade', date_filed) 
            ORDER BY citation_count DESC
        ) as rank_in_decade
        
    FROM public.search_opinioncluster
    WHERE date_filed >= '1900-01-01' 
      -- UPDATED: Extended to cover all potential data in your 2025 dump
      AND date_filed <= '2026-01-01' 
      AND citation_count > 0
)
SELECT 
    decade,
	id,
	case_name,
	source,
	docket_id,
	precedential_status,
    rank_in_decade,
    citation_count,
    case_name_full,
	judges,
	filepath_json_harvard,
	filepath_pdf_harvard, 
    date_filed
FROM RankedCases
WHERE rank_in_decade <= 100 -- Get Top 100 per decade
ORDER BY decade DESC, rank_in_decade ASC;

*/


/* TOP 1500 CASES WITH MOST CITATIONS
*/

/*
SELECT
    citation_count,
	id,
	source, 
	case_name_full, 
    case_name,
	docket_id, 
	judges, 
	filepath_json_harvard,
	filepath_pdf_harvard, 	
    date_filed,
    precedential_status
FROM public.search_opinioncluster
ORDER BY citation_count DESC
LIMIT 1500;

*/



















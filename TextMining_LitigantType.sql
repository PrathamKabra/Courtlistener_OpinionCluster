SELECT
	CASE
		WHEN case_name ILIKE '%United States%' OR case_name ILIKE '%U.S.%' THEN 'Federal Cases'
		WHEN case_name ILIKE '%State of%' OR case_name ILIKE '%People v.%' or case_name ILIKE '%Commonwealth%' THEN 'State Gov Cases'
		WHEN case_name ILIKE '% Corp%' OR case_name ILIKE '% Inc%' OR case_name ILIKE '% Co.%' OR case_name ILIKE '% LLC%' THEN 'Corporate Entity'
		WHEN case_name ILIKE '%In re %' OR case_name ILIKE '%Ex parte%' THEN 'Procedural / Special'
		ELSE 'Private/Individual'
	END AS Litigant_type,
	COUNT(*) AS Case_Volume
FROM 
	public.search_opinioncluster
GROUP BY 1
ORDER BY 2 DESC;

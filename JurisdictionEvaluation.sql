/*
SELECT 
    judges, 
    filepath_json_harvard
FROM public.search_opinioncluster
WHERE 
    -- 1. Filepath must be present (Priority Condition)
    filepath_json_harvard IS NOT NULL 
    AND filepath_json_harvard != ''
    
    -- 2. Judges must also be present (To satisfy "I want both")
    AND judges IS NOT NULL 
    AND TRIM(judges) != ''

ORDER BY judges ASC
LIMIT 5000;
*/


/*
Identifying jurisdiction of the cases using the filepath_json_harvard column
*/

/*
SELECT 
	COUNT(*) as total_matches
FROM
	public.search_opinioncluster
WHERE 
	filepath_json_harvard LIKE 'law.free.cap.myrick%';

*/

/*
SELECT 
	id,
	case_name, 
	case_name_full,
	docket_id, 
	date_created, 
	date_modified, 
	date_filed, 
	source,
	judges, 
	attorneys, 
	precedential_status,
	filepath_json_harvard
FROM
	public.search_opinioncluster
WHERE
	filepath_json_harvard LIKE 'law.free.cap.cal%'
ORDER BY date_filed DESC

*/

-- GETTING DATA FOR 'COFFEY' AND 'MYRICK'
SELECT 
	id,
	case_name, 
	case_name_full,
	docket_id, 
	date_created, 
	date_modified, 
	date_filed, 
	source,
	judges, 
	attorneys, 
	precedential_status,
	filepath_json_harvard
FROM
	public.search_opinioncluster
WHERE
	filepath_json_harvard LIKE 'law.free.cap.myrick%'
ORDER BY date_filed DESC

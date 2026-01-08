-- Creating a VIEW for Supreme Court Cases - 

/* SELECT 
    COUNT(*) as total_rows,
    COUNT(*) FILTER (WHERE scdb_id IS NULL) as null_count,
    COUNT(*) FILTER (WHERE scdb_id = '') as empty_string_count,
    COUNT(*) FILTER (WHERE scdb_id != '' AND scdb_id IS NOT NULL) as real_data_count
FROM public.search_opinioncluster;

*/

/*DROP VIEW IF EXISTS view_supreme_court_cases;

CREATE VIEW view_supreme_court_cases AS
SELECT * FROM public.search_opinioncluster
WHERE scdb_id IS NOT NULL 
  AND scdb_id != '';  -- This removes the blank text rows
*/

/*SELECT *	
FROM view_supreme_court_cases
*/


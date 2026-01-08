-- 1. Disable Foreign Key checks (Crucial for isolated files)
SET session_replication_role = 'replica';

-- 2. Run the Full Import
COPY public.search_opinioncluster (
    id, date_created, date_modified, judges, date_filed, date_filed_is_approximate,
    slug, case_name_short, case_name, case_name_full, scdb_id, scdb_decision_direction,
    scdb_votes_majority, scdb_votes_minority, source, procedural_history, attorneys,
    nature_of_suit, posture, syllabus, headnotes, summary, disposition, history,
    other_dates, cross_reference, correction, citation_count, precedential_status,
    date_blocked, blocked, filepath_json_harvard, filepath_pdf_harvard, docket_id,
    arguments, headmatter
)
FROM '/tmp/clusters.csv' 
WITH (FORMAT csv, ENCODING 'utf8', ESCAPE '\', HEADER true, NULL '');

-- 3. Re-enable Foreign Key checks
SET session_replication_role = 'origin';
-- ANALYSIS --
-- PHASE 1: DATA DISCOVERY -- 
-- NULLITY ANALYSIS --

SELECT 
    COUNT(*) AS total_rows,

    -- --- 1. INTEGER (Standard NULL check) ---
    COUNT(*) - COUNT(id) AS id_missing,
    COUNT(*) - COUNT(citation_count) AS citation_count_missing,
    COUNT(*) - COUNT(docket_id) AS docket_id_missing,
    COUNT(*) - COUNT(scdb_decision_direction) AS scdb_decision_missing,
    COUNT(*) - COUNT(scdb_votes_majority) AS scdb_votes_majority_missing,
    COUNT(*) - COUNT(scdb_votes_minority) AS scdb_votes_minority_missing,

    -- --- 2. TEXT & VARCHAR (Check for NULL + Empty Strings '') ---
    -- Identifiers & Names
    COUNT(*) - COUNT(NULLIF(slug, '')) AS slug_missing,
    COUNT(*) - COUNT(NULLIF(scdb_id, '')) AS scdb_id_missing,
    COUNT(*) - COUNT(NULLIF(case_name, '')) AS case_name_missing,
    COUNT(*) - COUNT(NULLIF(case_name_short, '')) AS case_name_short_missing,
    COUNT(*) - COUNT(NULLIF(case_name_full, '')) AS case_name_full_missing,
    COUNT(*) - COUNT(NULLIF(source, '')) AS source_missing,
    
    -- Legal Context
    COUNT(*) - COUNT(NULLIF(judges, '')) AS judges_missing,
    COUNT(*) - COUNT(NULLIF(attorneys, '')) AS attorneys_missing,
    COUNT(*) - COUNT(NULLIF(nature_of_suit, '')) AS nature_of_suit_missing,
    COUNT(*) - COUNT(NULLIF(posture, '')) AS posture_missing,
    COUNT(*) - COUNT(NULLIF(procedural_history, '')) AS procedural_history_missing,
    COUNT(*) - COUNT(NULLIF(disposition, '')) AS disposition_missing,
    COUNT(*) - COUNT(NULLIF(precedential_status, '')) AS precedential_status_missing,

    -- Deep Content (Long Text)
    COUNT(*) - COUNT(NULLIF(syllabus, '')) AS syllabus_missing,
    COUNT(*) - COUNT(NULLIF(headnotes, '')) AS headnotes_missing,
    COUNT(*) - COUNT(NULLIF(summary, '')) AS summary_missing,
    COUNT(*) - COUNT(NULLIF(arguments, '')) AS arguments_missing,
    COUNT(*) - COUNT(NULLIF(headmatter, '')) AS headmatter_missing,
    COUNT(*) - COUNT(NULLIF(history, '')) AS history_missing,
    
    -- Metadata / Misc Text
    COUNT(*) - COUNT(NULLIF(correction, '')) AS correction_missing,
    COUNT(*) - COUNT(NULLIF(cross_reference, '')) AS cross_reference_missing,
    COUNT(*) - COUNT(NULLIF(other_dates, '')) AS other_dates_missing,
    COUNT(*) - COUNT(NULLIF(filepath_json_harvard, '')) AS json_missing,
    COUNT(*) - COUNT(NULLIF(filepath_pdf_harvard, '')) AS pdf_missing,

    -- --- 3. DATE / TIMESTAMP (Standard NULL check) ---
    COUNT(*) - COUNT(date_created) AS date_created_missing,
    COUNT(*) - COUNT(date_modified) AS date_modified_missing,
    COUNT(*) - COUNT(date_filed) AS date_filed_missing,
    COUNT(*) - COUNT(date_blocked) AS date_blocked_missing,

    -- --- 4. BOOLEAN (Standard NULL check) ---
    COUNT(*) - COUNT(blocked) AS blocked_missing,
    COUNT(*) - COUNT(date_filed_is_approximate) AS date_approx_missing

FROM public.search_opinioncluster;

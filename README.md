**Project Title: United States Legal History: A 10-Million Record SQL Analysis**

**Executive Summary:**

**Objective:** Analyze the 100-year evolution of US litigation and identify "Power Law" trends in judicial precedence.

**Dataset:** 12GB of raw court opinions (CourtListener), ~9.9M rows.

**Tools:** PostgreSQL, pgAdmin 4, Regex.

**Key Technical Challenges Solved:**

**Optimization:** Indexed 10M rows (B-Tree/Partial Index), reducing query time from >5 mins to <200ms.

**Data Cleaning:** Used UNNEST and STRING_TO_ARRAY to parse messy comma-separated Judge lists.

**Text Mining:** Applied SQL RegEx to classify 9M unlabeled cases into "Corporate," "Criminal," and "Bankruptcy" buckets.

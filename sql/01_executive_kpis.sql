/*
=========================================================
Product Analytics Portfolio Project
File: 01_executive_kpis.sql

Business Question:
What is the overall health of the product based on
1,257 user survey responses?

Purpose:
Calculate executive-level KPIs used to assess overall
product health and power the Executive Overview dashboard.
=========================================================
*/

-- =====================================================
-- KPI 1: Total Survey Respondents
-- =====================================================

SELECT
    COUNT(*) AS total_respondents
FROM survey_cleaned;


-- =====================================================
-- KPI 2: Average Experience Score
-- =====================================================

SELECT
    ROUND(AVG(overall_experience_score), 2) AS average_experience_score
FROM survey_cleaned;


-- =====================================================
-- KPI 3: Platform Distribution
-- =====================================================

SELECT
    platform,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage_of_respondents
FROM survey_cleaned
GROUP BY platform
ORDER BY respondents DESC;


-- =====================================================
-- KPI 4: Experience Score Distribution
-- =====================================================

SELECT
    overall_experience_score,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage_of_users
FROM survey_cleaned
GROUP BY overall_experience_score
ORDER BY overall_experience_score;


-- =====================================================
-- KPI 5: Average Experience by Platform
-- =====================================================

SELECT
    platform,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score), 2) AS average_experience_score
FROM survey_cleaned
GROUP BY platform
ORDER BY average_experience_score DESC;


-- =====================================================
-- KPI 6: Average Device Performance Score
-- =====================================================

SELECT
    ROUND(AVG(device_performance_score), 2) AS average_device_performance
FROM survey_cleaned;


-- =====================================================
-- KPI 7: Average Bug Fix Speed Score
-- =====================================================

SELECT
    ROUND(AVG(bug_fix_speed_score), 2) AS average_bug_fix_speed
FROM survey_cleaned;


-- =====================================================
-- Executive KPI Summary
-- One-row summary of key product health metrics
-- =====================================================

SELECT
    COUNT(*) AS total_respondents,
    ROUND(AVG(overall_experience_score), 2) AS average_experience_score,
    ROUND(AVG(device_performance_score), 2) AS average_device_performance,
    ROUND(AVG(bug_fix_speed_score), 2) AS average_bug_fix_speed
FROM survey_cleaned;
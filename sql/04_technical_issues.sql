/*
=========================================================
Product Analytics Portfolio Project
File: 04_technical_issues.sql

Business Question:
What technical issues are negatively impacting
the user experience?

Purpose:
Analyze technical issues, product stability,
and their relationship with overall user
experience.
=========================================================
*/

-- =====================================================
-- Technical Issue 1: Bug Frequency Distribution
-- =====================================================

SELECT
    bug_frequency,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY bug_frequency
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 2: Server Error Frequency
-- =====================================================

SELECT
    server_error_frequency,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY server_error_frequency
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 3: Device Performance Score
-- =====================================================

SELECT
    device_performance_score,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY device_performance_score
ORDER BY device_performance_score;


-- =====================================================
-- Technical Issue 4: Game Runs Smoothly
-- =====================================================

SELECT
    runs_smoothly,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY runs_smoothly
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 5: Server Errors in Last 30 Days
-- =====================================================

SELECT
    server_errors_last_30_days,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY server_errors_last_30_days
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 6: Most Frustrating Issue
-- =====================================================

SELECT
    most_frustrating_issue,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY most_frustrating_issue
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 7: Largest User Pain Point
-- =====================================================

SELECT
    "Whats the biggest issue currently hurting the game? " AS biggest_issue,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY "Whats the biggest issue currently hurting the game? "
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 8: Reported Issues Breakdown
-- =====================================================

SELECT
    reported_issues,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY reported_issues
ORDER BY respondents DESC;


-- =====================================================
-- Technical Issue 9: Average Experience by Bug Frequency
-- =====================================================

SELECT
    bug_frequency,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY bug_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Technical Issue 10: Average Experience by Server Errors
-- =====================================================

SELECT
    server_error_frequency,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY server_error_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Technical Issue 11: Experience by Runs Smoothly
-- =====================================================

SELECT
    runs_smoothly,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY runs_smoothly
ORDER BY avg_experience DESC;


-- =====================================================
-- Technical Issue 12: Technical Issue Summary
-- =====================================================

SELECT
    ROUND(AVG(device_performance_score),2) AS avg_device_score,
    ROUND(AVG(bug_fix_speed_score),2) AS avg_bug_fix_speed
FROM survey_cleaned;
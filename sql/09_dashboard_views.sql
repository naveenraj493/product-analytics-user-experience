/*
=========================================================
Product Analytics Portfolio Project
File: 09_dashboard_views.sql

Business Question:
Which reusable SQL views power the Tableau dashboards?

Purpose:
Create reusable SQL views used by the Tableau dashboards,
reducing duplicate queries and simplifying maintenance.
=========================================================
*/

CREATE OR REPLACE VIEW vw_executive_kpis AS
SELECT
    COUNT(*) AS total_responses,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    ROUND(AVG(device_performance_score),2) AS avg_device_score,
    ROUND(AVG(bug_fix_speed_score),2) AS avg_bug_fix_score
FROM survey_cleaned;

CREATE OR REPLACE VIEW vw_platform_distribution AS
SELECT
    platform,
    COUNT(*) AS users
FROM survey_cleaned
GROUP BY platform
ORDER BY users DESC;

CREATE OR REPLACE VIEW vw_experience_distribution AS
SELECT
    overall_experience_score,
    COUNT(*) AS users
FROM survey_cleaned
GROUP BY overall_experience_score
ORDER BY overall_experience_score;

CREATE OR REPLACE VIEW vw_age_distribution AS
SELECT
    age_group,
    COUNT(*) AS users,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY age_group;

CREATE OR REPLACE VIEW vw_bug_frequency AS
SELECT
    bug_frequency,
    COUNT(*) AS users,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY bug_frequency;

CREATE OR REPLACE VIEW vw_server_errors AS
SELECT
    server_error_frequency,
    COUNT(*) AS users,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY server_error_frequency;

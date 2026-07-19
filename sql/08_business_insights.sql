/*
=========================================================
Product Analytics Portfolio Project
File: 08_business_insights.sql

Business Question:
What are the highest-impact insights from the survey,
and what actions should the product team prioritize?

Purpose:
Generate ranked business insights using CTEs,
window functions, and aggregations to support
product decision-making.
=========================================================
*/

-- =====================================================
-- Insight 1: Rank Feature Priorities
-- =====================================================

WITH feature_votes AS (

    SELECT 'Bug Fixes' AS feature, COUNT(*) AS votes
    FROM survey_cleaned
    WHERE priority_bug_fixes = TRUE

    UNION ALL

    SELECT 'Anti-Cheat', COUNT(*)
    FROM survey_cleaned
    WHERE priority_anti_cheat = TRUE

    UNION ALL

    SELECT 'Server Stability', COUNT(*)
    FROM survey_cleaned
    WHERE priority_server_stability = TRUE

    UNION ALL

    SELECT 'Performance', COUNT(*)
    FROM survey_cleaned
    WHERE priority_performance = TRUE

    UNION ALL

    SELECT 'New Content', COUNT(*)
    FROM survey_cleaned
    WHERE priority_new_content = TRUE

    UNION ALL

    SELECT 'New Maps', COUNT(*)
    FROM survey_cleaned
    WHERE priority_new_maps = TRUE

    UNION ALL

    SELECT 'Better Matchmaking', COUNT(*)
    FROM survey_cleaned
    WHERE priority_better_matchmaking = TRUE

)

SELECT
    feature,
    votes,
    RANK() OVER (ORDER BY votes DESC) AS priority_rank
FROM feature_votes
ORDER BY priority_rank;

----------------------------------------------------------
-- Insight 2: Highest Experience User Segments
----------------------------------------------------------

SELECT
    platform,
    play_frequency,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents,
    RANK() OVER (
        ORDER BY AVG(overall_experience_score) DESC
    ) AS experience_rank
FROM survey_cleaned
GROUP BY
    platform,
    play_frequency
HAVING COUNT(*) >= 10
ORDER BY experience_rank;

----------------------------------------------------------
-- Insight 3: Lowest Experience User Segments
----------------------------------------------------------

SELECT
    platform,
    play_frequency,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents,
    RANK() OVER (
        ORDER BY AVG(overall_experience_score)
    ) AS dissatisfaction_rank
FROM survey_cleaned
GROUP BY
    platform,
    play_frequency
HAVING COUNT(*) >= 10
ORDER BY dissatisfaction_rank;

----------------------------------------------------------
-- Insight 4: Technical Issues Ranked
----------------------------------------------------------

WITH issues AS (

SELECT
'Server Errors' AS issue,
SUM(CASE WHEN issue_server_error THEN 1 ELSE 0 END) AS reports
FROM survey_cleaned

UNION ALL

SELECT
'Game Crashes',
SUM(CASE WHEN issue_game_crash THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'FPS Drops',
SUM(CASE WHEN issue_fps_drops THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Ping Spikes',
SUM(CASE WHEN issue_ping_spikes THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Matchmaking',
SUM(CASE WHEN issue_matchmaking THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Audio Bugs',
SUM(CASE WHEN issue_audio_bugs THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Movement',
SUM(CASE WHEN issue_movement_glitches THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Texture Rendering',
SUM(CASE WHEN issue_texture_rendering THEN 1 ELSE 0 END)
FROM survey_cleaned

UNION ALL

SELECT
'Login',
SUM(CASE WHEN issue_login THEN 1 ELSE 0 END)
FROM survey_cleaned

)

SELECT
issue,
reports,
DENSE_RANK() OVER(
ORDER BY reports DESC
) AS issue_rank
FROM issues
ORDER BY issue_rank;

----------------------------------------------------------
-- Insight 5: Developer Trust vs Experience
----------------------------------------------------------

SELECT
developers_listen,
COUNT(*) AS respondents,
ROUND(AVG(overall_experience_score),2) AS avg_experience,
ROUND(AVG(device_performance_score),2) AS avg_device_score
FROM survey_cleaned
GROUP BY developers_listen
ORDER BY avg_experience DESC;

----------------------------------------------------------
-- Insight 6: Update Sentiment vs Experience
----------------------------------------------------------

SELECT
update_sentiment,
COUNT(*) AS respondents,
ROUND(AVG(overall_experience_score),2) AS avg_experience,
ROUND(AVG(device_performance_score),2) AS avg_device_score
FROM survey_cleaned
GROUP BY update_sentiment
ORDER BY avg_experience DESC;

----------------------------------------------------------
-- Insight 7: Executive Recommendations
----------------------------------------------------------

SELECT
COUNT(*) AS respondents,
ROUND(AVG(overall_experience_score),2) AS avg_experience,
ROUND(AVG(device_performance_score),2) AS avg_device_score,
ROUND(AVG(bug_fix_speed_score),2) AS avg_bug_fix_speed
FROM survey_cleaned;

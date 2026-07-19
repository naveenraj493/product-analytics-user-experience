/*
=========================================================
Product Analytics Portfolio Project
File: 02_user_segmentation.sql

Business Question:
Who are our users, and how can they be segmented
based on demographics and behavior?

Purpose:
Analyze user demographics, engagement patterns,
and behavioral segments to better understand
the survey population.
=========================================================
*/

-- =====================================================
-- Segment 1: Age Distribution
-- =====================================================

SELECT
    age_group,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY age_group
ORDER BY respondents DESC;


-- =====================================================
-- Segment 2: Platform Distribution
-- =====================================================

SELECT
    platform,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY platform
ORDER BY respondents DESC;


-- =====================================================
-- Segment 3: User Tenure
-- =====================================================

SELECT
    years_playing,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY years_playing
ORDER BY respondents DESC;


-- =====================================================
-- Segment 4: Play Frequency
-- =====================================================

SELECT
    play_frequency,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY play_frequency
ORDER BY respondents DESC;


-- =====================================================
-- Segment 5: Primary Game Mode
-- =====================================================

SELECT
    primary_game_mode,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY primary_game_mode
ORDER BY respondents DESC;


-- =====================================================
-- Segment 6: Platform × Play Frequency
-- =====================================================

SELECT
    platform,
    play_frequency,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    platform,
    play_frequency
ORDER BY
    platform,
    respondents DESC;


-- =====================================================
-- Segment 7: Platform × Years Playing
-- =====================================================

SELECT
    platform,
    years_playing,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    platform,
    years_playing
ORDER BY
    platform,
    respondents DESC;


-- =====================================================
-- Segment 8: Average Experience by Age Group
-- =====================================================

SELECT
    age_group,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY age_group
ORDER BY avg_experience DESC;


-- =====================================================
-- Segment 9: Average Experience by Play Frequency
-- =====================================================

SELECT
    play_frequency,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY play_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Segment 10: Average Experience by Years Playing
-- =====================================================

SELECT
    years_playing,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY years_playing
ORDER BY avg_experience DESC;
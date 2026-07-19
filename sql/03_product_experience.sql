/*
=========================================================
Product Analytics Portfolio Project
File: 03_product_experience.sql

Business Question:
What factors are associated with user satisfaction
and overall product experience?

Purpose:
Identify the user segments and product attributes
most strongly associated with higher or lower
experience scores.
=========================================================
*/

-- =====================================================
-- Experience by Platform
-- =====================================================

SELECT
    platform,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY platform
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Usage Frequency
-- =====================================================

SELECT
    play_frequency,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY play_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by User Tenure
-- =====================================================

SELECT
    years_playing,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY years_playing
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Device Performance
-- =====================================================

SELECT
    device_performance_score,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY device_performance_score
ORDER BY device_performance_score;


-- =====================================================
-- Experience by Update Sentiment
-- =====================================================

SELECT
    update_sentiment,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY update_sentiment
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Developers Listen
-- =====================================================

SELECT
    developers_listen,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY developers_listen
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Player Report Attention
-- =====================================================

SELECT
    player_reports_receive_attention,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY player_reports_receive_attention
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Trust Change
-- =====================================================

SELECT
    trust_change,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY trust_change
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Product Direction
-- =====================================================

SELECT
    product_direction,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY product_direction
ORDER BY avg_experience DESC;


-- =====================================================
-- Experience by Runs Smoothly
-- =====================================================

SELECT
    runs_smoothly,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY runs_smoothly
ORDER BY avg_experience DESC;


-- =====================================================
-- Top 10 Highest Experience Groups
-- =====================================================

SELECT
    play_frequency,
    platform,
    years_playing,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    play_frequency,
    platform,
    years_playing
HAVING COUNT(*) >= 10
ORDER BY avg_experience DESC
LIMIT 10;


-- =====================================================
-- Top 10 Lowest Experience Groups
-- =====================================================

SELECT
    play_frequency,
    platform,
    years_playing,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    play_frequency,
    platform,
    years_playing
HAVING COUNT(*) >= 10
ORDER BY avg_experience ASC
LIMIT 10;
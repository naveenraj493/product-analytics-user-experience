/*
=========================================================
Product Analytics Portfolio Project
File: 05_update_sentiment.sql

Business Question:
How did users react to the recent update, and how has
it affected trust, product direction, and satisfaction?

Purpose:
Analyze user sentiment toward recent updates and
evaluate how trust, product direction, and product
quality relate to overall experience.
=========================================================
*/

-- =====================================================
-- Update Sentiment Distribution
-- =====================================================

SELECT
    update_sentiment,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY update_sentiment
ORDER BY respondents DESC;


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
-- Trust Change Distribution
-- =====================================================

SELECT
    trust_change,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY trust_change
ORDER BY respondents DESC;


-- =====================================================
-- Product Direction
-- =====================================================

SELECT
    product_direction,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY product_direction
ORDER BY respondents DESC;


-- =====================================================
-- Developers Listen
-- =====================================================

SELECT
    developers_listen,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY developers_listen
ORDER BY avg_experience DESC;


-- =====================================================
-- User Reports Receive Attention
-- =====================================================

SELECT
    player_reports_receive_attention,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY player_reports_receive_attention
ORDER BY avg_experience DESC;


-- =====================================================
-- Bug Fix Speed Score
-- =====================================================

SELECT
    bug_fix_speed_score,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY bug_fix_speed_score
ORDER BY bug_fix_speed_score;


-- =====================================================
-- Anti-Cheat Effectiveness
-- =====================================================

SELECT
    anti_cheat_effective,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY anti_cheat_effective
ORDER BY avg_experience DESC;


-- =====================================================
-- Cheater Frequency
-- =====================================================

SELECT
    cheater_frequency,
    COUNT(*) AS respondents,
    ROUND(AVG(overall_experience_score),2) AS avg_experience
FROM survey_cleaned
GROUP BY cheater_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Collaboration Focus
-- =====================================================

SELECT
    focus_too_much_on_collaborations,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY focus_too_much_on_collaborations
ORDER BY respondents DESC;


-- =====================================================
-- Prefer Bug Fix Updates
-- =====================================================

SELECT
    prefer_bug_fix_updates,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY prefer_bug_fix_updates
ORDER BY respondents DESC;


-- =====================================================
-- Executive Sentiment Summary
-- =====================================================

SELECT
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    ROUND(AVG(bug_fix_speed_score),2) AS avg_bug_fix_speed,
    ROUND(AVG(device_performance_score),2) AS avg_device_score
FROM survey_cleaned;
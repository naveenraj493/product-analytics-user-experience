/*
=========================================================
Product Analytics Portfolio Project
File: 07_feedback_channels.sql

Business Question:
How do users engage with the community and where
do they prefer to provide feedback?

Purpose:
Analyze user communication preferences and
community engagement to identify the most
effective feedback channels.
=========================================================
*/

-- =====================================================
-- Community Discussion Frequency
-- =====================================================

SELECT
    community_discussion_frequency,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        1
    ) AS percentage
FROM survey_cleaned
GROUP BY community_discussion_frequency
ORDER BY respondents DESC;


-- =====================================================
-- Preferred Feedback Channels
-- =====================================================

SELECT
    feedback_channels,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY feedback_channels
ORDER BY respondents DESC;


-- =====================================================
-- Individual Feedback Channels
-- =====================================================

SELECT
    'Discord' AS channel,
    COUNT(*) AS respondents
FROM survey_cleaned
WHERE feedback_discord = TRUE

UNION ALL

SELECT
    'Instagram Comments',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_comments = TRUE

UNION ALL

SELECT
    'Instagram DMs',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_dms = TRUE

UNION ALL

SELECT
    'Instagram Story',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_story = TRUE

UNION ALL

SELECT
    'X (Twitter)',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_x = TRUE

UNION ALL

SELECT
    'YouTube',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_youtube = TRUE

UNION ALL

SELECT
    'Reddit',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_reddit = TRUE

UNION ALL

SELECT
    'In-game Support',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_ingame_support = TRUE

UNION ALL

SELECT
    'Do Not Share Feedback',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_do_not_share = TRUE

UNION ALL

SELECT
    'Other',
    COUNT(*)
FROM survey_cleaned
WHERE feedback_other = TRUE

ORDER BY respondents DESC;


-- =====================================================
-- Feedback Channels by Platform
-- =====================================================

SELECT
    platform,
    feedback_channels,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    platform,
    feedback_channels
ORDER BY
    platform,
    respondents DESC;


-- =====================================================
-- Community Engagement by Usage Frequency
-- =====================================================

SELECT
    play_frequency,
    community_discussion_frequency,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    play_frequency,
    community_discussion_frequency
ORDER BY
    play_frequency,
    respondents DESC;


-- =====================================================
-- Community Engagement by Experience
-- =====================================================

SELECT
    community_discussion_frequency,
    ROUND(AVG(overall_experience_score),2) AS avg_experience,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY community_discussion_frequency
ORDER BY avg_experience DESC;


-- =====================================================
-- Community Engagement by Update Sentiment
-- =====================================================

SELECT
    community_discussion_frequency,
    update_sentiment,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    community_discussion_frequency,
    update_sentiment
ORDER BY
    community_discussion_frequency,
    respondents DESC;
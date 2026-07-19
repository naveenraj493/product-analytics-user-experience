/*
=========================================================
Product Analytics Portfolio Project
File: 06_feature_prioritization.sql

Business Question:
Which product improvements should the development
team prioritize based on user feedback?

Purpose:
Analyze user feature priorities and preferences
to identify the product improvements with the
highest perceived value.
=========================================================
*/

-- =====================================================
-- Feature Priority Votes
-- =====================================================

SELECT
    'Bug Fixes' AS feature,
    COUNT(*) AS votes
FROM survey_cleaned
WHERE priority_bug_fixes = TRUE

UNION ALL

SELECT
    'Anti-Cheat',
    COUNT(*)
FROM survey_cleaned
WHERE priority_anti_cheat = TRUE

UNION ALL

SELECT
    'Server Stability',
    COUNT(*)
FROM survey_cleaned
WHERE priority_server_stability = TRUE

UNION ALL

SELECT
    'Performance Optimization',
    COUNT(*)
FROM survey_cleaned
WHERE priority_performance = TRUE

UNION ALL

SELECT
    'New Content',
    COUNT(*)
FROM survey_cleaned
WHERE priority_new_content = TRUE

UNION ALL

SELECT
    'New Maps',
    COUNT(*)
FROM survey_cleaned
WHERE priority_new_maps = TRUE

UNION ALL

SELECT
    'Better Matchmaking',
    COUNT(*)
FROM survey_cleaned
WHERE priority_better_matchmaking = TRUE

ORDER BY votes DESC;


-- =====================================================
-- Developer Priorities
-- =====================================================

SELECT
    developer_priorities,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY developer_priorities
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
-- Focus Too Much On Collaborations
-- =====================================================

SELECT
    focus_too_much_on_collaborations,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY focus_too_much_on_collaborations
ORDER BY respondents DESC;


-- =====================================================
-- Update Features Users Liked
-- =====================================================

SELECT
    liked_update_features,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY liked_update_features
ORDER BY respondents DESC;


-- =====================================================
-- Individual Features Users Liked
-- =====================================================

SELECT
    SUM(CASE WHEN liked_new_maps THEN 1 ELSE 0 END) AS liked_new_maps,
    SUM(CASE WHEN liked_new_modes THEN 1 ELSE 0 END) AS liked_new_modes,
    SUM(CASE WHEN liked_collaborations THEN 1 ELSE 0 END) AS liked_collaborations,
    SUM(CASE WHEN liked_gameplay_improvements THEN 1 ELSE 0 END) AS liked_gameplay_improvements,
    SUM(CASE WHEN liked_events_rewards THEN 1 ELSE 0 END) AS liked_events_rewards,
    SUM(CASE WHEN liked_graphics_improvements THEN 1 ELSE 0 END) AS liked_graphics_improvements,
    SUM(CASE WHEN liked_weapon_balance THEN 1 ELSE 0 END) AS liked_weapon_balance,
    SUM(CASE WHEN liked_other THEN 1 ELSE 0 END) AS liked_other
FROM survey_cleaned;


-- =====================================================
-- Biggest Recent Change Users Noticed
-- =====================================================

SELECT
    biggest_recent_change,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY biggest_recent_change
ORDER BY respondents DESC;


-- =====================================================
-- Largest User Pain Point
-- =====================================================

SELECT
    "Whats the biggest issue currently hurting the game? " AS biggest_issue,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY
    "Whats the biggest issue currently hurting the game? "
ORDER BY respondents DESC;


-- =====================================================
-- Most Frustrating Issue
-- =====================================================

SELECT
    most_frustrating_issue,
    COUNT(*) AS respondents
FROM survey_cleaned
GROUP BY most_frustrating_issue
ORDER BY respondents DESC;
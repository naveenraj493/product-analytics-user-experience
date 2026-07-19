/*
-------------------------------------------------------
Project : Product Analytics Survey Analysis
File    : 00_create_table.sql

Purpose :
Creates the cleaned survey table and reusable views
used throughout the analysis and Tableau dashboards.

Author  : Naveen Raj Kanagaraj
-------------------------------------------------------
*/

DROP TABLE IF EXISTS survey_cleaned;

-------------------------------------------------------
-- Create Cleaned Survey Table
-------------------------------------------------------

CREATE TABLE survey_cleaned (
    "submitted_at" TEXT,
    "age_group" TEXT,
    "platform" TEXT,
    "years_playing" TEXT,
    "play_frequency" TEXT,
    "primary_game_mode" TEXT,
    "overall_experience_score" INTEGER,
    "experience_vs_6_months" TEXT,
    "biggest_recent_change" TEXT,
    "update_sentiment" TEXT,
    "liked_update_features" TEXT,
    "liked_new_maps" BOOLEAN,
    "liked_new_modes" BOOLEAN,
    "liked_collaborations" BOOLEAN,
    "liked_gameplay_improvements" BOOLEAN,
    "liked_events_rewards" BOOLEAN,
    "liked_graphics_improvements" BOOLEAN,
    "liked_weapon_balance" BOOLEAN,
    "liked_other" BOOLEAN,
    "update_dislikes" TEXT,
    "bug_frequency" TEXT,
    "server_error_frequency" TEXT,
    "reported_issues" TEXT,
    "issue_server_error" BOOLEAN,
    "issue_game_crash" BOOLEAN,
    "issue_fps_drops" BOOLEAN,
    "issue_ping_spikes" BOOLEAN,
    "issue_matchmaking" BOOLEAN,
    "issue_audio_bugs" BOOLEAN,
    "issue_movement_glitches" BOOLEAN,
    "issue_texture_rendering" BOOLEAN,
    "issue_login" BOOLEAN,
    "issue_other" BOOLEAN,
    "most_frustrating_issue" TEXT,
    "device_performance_score" INTEGER,
    "runs_smoothly" TEXT,
    "server_errors_last_30_days" TEXT,
    "bugs_caused_delete_intent" TEXT,
    "developers_listen" TEXT,
    "player_reports_receive_attention" TEXT,
    "bug_fix_speed_score" INTEGER,
    "cheater_frequency" TEXT,
    "anti_cheat_effective" TEXT,
    "focus_too_much_on_collaborations" TEXT,
    "prefer_bug_fix_updates" TEXT,
    "developer_priorities" TEXT,
    "priority_bug_fixes" BOOLEAN,
    "priority_anti_cheat" BOOLEAN,
    "priority_server_stability" BOOLEAN,
    "priority_performance" BOOLEAN,
    "priority_new_content" BOOLEAN,
    "priority_new_maps" BOOLEAN,
    "priority_better_matchmaking" BOOLEAN,
    "trust_change" TEXT,
    "product_direction" TEXT,
    "direction_definitely_yes" BOOLEAN,
    "direction_probably_yes" BOOLEAN,
    "direction_not_sure" BOOLEAN,
    "direction_probably_no" BOOLEAN,
    "direction_definitely_no" BOOLEAN,
    "community_discussion_frequency" TEXT,
    "feedback_channels" TEXT,
    "feedback_discord" BOOLEAN,
    "feedback_instagram_comments" BOOLEAN,
    "feedback_instagram_dms" BOOLEAN,
    "feedback_instagram_story" BOOLEAN,
    "feedback_x" BOOLEAN,
    "feedback_youtube" BOOLEAN,
    "feedback_reddit" BOOLEAN,
    "feedback_ingame_support" BOOLEAN,
    "feedback_do_not_share" BOOLEAN,
    "feedback_other" BOOLEAN,
    "Whats the biggest issue currently hurting the game? " TEXT
);

-------------------------------------------------------
-- View: Feature Priorities
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_feature_priorities AS

SELECT 'Bug Fixes' AS feature, 
COUNT(*) AS votes
FROM survey_cleaned
WHERE priority_bug_fixes = TRUE

UNION ALL

SELECT 'Anti Cheat', COUNT(*)
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

ORDER BY votes DESC;

-------------------------------------------------------
-- Validation
-------------------------------------------------------

SELECT *
FROM vw_feature_priorities;

-------------------------------------------------------
-- View: Feedback Channels
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_feedback_channels AS

SELECT 'Discord' AS channel, COUNT(*) AS respondents
FROM survey_cleaned
WHERE feedback_discord = TRUE

UNION ALL

SELECT 'Instagram Comments', COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_comments = TRUE

UNION ALL

SELECT 'Instagram DM', COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_dms = TRUE

UNION ALL

SELECT 'Reddit', COUNT(*)
FROM survey_cleaned
WHERE feedback_reddit = TRUE

UNION ALL

SELECT 'X (Twitter)', COUNT(*)
FROM survey_cleaned
WHERE feedback_x = TRUE

UNION ALL

SELECT 'YouTube', COUNT(*)
FROM survey_cleaned
WHERE feedback_youtube = TRUE

UNION ALL

SELECT 'In-game Support', COUNT(*)
FROM survey_cleaned
WHERE feedback_ingame_support = TRUE

UNION ALL

SELECT 'Instagram Story', COUNT(*)
FROM survey_cleaned
WHERE feedback_instagram_story = TRUE

UNION ALL

SELECT 'Do Not Share Feedback', COUNT(*)
FROM survey_cleaned
WHERE feedback_do_not_share = TRUE

UNION ALL

SELECT 'Other', COUNT(*)
FROM survey_cleaned
WHERE feedback_other = TRUE

ORDER BY respondents DESC;

-------------------------------------------------------
-- Validation
-------------------------------------------------------

SELECT *
FROM vw_feedback_channels;

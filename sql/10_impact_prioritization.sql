/* ==========================================================
Product Analytics Portfolio Project
File: 10_impact_prioritization.sql

Business Question:
Which technical issues should be prioritized based
on both prevalence and impact on user experience?

Purpose:
Create reusable views that combine issue prevalence
and experience impact into a composite priority score.
=========================================================
*/


/*----------------------------------------------------------
VIEW 1
Issue impact on user experience
----------------------------------------------------------*/

CREATE OR REPLACE VIEW vw_issue_impact AS

SELECT
    issue,

    COUNT(*) AS affected_players,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM survey_cleaned),
        2
    ) AS prevalence_pct,

    ROUND(
        AVG(overall_experience_score),
        2
    ) AS avg_experience,

    ROUND(
        (
            (SELECT AVG(overall_experience_score)
             FROM survey_cleaned)
            -
            AVG(overall_experience_score)
        ),
        2
    ) AS experience_gap

FROM (

    SELECT
        overall_experience_score,
        'Server Error' AS issue
    FROM survey_cleaned
    WHERE issue_server_error = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Game Crash'
    FROM survey_cleaned
    WHERE issue_game_crash = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'FPS Drops'
    FROM survey_cleaned
    WHERE issue_fps_drops = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Ping Spikes'
    FROM survey_cleaned
    WHERE issue_ping_spikes = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Matchmaking'
    FROM survey_cleaned
    WHERE issue_matchmaking = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Audio Bugs'
    FROM survey_cleaned
    WHERE issue_audio_bugs = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Movement Glitches'
    FROM survey_cleaned
    WHERE issue_movement_glitches = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Texture Rendering'
    FROM survey_cleaned
    WHERE issue_texture_rendering = TRUE

    UNION ALL

    SELECT
        overall_experience_score,
        'Login Issues'
    FROM survey_cleaned
    WHERE issue_login = TRUE

) x

GROUP BY issue;



/*----------------------------------------------------------
VIEW 2
Priority Score
(prevalence × experience impact)
----------------------------------------------------------*/

CREATE OR REPLACE VIEW vw_fix_priority AS

SELECT

    issue,

    affected_players,

    prevalence_pct,

    avg_experience,

    experience_gap,

    ROUND(
        prevalence_pct * experience_gap,
        2
    ) AS priority_score

FROM vw_issue_impact

ORDER BY priority_score DESC;



/*----------------------------------------------------------
Results
----------------------------------------------------------*/

SELECT *
FROM vw_issue_impact;

SELECT *
FROM vw_fix_priority;
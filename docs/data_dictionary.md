# Data Dictionary

## Dataset Summary

- Records: 1,257
- Variables: 70
- Source: Original BGMI user survey
- Published Dataset: Anonymized version of the original survey
- Data Collection Period: 2026-07-02 to 2026-07-13

---

## Key Variable Definitions

| Column | Type | Description |
|---------|------|-------------|
| submitted_at | datetime | Survey submission timestamp |
| age_group | categorical | Respondent age category |
| platform | categorical | Primary gaming platform |
| years_playing | categorical | Number of years the respondent has played BGMI |
| play_frequency | categorical | Frequency of gameplay |
| primary_game_mode | categorical | Most frequently played game mode |
| overall_experience_score | integer | Overall BGMI experience rating (0-10) |
| device_performance_score | integer | Device performance rating (0-10) |
| bug_fix_speed_score | integer | Satisfaction with bug fix speed (0-10) |

The remaining variables follow the same snake_case naming convention used throughout the project and are available in the published dataset (`survey_cleaned_public.csv`) and SQL schema.
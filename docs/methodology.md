# Methodology

## Project Objective

Analyze survey data collected from BGMI players to identify product experience issues, technical pain points, and opportunities for product improvement.

---

## Data Collection

- Survey platform: Google Forms
- Collection period: July 2, 2026 to July 13, 2026
- Total responses collected: 1,257

---

## Data Cleaning

The original survey export contained metadata and personally identifiable information.

The following preprocessing steps were performed:

- Removed respondent identifiers
- Removed email addresses
- Standardized column names using snake_case
- Converted timestamps to datetime
- Verified missing values
- Checked for duplicate records
- Exported an anonymized public dataset

---

## Data Validation

Validation included:

- Dataset dimensions
- Missing value assessment
- Duplicate detection
- Data type verification
- Descriptive statistics

---

## Data Storage

The cleaned dataset was exported as a public CSV and imported into PostgreSQL for SQL-based analysis. The published repository includes the anonymized CSV used throughout the project.

---

## Analysis

Analysis focused on:

- User demographics
- Product experience
- Technical issues
- Developer trust
- Security perceptions
- Product priorities
- Community engagement
- Feedback channels

---

## Visualization

Insights were visualized using Tableau dashboards.

---

## Tools Used

- Python
- Pandas
- PostgreSQL
- SQL
- Tableau
- Git
- GitHub
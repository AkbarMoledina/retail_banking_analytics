WITH date_spine AS (
   {{ dbt_utils.date_spine(
    datepart="day",
    start_date="'1993-01-01'",
    end_date="'1999-01-01'"
    ) }}
)

SELECT
    TO_CHAR(date_day, 'YYYYMMDD')::INT AS date_id,
    date_day::DATE AS full_date,
    YEAR(full_date) AS year,
    CASE
        WHEN MONTH(full_date) IN (1,2,3) THEN 'Q1'
        WHEN MONTH(full_date) IN (4,5,6) THEN 'Q2'
        WHEN MONTH(full_date) IN (7,8,9) THEN 'Q3'
        WHEN MONTH(full_date) IN (10,11,12) THEN 'Q4'
    END AS quarter,
    MONTH(full_date) AS month,
    MONTHNAME(full_date) AS month_name,
    WEEK(full_date) as week_of_year,
    DAY(full_date) AS day,
    DAYNAME(full_date) AS day_name,
    DAYOFWEEKISO(full_date) AS day_of_week,
    CASE WHEN DAYOFWEEKISO(full_date) IN (6,7) THEN TRUE ELSE FALSE END AS is_weekend
FROM date_spine
ORDER BY full_date

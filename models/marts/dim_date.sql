WITH date_spine AS (
   {{ dbt_utils.date_spine(
    datepart="day",
    start_date="'1993-01-01'",
    end_date="'1999-01-01'"
    ) }}
)

SELECT
    {{ generate_date_id('date_day') }} AS date_id,
    date_day::DATE AS full_date,
    YEAR(date_day) AS year,
    QUARTER(date_day) AS quarter,
    MONTH(date_day) AS month,
    MONTHNAME(date_day) AS month_name,
    WEEK(date_day) as week_of_year,
    DAY(date_day) AS day,
    DAYNAME(date_day) AS day_name,
    DAYOFWEEKISO(date_day) AS day_of_week,
    CASE WHEN DAYOFWEEKISO(date_day) IN (6,7) THEN TRUE ELSE FALSE END AS is_weekend
FROM date_spine
ORDER BY full_date

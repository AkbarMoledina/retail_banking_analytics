{{ config(materialized='view') }}

WITH client_details AS (
    SELECT
        client_id,
        birth_number,
        district_id,
        ('19' || SUBSTRING(birth_number, 1, 2))::INT AS birth_year,
        CASE
            WHEN SUBSTRING(birth_number, 3, 2)::INT > 50 THEN SUBSTRING(birth_number, 3, 2)::INT - 50
            ELSE SUBSTRING(birth_number, 3, 2)::INT
        END AS birth_month,
        SUBSTRING(birth_number, 5, 2)::INT AS birth_day,
        CASE
            WHEN SUBSTRING(birth_number, 3, 2)::INT > 50 THEN 'Female'
            ELSE 'Male'
        END AS gender
    FROM {{ ref('stg_client') }}
)

SELECT
    client_id,
    district_id,
    birth_number,
    TRY_TO_DATE(birth_year::VARCHAR || '-' || LPAD(birth_month::VARCHAR, 2, 0) || '-' || LPAD(birth_day::VARCHAR, 2, 0)) AS birth_date,
    birth_year,
    birth_month,
    birth_day,
    gender
FROM client_details

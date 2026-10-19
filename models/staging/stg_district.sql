WITH source AS (
    SELECT * FROM {{ source('raw', 'district') }}
)

SELECT
    A1 AS district_id,
    A2 AS district_name,
    A3 AS region,
    A4 AS population,
    A5 AS municipalities_0_to_499,
    A6 AS municipalities_500_to_1999,
    A7 AS municipalities_2000_to_9999,
    A8 AS municipalities_over_10000,
    A9 AS no_of_cities,
    A10 AS urban_population_ratio,
    A11 AS avg_salary,
    A12 AS unemployment_rate_1995,
    A13 AS unemployment_rate_1996,
    A14 AS entrepreneurs_per_1000,
    A15 AS crimes_1995,
    A16 AS crimes_1996
FROM source
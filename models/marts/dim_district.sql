SELECT
    {{ dbt_utils.generate_surrogate_key(['district_id']) }} AS district_sk,
    district_id,
    district_name,
    region,
    population,
    municipalities_0_to_499,
    municipalities_500_to_1999,
    municipalities_2000_to_9999,
    municipalities_over_10000,
    no_of_cities,
    urban_population_ratio,
    avg_salary,
    unemployment_rate_1995,
    unemployment_rate_1996,
    entrepreneurs_per_1000,
    crimes_1995,
    crimes_1996
FROM {{ ref('stg_district') }}


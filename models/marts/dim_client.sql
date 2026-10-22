SELECT
    {{ dbt_utils.generate_surrogate_key(['client_id']) }} AS client_sk,
    client_id,
    district_id,
    {{ generate_date_id('birth_date') }} AS birth_date_id,
    gender
FROM {{ ref('int_client_demographics') }}
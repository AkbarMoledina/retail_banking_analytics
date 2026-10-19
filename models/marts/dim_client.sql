SELECT
    {{ dbt_utils.generate_surrogate_key(['client_id']) }} AS client_sk,
    client_id,
    district_id,
    birth_date,
    gender
FROM {{ ref('int_client_demographics') }}
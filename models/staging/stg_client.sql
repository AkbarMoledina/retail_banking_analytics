WITH source AS (
    SELECT * FROM {{ source('raw', 'client') }}
)

SELECT
    client_id,
    birth_number,
    district_id
FROM source
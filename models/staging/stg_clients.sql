WITH source AS (
    SELECT * FROM {{ source('raw', 'clients') }}
)

SELECT
    client_id,
    birth_number,
    district_id
FROM source
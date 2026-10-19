WITH source AS (
    SELECT * FROM {{ source('raw', 'disposition') }}
)

SELECT
    disp_id AS disposition_id,
    client_id,
    account_id,
    INITCAP(type) AS disposition_type
FROM source
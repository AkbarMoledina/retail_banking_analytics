WITH source AS (
    SELECT * FROM {{ source('raw', 'dispositions') }}
)

SELECT
    disp_id AS disposition_id,
    client_id,
    account_id,
    INITCAP(type) AS disposition_type
FROM source
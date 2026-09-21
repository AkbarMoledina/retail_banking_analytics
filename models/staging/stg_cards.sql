WITH source AS (
    SELECT * FROM {{ source('raw', 'cards')}}
)

SELECT
    card_id,
    disp_id AS disposition_id,
    INITCAP(type) AS type,
    issued,
    TRY_TO_TIMESTAMP_NTZ(CASE WHEN LEFT(issued, 2) BETWEEN '50' AND '99' THEN '19' || issued
        ELSE '20' || issued END) AS issued_datetime
FROM source

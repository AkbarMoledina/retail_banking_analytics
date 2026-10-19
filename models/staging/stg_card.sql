WITH source AS (
    SELECT * FROM {{ source('raw', 'card')}}
)

SELECT
    card_id,
    disp_id AS disposition_id,
    INITCAP(type) AS type,
    issued,
    {{ format_timestamp_ntz('issued') }} AS issued_datetime
FROM source

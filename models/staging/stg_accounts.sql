WITH source AS (
    SELECT * FROM {{ source('raw', 'accounts') }}
)

SELECT
    account_id,
    district_id,
    frequency,
    date,
    {{ format_date('date') }} AS creation_date
FROM source

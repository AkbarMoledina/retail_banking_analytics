WITH source AS (
    SELECT * FROM {{ source('raw', 'accounts') }}
)

SELECT
    account_id,
    district_id,
    frequency,
    {{ format_date('date') }} AS account_creation_date
FROM source

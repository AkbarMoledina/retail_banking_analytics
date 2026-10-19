WITH source AS (
    SELECT * FROM {{ source('raw', 'loan') }}
)

SELECT
    loan_id,
    account_id,
    date,
    {{ format_date('date') }} AS loan_granted_date,
    amount,
    duration,
    payments,
    status
FROM source

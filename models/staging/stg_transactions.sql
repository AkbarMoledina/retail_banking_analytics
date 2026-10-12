WITH source AS (
    SELECT * FROM {{ source('raw', 'transactions') }}
)

SELECT
    trans_id,
    account_id,
    date,
    {{ format_date('date') }} AS transaction_date,
    type,
    operation,
    amount,
    balance,
    k_symbol,
    bank,
    account
FROM source

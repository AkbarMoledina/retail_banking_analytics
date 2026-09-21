WITH source AS (
    SELECT * FROM {{ source('raw', 'transactions') }}
)

SELECT
    trans_id,
    account_id,
    date,
    TRY_TO_DATE(CASE WHEN LEFT(date, 2) BETWEEN '50' AND '99' THEN '19' || date
         ELSE '20' || date END) AS transaction_date,
    type,
    operation,
    amount,
    balance,
    k_symbol,
    bank,
    account
FROM source

WITH source AS (
    SELECT * FROM {{ source('raw', 'standing_order') }}
)

SELECT
    order_id,
    account_id,
    bank_to,
    account_to,
    amount,
    k_symbol
FROM source
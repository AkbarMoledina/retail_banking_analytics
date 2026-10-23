SELECT
    t.trans_id,
    a.account_sk,
    {{ generate_date_id('transaction_date') }} AS transaction_date_id,
    t.type,
    t.operation,
    t.amount,
    t.balance,
    t.k_symbol
FROM {{ ref('int_transactions_translated') }} t
LEFT JOIN {{ ref('dim_account') }} a
ON t.account_id = a.account_id

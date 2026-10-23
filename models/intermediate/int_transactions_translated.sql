SELECT
    t.trans_id,
    t.account_id,
    t.transaction_date,
    tm.english AS type,
    om.english AS operation,
    t.amount,
    t.balance,
    km.english AS k_symbol,
    t.bank,
    t.account
FROM {{ ref('stg_transaction') }} t
LEFT JOIN {{ ref('transaction_operation_mapping') }} om
ON t.operation = om.czech
LEFT JOIN {{ ref('transaction_type_mapping') }} tm
ON t.type = tm.czech
LEFT JOIN {{ ref('k_symbol_mapping') }} km
ON t.k_symbol = km.czech

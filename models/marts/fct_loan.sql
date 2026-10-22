SELECT
    l.loan_id,
    a.account_sk,
    {{ date_to_date_id('l.loan_granted_date') }} AS loan_granted_date_id,
    l.amount,
    l.duration,
    l.payments,
    l.status
FROM {{ ref('stg_loan') }} l
LEFT JOIN dim_account a
ON l.account_id = a.account_id
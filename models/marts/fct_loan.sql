SELECT
    l.loan_id,
    a.account_sk,
    {{ generate_date_id('l.loan_granted_date') }} AS loan_granted_date_id,
    l.amount,
    l.duration,
    l.payments,
    l.status,
    l.is_defaulted,
    l.is_active
FROM {{ ref('int_loan_status_enriched') }} l
LEFT JOIN {{ ref('dim_account') }} a
ON l.account_id = a.account_id